{*************************************************************************
*
*      DBISAM crypto funtions and type definitions
*      for Delphi 3.x + and C++Builder 3.x +
*
*      Copyright 1996-2005  Elevate Software
*      All rights reserved.
*
*************************************************************************}

{$I dbisamcp.inc}

unit dbisamcr;

{
Copyright (C) 1991-2, RSA Data Security, Inc. Created 1991. All
rights reserved.

License to copy and use this software is granted provided that it
is identified as the "RSA Data Security, Inc. MD5 Message-Digest
Algorithm" in all material mentioning or referencing this software
or this function.

License is also granted to make and use derivative works provided
that such works are identified as "derived from the RSA Data
Security, Inc. MD5 Message-Digest Algorithm" in all material
mentioning or referencing the derived work.

RSA Data Security, Inc. makes no representations concerning either
the merchantability of this software or the suitability of this
software for any particular purpose. It is provided "as is"
without express or implied warranty of any kind.

These notices must be retained in any copies of any part of this
documentation and/or software.
}

interface

uses SysUtils, Classes,

{$I dbisamvr.inc}

Windows;

type
  pMD5Digest = ^TMD5Digest;
  TMD5Digest = packed record
    case integer of
      0: (A, B, C, D: longint);
      1: (v: array [0..15] of byte);
  end;

type
  pBlowfishData = ^TBlowfishData;
  TBlowfishData = record
    InitBlock: array[0..7] of byte;    { initial IV }
    LastBlock: array[0..7] of byte;    { current IV }
    SBoxM: array[0..3, 0..255] of longword;
    PBoxM: array[0..17] of longword;
  end;

function MD5String(const AString: AnsiString): TMD5Digest;

function MD5File(const AFileName: string): TMD5Digest;

function MD5Stream(const AStream: TStream): TMD5Digest;

function MD5Buffer(const ABuffer; ASize: integer): TMD5Digest;

function MD5DigestToString(const ADigest: TMD5Digest): string;

function MD5DigestCompare(const ADigest1, ADigest2: TMD5Digest): boolean;

function BFTest: boolean;

procedure BFInit(var Data: TBlowfishData; Key: Pointer; Len: integer; IV: Pointer);

procedure BFEncrypt(var Data: TBlowfishData; Input, Output: Pointer);

procedure BFDecrypt(var Data: TBlowfishData; Input, Output: Pointer);

procedure BFReset(var Data: TBlowfishData);

implementation

uses dbisamcn;

type

  PLongWordArray4 = ^TLongWordArray4;
  TLongWordArray4 = array [0..3] of longword;
  PLongWordArray2 = ^TLongWordArray2;
  TLongWordArray2 = array [0..1] of longword;
  PByteArray16    = ^TByteArray16;
  TByteArray16    = array [0..15] of byte;
  PByteArray64    = ^TByteArray64;
  TByteArray64    = array [0..63] of byte;

//  PByteArray = ^TByteArray;
//  TByteArray = array [0..0] of byte;

//  PLongWordArray = ^TLongWordArray;
//  TLongWordArray = array [0..0] of longword;

  PMD5Context = ^TMD5Context;
  TMD5Context = record
    State: TLongWordArray4;
    Count: TLongWordArray2;
    Buffer: TByteArray64;
  end;

