unit UnitProcessTSNLists;

interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics, Controls, Forms, Dialogs,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls;

procedure ProcessTSNLists(db: TDBISAMDatabase; tblS: TDBISAMTable; sStatType: string);

implementation
uses FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, UnitDBRoutines, mlog,
   FormMain, UnitCommonCode;

procedure ParseTSNLists(sFileName: string; sSaveFileName: string; sStatType: string; tbl: TDBISAMTable);
var
   sIn: string;
   sOut: string;

   fsIn: TFileStream;
   fsOut: TFileStream;
   lstIn: TStringList;
   lstOut: TStringList;
   lstSplit: TStringList;

   iIdx: integer;
   iLen: integer;
   iStart: integer;
   iEndPos: Integer;

   sTmp: ansistring;

   sName: string;
   sTmpName: string;
   sTSNFileName: string;



   iLineLen: integer;
   iLineCopyLen: integer;
   iLineCopyLen2: integer;
   iLineStart: integer;
   sLineTmp: ansistring;
   iLineEndPos: Integer;
   sLine: array[1..15] of ansistring;
   iLineIdx: integer;
   sPostsAvail: string;
begin

   try

      UpdateStatusBar(sFileName);
      fsIn := TFileStream.Create(sFileName, fmOpenRead or fmShareDenyWrite);

      SetLength(sIn, fsIn.Size + 1);
      fsIn.Read(sIn[1], fsIn.Size);
      try
         //sOut := HtmlExtractHREF(sIn, True, True, True, False);
         sOut := HtmlExtractText(sIn, True, True, True, False);
      except
      end;

      sOut := FastReplace(sOut, Chr(160), '', False);

      try
         fsOut := TFileStream.Create(sSaveFileName, fmCreate);
         fsOut.WriteBuffer(sOut[1], Length(sOut));
      finally
         FreeAndNil(fsOut);
      end;

   finally
      FreeAndNil(fsIn);
   end;

   try
      lstIn := TStringList.Create;
      lstOut := TStringList.Create;

      lstIn.LoadFromFile(sSaveFileName);

      for iIdx := 0 to lstIn.Count - 1 do begin
         sTmp := lstIn[iIdx];
         if (sTmp = '') then begin
            continue;
         end;
         //    lstOut.Add(sTmp);

         try
            sLineTmp := sTmp;
            for iLineIdx := 1 to 15 do begin
               sLine[iLineIdx] := '';
            end;

            if (sStatType = MCP_FILE) then begin
               iLineLen := Length(sLineTmp);
               for iLineIdx := 1 to 15 do begin
                  sLine[iLineIdx] := '';
                  if (SmartPos('https://www.brisnet.com/secure-bin/brisclub/', sLineTmp) > 0) then begin


                     iLineStart := SmartPos('https://www.brisnet.com/secure-bin/brisclub/', sLineTmp);
                     iLineEndPos := SmartPos('>', sLineTmp, true, iLineStart);
                     iLineCopyLen := iLineEndPos - iLineStart;
                     if (iLineStart > 0) then begin
                        if (iLineCopyLen > 0) then begin

                           iLineCopyLen2 := (iLineLen - iLineEndPos);
                           try
                              if ((iLineEndPos < iLineLen) and (iLineCopyLen2 <= (iLineLen - iLineEndPos))) then begin
                                 sPostsAvail := CopyStr(sLineTmp, iLineEndPos + 1, 4);
                              end;
                           except
                              on E: Exception do begin
                                 hLog.AddToLog(E.Message, msevException);
                              end;
                           end;

                           if (SmartPos('p', sPostsAvail) > 0) then begin
                              sLine[iLineIdx] := CopyStr(sLineTmp, iLineStart, iLineCopyLen - 1);
                           end else begin
                              sLine[iLineIdx] := '';
                           end;
                        end;
                     end;

                     iLineCopyLen := (iLineLen - iLineEndPos);

                     try
                        if ((iLineEndPos < iLineLen) and (iLineCopyLen <= (iLineLen - iLineEndPos))) then begin
                           sLineTmp := CopyStr(sLineTmp, iLineEndPos, iLineCopyLen - 1);
                        end;
                     except
                        on E: Exception do begin
                           hLog.AddToLog(E.Message, msevException);
                        end;
                     end;
                  end;
               end;
            end;


            if (sStatType = ERD_FILE) then begin
               iLineLen := Length(sLineTmp);
               for iLineIdx := 1 to 15 do begin
                  sLine[iLineIdx] := '';
                  if (SmartPos('https://www.brisnet.com/secure-bin/brisclub/', sLineTmp) > 0) then begin
                     iLineStart := SmartPos('https:', sLineTmp);
                     iLineEndPos := SmartPos('zip"', sLineTmp, true, iLineStart);
                     if iLineEndPos > 0 then begin
                        iLineEndPos := iLineEndPos + 4;
                     end;
                     iLineCopyLen := iLineEndPos - iLineStart;
                     if (iLineStart > 0) then begin
                        if (iLineCopyLen > 0) then begin
                           sLine[iLineIdx] := CopyStr(sLineTmp, iLineStart, iLineCopyLen - 1);
                        end;
                     end;

                     iLineCopyLen := (iLineLen - iLineEndPos);

                     try
                        if ((iLineEndPos < iLineLen) and (iLineCopyLen <= (iLineLen - iLineEndPos))) then begin
                           sLineTmp := CopyStr(sLineTmp, iLineEndPos, iLineCopyLen - 1);
                        end;
                     except
                        on E: Exception do begin
                           hLog.AddToLog(E.Message, msevException);
                        end;
                     end;
                  end;
               end;
            end;

            if (sStatType = LSC_FILE) then begin
               iLineLen := Length(sLineTmp);
               for iLineIdx := 1 to 15 do begin
                  sLine[iLineIdx] := '';
                  if (SmartPos('https://www.brisnet.com/secure-bin/brisclub/', sLineTmp) > 0) then begin



                     iLineStart := SmartPos('https:', sLineTmp);
                     iLineEndPos := SmartPos('scr', sLineTmp, true, iLineStart);
                     if iLineEndPos > 0 then begin
                        iLineEndPos := iLineEndPos + 4 + 15;
                     end;
                     iLineCopyLen := iLineEndPos - iLineStart;
                     if (iLineStart > 0) then begin
                        if (iLineCopyLen > 0) then begin
                           sLine[iLineIdx] := CopyStr(sLineTmp, iLineStart, iLineCopyLen - 1);
                        end;
                     end;

                     iLineCopyLen := (iLineLen - iLineEndPos);

                     try
                        if ((iLineEndPos < iLineLen) and (iLineCopyLen <= (iLineLen - iLineEndPos))) then begin
                           sLineTmp := CopyStr(sLineTmp, iLineEndPos, iLineCopyLen - 1);
                        end;
                     except
                        on E: Exception do begin
                           hLog.AddToLog(E.Message, msevException);
                        end;
                     end;
                  end;
               end;
            end;

         except
            on E: Exception do begin
               hLog.AddToLog(E.Message, msevException);
            end;
         end;


         for iLineIdx := 1 to 15 do begin
            if Trim(sLine[iLineIdx]) <> '' then begin
               lstOut.Add(sLine[iLineIdx]);
            end;
         end;

         continue;

      end;

   finally
      FreeAndNil(lstIn);
      lstOut.SaveToFile(sSaveFileName);
      FreeAndNil(lstOut);
   end;
   //
      //
   try
      lstIn := TStringList.Create;
      lstIn.LoadFromFile(sSaveFileName);

      for iIdx := 0 to lstIn.Count - 1 do begin
         sTmp := StringListTrim(lstIn[iIdx]);

         try
            tbl.IndexName := '';
            tbl.SetKey();
            sTmp := FastReplace(sTmp, '"', '', False);
            sTmp := FastReplace(sTmp, '<', '', False);
            sTmp := FastReplace(sTmp, '>', '', False);

            tbl.FieldByName('ServerURL').Value := Trim(sTmp);

            if (sStatType = MCP_FILE) then begin
               iStart := SmartPos('?mcp', sTmp);
               sTSNFileName := CopyStr(sTmp, iStart + 4, 12);
            end;

            if (sStatType = ERD_FILE) then begin
               iStart := SmartPos('?erd', sTmp);
               sTSNFileName := CopyStr(sTmp, iStart + 4, 12);
            end;

            if (sStatType = LSC_FILE) then begin
               iStart := SmartPos('?scr', sTmp);
               sTSNFileName := CopyStr(sTmp, iStart + 4, 12);
            end;

            if not (tbl.GotoKey()) then begin
               tbl.Append();
               tbl.FieldByName('ServerURL').Value := Trim(sTmp);
               tbl.FieldByName('IsDownloaded').Value := False;
               tbl.FieldByName('FileName').Value := sTSNFileName;
               if (sStatType = LSC_FILE) then begin
                  tbl.FieldByName('FileType').Value := 'LSC';
               end;
               if (sStatType = ERD_FILE) then begin
                  tbl.FieldByName('FileType').Value := 'ERD';
               end;
               if (sStatType = MCP_FILE) then begin
                  tbl.FieldByName('FileType').Value := 'MCP';
               end;
               tbl.Post();

            end else begin
               hLog.AddToLog(sStatType + ' ' + sName, msevOperation);
            end;

         except
            on E: Exception do begin
               hLog.AddToLog(E.Message, msevException);
            end;
         end;
      end;

   finally
      FreeAndNil(lstIn);
      UpdateStatusBar('');
   end;


