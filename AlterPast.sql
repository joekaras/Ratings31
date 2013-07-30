ALTER TABLE PAST
   DROP IF EXISTS Last1stCallBL ,
   DROP IF EXISTS Last2ndCallBL,
   DROP IF EXISTS LastStCallBL,
   DROP IF EXISTS LastBL1stCall,
   DROP IF EXISTS LastBL2ndCall,
   DROP IF EXISTS LastBLStCall,
   ADD IF NOT EXISTS LastBL1stCall FLOAT DEFAULT 0,
   ADD IF NOT EXISTS LastBL2ndCall FLOAT DEFAULT 0,
   ADD IF NOT EXISTS LastBLStrCall FLOAT DEFAULT 0,
   ADD IF NOT EXISTS LastBLFinCall FLOAT DEFAULT 0,
   ADD IF NOT EXISTS LastPos1stCall FLOAT DEFAULT 0,
   ADD IF NOT EXISTS LastPos2ndCall FLOAT DEFAULT 0,
   ADD IF NOT EXISTS LastPosStrCall FLOAT DEFAULT 0,
   ADD IF NOT EXISTS LastPosFinCall FLOAT DEFAULT 0,
   ADD IF NOT EXISTS LastTime1stCall FLOAT DEFAULT 0,
   ADD IF NOT EXISTS LastTime2ndCall FLOAT DEFAULT 0,
   ADD IF NOT EXISTS LastTimeStrCall FLOAT DEFAULT 0,
   ADD IF NOT EXISTS LastTimeFinCall FLOAT DEFAULT 0
;

ALTER TABLE PP

   ADD IF NOT EXISTS BL1stCall FLOAT DEFAULT 0,
   ADD IF NOT EXISTS BL2ndCall FLOAT DEFAULT 0,
   ADD IF NOT EXISTS BLStrCall FLOAT DEFAULT 0,
   ADD IF NOT EXISTS BLFinCall FLOAT DEFAULT 0,

   ADD IF NOT EXISTS TimeFinCall FLOAT DEFAULT 0,
   ADD IF NOT EXISTS Time1stCall FLOAT DEFAULT 0,
   ADD IF NOT EXISTS Time2ndCall FLOAT DEFAULT 0,
   ADD IF NOT EXISTS TimeStrCall FLOAT DEFAULT 0,

   ADD IF NOT EXISTS PosFinCall FLOAT DEFAULT 0,
   ADD IF NOT EXISTS Pos1stCall FLOAT DEFAULT 0,
   ADD IF NOT EXISTS Pos2ndCall FLOAT DEFAULT 0,
   ADD IF NOT EXISTS PosStrCall FLOAT DEFAULT 0,


   drop  if exists TimeCall1st,
   drop  if exists TimeCall2nd,
   drop  if exists TimeCallStr,
   drop  if exists PosCall1st,
   drop  if exists PosCall2nd,
   drop  if exists PosCallStr,
                          
   drop if exists Call1st,
   drop if exists Call2nd,
   drop if exists Call3rd,
   drop if exists FinCall,
 
   drop if exists EarlyPacePos,
   drop if exists MiddlePacePos,
   drop if exists LatePacePos,
   drop if exists FinishPacePos,
   drop if exists WinTime,
   drop if exists FinBL,
   drop if exists Call1stBL,
   drop if exists Call2ndBL,
   drop if exists CallStBL;