const
  S11 = 7;
  S12 = 12;
  S13 = 17;
  S14 = 22;
  S21 = 5;
  S22 = 9;
  S23 = 14;
  S24 = 20;
  S31 = 4;
  S32 = 11;
  S33 = 16;
  S34 = 23;
  S41 = 6;
  S42 = 10;
  S43 = 15;
  S44 = 21;

  PBox: array[0..17] of longword =
   ($243f6a88, $85a308d3, $13198a2e, $03707344,
    $a4093822, $299f31d0, $082efa98, $ec4e6c89,
    $452821e6, $38d01377, $be5466cf, $34e90c6c,
    $c0ac29b7, $c97c50dd, $3f84d5b5, $b5470917,
    $9216d5d9, $8979fb1b);
  SBox: array[0..3, 0..255] of longword =
  (($d1310ba6, $98dfb5ac, $2ffd72db, $d01adfb7,
    $b8e1afed, $6a267e96, $ba7c9045, $f12c7f99,
    $24a19947, $b3916cf7, $0801f2e2, $858efc16,
    $636920d8, $71574e69, $a458fea3, $f4933d7e,
    $0d95748f, $728eb658, $718bcd58, $82154aee,
    $7b54a41d, $c25a59b5, $9c30d539, $2af26013,
    $c5d1b023, $286085f0, $ca417918, $b8db38ef,
    $8e79dcb0, $603a180e, $6c9e0e8b, $b01e8a3e,
    $d71577c1, $bd314b27, $78af2fda, $55605c60,
    $e65525f3, $aa55ab94, $57489862, $63e81440,
    $55ca396a, $2aab10b6, $b4cc5c34, $1141e8ce,
    $a15486af, $7c72e993, $b3ee1411, $636fbc2a,
    $2ba9c55d, $741831f6, $ce5c3e16, $9b87931e,
    $afd6ba33, $6c24cf5c, $7a325381, $28958677,
    $3b8f4898, $6b4bb9af, $c4bfe81b, $66282193,
    $61d809cc, $fb21a991, $487cac60, $5dec8032,
    $ef845d5d, $e98575b1, $dc262302, $eb651b88,
    $23893e81, $d396acc5, $0f6d6ff3, $83f44239,
    $2e0b4482, $a4842004, $69c8f04a, $9e1f9b5e,
    $21c66842, $f6e96c9a, $670c9c61, $abd388f0,
    $6a51a0d2, $d8542f68, $960fa728, $ab5133a3,
    $6eef0b6c, $137a3be4, $ba3bf050, $7efb2a98,
    $a1f1651d, $39af0176, $66ca593e, $82430e88,
    $8cee8619, $456f9fb4, $7d84a5c3, $3b8b5ebe,
    $e06f75d8, $85c12073, $401a449f, $56c16aa6,
    $4ed3aa62, $363f7706, $1bfedf72, $429b023d,
    $37d0d724, $d00a1248, $db0fead3, $49f1c09b,
    $075372c9, $80991b7b, $25d479d8, $f6e8def7,
    $e3fe501a, $b6794c3b, $976ce0bd, $04c006ba,
    $c1a94fb6, $409f60c4, $5e5c9ec2, $196a2463,
    $68fb6faf, $3e6c53b5, $1339b2eb, $3b52ec6f,
    $6dfc511f, $9b30952c, $cc814544, $af5ebd09,
    $bee3d004, $de334afd, $660f2807, $192e4bb3,
    $c0cba857, $45c8740f, $d20b5f39, $b9d3fbdb,
    $5579c0bd, $1a60320a, $d6a100c6, $402c7279,
    $679f25fe, $fb1fa3cc, $8ea5e9f8, $db3222f8,
    $3c7516df, $fd616b15, $2f501ec8, $ad0552ab,
    $323db5fa, $fd238760, $53317b48, $3e00df82,
    $9e5c57bb, $ca6f8ca0, $1a87562e, $df1769db,
    $d542a8f6, $287effc3, $ac6732c6, $8c4f5573,
    $695b27b0, $bbca58c8, $e1ffa35d, $b8f011a0,
    $10fa3d98, $fd2183b8, $4afcb56c, $2dd1d35b,
    $9a53e479, $b6f84565, $d28e49bc, $4bfb9790,
    $e1ddf2da, $a4cb7e33, $62fb1341, $cee4c6e8,
    $ef20cada, $36774c01, $d07e9efe, $2bf11fb4,
    $95dbda4d, $ae909198, $eaad8e71, $6b93d5a0,
    $d08ed1d0, $afc725e0, $8e3c5b2f, $8e7594b7,
    $8ff6e2fb, $f2122b64, $8888b812, $900df01c,
    $4fad5ea0, $688fc31c, $d1cff191, $b3a8c1ad,
    $2f2f2218, $be0e1777, $ea752dfe, $8b021fa1,
    $e5a0cc0f, $b56f74e8, $18acf3d6, $ce89e299,
    $b4a84fe0, $fd13e0b7, $7cc43b81, $d2ada8d9,
    $165fa266, $80957705, $93cc7314, $211a1477,
    $e6ad2065, $77b5fa86, $c75442f5, $fb9d35cf,
    $ebcdaf0c, $7b3e89a0, $d6411bd3, $ae1e7e49,
    $00250e2d, $2071b35e, $226800bb, $57b8e0af,
    $2464369b, $f009b91e, $5563911d, $59dfa6aa,
    $78c14389, $d95a537f, $207d5ba2, $02e5b9c5,
    $83260376, $6295cfa9, $11c81968, $4e734a41,
    $b3472dca, $7b14a94a, $1b510052, $9a532915,
    $d60f573f, $bc9bc6e4, $2b60a476, $81e67400,
    $08ba6fb5, $571be91f, $f296ec6b, $2a0dd915,
    $b6636521, $e7b9f9b6, $ff34052e, $c5855664,
    $53b02d5d, $a99f8fa1, $08ba4799, $6e85076a),
    ($4b7a70e9, $b5b32944, $db75092e, $c4192623,
    $ad6ea6b0, $49a7df7d, $9cee60b8, $8fedb266,
    $ecaa8c71, $699a17ff, $5664526c, $c2b19ee1,
    $193602a5, $75094c29, $a0591340, $e4183a3e,
    $3f54989a, $5b429d65, $6b8fe4d6, $99f73fd6,
    $a1d29c07, $efe830f5, $4d2d38e6, $f0255dc1,
    $4cdd2086, $8470eb26, $6382e9c6, $021ecc5e,
    $09686b3f, $3ebaefc9, $3c971814, $6b6a70a1,
    $687f3584, $52a0e286, $b79c5305, $aa500737,
    $3e07841c, $7fdeae5c, $8e7d44ec, $5716f2b8,
    $b03ada37, $f0500c0d, $f01c1f04, $0200b3ff,
    $ae0cf51a, $3cb574b2, $25837a58, $dc0921bd,
    $d19113f9, $7ca92ff6, $94324773, $22f54701,
    $3ae5e581, $37c2dadc, $c8b57634, $9af3dda7,
    $a9446146, $0fd0030e, $ecc8c73e, $a4751e41,
    $e238cd99, $3bea0e2f, $3280bba1, $183eb331,
    $4e548b38, $4f6db908, $6f420d03, $f60a04bf,
    $2cb81290, $24977c79, $5679b072, $bcaf89af,
    $de9a771f, $d9930810, $b38bae12, $dccf3f2e,
    $5512721f, $2e6b7124, $501adde6, $9f84cd87,
    $7a584718, $7408da17, $bc9f9abc, $e94b7d8c,
    $ec7aec3a, $db851dfa, $63094366, $c464c3d2,
    $ef1c1847, $3215d908, $dd433b37, $24c2ba16,
    $12a14d43, $2a65c451, $50940002, $133ae4dd,
    $71dff89e, $10314e55, $81ac77d6, $5f11199b,
    $043556f1, $d7a3c76b, $3c11183b, $5924a509,
    $f28fe6ed, $97f1fbfa, $9ebabf2c, $1e153c6e,
    $86e34570, $eae96fb1, $860e5e0a, $5a3e2ab3,
    $771fe71c, $4e3d06fa, $2965dcb9, $99e71d0f,
    $803e89d6, $5266c825, $2e4cc978, $9c10b36a,
    $c6150eba, $94e2ea78, $a5fc3c53, $1e0a2df4,
    $f2f74ea7, $361d2b3d, $1939260f, $19c27960,
    $5223a708, $f71312b6, $ebadfe6e, $eac31f66,
    $e3bc4595, $a67bc883, $b17f37d1, $018cff28,
    $c332ddef, $be6c5aa5, $65582185, $68ab9802,
    $eecea50f, $db2f953b, $2aef7dad, $5b6e2f84,
    $1521b628, $29076170, $ecdd4775, $619f1510,
    $13cca830, $eb61bd96, $0334fe1e, $aa0363cf,
    $b5735c90, $4c70a239, $d59e9e0b, $cbaade14,
    $eecc86bc, $60622ca7, $9cab5cab, $b2f3846e,
    $648b1eaf, $19bdf0ca, $a02369b9, $655abb50,
    $40685a32, $3c2ab4b3, $319ee9d5, $c021b8f7,
    $9b540b19, $875fa099, $95f7997e, $623d7da8,
    $f837889a, $97e32d77, $11ed935f, $16681281,
    $0e358829, $c7e61fd6, $96dedfa1, $7858ba99,
    $57f584a5, $1b227263, $9b83c3ff, $1ac24696,
    $cdb30aeb, $532e3054, $8fd948e4, $6dbc3128,
    $58ebf2ef, $34c6ffea, $fe28ed61, $ee7c3c73,
    $5d4a14d9, $e864b7e3, $42105d14, $203e13e0,
    $45eee2b6, $a3aaabea, $db6c4f15, $facb4fd0,
    $c742f442, $ef6abbb5, $654f3b1d, $41cd2105,
    $d81e799e, $86854dc7, $e44b476a, $3d816250,
    $cf62a1f2, $5b8d2646, $fc8883a0, $c1c7b6a3,
    $7f1524c3, $69cb7492, $47848a0b, $5692b285,
    $095bbf00, $ad19489d, $1462b174, $23820e00,
    $58428d2a, $0c55f5ea, $1dadf43e, $233f7061,
    $3372f092, $8d937e41, $d65fecf1, $6c223bdb,
    $7cde3759, $cbee7460, $4085f2a7, $ce77326e,
    $a6078084, $19f8509e, $e8efd855, $61d99735,
    $a969a7aa, $c50c06c2, $5a04abfc, $800bcadc,
    $9e447a2e, $c3453484, $fdd56705, $0e1e9ec9,
    $db73dbd3, $105588cd, $675fda79, $e3674340,
    $c5c43465, $713e38d8, $3d28f89e, $f16dff20,
    $153e21e7, $8fb03d4a, $e6e39f2b, $db83adf7),
    ($e93d5a68, $948140f7, $f64c261c, $94692934,
    $411520f7, $7602d4f7, $bcf46b2e, $d4a20068,
    $d4082471, $3320f46a, $43b7d4b7, $500061af,
    $1e39f62e, $97244546, $14214f74, $bf8b8840,
    $4d95fc1d, $96b591af, $70f4ddd3, $66a02f45,
    $bfbc09ec, $03bd9785, $7fac6dd0, $31cb8504,
    $96eb27b3, $55fd3941, $da2547e6, $abca0a9a,
    $28507825, $530429f4, $0a2c86da, $e9b66dfb,
    $68dc1462, $d7486900, $680ec0a4, $27a18dee,
    $4f3ffea2, $e887ad8c, $b58ce006, $7af4d6b6,
    $aace1e7c, $d3375fec, $ce78a399, $406b2a42,
    $20fe9e35, $d9f385b9, $ee39d7ab, $3b124e8b,
    $1dc9faf7, $4b6d1856, $26a36631, $eae397b2,
    $3a6efa74, $dd5b4332, $6841e7f7, $ca7820fb,
    $fb0af54e, $d8feb397, $454056ac, $ba489527,
    $55533a3a, $20838d87, $fe6ba9b7, $d096954b,
    $55a867bc, $a1159a58, $cca92963, $99e1db33,
    $a62a4a56, $3f3125f9, $5ef47e1c, $9029317c,
    $fdf8e802, $04272f70, $80bb155c, $05282ce3,
    $95c11548, $e4c66d22, $48c1133f, $c70f86dc,
    $07f9c9ee, $41041f0f, $404779a4, $5d886e17,
    $325f51eb, $d59bc0d1, $f2bcc18f, $41113564,
    $257b7834, $602a9c60, $dff8e8a3, $1f636c1b,
    $0e12b4c2, $02e1329e, $af664fd1, $cad18115,
    $6b2395e0, $333e92e1, $3b240b62, $eebeb922,
    $85b2a20e, $e6ba0d99, $de720c8c, $2da2f728,
    $d0127845, $95b794fd, $647d0862, $e7ccf5f0,
    $5449a36f, $877d48fa, $c39dfd27, $f33e8d1e,
    $0a476341, $992eff74, $3a6f6eab, $f4f8fd37,
    $a812dc60, $a1ebddf8, $991be14c, $db6e6b0d,
    $c67b5510, $6d672c37, $2765d43b, $dcd0e804, 
    $f1290dc7, $cc00ffa3, $b5390f92, $690fed0b, 
    $667b9ffb, $cedb7d9c, $a091cf0b, $d9155ea3, 
    $bb132f88, $515bad24, $7b9479bf, $763bd6eb, 
    $37392eb3, $cc115979, $8026e297, $f42e312d,
    $6842ada7, $c66a2b3b, $12754ccc, $782ef11c,
    $6a124237, $b79251e7, $06a1bbe6, $4bfb6350, 
    $1a6b1018, $11caedfa, $3d25bdd8, $e2e1c3c9,
    $44421659, $0a121386, $d90cec6e, $d5abea2a, 
    $64af674e, $da86a85f, $bebfe988, $64e4c3fe,
    $9dbc8057, $f0f7c086, $60787bf8, $6003604d, 
    $d1fd8346, $f6381fb0, $7745ae04, $d736fccc,
    $83426b33, $f01eab71, $b0804187, $3c005e5f, 
    $77a057be, $bde8ae24, $55464299, $bf582e61, 
    $4e58f48f, $f2ddfda2, $f474ef38, $8789bdc2,
    $5366f9c3, $c8b38e74, $b475f255, $46fcd9b9, 
    $7aeb2661, $8b1ddf84, $846a0e79, $915f95e2, 
    $466e598e, $20b45770, $8cd55591, $c902de4c,
    $b90bace1, $bb8205d0, $11a86248, $7574a99e, 
    $b77f19b6, $e0a9dc09, $662d09a1, $c4324633,
    $e85a1f02, $09f0be8c, $4a99a025, $1d6efe10, 
    $1ab93d1d, $0ba5a4df, $a186f20f, $2868f169,
    $dcb7da83, $573906fe, $a1e2ce9b, $4fcd7f52,
    $50115e01, $a70683fa, $a002b5c4, $0de6d027, 
    $9af88c27, $773f8641, $c3604c06, $61a806b5,
    $f0177a28, $c0f586e0, $006058aa, $30dc7d62, 
    $11e69ed7, $2338ea63, $53c2dd94, $c2c21634, 
    $bbcbee56, $90bcb6de, $ebfc7da1, $ce591d76, 
    $6f05e409, $4b7c0188, $39720a3d, $7c927c24,
    $86e3725f, $724d9db9, $1ac15bb4, $d39eb8fc,
    $ed545578, $08fca5b5, $d83d7cd3, $4dad0fc4,
    $1e50ef5e, $b161e6f8, $a28514d9, $6c51133c,
    $6fd5c7e7, $56e14ec4, $362abfce, $ddc6c837,
    $d79a3234, $92638212, $670efa8e, $406000e0),
    ($3a39ce37, $d3faf5cf, $abc27737, $5ac52d1b,
    $5cb0679e, $4fa33742, $d3822740, $99bc9bbe, 
    $d5118e9d, $bf0f7315, $d62d1c7e, $c700c47b,
    $b78c1b6b, $21a19045, $b26eb1be, $6a366eb4,
    $5748ab2f, $bc946e79, $c6a376d2, $6549c2c8, 
    $530ff8ee, $468dde7d, $d5730a1d, $4cd04dc6,
    $2939bbdb, $a9ba4650, $ac9526e8, $be5ee304,
    $a1fad5f0, $6a2d519a, $63ef8ce2, $9a86ee22,
    $c089c2b8, $43242ef6, $a51e03aa, $9cf2d0a4, 
    $83c061ba, $9be96a4d, $8fe51550, $ba645bd6, 
    $2826a2f9, $a73a3ae1, $4ba99586, $ef5562e9,
    $c72fefd3, $f752f7da, $3f046f69, $77fa0a59, 
    $80e4a915, $87b08601, $9b09e6ad, $3b3ee593, 
    $e990fd5a, $9e34d797, $2cf0b7d9, $022b8b51, 
    $96d5ac3a, $017da67d, $d1cf3ed6, $7c7d2d28, 
    $1f9f25cf, $adf2b89b, $5ad6b472, $5a88f54c,
    $e029ac71, $e019a5e6, $47b0acfd, $ed93fa9b, 
    $e8d3c48d, $283b57cc, $f8d56629, $79132e28,
    $785f0191, $ed756055, $f7960e44, $e3d35e8c, 
    $15056dd4, $88f46dba, $03a16125, $0564f0bd, 
    $c3eb9e15, $3c9057a2, $97271aec, $a93a072a,
    $1b3f6d9b, $1e6321f5, $f59c66fb, $26dcf319, 
    $7533d928, $b155fdf5, $03563482, $8aba3cbb,
    $28517711, $c20ad9f8, $abcc5167, $ccad925f,
    $4de81751, $3830dc8e, $379d5862, $9320f991, 
    $ea7a90c2, $fb3e7bce, $5121ce64, $774fbe32,
    $a8b6e37e, $c3293d46, $48de5369, $6413e680, 
    $a2ae0810, $dd6db224, $69852dfd, $09072166, 
    $b39a460a, $6445c0dd, $586cdecf, $1c20c8ae, 
    $5bbef7dd, $1b588d40, $ccd2017f, $6bb4e3bb, 
    $dda26a7e, $3a59ff45, $3e350a44, $bcb4cdd5,
    $72eacea8, $fa6484bb, $8d6612ae, $bf3c6f47, 
    $d29be463, $542f5d9e, $aec2771b, $f64e6370, 
    $740e0d8d, $e75b1357, $f8721671, $af537d5d,
    $4040cb08, $4eb4e2cc, $34d2466a, $0115af84, 
    $e1b00428, $95983a1d, $06b89fb4, $ce6ea048,
    $6f3f3b82, $3520ab82, $011a1d4b, $277227f8, 
    $611560b1, $e7933fdc, $bb3a792b, $344525bd, 
    $a08839e1, $51ce794b, $2f32c9b7, $a01fbac9, 
    $e01cc87e, $bcc7d1f6, $cf0111c3, $a1e8aac7, 
    $1a908749, $d44fbd9a, $d0dadecb, $d50ada38,
    $0339c32a, $c6913667, $8df9317c, $e0b12b4f,
    $f79e59b7, $43f5bb3a, $f2d519ff, $27d9459c,
    $bf97222c, $15e6fc2a, $0f91fc71, $9b941525,
    $fae59361, $ceb69ceb, $c2a86459, $12baa8d1, 
    $b6c1075e, $e3056a0c, $10d25065, $cb03a442,
    $e0ec6e0e, $1698db3b, $4c98a0be, $3278e964, 
    $9f1f9532, $e0d392df, $d3a0342b, $8971f21e, 
    $1b0a7441, $4ba3348c, $c5be7120, $c37632d8, 
    $df359f8d, $9b992f2e, $e60b6f47, $0fe3f11d, 
    $e54cda54, $1edad891, $ce6279cf, $cd3e7e6f,
    $1618b166, $fd2c1d05, $848fd2c5, $f6fb2299, 
    $f523f357, $a6327623, $93a83531, $56cccd02, 
    $acf08162, $5a75ebb5, $6e163697, $88d273cc, 
    $de966292, $81b949d0, $4c50901b, $71c65614, 
    $e6c6c7bd, $327a140a, $45e1d006, $c3f27b9a,
    $c9aa53fd, $62a80f00, $bb25bfe2, $35bdd2f6,
    $71126905, $b2040222, $b6cbcf7c, $cd769c2b, 
    $53113ec0, $1640e3d3, $38abbd60, $2547adf0,
    $ba38209c, $f746ce76, $77afa1c5, $20756060, 
    $85cbfe4e, $8ae88dd8, $7aaaf9b0, $4cf9aa7e,
    $1948c25c, $02fb8a8c, $01c36ae4, $d6ebe1f9, 
    $90d4f869, $a65cdea0, $3f09252d, $c208e69f,
    $b74e6132, $ce77e25b, $578fdfe3, $3ac372e6));

