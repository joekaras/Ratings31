unit UnitUpdateKeysInHorseHistory;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls, strMan, cxProgressBar;

procedure Update_HH_PK_SK_DK_Keys(iIncCnt: integer; bOneDay: boolean; iNbrOfDays: integer);

implementation
//uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
//   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   //   FormMain, UnitCommonCode, UnitSetRanking, UnitGetHandicappingKeys;
//   UnitCommonCode, UnitSetRanking, UnitGetHandicappingKeys;
uses DatRatings, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog, DatReport,
   FormMain, UnitCommonCode;

procedure Update_HH_PK_SK_DK_Keys(iIncCnt: integer; bOneDay: boolean; iNbrOfDays: integer);
var

   iBegPos: integer;
   iPos: integer;

   iStaCnt: integer;
   iTotalCnt: integer;
   iRecordCnt: integer;

   sBaseKey: string;

   sPrimaryOrderKey: string;
   sSecondaryOrderKey: string;
   sDefaultOrderKey: string;

   sOldPrimaryOrderKey: string;
   sOldSecondaryOrderKey: string;
   sOldDefaultOrderKey: string;

   lstSplit: TStringList;
   sKeyName: string;

   function ParseAllNames(sName: string): string;
   var
      sTmp: string;
      iEndPos: integer;

   begin

      sTmp := sName;
      if SmartPos('(', sTmp) > 1 then begin
         iEndPos := SmartPos('(', sTmp);
         sName := CopyStr(sTmp, 1, iEndPos - 1);
      end else begin
         sName := Trim(sTmp);
      end;

      sTmp := sName;
      if SmartPos('&', sTmp) > 7 then begin
         iEndPos := SmartPos('&', sTmp);
         sName := CopyStr(sTmp, 1, iEndPos - 1);
      end else begin
         sName := Trim(sTmp);
      end;

      sTmp := sName;
      if SmartPos('/', sTmp) > 7 then begin
         iEndPos := SmartPos('/', sTmp);
         sName := CopyStr(sTmp, 1, iEndPos - 1);
      end else begin
         sName := Trim(sTmp);
      end;

      sTmp := sName;
      if SmartPos('[', sTmp) > 7 then begin
         iEndPos := SmartPos('[', sTmp);
         sName := CopyStr(sTmp, 1, iEndPos - 1);
      end else begin
         sName := Trim(sTmp);
      end;

      sTmp := sName;
      if SmartPos('-', sTmp) > 10 then begin
         iEndPos := SmartPos('-', sTmp);
         sName := CopyStr(sTmp, 1, iEndPos - 1);
      end else begin
         sName := Trim(sTmp);
      end;

      sTmp := sName;
      if SmartPos('|', sTmp) > 10 then begin
         iEndPos := SmartPos('|', sTmp);
         sName := CopyStr(sTmp, 1, iEndPos - 1);
      end else begin
         sName := Trim(sTmp);
      end;

      sTmp := sName;
      if SmartPos(' AND ', sTmp) > 10 then begin
         iEndPos := SmartPos(' AND ', sTmp);
         sName := CopyStr(sTmp, 1, iEndPos - 1);
      end else begin
         sName := Trim(sTmp);
      end;

      sTmp := sName;
      if SmartPos(' OR ', sTmp) > 7 then begin
         iEndPos := SmartPos(' OR ', sTmp);
         sName := CopyStr(sTmp, 1, iEndPos - 1);
      end else begin
         sName := Trim(sTmp);
      end;

      sName := FastReplace(sName, ',', ' ', True);
      sName := FastReplace(sName, ' .A', 'A', True);
      sName := FastReplace(sName, ' .B', 'B', True);
      sName := FastReplace(sName, ' .C', 'C', True);
      sName := FastReplace(sName, ' .D', 'D', True);
      sName := FastReplace(sName, ' .E', 'E', True);
      sName := FastReplace(sName, ' .F', 'F', True);
      sName := FastReplace(sName, ' .G', 'G', True);
      sName := FastReplace(sName, ' .H', 'H', True);
      sName := FastReplace(sName, ' .I', 'I', True);
      sName := FastReplace(sName, ' .J', 'J', True);
      sName := FastReplace(sName, ' .K', 'K', True);
      sName := FastReplace(sName, ' .L', 'L', True);
      sName := FastReplace(sName, ' .M', 'M', True);
      sName := FastReplace(sName, ' .N', 'N', True);
      sName := FastReplace(sName, ' .O', 'O', True);
      sName := FastReplace(sName, ' .P', 'P', True);
      sName := FastReplace(sName, ' .Q', 'Q', True);
      sName := FastReplace(sName, ' .R', 'R', True);
      sName := FastReplace(sName, ' .S', 'S', True);
      sName := FastReplace(sName, ' .T', 'T', True);
      sName := FastReplace(sName, ' .U', 'U', True);
      sName := FastReplace(sName, ' .V', 'V', True);
      sName := FastReplace(sName, ' .W', 'W', True);
      sName := FastReplace(sName, ' .X', 'X', True);
      sName := FastReplace(sName, ' .Y', 'Y', True);
      sName := FastReplace(sName, ' .Z', 'Z', True);
      sName := FastReplace(sName, '"', '', True);
      sName := FastReplace(sName, ' JR', '', True);
      sName := FastReplace(sName, ' SR', '', True);
      sName := FastReplace(sName, '(', '', True);
      sName := FastReplace(sName, ')', '', True);
      sName := FastReplace(sName, ';', ' ', True);
      sName := FastReplace(sName, '&', ' ', True);
      sName := FastReplace(sName, '"', '', True);
      sName := FastReplace(sName, '"', '', True);
      sName := FastReplace(sName, ', LTD.', '', True);
      sName := FastReplace(sName, ', LTD.', '', True);
      sName := FastReplace(sName, ' LTD.', '', True);
      sName := FastReplace(sName, ' LTD ', '', True);
      sName := FastReplace(sName, ', INC.', '', True);
      sName := FastReplace(sName, ', INC.', '', True);
      sName := FastReplace(sName, ' INC.', '', True);
      sName := FastReplace(sName, ' INC ', '', True);
      sName := FastReplace(sName, ' INC', '', True);
      sName := FastReplace(sName, 'L.L.C ', '', True);
      sName := FastReplace(sName, ' L.L.C', '', True);
      sName := FastReplace(sName, ' LLC ', '', True);
      sName := FastReplace(sName, ' LLC', '', True);
      sName := FastReplace(sName, ' LLC.', '', True);
      sName := FastReplace(sName, ', ET AL ', '', True);
      sName := FastReplace(sName, ' ET AL ', '', True);
      sName := FastReplace(sName, ' ET AL', '', True);
      sName := FastReplace(sName, ' ,JR. ', '', True);
      sName := FastReplace(sName, ',JR. ', '', True);
      sName := FastReplace(sName, ' JR. ', '', True);
      sName := FastReplace(sName, ' JR', '', True);
      sName := FastReplace(sName, ',SR. ', '', True);
      sName := FastReplace(sName, ' SR. ', '', True);
      sName := FastReplace(sName, ' ,SR. ', '', True);

      sTmp := sName;
      if SmartPos(',', sTmp) > 10 then begin
         iEndPos := SmartPos(',', sTmp);
         sName := CopyStr(sTmp, 1, iEndPos - 1);
      end else begin
         sName := Trim(sTmp);
      end;

      sName := FastReplace(sName, 'CORP.', 'CORP', True);
      sName := FastReplace(sName, 'LIMITED', 'LTD', True);
      sName := FastReplace(sName, 'RACING STABLES', 'STABLE', True);
      sName := FastReplace(sName, 'STABLES LTD', 'STABLE', True);
      sName := FastReplace(sName, 'ADAM M. RUSSO', 'ADAM M RUSSO', True);
      sName := FastReplace(sName, 'ACKERLEY BROS FARM', 'ACKERLEY BROS', True);
      sName := FastReplace(sName, 'ACKERLEY BROS. FARM', 'ACKERLEY BROS', True);
      sName := FastReplace(sName, 'ACKERLEY BROTHERS FARM', 'ACKERLEY BROS', True);
      sName := FastReplace(sName, 'ACKERLEY BROTHERS FARM INC', 'ACKERLEY BROS', True);
      sName := FastReplace(sName, 'ABBOTT OR SCOTT', 'ABBOTT', True);
      sName := FastReplace(sName, 'A. PATRICK MCEVOY', 'A. P. MCEVOY', True);
      sName := FastReplace(sName, 'A. PATRICK MCEVOY SR', 'A. P. MCEVOY', True);

      Result := sName;

   end;


   procedure SplitName(sNameIn: string);
   var
      sPart1: string;
      sPart2: string;
      sPart3: string;
      sPart4: string;
      sPart5: string;
      sSr: string;
      sJr: string;

   begin
      try
         //| Sam B. David, Jr. |198|44|32|21|$984,012|22%|49%
         // DAVID JR SAM B
         //| Sam B. David |198|44|32|21|$984,012|22%|49%
         // DAVID SAM B
         sPart1 := '';
         sPart2 := '';
         sPart3 := '';
         sPart4 := '';
         sPart5 := '';
         sSr := '';
         sJr := '';

         sNameIn := FastReplace(sNameIn, '.', '', True);
         sNameIn := FastReplace(sNameIn, ' ', '|', True);

         Split(sNameIn, '|', lstSplit);
         if lstSplit.Count = 2 then begin
            sKeyName := StringListTrim(UpperCase(lstSplit[0])) + ' ' +
               StringListTrim(UpperCase(lstSplit[1]));
         end;

         if lstSplit.Count = 3 then begin
            sPart1 := StringListTrim(UpperCase(lstSplit[0]));
            sPart2 := StringListTrim(UpperCase(lstSplit[1]));
            sPart3 := StringListTrim(UpperCase(lstSplit[2]));
            if (Length(sPart1) = 1) then begin
               sPart1 := '';
            end;
            if (Length(sPart2) = 1) then begin
               sPart2 := '';
            end;
            if (Length(sPart3) = 1) then begin
               sPart3 := '';
            end;
            sKeyName := sPart1 + ' ' + sPart2 + ' ' + sPart3;
         end;

         if lstSplit.Count = 4 then begin
            sPart1 := StringListTrim(UpperCase(lstSplit[0]));
            sPart2 := StringListTrim(UpperCase(lstSplit[1]));
            sPart3 := StringListTrim(UpperCase(lstSplit[2]));
            sPart4 := StringListTrim(UpperCase(lstSplit[3]));
            if (Length(sPart1) = 1) then begin
               sPart1 := '';
            end;
            if (Length(sPart2) = 1) then begin
               sPart2 := '';
            end;
            if (Length(sPart3) = 1) then begin
               sPart3 := '';
            end;
            if (Length(sPart4) = 1) then begin
               sPart4 := '';
            end;

            if (sPart1 = 'JR') then begin
               sJR := 'JR';
            end;
            if (sPart1 = 'SJR') then begin
               sSR := 'SR';
            end;
            if (sPart2 = 'JR') then begin
               sJR := 'JR';
            end;
            if (sPart2 = 'SJR') then begin
               sSR := 'SR';
            end;
            if (sPart3 = 'JR') then begin
               sJR := 'JR';
            end;
            if (sPart3 = 'SJR') then begin
               sSR := 'SR';
            end;
            if (sPart4 = 'JR') then begin
               sJR := 'JR';
            end;
            if (sPart4 = 'SJR') then begin
               sSR := 'SR';
            end;

            if (sPart1 = 'JR') then begin
               sJR := '';
            end;
            if (sPart1 = 'SJR') then begin
               sSR := '';
            end;
            if (sPart2 = 'JR') then begin
               sJR := '';
            end;
            if (sPart2 = 'SJR') then begin
               sSR := '';
            end;
            if (sPart3 = 'JR') then begin
               sJR := '';
            end;
            if (sPart3 = 'SJR') then begin
               sSR := '';
            end;
            if (sPart4 = 'JR') then begin
               sJR := '';
            end;
            if (sPart4 = 'SJR') then begin
               sSR := '';
            end;
            sKeyName := sPart1 + ' ' + sPart2 + ' ' + sPart3 + ' ' + sPart4 + ' ' + sSr + sJr;

         end;
         if lstSplit.Count > 4 then begin
            sKeyName := sNameIn;
         end;

      finally
         FreeAndNil(lstSplit);
      end;
   end;

