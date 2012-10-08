unit UnitImportHarness;


interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls;

procedure ImportHarness();

implementation
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode, ESBMaths2, HDataModule, StrMan, dbfDataModule;

procedure ImportHarness();
var
   iEndPos: Integer;
   iStartPos: Integer;
   iAttributes: Integer;

   sTmp: string;
   sSearch: string;

   tsFile: TSearchRec;
   dtDownLoadDate: TDateTime;
   dtPresent: TDateTime;

   wYear: Word;
   wMonth: Word;
   wDay: Word;
   sPath: string;
   sFileName: string;
   sRaceMM: string;
   sRaceDD: string;
   iLen: Integer;
   bOk: boolean;

   procedure ImportAxcisHarnessRaceEntry(
      sHarnessRaceFileName: string;
      sHarnessEntryFileName: string;
      sHarnessPastFileName: string;
      sHarnessTrainerFileName: string;
      sHarnessDriverFileName: string);
   var
      lRecNo: Longint;
      bFinished: Boolean;
      sCurrTrkCode: string;
      sSendTrkCode: string;
      sChartsTrkCode: string;

      procedure ImportAxcisHarnessEntry(lRecNo: Longint);
      var
         bFinished: boolean;
         fStarts: double;
         fWinPct: double;
         fWins: double;
         sCurrRaceNbr: string;
         sRaceNbr: string;

      begin

         hLog.AddToLog('ImportAxcisHarnessEntry', msevOperation);
         try

            dbfDm.dbfHarnessEntry.PhysicalRecNo := lRecNo;

            sRaceNbr := dbfDm.dbfHarnessEntry.FieldByName('RACE').AsString;
            sCurrRaceNbr := dbfDm.dbfHarnessRace.FieldByName('RACE').AsString;
            bFinished := False;
            while (sRaceNbr = sCurrRaceNbr) and (not bFinished) do begin

               if (sRaceNbr <> sCurrRaceNbr) then begin
                  exit;
               end;
               if (dbfDm.dbfHarnessEntry.Eof) then begin
                  bFinished := True;
               end;

               hdm.tblEntries.IndexName := '';
               hdm.tblEntries.SetKey();
               hdm.tblEntries.FieldByName('TrkCode').AsString := sFileTrkCode;
               hdm.tblEntries.FieldByName('RaceNbr').AsInteger := atoi(dbfDm.dbfHarnessRace.FieldByName('RACE').AsString);
               hdm.tblEntries.FieldByName('RaceDate').AsDateTime := dtAxcisRaceDate;
               hdm.tblEntries.FieldByName('ProgramNbr').AsString := dbfDm.dbfHarnessEntry.FieldByName('PROGRAM').AsString;

               try
                  if (hdm.tblEntries.GotoKey()) then begin
                     if hdm.tblEntries.RecordID > 0 then begin
                        //                  hdm.tblEntries.Edit();
                        //                  FldEntryAxcis();
                        //                  hdm.tblEntries.Post();
                     end;
                  end;
               except
                  on E: Exception do hLog.AddToLog(E.Message, msevException);
               end;

               dbfDm.dbfHarnessEntry.Next();
               sRaceNbr := dbfDm.dbfHarnessEntry.FieldByName('RACE').AsString;
            end;
         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;
      end;

   begin

      hLog.AddToLog('ImportAxcisHarnessRaceEntry', msevOperation);
      try

         dbfDm.dbfHarnessRace.Active := False;
         dbfDm.dbfHarnessRace.TableName := sHarnessRaceFileName;
         dbfDm.dbfHarnessRace.FilePath := AXCIS_BUGGY_PATH;
         dbfDm.dbfHarnessRace.FilePathFull := AXCIS_BUGGY_PATH;
         dbfDm.dbfHarnessRace.Active := True;

         dbfDm.dbfHarnessEntry.Active := False;
         dbfDm.dbfHarnessEntry.TableName := sHarnessEntryFileName;
         dbfDm.dbfHarnessEntry.FilePath := AXCIS_BUGGY_PATH;
         dbfDm.dbfHarnessEntry.FilePathFull := AXCIS_BUGGY_PATH;
         dbfDm.dbfHarnessEntry.Active := True;


         dbfDm.dbfHarnessTrainer.Active := False;
         dbfDm.dbfHarnessTrainer.TableName := sHarnessTrainerFileName;
         dbfDm.dbfHarnessTrainer.FilePath := AXCIS_BUGGY_PATH;
         dbfDm.dbfHarnessTrainer.FilePathFull := AXCIS_BUGGY_PATH;
         dbfDm.dbfHarnessTrainer.Active := True;

         dbfDm.dbfHarnessDriver.Active := False;
         dbfDm.dbfHarnessDriver.TableName := sHarnessDriverFileName;
         dbfDm.dbfHarnessDriver.FilePath := AXCIS_BUGGY_PATH;
         dbfDm.dbfHarnessDriver.FilePathFull := AXCIS_BUGGY_PATH;
         dbfDm.dbfHarnessDriver.Active := True;

         dbfDm.dbfHarnessPast.Active := False;
         dbfDm.dbfHarnessPast.TableName := sHarnessPastFileName;
         dbfDm.dbfHarnessPast.FilePath := AXCIS_BUGGY_PATH;
         dbfDm.dbfHarnessPast.FilePathFull := AXCIS_BUGGY_PATH;
         dbfDm.dbfHarnessPast.Active := True;


      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
            dbfDm.dbfHarnessRace.Active := False;
            dbfDm.dbfHarnessEntry.Active := False;
            dbfDm.dbfHarnessTrainer.Active := False;
            dbfDm.dbfHarnessDriver.Active := False;
            dbfDm.dbfHarnessPast.Active := False;
            MainForm.ClearPrgStatusBars();
         end;
      end;

      try
         OpenTableExclusive(hdm.tblRaces);
         OpenTableExclusive(hdm.tblTrack);
         OpenTableExclusive(hdm.tblEntries);

         //      UpdateStatusBar('Loading ' + sHarnessRaceFileName);

         MainForm.InitPrgBar(dbfDm.dbfHarnessRace.RecordCount);

         dbfDm.dbfHarnessRace.First;

         bFinished := False;
         while (not bFinished) do begin
            MainForm.IncPrgBar();

            if (dbfDm.dbfHarnessRace.Eof) then begin
               bFinished := True;
            end;

            sChartsTrkCode := '';
            hdm.tblTrack.IndexName := '';
            hdm.tblTrack.SetKey();
            hdm.tblTrack.FieldByName('TrkCode').Value := sFileTrkCode;
            if hdm.tblTrack.GotoKey() then begin
               sChartsTrkCode := Trim(hdm.tblTrack.FieldByName('ChartsTrkCode').AsString);
            end;

            sCurrTrkCode := dbfDm.dbfHarnessRace.FieldByName('TRACK').AsString;
            sSendTrkCode := dbfDm.dbfHarnessRace.FieldByName('SEND_TRACK').AsString;

            if (sCurrTrkCode = sChartsTrkCode) then begin
               MainForm.staBar.SimpleText := 'Importing ' + dbfDm.dbfHarnessRace.FieldByName('TRACK').AsString +
                  ' ' + DateToStr(dtAxcisRaceDate) + ' ' + dbfDm.dbfHarnessRace.FieldByName('RACE').AsString;

               lRecNo := atol(dbfDm.dbfHarnessRace.FieldByName('HORSE1').AsString);

               hdm.tblRaces.IndexName := '';
               hdm.tblRaces.SetKey();

               hdm.tblRaces.FieldByName('TrkCode').AsString := sFileTrkCode;
               hdm.tblRaces.FieldByName('RaceDate').AsDateTime := dtAxcisRaceDate;
               hdm.tblRaces.FieldByName('RaceNbr').AsInteger := dbfDm.dbfHarnessRace.FieldByName('RACE').AsInteger;

               if (hdm.tblRaces.GotoKey()) then begin
                  ImportAxcisHarnessEntry(lRecNo);
               end;
            end;
            dbfDm.dbfHarnessRace.Next();
         end;

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
            MainForm.ClearPrgStatusBars();
            dbfDm.dbfHarnessRace.Active := False;
            dbfDm.dbfHarnessEntry.Active := False;
            dbfDm.dbfHarnessTrainer.Active := False;
            dbfDm.dbfHarnessDriver.Active := False;
            dbfDm.dbfHarnessPast.Active := False;

            CloseTableExclusive(hdm.tblRaces);
            CloseTableExclusive(hdm.tblEntries);
            CloseTableExclusive(hdm.tblEntries);
         end;
      end;

      MainForm.ClearPrgStatusBars();
      dbfDm.dbfHarnessRace.Active := False;
      dbfDm.dbfHarnessEntry.Active := False;
      dbfDm.dbfHarnessTrainer.Active := False;
      dbfDm.dbfHarnessDriver.Active := False;
      dbfDm.dbfHarnessPast.Active := False;

      CloseTableExclusive(hdm.tblRaces);
      CloseTableExclusive(hdm.tblEntries);
      CloseTableExclusive(hdm.tblEntries);
   end;

   procedure ImportAxcisHarnessDriver(sHarnessDriverFileName: string);
   var
      lRecNo: Longint;
      bFinished: Boolean;

   begin


      hLog.AddToLog('ImportAxcisHarnessDriver', msevOperation);
      try

         dbfDm.dbfHarnessDriver.Active := False;
         dbfDm.dbfHarnessDriver.TableName := sHarnessDriverFileName;
         dbfDm.dbfHarnessDriver.FilePath := AXCIS_BUGGY_PATH;
         dbfDm.dbfHarnessDriver.FilePathFull := AXCIS_BUGGY_PATH;
         dbfDm.dbfHarnessDriver.Active := True;


      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
            dbfDm.dbfHarnessDriver.Active := False;
            MainForm.ClearPrgStatusBars();
         end;
      end;

      try
         OpenTableExclusive(hdm.tblDriver);

         //      UpdateStatusBar('Loading ' + sHarnessDriverFileName);
         MainForm.InitPrgBar(dbfDm.dbfHarnessDriver.RecordCount);

         dbfDm.dbfHarnessDriver.First;

         bFinished := False;
         while (not bFinished) do begin
            MainForm.IncPrgBar();

            if (dbfDm.dbfHarnessDriver.Eof) then begin
               bFinished := True;
            end;
            hdm.tblDriver.IndexName := '';
            hdm.tblDriver.SetKey();
            hdm.tblDriver.FieldByName('Number').AsString := dbfDm.dbfHarnessDriver.FieldByName('DRIVERNUM').AsString;
            if not (hdm.tblDriver.GotoKey()) then begin
               hdm.tblDriver.Append();
               hdm.tblDriver.FieldByName('Number').AsString := dbfDm.dbfHarnessDriver.FieldByName('DRIVERNUM').AsString;
               hdm.tblDriver.FieldByName('Name').AsString := dbfDm.dbfHarnessDriver.FieldByName('DRIVERNAME').AsString;
               hdm.tblDriver.Post();
            end;
            dbfDm.dbfHarnessDriver.Next();
         end;

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
            MainForm.ClearPrgStatusBars();
            dbfDm.dbfHarnessDriver.Active := False;
            CloseTableExclusive(hdm.tblDriver);
         end;
      end;

      MainForm.ClearPrgStatusBars();
      dbfDm.dbfHarnessDriver.Active := False;
      CloseTableExclusive(hdm.tblDriver);
   end;

   procedure ImportAxcisHarnessTrainer(sHarnessTrainerFileName: string);
   var
      lRecNo: Longint;
      bFinished: Boolean;

   begin

      hLog.AddToLog('ImportAxcisHarnessTrainer', msevOperation);
      try

         dbfDm.dbfHarnessTrainer.Active := False;
         dbfDm.dbfHarnessTrainer.TableName := sHarnessTrainerFileName;
         dbfDm.dbfHarnessTrainer.FilePath := AXCIS_BUGGY_PATH;
         dbfDm.dbfHarnessTrainer.FilePathFull := AXCIS_BUGGY_PATH;
         dbfDm.dbfHarnessTrainer.Active := True;

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
            dbfDm.dbfHarnessTrainer.Active := False;
            MainForm.ClearPrgStatusBars();
         end;
      end;

      try
         OpenTableExclusive(hdm.tblTrainer);

         //      UpdateStatusBar('Loading ' + sHarnessTrainerFileName);
         MainForm.InitPrgBar(dbfDm.dbfHarnessTrainer.RecordCount);

         dbfDm.dbfHarnessTrainer.First;

         bFinished := False;
         while (not bFinished) do begin
            MainForm.IncPrgBar();

            if (dbfDm.dbfHarnessTrainer.Eof) then begin
               bFinished := True;
            end;
            hdm.tblTrainer.IndexName := '';
            hdm.tblTrainer.SetKey();
            hdm.tblTrainer.FieldByName('Number').AsString := dbfDm.dbfHarnessTrainer.FieldByName('TRAINERNUM').AsString;
            if not (hdm.tblTrainer.GotoKey()) then begin
               hdm.tblTrainer.Append();
               hdm.tblTrainer.FieldByName('Number').AsString := dbfDm.dbfHarnessTrainer.FieldByName('TRAINERNUM').AsString;
               hdm.tblTrainer.FieldByName('Name').AsString := dbfDm.dbfHarnessTrainer.FieldByName('TRAINNAME').AsString;
               hdm.tblTrainer.Post();
            end;
            dbfDm.dbfHarnessTrainer.Next();
         end;

      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
            MainForm.ClearPrgStatusBars();
            dbfDm.dbfHarnessTrainer.Active := False;
            CloseTableExclusive(hdm.tblTrainer);
         end;
      end;

      MainForm.ClearPrgStatusBars();
      dbfDm.dbfHarnessTrainer.Active := False;
      CloseTableExclusive(hdm.tblTrainer);
   end;

   procedure ImportAxcisHarnessPast
         (
         sHarnessEntryFileName: string;
         sHarnessPastFileName: string;
         sHarnessTrainerFileName: string;
         sHarnessDriverFileName: string
         );
   var
      bFinished: boolean;

      sD: string;
      sM: string;
      sY: string;

      iStaCnt: integer;

      lHorseRecNo: longint;
      lDriverRecNo: longint;
      lSaveHorseRecNo: longint;

      sOwnerName: string;
      sBreederName: string;
      sSaddleCloth: string;

      sRace1BackTrkCode: string;
      sRace1BackRaceDesc: string;
      sRace1BackTrackSize: string;
      sRace1BackPostPos: string;
      sRace1BackGait: string;
      sRace1BackCond: string;
      sRace1BackClass: string;
      sRace1BackComment: string;
      sRace1BackClaimed: string;
      sRace1BackDriver: string;
      sRace1BackTrainer: string;
      sRace1BackFinish: string;
      sRace1BackDHDQ: string;
      sRace1BackFav: string;
      sRace1BackOdds: string;
      sRace1BackTime: string;
      sRace1Back4Q: string;

      sRace2BackTrkCode: string;
      sRace2BackRaceDesc: string;
      sRace2BackTrackSize: string;
      sRace2BackPostPos: string;
      sRace2BackGait: string;
      sRace2BackCond: string;
      sRace2BackClass: string;
      sRace2BackComment: string;
      sRace2BackClaimed: string;
      sRace2BackDriver: string;
      sRace2BackTrainer: string;
      sRace2BackFinish: string;
      sRace2BackDHDQ: string;
      sRace2BackFav: string;
      sRace2BackOdds: string;
      sRace2BackTime: string;
      sRace2Back4Q: string;

      sRace3BackTrkCode: string;
      sRace3BackRaceDesc: string;
      sRace3BackTrackSize: string;
      sRace3BackPostPos: string;
      sRace3BackGait: string;
      sRace3BackCond: string;
      sRace3BackClass: string;
      sRace3BackComment: string;
      sRace3BackClaimed: string;
      sRace3BackDriver: string;
      sRace3BackTrainer: string;
      sRace3BackFinish: string;
      sRace3BackDHDQ: string;
      sRace3BackFav: string;
      sRace3BackOdds: string;
      sRace3BackTime: string;
      sRace3Back4Q: string;

      iRaceNbr: integer;
   begin

      hLog.AddToLog('ImportAxcisHarnessPast', msevOperation);
      bFinished := False;
      try
         try
            dbfDm.dbfHarnessEntry.Active := False;
            dbfDm.dbfHarnessEntry.TableName := sHarnessEntryFileName;
            dbfDm.dbfHarnessEntry.FilePath := AXCIS_BUGGY_PATH;
            dbfDm.dbfHarnessEntry.FilePathFull := AXCIS_BUGGY_PATH;
            dbfDm.dbfHarnessEntry.Active := True;

            dbfDm.dbfHarnessPast.Active := False;
            dbfDm.dbfHarnessPast.TableName := sHarnessPastFileName;
            dbfDm.dbfHarnessPast.FilePath := AXCIS_BUGGY_PATH;
            dbfDm.dbfHarnessPast.FilePathFull := AXCIS_BUGGY_PATH;
            dbfDm.dbfHarnessPast.Active := True;

            dbfDm.dbfHarnessDriver.Active := False;
            dbfDm.dbfHarnessDriver.TableName := sHarnessDriverFileName;
            dbfDm.dbfHarnessDriver.FilePath := AXCIS_BUGGY_PATH;
            dbfDm.dbfHarnessDriver.FilePathFull := AXCIS_BUGGY_PATH;
            dbfDm.dbfHarnessDriver.Active := True;

            dbfDm.dbfHarnessTrainer.Active := False;
            dbfDm.dbfHarnessTrainer.TableName := sHarnessTrainerFileName;
            dbfDm.dbfHarnessTrainer.FilePath := AXCIS_BUGGY_PATH;
            dbfDm.dbfHarnessTrainer.FilePathFull := AXCIS_BUGGY_PATH;
            dbfDm.dbfHarnessTrainer.Active := True;


            //         UpdateStatusBar('Loading ' + sHarnessPastFileName);
            MainForm.InitPrgBar(dbfDm.dbfHarnessPast.RecordCount);


            iRaceNbr := 0;
            lSaveHorseRecNo := 0;

            OpenTableExclusive(hdm.tblEntries);
            OpenTableExclusive(hdm.tblTrainer);

            dbfDm.dbfHarnessPast.First();
            while (not bFinished) do begin

               if (dbfDm.dbfHarnessPast.Eof) then begin
                  bFinished := True;
               end;

               MainForm.IncPrgBar();

               lHorseRecNo := atol(dbfDm.dbfHarnessPast.FieldByName('HN').AsString);
               if (lHorseRecNo > 0) then begin
                  dbfDm.dbfHarnessEntry.PhysicalRecNo := lHorseRecNo;
                  sOwnerName := dbfDm.dbfHarnessEntry.FieldByName('OWNER_NAME').AsString;
                  sBreederName := dbfDm.dbfHarnessEntry.FieldByName('BREED_NAME').AsString;
                  sSaddleCloth := dbfDm.dbfHarnessEntry.FieldByName('SADDLECLTH').AsString;
               end;

               if LeftStr(dbfDm.dbfHarnessPast.FieldByName('CLASS').AsString, 4) = 'QUA ' then begin
                  lSaveHorseRecNo := lHorseRecNo;
                  dbfDm.dbfHarnessPast.Next();
                  continue;
               end;

               if (lHorseRecNo <> lSaveHorseRecNo) then begin
                  if (lSaveHorseRecNo > 0) then begin
                     try
                        dbfDm.dbfHarnessEntry.PhysicalRecNo := lSaveHorseRecNo;
                        hdm.tblEntries.IndexName := 'ByHorseName';
                        hdm.tblEntries.SetKey();
                        hdm.tblEntries.FieldByName('RaceNbr').AsInteger := dbfDm.dbfHarnessEntry.FieldByName('RACE').AsInteger;
                        hdm.tblEntries.FieldByName('HorseName').AsString := dbfDm.dbfHarnessEntry.FieldByName('HORSE_NAME').AsString;
                        hdm.tblEntries.FieldByName('ProgramNbr').AsString := dbfDm.dbfHarnessEntry.FieldByName('PROGRAM').AsString;

                        if (hdm.tblEntries.GotoKey()) then begin
                           hdm.tblEntries.Edit();
                           hdm.tblEntries.FieldByName('OwnerName').AsString := sOwnerName;
                           hdm.tblEntries.FieldByName('BreederName').AsString := sBreederName;
                           hdm.tblEntries.FieldByName('SaddleCloth').AsString := sSaddleCloth;

                           hdm.tblEntries.FieldByName('Race1BackTrackSize').AsString := sRace1BackTrackSize;
                           hdm.tblEntries.FieldByName('Race1BackPostPos').AsInteger := atoi(sRace1BackPostPos);
                           hdm.tblEntries.FieldByName('Race1BackGait').AsString := sRace1BackGait;
                           hdm.tblEntries.FieldByName('Race1BackCond').AsString := sRace1BackCond;
                           hdm.tblEntries.FieldByName('Race1BackClassDesc').AsString := sRace1BackClass;
                           hdm.tblEntries.FieldByName('Race1BackComment').AsString := sRace1BackComment;
                           hdm.tblEntries.FieldByName('Race1BackClaimed').AsString := sRace1BackClaimed;
                           hdm.tblEntries.FieldByName('Race1BackRaceDesc').AsString := sRace1BackRaceDesc;
                           hdm.tblEntries.FieldByName('Race1BackDriver').AsString := sRace1BackDriver;
                           hdm.tblEntries.FieldByName('Race1BackTrainer').AsString := sRace1BackTrainer;

                           hdm.tblEntries.FieldByName('Race2BackTrackSize').AsString := sRace2BackTrackSize;
                           hdm.tblEntries.FieldByName('Race2BackPostPos').AsInteger := atoi(sRace2BackPostPos);
                           hdm.tblEntries.FieldByName('Race2BackGait').AsString := sRace2BackGait;
                           hdm.tblEntries.FieldByName('Race2BackCond').AsString := sRace2BackCond;
                           hdm.tblEntries.FieldByName('Race2BackClassDesc').AsString := sRace2BackClass;
                           hdm.tblEntries.FieldByName('Race2BackComment').AsString := sRace2BackComment;
                           hdm.tblEntries.FieldByName('Race2BackClaimed').AsString := sRace2BackClaimed;
                           hdm.tblEntries.FieldByName('Race2BackRaceDesc').AsString := sRace2BackRaceDesc;
                           hdm.tblEntries.FieldByName('Race2BackDriver').AsString := sRace2BackDriver;
                           hdm.tblEntries.FieldByName('Race2BackTrainer').AsString := sRace2BackTrainer;

                           hdm.tblEntries.FieldByName('Race3BackTrackSize').AsString := sRace3BackTrackSize;
                           hdm.tblEntries.FieldByName('Race3BackPostPos').AsInteger := atoi(sRace3BackPostPos);
                           hdm.tblEntries.FieldByName('Race3BackGait').AsString := sRace3BackGait;
                           hdm.tblEntries.FieldByName('Race3BackCond').AsString := sRace3BackCond;
                           hdm.tblEntries.FieldByName('Race3BackClassDesc').AsString := sRace3BackClass;
                           hdm.tblEntries.FieldByName('Race3BackComment').AsString := sRace3BackComment;
                           hdm.tblEntries.FieldByName('Race3BackClaimed').AsString := sRace3BackClaimed;
                           hdm.tblEntries.FieldByName('Race3BackRaceDesc').AsString := sRace3BackRaceDesc;
                           hdm.tblEntries.FieldByName('Race3BackDriver').AsString := sRace3BackDriver;
                           hdm.tblEntries.FieldByName('Race3BackTrainer').AsString := sRace3BackTrainer;

                           hdm.tblEntries.Post();
                           dbfDm.dbfHarnessEntry.PhysicalRecNo := lHorseRecNo;
                        end;
                     finally
                        hdm.tblEntries.IndexName := '';
                     end;
                  end;

                  iRaceNbr := 0;
                  sOwnerName := '';
                  sBreederName := '';
                  sSaddleCloth := '';
                  sRace1BackRaceDesc := '';
                  sRace1BackTrackSize := '';
                  sRace1BackPostPos := '';
                  sRace1BackGait := '';
                  sRace1BackCond := '';
                  sRace1BackClass := '';
                  sRace1BackComment := '';
                  sRace1BackClaimed := '';
                  sRace1BackDriver := '';
                  sRace1BackTrainer := '';
                  sRace1BackFinish := '';
                  sRace1BackDHDQ := '';
                  sRace1BackFav := '';
                  sRace1BackOdds := '';
                  sRace1BackTime := '';
                  sRace1Back4Q := '';

                  sRace2BackRaceDesc := '';
                  sRace2BackTrackSize := '';
                  sRace2BackPostPos := '';
                  sRace2BackGait := '';
                  sRace2BackCond := '';
                  sRace2BackClass := '';
                  sRace2BackComment := '';
                  sRace2BackClaimed := '';
                  sRace2BackDriver := '';
                  sRace2BackTrainer := '';
                  sRace2BackFinish := '';
                  sRace2BackDHDQ := '';
                  sRace2BackFav := '';
                  sRace2BackOdds := '';
                  sRace2BackTime := '';
                  sRace2Back4Q := '';

                  sRace3BackRaceDesc := '';
                  sRace3BackTrackSize := '';
                  sRace3BackPostPos := '';
                  sRace3BackGait := '';
                  sRace3BackCond := '';
                  sRace3BackClass := '';
                  sRace3BackComment := '';
                  sRace3BackClaimed := '';
                  sRace3BackDriver := '';
                  sRace3BackTrainer := '';
                  sRace3BackFinish := '';
                  sRace3BackDHDQ := '';
                  sRace3BackFav := '';
                  sRace3BackOdds := '';
                  sRace3BackTime := '';
                  sRace3Back4Q := '';

               end;



               Inc(iRaceNbr);

               if (iRaceNbr = 1) then begin
                  sRace1BackTrkCode := dbfDm.dbfHarnessPast.FieldByName('TRACK').AsString;
                  sRace1BackTrackSize := dbfDm.dbfHarnessPast.FieldByName('TRACKSIZE').AsString;
                  sRace1BackPostPos := dbfDm.dbfHarnessPast.FieldByName('POST').AsString;
                  sRace1BackGait := dbfDm.dbfHarnessPast.FieldByName('GAIT').AsString;
                  sRace1BackCond := dbfDm.dbfHarnessPast.FieldByName('COND').AsString;
                  sRace1BackClass := dbfDm.dbfHarnessPast.FieldByName('CLASS').AsString;
                  sRace1BackComment := dbfDm.dbfHarnessPast.FieldByName('COMMENT').AsString;
                  if (Trim(dbfDm.dbfHarnessPast.FieldByName('PPCLAIMED').AsString) <> '') then begin
                     sRace1BackClaimed := 'C';
                  end else begin
                     sRace1BackClaimed := ' ';
                  end;

                  if (atoi(dbfDm.dbfHarnessPast.FieldByName('FINISH_OFF').AsString)) > 0 then begin
                     sRace1BackFinish := FormatFloat('##', (atof(dbfDm.dbfHarnessPast.FieldByName('FINISH_OFF').AsString)));
                  end else begin
                     sRace1BackFinish := FormatFloat('##', 0);
                  end;

                  sRace1BackDHDQ := dbfDm.dbfHarnessPast.FieldByName('DHDQ').AsString;
                  sRace1BackFav := dbfDm.dbfHarnessPast.FieldByName('FAV').AsString;
                  if (atof(dbfDm.dbfHarnessPast.FieldByName('ODDS').AsString)) > 0 then begin
                     sRace1BackOdds := FormatFloat('##0.00', (atof(dbfDm.dbfHarnessPast.FieldByName('ODDS').AsString)));
                  end else begin
                     sRace1BackOdds := FormatFloat('##0.00', 0.00);
                  end;

                  sRace1BackTime := dbfDm.dbfHarnessPast.FieldByName('HRSE_TM_FN').AsString;
                  if (atof(dbfDm.dbfHarnessPast.FieldByName('HRSE_TM_4Q').AsString)) > 0 then begin
                     sRace1Back4Q := FormatFloat('#0.0', (atof(dbfDm.dbfHarnessPast.FieldByName('HRSE_TM_4Q').AsString)));
                  end else begin
                     sRace1Back4Q := '';
                  end;

                  lDriverRecNo := atol(dbfDm.dbfHarnessPast.FieldByName('DN').AsString);
                  if (lDriverRecNo > 0) then begin
                     dbfDm.dbfHarnessDriver.PhysicalRecNo := lDriverRecNo;
                     sRace1BackDriver := dbfDm.dbfHarnessDriver.FieldByName('DRIVERNAME').AsString;
                  end else begin
                     sRace1BackDriver := '';
                  end;

                  hdm.tblTrainer.IndexName := '';
                  hdm.tblTrainer.SetKey();
                  hdm.tblTrainer.FieldByName('Number').AsString := dbfDm.dbfHarnessPast.FieldByName('PPTRAINER').AsString;
                  if (hdm.tblTrainer.GotoKey()) then begin
                     sRace1BackTrainer := hdm.tblTrainer.FieldByName('Name').AsString;
                  end else begin
                     sRace1BackTrainer := '';
                  end;

                  sY := CopyStr(dbfDm.dbfHarnessPast.FieldByName('DATE').AsString, 3, 2);
                  sM := CopyStr(dbfDm.dbfHarnessPast.FieldByName('DATE').AsString, 5, 2);
                  sD := CopyStr(dbfDm.dbfHarnessPast.FieldByName('DATE').AsString, 7, 2);
                  sRace1BackRaceDesc := '';
                  sRace1BackRaceDesc :=
                     Format('%-2s', [sRace1BackPostPos]) + ' ' +
                     Format('%-2s', [sM]) + '/' +
                     Format('%-2s', [sD]) + '/' +
                     Format('%-2s', [sY]) + ' ' +
                     Format('%-5s', [sRace1BackTrkCode]) + ' ' +
                     Format('%2s', [sRace1BackCond]) + ' ' +
                     Format('%-13s', [sRace1BackClass]) + ' ' +
                     Format('%-1s', [sRace1BackClaimed]) + ' ' +
                     Format('%-14s', [sRace1BackComment]) + ' ' +
                     Format('%6s', [sRace1BackTime]) + ' ' +
                     Format('%4s', [sRace1Back4Q]) + ' ' +
                     Format('%2s', [sRace1BackFinish]) +
                     Format('%-2s', [sRace1BackDHDQ]) +
                     Format('%6s', [sRace1BackOdds]) +
                     Format('%1s', [sRace1BackFav]);
               end;

               if (iRaceNbr = 2) then begin
                  sRace2BackTrkCode := dbfDm.dbfHarnessPast.FieldByName('TRACK').AsString;
                  sRace2BackTrackSize := dbfDm.dbfHarnessPast.FieldByName('TRACKSIZE').AsString;
                  sRace2BackPostPos := dbfDm.dbfHarnessPast.FieldByName('POST').AsString;
                  sRace2BackGait := dbfDm.dbfHarnessPast.FieldByName('GAIT').AsString;
                  sRace2BackCond := dbfDm.dbfHarnessPast.FieldByName('COND').AsString;
                  sRace2BackClass := dbfDm.dbfHarnessPast.FieldByName('CLASS').AsString;
                  sRace2BackComment := dbfDm.dbfHarnessPast.FieldByName('COMMENT').AsString;
                  if (Trim(dbfDm.dbfHarnessPast.FieldByName('PPCLAIMED').AsString) <> '') then begin
                     sRace2BackClaimed := 'C';
                  end else begin
                     sRace2BackClaimed := ' ';
                  end;

                  if (atoi(dbfDm.dbfHarnessPast.FieldByName('FINISH_OFF').AsString)) > 0 then begin
                     sRace2BackFinish := FormatFloat('##', (atof(dbfDm.dbfHarnessPast.FieldByName('FINISH_OFF').AsString)));
                  end else begin
                     sRace2BackFinish := FormatFloat('##', 0);
                  end;

                  sRace2BackDHDQ := dbfDm.dbfHarnessPast.FieldByName('DHDQ').AsString;
                  sRace2BackFav := dbfDm.dbfHarnessPast.FieldByName('FAV').AsString;
                  if (atof(dbfDm.dbfHarnessPast.FieldByName('ODDS').AsString)) > 0 then begin
                     sRace2BackOdds := FormatFloat('##0.00', (atof(dbfDm.dbfHarnessPast.FieldByName('ODDS').AsString)));
                  end else begin
                     sRace2BackOdds := FormatFloat('##0.00', 0.00);
                  end;

                  sRace2BackTime := dbfDm.dbfHarnessPast.FieldByName('HRSE_TM_FN').AsString;
                  if (atof(dbfDm.dbfHarnessPast.FieldByName('HRSE_TM_4Q').AsString)) > 0 then begin
                     sRace2Back4Q := FormatFloat('#0.0', (atof(dbfDm.dbfHarnessPast.FieldByName('HRSE_TM_4Q').AsString)));
                  end else begin
                     sRace2Back4Q := '';
                  end;

                  lDriverRecNo := atol(dbfDm.dbfHarnessPast.FieldByName('DN').AsString);
                  if (lDriverRecNo > 0) then begin
                     dbfDm.dbfHarnessDriver.PhysicalRecNo := lDriverRecNo;
                     sRace2BackDriver := dbfDm.dbfHarnessDriver.FieldByName('DRIVERNAME').AsString;
                  end else begin
                     sRace2BackDriver := '';
                  end;

                  hdm.tblTrainer.IndexName := '';
                  hdm.tblTrainer.SetKey();
                  hdm.tblTrainer.FieldByName('Number').AsString := dbfDm.dbfHarnessPast.FieldByName('PPTRAINER').AsString;
                  if (hdm.tblTrainer.GotoKey()) then begin
                     sRace2BackTrainer := hdm.tblTrainer.FieldByName('Name').AsString;
                  end else begin
                     sRace2BackTrainer := '';
                  end;

                  sY := CopyStr(dbfDm.dbfHarnessPast.FieldByName('DATE').AsString, 3, 2);
                  sM := CopyStr(dbfDm.dbfHarnessPast.FieldByName('DATE').AsString, 5, 2);
                  sD := CopyStr(dbfDm.dbfHarnessPast.FieldByName('DATE').AsString, 7, 2);
                  sRace2BackRaceDesc := '';
                  sRace2BackRaceDesc :=
                     Format('%-2s', [sRace2BackPostPos]) + ' ' +
                     Format('%-2s', [sM]) + '/' +
                     Format('%-2s', [sD]) + '/' +
                     Format('%-2s', [sY]) + ' ' +
                     Format('%-5s', [sRace2BackTrkCode]) + ' ' +
                     Format('%2s', [sRace2BackCond]) + ' ' +
                     Format('%-13s', [sRace2BackClass]) + ' ' +
                     Format('%-1s', [sRace2BackClaimed]) + ' ' +
                     Format('%-14s', [sRace2BackComment]) + ' ' +
                     Format('%6s', [sRace2BackTime]) + ' ' +
                     Format('%4s', [sRace2Back4Q]) + ' ' +
                     Format('%2s', [sRace2BackFinish]) +
                     Format('%-2s', [sRace2BackDHDQ]) +
                     Format('%6s', [sRace2BackOdds]) +
                     Format('%1s', [sRace2BackFav]);
               end;

               if (iRaceNbr = 3) then begin
                  sRace3BackTrkCode := dbfDm.dbfHarnessPast.FieldByName('TRACK').AsString;
                  sRace3BackTrackSize := dbfDm.dbfHarnessPast.FieldByName('TRACKSIZE').AsString;
                  sRace3BackPostPos := dbfDm.dbfHarnessPast.FieldByName('POST').AsString;
                  sRace3BackGait := dbfDm.dbfHarnessPast.FieldByName('GAIT').AsString;
                  sRace3BackCond := dbfDm.dbfHarnessPast.FieldByName('COND').AsString;
                  sRace3BackClass := dbfDm.dbfHarnessPast.FieldByName('CLASS').AsString;
                  sRace3BackComment := dbfDm.dbfHarnessPast.FieldByName('COMMENT').AsString;
                  if (Trim(dbfDm.dbfHarnessPast.FieldByName('PPCLAIMED').AsString) <> '') then begin
                     sRace3BackClaimed := 'C';
                  end else begin
                     sRace3BackClaimed := ' ';
                  end;
                  if (atoi(dbfDm.dbfHarnessPast.FieldByName('FINISH_OFF').AsString)) > 0 then begin
                     sRace3BackFinish := FormatFloat('##', (atof(dbfDm.dbfHarnessPast.FieldByName('FINISH_OFF').AsString)));
                  end else begin
                     sRace3BackFinish := FormatFloat('##', 0);
                  end;

                  sRace3BackDHDQ := dbfDm.dbfHarnessPast.FieldByName('DHDQ').AsString;
                  sRace3BackFav := dbfDm.dbfHarnessPast.FieldByName('FAV').AsString;
                  if (atof(dbfDm.dbfHarnessPast.FieldByName('ODDS').AsString)) > 0 then begin
                     sRace3BackOdds := FormatFloat('##0.00', (atof(dbfDm.dbfHarnessPast.FieldByName('ODDS').AsString)));
                  end else begin
                     sRace3BackOdds := FormatFloat('##0.00', 0.00);
                  end;
                  sRace3BackTime := dbfDm.dbfHarnessPast.FieldByName('HRSE_TM_FN').AsString;
                  if (atof(dbfDm.dbfHarnessPast.FieldByName('HRSE_TM_4Q').AsString)) > 0 then begin
                     sRace3Back4Q := FormatFloat('#0.0', (atof(dbfDm.dbfHarnessPast.FieldByName('HRSE_TM_4Q').AsString)));
                  end else begin
                     sRace3Back4Q := '';
                  end;

                  lDriverRecNo := atol(dbfDm.dbfHarnessPast.FieldByName('DN').AsString);
                  if (lDriverRecNo > 0) then begin
                     dbfDm.dbfHarnessDriver.PhysicalRecNo := lDriverRecNo;
                     sRace3BackDriver := dbfDm.dbfHarnessDriver.FieldByName('DRIVERNAME').AsString;
                  end else begin
                     sRace3BackDriver := '';
                  end;

                  hdm.tblTrainer.IndexName := '';
                  hdm.tblTrainer.SetKey();
                  hdm.tblTrainer.FieldByName('Number').AsString := dbfDm.dbfHarnessPast.FieldByName('PPTRAINER').AsString;
                  if (hdm.tblTrainer.GotoKey()) then begin
                     sRace3BackTrainer := hdm.tblTrainer.FieldByName('Name').AsString;
                  end else begin
                     sRace3BackTrainer := '';
                  end;

                  sY := CopyStr(dbfDm.dbfHarnessPast.FieldByName('DATE').AsString, 3, 2);
                  sM := CopyStr(dbfDm.dbfHarnessPast.FieldByName('DATE').AsString, 5, 2);
                  sD := CopyStr(dbfDm.dbfHarnessPast.FieldByName('DATE').AsString, 7, 2);
                  sRace3BackRaceDesc := '';
                  sRace3BackRaceDesc :=
                     Format('%-2s', [sRace3BackPostPos]) + ' ' +
                     Format('%-2s', [sM]) + '/' +
                     Format('%-2s', [sD]) + '/' +
                     Format('%-2s', [sY]) + ' ' +
                     Format('%-5s', [sRace3BackTrkCode]) + ' ' +
                     Format('%2s', [sRace3BackCond]) + ' ' +
                     Format('%-13s', [sRace3BackClass]) + ' ' +
                     Format('%-1s', [sRace3BackClaimed]) + ' ' +
                     Format('%-14s', [sRace3BackComment]) + ' ' +
                     Format('%6s', [sRace3BackTime]) + ' ' +
                     Format('%4s', [sRace3Back4Q]) + ' ' +
                     Format('%2s', [sRace3BackFinish]) +
                     Format('%-2s', [sRace3BackDHDQ]) +
                     Format('%6s', [sRace3BackOdds]) +
                     Format('%1s', [sRace3BackFav]);
               end;

               lSaveHorseRecNo := lHorseRecNo;
               dbfDm.dbfHarnessPast.Next();
            end;

         except
            on E: Exception do hLog.AddToLog(E.Message, msevException);
         end;

      finally
         dbfDm.dbfHarnessEntry.Active := False;
         dbfDm.dbfHarnessPast.Active := False;
         dbfDm.dbfHarnessDriver.Active := False;
         dbfDm.dbfHarnessTrainer.Active := False;
         CloseTableExclusive(hdm.tblTrainer);
         CloseTableExclusive(hdm.tblEntries);
         MainForm.ClearPrgStatusBars();
      end;

   end;

