unit UnitDBRoutines;
interface
uses
   Windows, Messages, SysUtils, DateUtils, Classes, Graphics,
   DBISAMTb, Db, StdCtrls, ComCtrls, ExtCtrls;

procedure OpenTable(t: TDBISAMTable);
procedure CloseTable(t: TDBISAMTable);
procedure OpenTableExclusive(t: TDBISAMTable);
procedure CloseTableExclusive(t: TDBISAMTable);
procedure OpenTableReadOnly(t: TDBISAMTable);
procedure CloseTableReadOnly(t: TDBISAMTable);

implementation
uses DatRatings, UnitCommonCode, FastStrings, FastStringFuncs, ESBDates,
   stStat, ESBRtns, ESBMaths, Math, mLog;

procedure OpenTable(t: TDBISAMTable);
begin

   //   if (not gbOpenCloseFiles) then begin
   //      exit;
   //   end;

   try
      if t.Active = False then begin
         t.Active := True;
      end;
   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
      end;
   end;

end;

procedure OpenTableExclusive(t: TDBISAMTable);
begin

   //   if (not gbOpenCloseFiles) then begin
   //      exit;
   //   end;

   try
      t.IndexName := '';
      if t.Active = False then begin
         t.Exclusive := True;
         t.Active := True;
      end;
      if t.Active = True then begin
         t.Active := False;
         t.Exclusive := True;
         t.Active := True;
      end;
   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
      end;

   end;
end;

procedure CloseTableExclusive(t: TDBISAMTable);
begin

   if (not gbOpenCloseFiles) then begin
      exit;
   end;

   try

      if t.Active = True then begin
         t.FlushBuffers();
         t.IndexName := '';
         if t.Ranged then begin
            t.CancelRange();
         end;
         if (t.Filtered) then begin
            t.Filtered := False;
         end;

         t.Active := False;
         t.Exclusive := False;
      end;

   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;

procedure CloseTable(t: TDBISAMTable);
begin

   if (not gbOpenCloseFiles) then begin
      exit;
   end;

   try

      if t.Active = True then begin
         t.IndexName := '';
         t.FlushBuffers();
         if t.Ranged then begin
            t.CancelRange();
         end;
         if (t.Filtered) then begin
            t.Filtered := False;
         end;

         t.Active := False;
         t.Exclusive := False;
      end;

   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;

procedure OpenTableReadOnly(t: TDBISAMTable);
begin

   if (not gbOpenCloseFiles) then begin
      exit;
   end;

   try
      t.IndexName := '';
      if t.Active = False then begin
         t.ReadOnly := True;
         t.Active := True;
      end;
      if t.Active = True then begin
         t.Active := False;
         t.ReadOnly := True;
         t.Active := True;
      end;
   except
      on E: Exception do begin
         hLog.AddToLog(E.Message, msevException);
      end;

   end;
end;

procedure CloseTableReadOnly(t: TDBISAMTable);
begin

   if (not gbOpenCloseFiles) then begin
      exit;
   end;

   try

      if t.Active = True then begin
         t.IndexName := '';
         t.FlushBuffers();
         if t.Ranged then begin
            t.CancelRange();
         end;
         if (t.Filtered) then begin
            t.Filtered := False;
         end;

         t.Active := False;
         t.Exclusive := False;
         t.ReadOnly := False;
      end;

   except
      on E: Exception do hLog.AddToLog(E.Message, msevException);
   end;

end;


end.