begin

   hLog.AddToLog('Update_HH_PK_SK_DK_Keys', msevOperation);
   try
      CloseTable(dm.tblHH);
      OpenTable(dm.tblHH);

      //  CloseTable(dm.tblRH);
  //      OpenTable(dm.tblRH);
  //
  //      CloseTable(dm.tblProcessed);
  //      OpenTable(dm.tblProcessed);

        //      if (bOneDay) then begin
        //         dm.tblHH.IndexName := 'ByRangeRaceDate';
        //
        //         dm.tblHH.SetRangeStart;
        //
        //         dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
        //         dm.tblHH.KeyFieldCount := 1;
        //
        //         dm.tblHH.SetRangeEnd;
        //         dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
        //
        //         dm.tblHH.KeyFieldCount := 1;
        //         dm.tblHH.ApplyRange;
        //      end else begin
        //         dm.tblHH.IndexName := 'ByRangeRaceDate';
        //
        //         dm.tblHH.SetRangeStart;
        //         dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := (Now() - iNbrOfDays);
        //         dm.tblHH.KeyFieldCount := 1;
        //
        //         dm.tblHH.SetRangeEnd;
        //         dm.tblHH.FieldByName('RangeRaceDate').AsDateTime := gedtOverrideDate;
        //         dm.tblHH.KeyFieldCount := 1;
        //
        //         dm.tblHH.ApplyRange;
        //
        //      end;
      iStaCnt := 0;
      iTotalCnt := 0;
      iRecordCnt := dm.tblHH.RecordCount;

      InitPrgBar(dm.tblHH.RecordCount);

      dm.tblHH.First();
      if not dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.StartTransaction();
      end;
      while not dm.tblHH.Eof do begin

         if dm.tblHH.FieldByName('TrkCode').AsString = '' then begin
            dm.tblHH.Next();
            Inc(iStaCnt);
            Inc(iTotalCnt);
            continue;
         end;

         if (iTotalCnt > iRecordCnt) then begin
            if dm.dbSireRate.InTransaction then begin
               dm.dbSireRate.Rollback();
            end;
            CloseTable(dm.tblHH);
            //     CloseTable(dm.tblRH);
     //            CloseTable(dm.tblProcessed);
            ClearPrgStatusBars();
            exit;
         end;

         if (iStaCnt > BATCH_SIZE) then begin
            UpdateStatusBar('Updating PRIMARY/SECONDARY/DEFAULT Keys - ' +
               dm.tblHH.FieldByName('TrkCode').AsString + ' ' +
               dm.tblHH.FieldByName('RaceDate').AsString + ' Race # ' +
               dm.tblHH.FieldByName('RaceNbr').AsString + ' ' +
               IntToStr(iTotalCnt) + ' of ' + IntToStr(dm.tblHH.RecordCount));
            Application.ProcessMessages();
            iStaCnt := 0;
            if not dm.dbSireRate.InTransaction then begin
               dm.dbSireRate.StartTransaction();
            end else begin
               if dm.dbSireRate.InTransaction then begin
                  dm.dbSireRate.Commit;
                  dm.dbSireRate.StartTransaction();
               end;
            end;
         end else begin
            Application.ProcessMessages();
            Inc(iStaCnt);
            Inc(iTotalCnt);
         end;

         IncPrgBar();

         //   if (dm.tblHH.FieldByName('RaceDate').AsDateTime < (Now() - iNbrOfDays)) then begin
         //      dm.tblHH.Next();
        //       continue;
         //   end;

            //       sPrimaryOrderKey := GetPrimaryOrderKey(dm.tblRH, dm.tblHH);
           //        sSecondaryOrderKey := GetSecondaryOrderKey(dm.tblRH, dm.tblHH);
           //        sDefaultOrderKey := GetDefaultOrderKey(dm.tblRH, dm.tblHH);

           //        sOldPrimaryOrderKey := dm.tblHH.FieldByName('PrimaryOrderKey').AsString;
           //        sOldDefaultOrderKey := dm.tblHH.FieldByName('DefaultOrderKey').AsString;
           //        sOldSecondaryOrderKey := dm.tblHH.FieldByName('SecondaryOrderKey').AsString;

                   //No need to update equals
           //        if ((sPrimaryOrderKey <> '') and
           //           (sDefaultOrderKey <> '') and
           //           (sSecondaryOrderKey <> '')) then begin
           //           if ((sPrimaryOrderKey = sOldPrimaryOrderKey) and
           //              (sDefaultOrderKey = sOldDefaultOrderKey) and
           //              (sSecondaryOrderKey = sOldSecondaryOrderKey)) then begin
           //              dm.tblHH.Next();
           //              continue;
           //           end;
           //        end;

                   // Must have a race history record
       //  dm.tblRH.IndexName := '';