begin

   hLog.AddToLog('ImportHarness', msevOperation);
   try

      //      prgBar.Position := 0;
      //      pnlPrgBar.Visible := False;

      if bUseOverrideDate then begin
         dtDownloadDate := gedtOverrideDate;
      end else begin
         dtDownloadDate := Now();
      end;

      //******
      iAttributes := faAnyFile;
      sPath := AXCIS_BUGGY_PATH;

      if bProcessAllDates then begin
         sSearch := sPath + '*r.exe';
      end
      else begin
         DecodeDate(dtDownloadDate, wYear, wMonth, wDay);
         if gbTest then begin
            sFileName := 'a*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
         end else begin
            sFileName := '*' + sm.Str(wMonth, 2) + sm.Str(wDay, 2);
         end;
         sFileName := sFileName + '*r.exe';
         sSearch := sPath + sFileName;
      end;
      MainForm.UpdateStatusBar(sSearch);

      if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
         iEndPos := SmartPos('.', tsFile.Name);
         iStartPos := iEndPos - 5;

         sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
         sFileTrkCode := UpperCase(sFileTrkCode);

         sTmp := CopyStr(tsFile.Name, iStartPos, 4);
         sRaceMM := CopyStr(sTmp, 1, 2);
         sRaceDD := CopyStr(sTmp, 3, 2);

         sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
         iLen := Length(sTmp);
         sTmp := CopyStr(sTmp, 9, iLen - 8);
         sFileName := sPath + sTmp;
         sFileName := UpperCase(sFileName);
         bOk := MainForm.ExtractRar(sFileName);
         if bOk then begin
            dtPresent := Now();
            DecodeDate(dtPresent, wYear, wMonth, wDay);
            wDay := atow(sRaceDD);
            wMonth := atow(sRaceMM);

            if bProcessAllDates then begin
               dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);
            end else begin
               dtAxcisRaceDate := dtDownloadDate;
            end;

            sHarnessRaceDbfName := 'raceshr.dbf';
            sHarnessEntryDbfName := 'horsehr.dbf';
            sHarnessTrainerDbfName := 'trainrhr.dbf';
            sHarnessDriverDbfName := 'driverhr.dbf';
            sHarnessPastDbfName := 'runlinhr.dbf';

            ImportAxcisHarnessDriver(sHarnessDriverDbfName);
            ImportAxcisHarnessTrainer(sHarnessTrainerDbfName);

            //try
            //   ImportAxcisHarnessRaceEntry(
            //      sHarnessRaceDbfName,
            //      sHarnessEntryDbfName,
            //      sHarnessPastDbfName,
            //      sHarnessTrainerDbfName,
            //      sHarnessDriverDbfName
            //      );
            //except
            //   on E: Exception do hLog.AddToLog(E.Message, msevException);
            //end;

            if not bProcessAllDates then begin
               try
                  ImportAxcisHarnessPast(sHarnessEntryDbfName, sHarnessPastDbfName, sHarnessTrainerDbfName, sHarnessDriverDbfName);
               except
                  on E: Exception do hLog.AddToLog(E.Message, msevException);
               end;
            end;
         end;

         while (FindNext(tsFile) = 0) do begin
            iEndPos := SmartPos('.', tsFile.Name);
            iStartPos := iEndPos - 5;

            sFileTrkCode := CopyStr(tsFile.Name, 1, iStartPos - 1);
            sFileTrkCode := UpperCase(sFileTrkCode);

            sTmp := CopyStr(tsFile.Name, iStartPos, 4);
            sRaceMM := CopyStr(sTmp, 1, 2);
            sRaceDD := CopyStr(sTmp, 3, 2);

            sTmp := CopyStr(sTmp, 1, 2) + '/' + CopyStr(sTmp, 3, 2) + ' - ' + tsFile.Name;
            iLen := Length(sTmp);
            sTmp := CopyStr(sTmp, 9, iLen - 8);
            sFileName := sPath + sTmp;
            sFileName := UpperCase(sFileName);
            bOk := MainForm.ExtractRar(sFileName);
            if bOk then begin
               dtPresent := Now();
               DecodeDate(dtPresent, wYear, wMonth, wDay);
               wDay := atow(sRaceDD);
               wMonth := atow(sRaceMM);

               if bProcessAllDates then begin
                  dtAxcisRaceDate := EncodeDate(wYear, wMonth, wDay);
               end else begin
                  dtAxcisRaceDate := dtDownloadDate;
               end;

               sHarnessRaceDbfName := 'raceshr.dbf';
               sHarnessEntryDbfName := 'horsehr.dbf';
               sHarnessTrainerDbfName := 'trainrhr.dbf';
               sHarnessDriverDbfName := 'driverhr.dbf';
               sHarnessPastDbfName := 'runlinhr.dbf';
               // For Now
               //               try
               //                  ImportAxcisHarnessRaceEntry(
               //                     sHarnessRaceDbfName,
               //                     sHarnessEntryDbfName,
               //                     sHarnessPastDbfName,
               //                     sHarnessTrainerDbfName,
               //                     sHarnessDriverDbfName
               //                     );
               //               except
               //                  on E: Exception do hLog.AddToLog(E.Message, msevException);
               //               end;

               ImportAxcisHarnessDriver(sHarnessDriverDbfName);
               ImportAxcisHarnessTrainer(sHarnessTrainerDbfName);

               if not bProcessAllDates then begin
                  try
                     ImportAxcisHarnessPast(sHarnessEntryDbfName, sHarnessPastDbfName, sHarnessTrainerDbfName, sHarnessDriverDbfName);
                  except
                     on E: Exception do hLog.AddToLog(E.Message, msevException);
                  end;
               end;
            end;
         end;
      end;
      FindClose(tsFile);
   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
         MainForm.ClearPrgStatusBars();
         FindClose(tsFile);
         dbfDm.dbfHarnessRace.Active := False;
         dbfDm.dbfHarnessEntry.Active := False;
         dbfDm.dbfHarnessTrainer.Active := False;
         dbfDm.dbfHarnessDriver.Active := False;
         dbfDm.dbfHarnessPast.Active := False;
      end;
   end;

   MainForm.ClearPrgStatusBars();
   dbfDm.dbfHarnessRace.Active := False;
   dbfDm.dbfHarnessEntry.Active := False;
   dbfDm.dbfHarnessTrainer.Active := False;
   dbfDm.dbfHarnessDriver.Active := False;
   dbfDm.dbfHarnessPast.Active := False;

end;




end.