var
  Padding: TByteArray64 =
    ($80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

function _F(x, y, z: longword): longword;
begin
  Result := (((x) and (y)) or ((not x) and (z)));
end;

function _G(x, y, z: longword): longword;
begin
  Result := (((x) and (z)) or ((y) and (not z)));
end;

function _H(x, y, z: longword): longword;
begin
  Result := ((x) xor (y) xor (z));
end;

function _I(x, y, z: longword): longword;
begin
  Result := ((y) xor ((x) or (not z)));
end;

function RotL(x, n: longword): longword;
begin
  Result := (((x) shl (n)) or ((x) shr (32 - (n))));
end;

procedure FF(var a: longword; b, c, d, x, s, ac: longword);
var
   i: int64;
begin
  i := a;
  i := i + _F(b, c, d) + x + ac;
  i := RotL(longword(i), s);
  i := i + b;
  a := longword(i);
end;

procedure GG(var a: longword; b, c, d, x, s, ac: longword);
var
   i: int64;
begin
  i := a;
  i := i + _G(b, c, d) + x + ac;
  i := RotL(longword(i), s);
  i := i + b;
  a := longword(i);
end;

procedure HH(var a: longword; b, c, d, x, s, ac: longword);
var
   i: int64;
begin
  i := a;
  i := i + _H(b, c, d) + x + ac;
  i := RotL(longword(i), s);
  i := i + b;
  a := longword(i);
end;

procedure II(var a: longword; b, c, d, x, s, ac: longword);
var
   i: int64;
begin
  i := a;
  i := i + _I(b, c, d) + x + ac;
  i := RotL(longword(i), s);
  i := i + b;
  a := longword(i);
end;

procedure MD5Encode(Output: PByteArray; Input: PLongWordArray; Len: longword);
var
  i, j: longword;
begin
  j := 0;
  i := 0;
  while j < Len do 
  begin
    output[j]     := byte(input[i] and $ff);
    output[j + 1] := byte((input[i] shr 8) and $ff);
    output[j + 2] := byte((input[i] shr 16) and $ff);
    output[j + 3] := byte((input[i] shr 24) and $ff);
    Inc(j, 4);
    Inc(i);
  end;
end;

procedure MD5Decode(Output: PLongWordArray; Input: PByteArray; Len: longword);
var
  i, j: longword;
begin
  j := 0;
  i := 0;
  while j < Len do 
  begin
    Output[i] := longword(Input[j]) or (longword(Input[j + 1]) shl 8) or
      (longword(Input[j + 2]) shl 16) or (longword(Input[j + 3]) shl 24);
    Inc(j, 4);
    Inc(i);
  end;
end;

procedure MD5Transform(State: PLongWordArray4; Buffer: PByteArray64);
var
  a, b, c, d: longword;
  x:          array[0..15] of longword;
  i: int64;
begin
  a := State[0];
  b := State[1];
  c := State[2];
  d := State[3];
  MD5Decode(PLongWordArray(@x), PByteArray(Buffer), 64);

  FF(a, b, c, d, x[0], S11, $d76aa478);
  FF(d, a, b, c, x[1], S12, $e8c7b756);
  FF(c, d, a, b, x[2], S13, $242070db);
  FF(b, c, d, a, x[3], S14, $c1bdceee);
  FF(a, b, c, d, x[4], S11, $f57c0faf);
  FF(d, a, b, c, x[5], S12, $4787c62a);
  FF(c, d, a, b, x[6], S13, $a8304613);
  FF(b, c, d, a, x[7], S14, $fd469501);
  FF(a, b, c, d, x[8], S11, $698098d8);
  FF(d, a, b, c, x[9], S12, $8b44f7af);
  FF(c, d, a, b, x[10], S13, $ffff5bb1);
  FF(b, c, d, a, x[11], S14, $895cd7be);
  FF(a, b, c, d, x[12], S11, $6b901122);
  FF(d, a, b, c, x[13], S12, $fd987193);
  FF(c, d, a, b, x[14], S13, $a679438e);
  FF(b, c, d, a, x[15], S14, $49b40821);

  GG(a, b, c, d, x[1], S21, $f61e2562);
  GG(d, a, b, c, x[6], S22, $c040b340);
  GG(c, d, a, b, x[11], S23, $265e5a51);
  GG(b, c, d, a, x[0], S24, $e9b6c7aa);
  GG(a, b, c, d, x[5], S21, $d62f105d);
  GG(d, a, b, c, x[10], S22, $2441453);
  GG(c, d, a, b, x[15], S23, $d8a1e681);
  GG(b, c, d, a, x[4], S24, $e7d3fbc8);
  GG(a, b, c, d, x[9], S21, $21e1cde6);
  GG(d, a, b, c, x[14], S22, $c33707d6);
  GG(c, d, a, b, x[3], S23, $f4d50d87);

  GG(b, c, d, a, x[8], S24, $455a14ed);
  GG(a, b, c, d, x[13], S21, $a9e3e905);
  GG(d, a, b, c, x[2], S22, $fcefa3f8);
  GG(c, d, a, b, x[7], S23, $676f02d9);
  GG(b, c, d, a, x[12], S24, $8d2a4c8a);

  HH(a, b, c, d, x[5], S31, $fffa3942);
  HH(d, a, b, c, x[8], S32, $8771f681);
  HH(c, d, a, b, x[11], S33, $6d9d6122);
  HH(b, c, d, a, x[14], S34, $fde5380c);
  HH(a, b, c, d, x[1], S31, $a4beea44);
  HH(d, a, b, c, x[4], S32, $4bdecfa9);
  HH(c, d, a, b, x[7], S33, $f6bb4b60);
  HH(b, c, d, a, x[10], S34, $bebfbc70);
  HH(a, b, c, d, x[13], S31, $289b7ec6);
  HH(d, a, b, c, x[0], S32, $eaa127fa);
  HH(c, d, a, b, x[3], S33, $d4ef3085);
  HH(b, c, d, a, x[6], S34, $4881d05);
  HH(a, b, c, d, x[9], S31, $d9d4d039);
  HH(d, a, b, c, x[12], S32, $e6db99e5);
  HH(c, d, a, b, x[15], S33, $1fa27cf8);
  HH(b, c, d, a, x[2], S34, $c4ac5665);

  II(a, b, c, d, x[0], S41, $f4292244);
  II(d, a, b, c, x[7], S42, $432aff97);
  II(c, d, a, b, x[14], S43, $ab9423a7);
  II(b, c, d, a, x[5], S44, $fc93a039);
  II(a, b, c, d, x[12], S41, $655b59c3);
  II(d, a, b, c, x[3], S42, $8f0ccc92);
  II(c, d, a, b, x[10], S43, $ffeff47d);
  II(b, c, d, a, x[1], S44, $85845dd1);
  II(a, b, c, d, x[8], S41, $6fa87e4f);
  II(d, a, b, c, x[15], S42, $fe2ce6e0);
  II(c, d, a, b, x[6], S43, $a3014314);
  II(b, c, d, a, x[13], S44, $4e0811a1);
  II(a, b, c, d, x[4], S41, $f7537e82);
  II(d, a, b, c, x[11], S42, $bd3af235);
  II(c, d, a, b, x[2], S43, $2ad7d2bb);
  II(b, c, d, a, x[9], S44, $eb86d391);

  i:=State[0];
  Inc(i, a);
  State[0] := longword(i);

  i:=State[1];
  Inc(i, b);
  State[1] := longword(i);

  i:=State[2];
  Inc(i, c);
  State[2] := longword(i);

  i:=State[3];
  Inc(i, d);
  State[3] := longword(i);

  FillChar(PByteArray(@x)^, SizeOf(x), #0);
end;

procedure MD5Init(var Context: TMD5Context);
begin
  FillChar(Context, SizeOf(Context), 0);
  Context.State[0] := $67452301;
  Context.State[1] := $efcdab89;
  Context.State[2] := $98badcfe;
  Context.State[3] := $10325476;
end;

procedure MD5Update(var Context: TMD5Context; Input: PByteArray; InputLen: longword);
var
  i, Index, PartLen: longword;
begin
  Index := longword((Context.Count[0] shr 3) and $3F);
  Inc(Context.Count[0], longword(InputLen) shl 3);
  if Context.Count[0] < longword(InputLen) shl 3 then
    Inc(Context.Count[1]);
  Inc(Context.Count[1], longword(InputLen) shr 29);
  PartLen := 64 - Index;
  if InputLen >= PartLen then 
  begin
    Move(Input^, PByteArray(@Context.Buffer[index])^, PartLen);
    MD5Transform(@Context.State, @Context.Buffer);
    i := PartLen;
    while i + 63 < InputLen do 
    begin
      MD5Transform(@Context.State, PByteArray64(@Input[i]));
      Inc(i, 64);
    end;
    Index := 0;
  end 
  else
    i := 0;
  Move(PByteArray(@Input[i])^, PByteArray(@Context.Buffer[Index])^, InputLen - i);
end;

procedure MD5Final(var Digest: TMD5Digest; var Context: TMD5Context);
var
  Bits:          array [0..7] of byte;
  Index, PadLen: longword;
begin
  MD5Encode(PByteArray(@Bits), PLongWordArray(@Context.Count), 8);
  Index := longword((Context.Count[0] shr 3) and $3F);
  if Index < 56 then
    PadLen := 56 - Index
  else
    PadLen := 120 - Index;
  MD5Update(Context, PByteArray(@PADDING), PadLen);
  MD5Update(Context, PByteArray(@Bits), 8);
  MD5Encode(PByteArray(@Digest), PLongWordArray(@Context.State), 16);
  FillChar(PByteArray(@Context)^, SizeOf(Context), #0);
end;

function MD5DigestToString(const ADigest: TMD5Digest): string;
var
  i: integer;
begin
  Result := '';
  for i := 0 to 15 do
    Result := Result + IntToHex(ADigest.v[i], 2);
end;

function MD5String(const AString: AnsiString): TMD5Digest;
begin
  Result := MD5Buffer(PChar(AString)^, Length(AString));
end;

function MD5File(const AFileName: string): TMD5Digest;
var
  f: TFileStream;
begin
  f := TFileStream.Create(AFileName, fmOpenRead);
  try
    Result := MD5Stream(f);
  finally
    f.Free;
  end;
end;

function MD5Stream(const AStream: TStream): TMD5Digest;
var
  Context:    TMD5Context;
  Buffer:     array[0..4095] of byte;
  Size:       integer;
  ReadBytes:  integer;
  TotalBytes: integer;
  SavePos:    integer;
begin
  MD5Init(Context);
  Size       := AStream.Size;
  SavePos    := AStream.Position;
  TotalBytes := 0;
  try
    AStream.Seek(0, soFromBeginning);
    repeat
      ReadBytes := AStream.Read(Buffer, SizeOf(Buffer));
      Inc(TotalBytes, ReadBytes);
      MD5Update(Context, @Buffer, ReadBytes);
    until (ReadBytes = 0) or (TotalBytes = Size);
  finally
    AStream.Seek(SavePos, soFromBeginning);
  end;
  MD5Final(Result, Context);
end;

function MD5Buffer(const ABuffer; ASize: integer): TMD5Digest;
var
  Context: TMD5Context;
begin
  MD5Init(Context);
  MD5Update(Context, PByteArray(@ABuffer), ASize);
  MD5Final(Result, Context);
end;

function MD5DigestCompare(const ADigest1, ADigest2: TMD5Digest): boolean;
begin
  Result := False;
  if ADigest1.A <> ADigest2.A then
    Exit;
  if ADigest1.B <> ADigest2.B then
    Exit;
  if ADigest1.C <> ADigest2.C then
    Exit;
  if ADigest1.D <> ADigest2.D then
    Exit;
  Result := True;
end;

procedure XorBlock(Input1, Input2, Output: PByteArray; Length: integer);
var
  i: integer;
begin
  for i := 0 to Length - 1 do
    Output[i] := Input1[i] xor Input2[i];
end;

procedure IncBlock(P: PByteArray; Len: integer);
begin
  Inc(P[Len - 1]);
  if (P[Len - 1] = 0) and (Len > 1) then
    IncBlock(P, Len - 1);
end;

procedure BFEncryptECB(const Data: TBlowfishData; Input, Output: Pointer);
var
  L, R: longword;
  i: int64;
begin
  Move(Input^, L, 4);
  Move(Pointer(integer(Input) + 4)^, R, 4);
  L := (L shr 24) or ((L shr 8) and $FF00) or ((L shl 8) and $FF0000) or (L shl 24);
  R := (R shr 24) or ((R shr 8) and $FF00) or ((R shl 8) and $FF0000) or (R shl 24);
  L := L xor Data.PBoxM[0];
  i := R;
  i := i xor (((int64(Data.SBoxM[0, (L shr 24) and $FF]) + int64(Data.SBoxM[1, (L shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (L shr 8) and $FF])) + int64(Data.SBoxM[3, L and $FF])) xor int64(Data.PBoxM[1]);
  R := longword(i);
  i := L;
  i := i xor (((int64(Data.SBoxM[0, (R shr 24) and $FF]) + int64(Data.SBoxM[1, (R shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (R shr 8) and $FF])) + int64(Data.SBoxM[3, R and $FF])) xor int64(Data.PBoxM[2]);
  L := longword(i);
  i := R;
  i := i xor (((int64(Data.SBoxM[0, (L shr 24) and $FF]) + int64(Data.SBoxM[1, (L shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (L shr 8) and $FF])) + int64(Data.SBoxM[3, L and $FF])) xor int64(Data.PBoxM[3]);
  R := longword(i);
  i := L;
  i := i xor (((int64(Data.SBoxM[0, (R shr 24) and $FF]) + int64(Data.SBoxM[1, (R shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (R shr 8) and $FF])) + int64(Data.SBoxM[3, R and $FF])) xor int64(Data.PBoxM[4]);
  L := longword(i);
  i := R;
  i := i xor (((int64(Data.SBoxM[0, (L shr 24) and $FF]) + int64(Data.SBoxM[1, (L shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (L shr 8) and $FF])) + int64(Data.SBoxM[3, L and $FF])) xor int64(Data.PBoxM[5]);
  R := longword(i);
  i := L;
  i := i xor (((int64(Data.SBoxM[0, (R shr 24) and $FF]) + int64(Data.SBoxM[1, (R shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (R shr 8) and $FF])) + int64(Data.SBoxM[3, R and $FF])) xor int64(Data.PBoxM[6]);
  L := longword(i);
  i := R;
  i := i xor (((int64(Data.SBoxM[0, (L shr 24) and $FF]) + int64(Data.SBoxM[1, (L shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (L shr 8) and $FF])) + int64(Data.SBoxM[3, L and $FF])) xor int64(Data.PBoxM[7]);
  R := longword(i);
  i := L;
  i := i xor (((int64(Data.SBoxM[0, (R shr 24) and $FF]) + int64(Data.SBoxM[1, (R shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (R shr 8) and $FF])) + int64(Data.SBoxM[3, R and $FF])) xor int64(Data.PBoxM[8]);
  L := longword(i);
  i := R;
  i := i xor (((int64(Data.SBoxM[0, (L shr 24) and $FF]) + int64(Data.SBoxM[1, (L shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (L shr 8) and $FF])) + int64(Data.SBoxM[3, L and $FF])) xor int64(Data.PBoxM[9]);
  R := longword(i);
  i := L;
  i := i xor (((int64(Data.SBoxM[0, (R shr 24) and $FF]) + int64(Data.SBoxM[1, (R shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (R shr 8) and $FF])) + int64(Data.SBoxM[3, R and $FF])) xor int64(Data.PBoxM[10]);
  L := longword(i);
  i := R;
  i := i xor (((int64(Data.SBoxM[0, (L shr 24) and $FF]) + int64(Data.SBoxM[1, (L shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (L shr 8) and $FF])) + int64(Data.SBoxM[3, L and $FF])) xor int64(Data.PBoxM[11]);
  R := longword(i);
  i := L;
  i := i xor (((int64(Data.SBoxM[0, (R shr 24) and $FF]) + int64(Data.SBoxM[1, (R shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (R shr 8) and $FF])) + int64(Data.SBoxM[3, R and $FF])) xor int64(Data.PBoxM[12]);
  L := longword(i);
  i := R;
  i := i xor (((int64(Data.SBoxM[0, (L shr 24) and $FF]) + int64(Data.SBoxM[1, (L shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (L shr 8) and $FF])) + int64(Data.SBoxM[3, L and $FF])) xor int64(Data.PBoxM[13]);
  R := longword(i);
  i := L;
  i := i xor (((int64(Data.SBoxM[0, (R shr 24) and $FF]) + int64(Data.SBoxM[1, (R shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (R shr 8) and $FF])) + int64(Data.SBoxM[3, R and $FF])) xor int64(Data.PBoxM[14]);
  L := longword(i);
  i := R;
  i := i xor (((int64(Data.SBoxM[0, (L shr 24) and $FF]) + int64(Data.SBoxM[1, (L shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (L shr 8) and $FF])) + int64(Data.SBoxM[3, L and $FF])) xor int64(Data.PBoxM[15]);
  R := longword(i);
  i := L;
  i := i xor (((int64(Data.SBoxM[0, (R shr 24) and $FF]) + int64(Data.SBoxM[1, (R shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (R shr 8) and $FF])) + int64(Data.SBoxM[3, R and $FF])) xor int64(Data.PBoxM[16]);
  L := longword(i);
  R := R xor Data.PBoxM[17];
  L := (L shr 24) or ((L shr 8) and $FF00) or ((L shl 8) and $FF0000) or (L shl 24);
  R := (R shr 24) or ((R shr 8) and $FF00) or ((R shl 8) and $FF0000) or (R shl 24);
  Move(R, Output^, 4);
  Move(L, Pointer(integer(Output) + 4)^, 4);
end;

procedure BFDecryptECB(const Data: TBlowfishData; Input, Output: Pointer);
var
  L, R: longword;
  i: int64;
begin
  Move(Input^, L, 4);
  Move(Pointer(integer(Input) + 4)^, R, 4);
  L := (L shr 24) or ((L shr 8) and $FF00) or ((L shl 8) and $FF0000) or (L shl 24);
  R := (R shr 24) or ((R shr 8) and $FF00) or ((R shl 8) and $FF0000) or (R shl 24);
  L := L xor Data.PBoxM[17];
  i := R;
  i := i xor (((int64(Data.SBoxM[0, (L shr 24) and $FF]) + int64(Data.SBoxM[1, (L shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (L shr 8) and $FF])) + int64(Data.SBoxM[3, L and $FF])) xor int64(Data.PBoxM[16]);
  R := longword(i);
  i := L;
  i := i xor (((int64(Data.SBoxM[0, (R shr 24) and $FF]) + int64(Data.SBoxM[1, (R shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (R shr 8) and $FF])) + int64(Data.SBoxM[3, R and $FF])) xor int64(Data.PBoxM[15]);
  L := longword(i);
  i := R;
  i := i xor (((int64(Data.SBoxM[0, (L shr 24) and $FF]) + int64(Data.SBoxM[1, (L shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (L shr 8) and $FF])) + int64(Data.SBoxM[3, L and $FF])) xor int64(Data.PBoxM[14]);
  R := longword(i);
  i := L;
  i := i xor (((int64(Data.SBoxM[0, (R shr 24) and $FF]) + int64(Data.SBoxM[1, (R shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (R shr 8) and $FF])) + int64(Data.SBoxM[3, R and $FF])) xor int64(Data.PBoxM[13]);
  L := longword(i);
  i := R;
  i := i xor (((int64(Data.SBoxM[0, (L shr 24) and $FF]) + int64(Data.SBoxM[1, (L shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (L shr 8) and $FF])) + int64(Data.SBoxM[3, L and $FF])) xor int64(Data.PBoxM[12]);
  R := longword(i);
  i := L;
  i := i xor (((int64(Data.SBoxM[0, (R shr 24) and $FF]) + int64(Data.SBoxM[1, (R shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (R shr 8) and $FF])) + int64(Data.SBoxM[3, R and $FF])) xor int64(Data.PBoxM[11]);
  L := longword(i);
  i := R;
  i := i xor (((int64(Data.SBoxM[0, (L shr 24) and $FF]) + int64(Data.SBoxM[1, (L shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (L shr 8) and $FF])) + int64(Data.SBoxM[3, L and $FF])) xor int64(Data.PBoxM[10]);
  R := longword(i);
  i := L;
  i := i xor (((int64(Data.SBoxM[0, (R shr 24) and $FF]) + int64(Data.SBoxM[1, (R shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (R shr 8) and $FF])) + int64(Data.SBoxM[3, R and $FF])) xor int64(Data.PBoxM[9]);
  L := longword(i);
  i := R;
  i := i xor (((int64(Data.SBoxM[0, (L shr 24) and $FF]) + int64(Data.SBoxM[1, (L shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (L shr 8) and $FF])) + int64(Data.SBoxM[3, L and $FF])) xor int64(Data.PBoxM[8]);
  R := longword(i);
  i := L;
  i := i xor (((int64(Data.SBoxM[0, (R shr 24) and $FF]) + int64(Data.SBoxM[1, (R shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (R shr 8) and $FF])) + int64(Data.SBoxM[3, R and $FF])) xor int64(Data.PBoxM[7]);
  L := longword(i);
  i := R;
  i := i xor (((int64(Data.SBoxM[0, (L shr 24) and $FF]) + int64(Data.SBoxM[1, (L shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (L shr 8) and $FF])) + int64(Data.SBoxM[3, L and $FF])) xor int64(Data.PBoxM[6]);
  R := longword(i);
  i := L;
  i := i xor (((int64(Data.SBoxM[0, (R shr 24) and $FF]) + int64(Data.SBoxM[1, (R shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (R shr 8) and $FF])) + int64(Data.SBoxM[3, R and $FF])) xor int64(Data.PBoxM[5]);
  L := longword(i);
  i := R;
  i := i xor (((int64(Data.SBoxM[0, (L shr 24) and $FF]) + int64(Data.SBoxM[1, (L shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (L shr 8) and $FF])) + int64(Data.SBoxM[3, L and $FF])) xor int64(Data.PBoxM[4]);
  R := longword(i);
  i := L;
  i := i xor (((int64(Data.SBoxM[0, (R shr 24) and $FF]) + int64(Data.SBoxM[1, (R shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (R shr 8) and $FF])) + int64(Data.SBoxM[3, R and $FF])) xor int64(Data.PBoxM[3]);
  L := longword(i);
  i := R;
  i := i xor (((int64(Data.SBoxM[0, (L shr 24) and $FF]) + int64(Data.SBoxM[1, (L shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (L shr 8) and $FF])) + int64(Data.SBoxM[3, L and $FF])) xor int64(Data.PBoxM[2]);
  R := longword(i);
  i := L;
  i := i xor (((int64(Data.SBoxM[0, (R shr 24) and $FF]) + int64(Data.SBoxM[1, (R shr 16) and $FF]))
    xor int64(Data.SBoxM[2, (R shr 8) and $FF])) + int64(Data.SBoxM[3, R and $FF])) xor int64(Data.PBoxM[1]);
  L := longword(i);
  R := R xor Data.PBoxM[0];
  L := (L shr 24) or ((L shr 8) and $FF00) or ((L shl 8) and $FF0000) or (L shl 24);
  R := (R shr 24) or ((R shr 8) and $FF00) or ((R shl 8) and $FF0000) or (R shl 24);
  Move(R, Output^, 4);
  Move(L, Pointer(integer(Output) + 4)^, 4);
end;

function BFTest : Boolean;
const
  Key: array[0..7] of byte = ($01, $23, $45, $67, $89, $AB, $CD, $EF);
  InBlock: array[0..7] of byte = ($11, $11, $11, $11, $11, $11, $11, $11);
  OutBlock: array[0..7] of byte = ($61, $F9, $C3, $80, $22, $81, $B0, $96);
var
  Block: array[0..7] of byte;
  Data:  TBlowfishData;
begin
  BFInit(Data, @Key, SizeOf(Key), nil);
  BFEncryptECB(Data, @InBlock, @Block);
  Result := CompareMem(@Block, @OutBlock, Sizeof(Block));
  BFDecryptECB(Data, @Block, @Block);
  Result := Result and CompareMem(@Block, @InBlock, Sizeof(Block));
  FillChar(Data,SizeOf(Data),#0);
end;

procedure BFInit(var Data: TBlowfishData; Key: Pointer; Len: integer; IV: Pointer);
var
  i, k:  integer;
  A:     longword;
  KeyB:  PByteArray;
  Block: array[0..7] of byte;
begin
  KeyB := Key;
  Move(SBox, Data.SBoxM, Sizeof(SBox));
  Move(PBox, Data.PBoxM, Sizeof(PBox));
  with Data do
  begin
    if IV = nil then
    begin
      FillChar(InitBlock, 8, 0);
      FillChar(LastBlock, 8, 0);
    end
    else
    begin
      Move(IV^, InitBlock, 8);
      Move(IV^, LastBlock, 8);
    end;
    k := 0;
    for i := 0 to 17 do
    begin
      A        := KeyB[(k + 3) mod Len];
      A        := A + (KeyB[(k + 2) mod Len] shl 8);
      A        := A + (KeyB[(k + 1) mod Len] shl 16);
      A        := A + (KeyB[k] shl 24);
      PBoxM[i] := PBoxM[i] xor A;
      k        := (k + 4) mod Len;
    end;
    FillChar(Block, Sizeof(Block), 0);
    for i := 0 to 8 do
    begin
      BFEncryptECB(Data, @Block, @Block);
      PBoxM[i * 2]     := Block[3] + (Block[2] shl 8) + (Block[1] shl 16)
        + (Block[0] shl 24);
      PBoxM[i * 2 + 1] := Block[7] + (Block[6] shl 8) + (Block[5] shl 16) +
        (Block[4] shl 24);
    end;
    for k := 0 to 3 do
    begin
      for i := 0 to 127 do
      begin
        BFEncryptECB(Data, @Block, @Block);
        SBoxM[k, i * 2]     := Block[3] + (Block[2] shl 8) + (Block[1] shl 16) +
          (Block[0] shl 24);
        SBoxM[k, i * 2 + 1] := Block[7] + (Block[6] shl 8) +
          (Block[5] shl 16) + (Block[4] shl 24);
      end;
    end;
  end;
end;

procedure BFEncrypt(var Data: TBlowfishData; Input, Output: Pointer);
begin
  XorBlock(Input, @Data.LastBlock, Output, 8);
  BFEncryptECB(Data, Output, Output);
  Move(Output^, Data.LastBlock, 8);
end;

procedure BFDecrypt(var Data: TBlowfishData; Input, Output: Pointer);
var
  Block: array[0..7] of byte;
begin
  Move(Input^, Block, 8);
  BFDecryptECB(Data, Input, Output);
  XorBlock(Output, @Data.LastBlock, Output, 8);
  Move(Block, Data.LastBlock, 8);
end;

procedure BFReset(var Data: TBlowfishData);
begin
  Move(Data.InitBlock, Data.LastBlock, 8);
end;

end.