//         dm.tblRH.SetKey();
//         dm.tblRH.FieldByName('TrkCode').AsString := dm.tblHH.FieldByName('TrkCode').AsString;
//         dm.tblRH.FieldByName('RaceNbr').AsInteger := dm.tblHH.FieldByName('RaceNbr').AsInteger;
//         dm.tblRH.FieldByName('RaceDate').AsString := dm.tblHH.FieldByName('RaceDate').AsString;
//         if not (dm.tblRH.GotoKey()) then begin
//            dm.tblHH.Next;
//            continue;
//         end;

         // Do a validity check
         //if SkipThisHHRecord(dm.tblRH, dm.tblHH) then begin
        //    dm.tblHH.Next;
        //    continue;
       //  end;

       //  dm.tblProcessed.IndexName := '';
      //   dm.tblProcessed.SetKey();
      //   dm.tblProcessed.FieldByName('TrkCode').AsString := dm.tblHH.FieldByName('TrkCode').AsString;
//         dm.tblProcessed.FieldByName('RaceDate').AsDateTime := dm.tblHH.FieldByName('RaceDate').AsDateTime;
      //   if (not dm.tblProcessed.GotoKey()) then begin
      //      dm.tblProcessed.Append();
      //      dm.tblProcessed.FieldByName('TrkCode').AsString := dm.tblHH.FieldByName('TrkCode').AsString;
      //      dm.tblProcessed.FieldByName('RaceDate').AsDateTime := dm.tblHH.FieldByName('RaceDate').AsDateTime;
      //      dm.tblProcessed.Post();
      //   end;

         dm.tblHH.Edit();

         sKeyName := '';
         SplitName(dm.tblHH.FieldByName('Trainer').AsString);
         dm.tblHH.FieldByName('Trainer').AsString := sKeyName;

         sKeyName := '';
         SplitName(dm.tblHH.FieldByName('Jockey').AsString);
         dm.tblHH.FieldByName('Jockey').AsString := sKeyName;

         //dm.tblHH.FieldByName('Owner').AsString :=
         sKeyName := ParseAllNames(dm.tblHH.FieldByName('Owner').AsString);
         //sKeyName := ParseAllNames('');
         //dm.tblHH.FieldByName('DefaultOrderKey').AsString := sDefaultOrderKey;
         //dm.tblHH.FieldByName('SecondaryOrderKey').AsString := sSecondaryOrderKey;
         //dm.tblHH.FieldByName('PrimaryOrderKey').AsString := sPrimaryOrderKey;

         dm.tblHH.Post();

         dm.tblHH.Next();
      end;

   except

      if dm.dbSireRate.InTransaction then begin
         dm.dbSireRate.Rollback();
      end;

      CloseTable(dm.tblHH);
      // CloseTable(dm.tblRH);
 //      CloseTable(dm.tblProcessed);
      ClearPrgStatusBars();
   end;

   if dm.dbSireRate.InTransaction then begin
      dm.dbSireRate.Commit;
   end;

   CloseTable(dm.tblHH);
   CloseTable(dm.tblRH);
   CloseTable(dm.tblProcessed);
   ClearPrgStatusBars();

end;

end.

