unit zlibcomp;

{$WARNINGS OFF}

{*********************************************************}
{* ZLib compression. This unit is provided as freeware   *}
{* and is written for 32-bit Delphi (D2 and higher).     *}
{*                                                       *}
{* As noted in the source, portions are copyrighted by   *}
{* the following parties:                                *}
{*   Copyright (c) 1997 Borland International            *}
{*   Copyright (c) 2000-2001 David O. Martin             *}
{*********************************************************}

{-------------------------------------------------------------}
{ Version history:                                            }
{   09/19/00  Version 1.0                                     }
{   10/30/00  Version 1.1. Moved CompressBuf and              }
{             DecompressBuf to the interface section.         }
{   03/08/01  Version 1.2. Added ZLibCompressStringFxn,       }
{             ZLibDecompressStringFxn, ZLibCompressMemStream, }
{             ZLibDecompressMemStream.                        }
{-------------------------------------------------------------}

{ Removed ZLib compression routines for strings, etc. since
  DBISAM only needs CompressBuf and DecompressBuf and the other
  functions call Windows-specific API calls }

interface

uses Classes;

const
  Version = '1.2';

procedure CompressBuf(
  const inBuf: Pointer;     { input: pointer to source data }
        inBytes: Integer;   { input: # of bytes in inBuf }
        level: Integer;     { input: compression level }
    var outBuf: Pointer;    { output: pointer to newly allocated buffer with compressed data }
    var outBytes: Integer); { output: # of bytes in outBuf }
{ This routine compresses data. Level may vary from 0 to 9 (3 to 6 may
  be a reasonable trade-off between speed and compression).

  Compression levels:
    0 = no compression                 (Z_NO_COMPRESSION constant)
    1 = best speed                     (Z_BEST_SPEED constant)
    9 = best compression, but slowest  (Z_BEST_COMPRESSION constant) }

procedure DecompressBuf(
  const inBuf: Pointer;     { input: pointer to compressed data }
        inBytes: Integer;   { input: # of bytes in inBuf }
    var outBuf: Pointer;    { output: pointer to newly allocated buffer with decompressed data }
    var outBytes: Integer); { output: # of bytes in outBuf }
{ This routine decompresses data that was compressed with CompressBuf. Note
  that this works for all compression levels. }

implementation

uses SysUtils, zlibpas;

{----------------------------------------------------------}
{ The CompressBuf and DecompressBuf routines that were     }
{ shipped with Delphi 3-5 are based on zlib 1.0.4 and are  }
{ not compatible with zlib 1.1.2. The following are        }
{ rewritten versions of CompressBuf and DecompressBuf that }
{ take into account the differences between zlib 1.0.4 and }
{ 1.1.2. Testing has shown this version is significantly   }
{ faster than the zlib code distributed with Delphi 5.     }
{                                                          }
{ Copyright (c) 1997 Borland International                 }
{ Copyright (c) 2000-2001 David O. Martin                  }
{----------------------------------------------------------}

procedure CompressBuf(
  const inBuf: Pointer;     { input: pointer to source data }
        inBytes: Integer;   { input: # of bytes in inBuf }
        level: Integer;     { input: compression level }
    var outBuf: Pointer;    { output: pointer to newly allocated buffer with compressed data }
    var outBytes: Integer); { output: # of bytes in outBuf }
{ This routine compresses data. Level may vary from 0 to 9 (3 to 6 may
  be a reasonable trade-off between speed and compression).

  Compression levels:
    0 = no compression                 (Z_NO_COMPRESSION constant)
    1 = best speed                     (Z_BEST_SPEED constant)
    9 = best compression, but slowest  (Z_BEST_COMPRESSION constant) }

  function Check(code: Integer): Integer;
  begin
    Result := code;
    if (code < 0) then
      raise Exception.Create('Compression error: '+z_errmsg[2-code]);
  end;

var
  strm: z_stream;
begin
  FillChar(strm, sizeof(strm), 0);
  outBytes := ((inBytes + (inBytes div 10) + 12) + 255) and not 255;
  GetMem(outBuf, outBytes);
  try
    strm.next_in := inBuf;
    strm.avail_in := inBytes;
    strm.next_out := outBuf;
    strm.avail_out := outBytes;
    Check(deflateInit(strm, level));
    try
      while Check(deflate(strm, Z_FINISH)) <> Z_STREAM_END do begin
        Inc(outBytes, 256);
        ReallocMem(outBuf, outBytes);
        strm.next_out := pBytef(Integer(outBuf) + strm.total_out);
        strm.avail_out := 256;
      end;
    finally
      Check(deflateEnd(strm));
    end;
    ReallocMem(outBuf, strm.total_out);
    outBytes := strm.total_out;
  except
    DeAllocMem(outBuf);
    raise;
  end;
end;

procedure DecompressBuf(
  const inBuf: Pointer;     { input: pointer to compressed data }
        inBytes: Integer;   { input: # of bytes in inBuf }
    var outBuf: Pointer;    { output: pointer to newly allocated buffer with decompressed data }
    var outBytes: Integer); { output: # of bytes in outBuf }
{ This routine decompresses data that was compressed with CompressBuf. }

  function Check(code: Integer): Integer;
  begin
    Result := code;
    if (code < 0) then
      raise Exception.Create('Decompression error: '+z_errmsg[2-code]);
  end;

var
  strm: z_stream;
  bufInc: Integer;
begin
  FillChar(strm, sizeof(strm), 0);
  bufInc := (inBytes + 255) and not 255;
  outBytes := bufInc;
  GetMem(outBuf, outBytes);
  try
    strm.next_in := inBuf;
    strm.avail_in := inBytes;
    strm.next_out := outBuf;
    strm.avail_out := outBytes;
    Check(inflateInit(strm));
    try
      while Check(inflate(strm, Z_NO_FLUSH)) <> Z_STREAM_END do begin
        Inc(outBytes, bufInc);
        ReallocMem(outBuf, outBytes);
        strm.next_out := pBytef(Integer(outBuf) + strm.total_out);
        strm.avail_out := bufInc;
      end;
    finally
      Check(inflateEnd(strm));
    end;
    ReallocMem(outBuf, strm.total_out);
    outBytes := strm.total_out;
  except
    DeAllocMem(outBuf);
    raise;
  end;
end;

end.