end;

procedure ProcessTSNLists(db: TDBISAMDatabase; tblS: TDBISAMTable; sStatType: string);
var
   iEndPos: Integer;
   iStartPos: Integer;
   iAttributes: Integer;

   sTmp: string;
   sBuf: string;
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
   iStaCnt: Integer;

begin

   hLog.LogFileName := LOG_PATH + BLOODHORSE_LOG_FILENAME;

   try
      OpenTable(tblS);
      try
         //******
         iAttributes := faAnyFile;

         sPath := TSN_STATS_PATH;

         if (sStatType = LSC_FILE) then begin
            sPath := TSN_LSC_PATH;
         end;
         //
         if (sStatType = MCP_FILE) then begin
            sSearch := sPath + 'ProCapFiles.html';
         end;

         if (sStatType = ERD_FILE) then begin
            sSearch := sPath + 'ERDFiles.html';
         end;

         if (sStatType = LSC_FILE) then begin
            sSearch := sPath + 'LSCFiles.html';
         end;

         UpdateStatusBar(sSearch);
         if FindFirst(sSearch, iAttributes, tsFile) = 0 then begin
            sFileName := sPath + tsFile.Name;
            if (sStatType = MCP_FILE) then begin
               DeleteFile('ProCaps.txt');
               ParseTSNLists(sFileName, 'ProCaps.txt', sStatType, tblS);
            end;
            if (sStatType = ERD_FILE) then begin
               DeleteFile('ERD.txt');
               ParseTSNLists(sFileName, 'ERD.txt', sStatType, tblS);
            end;
            if (sStatType = LSC_FILE) then begin
               DeleteFile('LSC.txt');
               ParseTSNLists(sFileName, 'LSC.txt', sStatType, tblS);
            end;
         end;
         FindClose(tsFile);
      except
         on E: Exception do begin
            hLog.AddToLog(E.Message, msevException);
            FindClose(tsFile);
         end;
      end;

   finally
      CloseTable(tblS);
      ClearPrgStatusBars();
      hLog.LogFileName := LOG_PATH + BLOODHORSE_LOG_FILENAME;
   end;

end;

end.
