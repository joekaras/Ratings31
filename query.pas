unit query;

interface

uses Windows, Messages, Classes, SysUtils, Graphics, Forms, Controls, ExtCtrls,
     DBCtrls, Grids, DBGrids, StdCtrls, Dialogs, ComCtrls, DB, main,
     dbisamtb, dbisamlb, dbisamct;

type
  TQueryForm = class(TForm)
    QuerySource: TDataSource;
    Panel1: TPanel;
    QueryNotebook: TPageControl;
    DataSheet: TTabSheet;
    SQLSheet: TTabSheet;
    InteractiveQuery: TDBISAMQuery;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    LoadSQLButton: TButton;
    SaveSQLButton: TButton;
    LiveResultCheckBox: TCheckBox;
    Label2: TLabel;
    MaxRowCountEdit: TEdit;
    PrepareButton: TButton;
    RunSQLButton: TButton;
    SQLMemo: TMemo;
    SaveResultSetButton: TButton;
    QueryGrid: TDBISAMDBGrid;
    SelectFieldsButton: TButton;
    CopyOnAppendCheckBox: TCheckBox;
    QueryNavigator: TDBNavigator;
    Label1: TLabel;
    PlanSheet: TTabSheet;
    PlanMemo: TMemo;
    GeneratePlanCheckBox: TCheckBox;
    RowEdit: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    ColumnEdit: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectFieldsButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure RunSQLButtonClick(Sender: TObject);
    procedure LoadSQLButtonClick(Sender: TObject);
    procedure SaveSQLButtonClick(Sender: TObject);
    procedure SaveResultSetButtonClick(Sender: TObject);
    procedure QueryGridColEnter(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure QueryNotebookChange(Sender: TObject);
    procedure QueryGridCellClick(Column: TColumn);
    procedure MaxRowCountEditKeyPress(Sender: TObject; var Key: Char);
    procedure CopyOnAppendCheckBoxClick(Sender: TObject);
    procedure PrepareButtonClick(Sender: TObject);
    procedure InteractiveQuerySaveProgress(Sender: TObject;
      PercentDone: Word);
    procedure InteractiveQueryQueryProgress(Sender: TObject;
      PercentDone: Word; var Abort: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure InteractiveQueryDataLost(Sender: TObject;
      Cause: TDataLossCause; const ContextInfo: String; var Continue,
      StopAsking: Boolean);
    procedure InteractiveQueryBeforeExecute(Sender: TObject);
    procedure InteractiveQueryAfterExecute(Sender: TObject);
    procedure LiveResultCheckBoxClick(Sender: TObject);
    procedure MaxRowCountEditChange(Sender: TObject);
    procedure SQLMemoChange(Sender: TObject);
    procedure GeneratePlanCheckBoxClick(Sender: TObject);
    procedure InteractiveQueryQueryError(Sender: TObject; E: Exception;
      var Action: TAbortAction);
    procedure SQLMemoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SQLMemoKeyPress(Sender: TObject; var Key: Char);
    procedure SQLMemoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SQLMemoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SQLMemoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    QueryExecuting: Boolean;
    QueryAborted: Boolean;
    procedure UpdatePreparedButton;
    function SaveSQLFirst(Sender: TObject): Word;
    procedure UpdateLineAndColumn;
  public
    QueryModified: Boolean;
    procedure InitializeWindow;
  end;

implementation

uses replog, upglog, visible, flddtls, savetbl, dbisamen, dbisamcn,
     dbisamsq, dbisamut;

{$R *.DFM}

function TQueryForm.SaveSQLFirst(Sender: TObject): Word;
begin
   Result:=mrNo;
   if SQLMemo.Modified then
      begin
      Result:=MessageDlg('The current SQL has been modified, do you want to save the current SQL?',
                          mtConfirmation, [mbYes,mbNo,mbCancel],0);
      if (Result=mrYes) then
         SaveSQLButtonClick(Sender);
      end;
end;

procedure TQueryForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   SaveQuerySettings(InteractiveQuery,MainForm.AppDirectory,
                     MainForm.AppVersionInformation.FileNameRoot);
   QuerySource.OnStateChange:=nil;
   QuerySource.OnDataChange:=nil;
   QueryGrid.OnDBLClick:=nil;
   try
      with InteractiveQuery do
         begin
         OnEditError:=nil;
         OnDeleteError:=nil;
         OnPostError:=nil;
         Close;
         if Prepared then
            UnPrepare;
         end;
   except
   end;
   Action:=caFree;
end;

procedure TQueryForm.SelectFieldsButtonClick(Sender: TObject);
begin
   MainForm.SelectVisibleFields(InteractiveQuery);
end;

procedure TQueryForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose:=MainForm.CheckWindowClose(InteractiveQuery);
   if CanClose then
      CanClose:=(SaveSQLFirst(Sender) <> mrCancel);
end;

procedure TQueryForm.FormCreate(Sender: TObject);
begin
   ReadWindowSettings(Self,MainForm.AppDirectory,
                      MainForm.AppVersionInformation.FileNameRoot,'Query Window');
   QuerySource.OnStateChange:=MainForm.WindowStateChange;
   QuerySource.OnDataChange:=MainForm.WindowDataChange;
   QueryGrid.OnDBLClick:=MainForm.WindowGridDBLClick;
   with InteractiveQuery do
      begin
      OnEditError:=MainForm.WindowEditError;
      OnDeleteError:=MainForm.WindowDeleteError;
      OnPostError:=MainForm.WindowPostError;
      end;
   SelectFieldsButton.Enabled:=False;
   SaveResultSetButton.Enabled:=False;
   QueryNotebook.ActivePage:=SQLSheet;
   ActiveControl:=SQLMemo;
   UpdateLineAndColumn;
   QueryExecuting:=False;
   QueryAborted:=False;
end;

procedure TQueryForm.RunSQLButtonClick(Sender: TObject);
begin
   if QueryExecuting then
      QueryAborted:=True
   else
      begin
      QueryExecuting:=False;
      QueryAborted:=False;
      Screen.Cursor:=crSQLWait;
      DisableChildControls(QueryNotebook);
      MainForm.ProgressGauge.Progress:=0;
      MainForm.ProgressGauge.Visible:=True;
      try
         with InteractiveQuery do
            begin
            PlanMemo.Lines.Clear;
            Close;
            Filtered:=False;
            Filter:='';
            if QueryModified then
               begin
               SQL.Text:=(SQLMemo.Lines.Text);
               QueryModified:=False;
               end;
            MainForm.ProgressPanel.Caption:='';
            MainForm.ProgressPanel.Update;
            { Verify the maximum row count }
            try
               if (StrToInt(MaxRowCountEdit.Text) < -1) then
                  begin
                  MessageDlg('The maximum row count must be between -1'+
                             ' and '+IntToStr(High(Integer)),mtError,[mbOk],0);
                  Exit;
                  end;
               MaxRowCount:=StrToInt(MaxRowCountEdit.Text);
            except
               MessageDlg('The maximum row count must be between -1'+
                          ' and '+IntToStr(High(Integer)),mtError,[mbOk],0);
               Exit;
            end;
            with RunSQLButton do
               begin
               Enabled:=True;
               Caption:='&Cancel';
               end;
            QueryExecuting:=True;
            try
               ExecSQL;
            finally
               QueryExecuting:=False;
               RunSQLButton.Caption:='&Run SQL';
               UpdatePreparedButton;
            end;
            EnableChildControls(QueryNotebook);
            if (SQLStatementType=stSelect) then
               begin
               MainForm.SetupWindow(InteractiveQuery);
               MainForm.SetupOpenDatabases;
               MainForm.UpdateMenuItems(nil);
               SelectFieldsButton.Enabled:=True;
               SaveResultSetButton.Enabled:=True;
               MainForm.TimePanel.Caption:=' '+FloatToStr(ExecutionTime)+' secs';
               QueryNotebook.ActivePage:=DataSheet;
               ActiveControl:=QueryGrid;
               end
            else
               begin
               MainForm.ProgressPanel.Caption:=' '+IntToStr(RowsAffected)+
                  ' rows affected';
               MainForm.TimePanel.Caption:=' '+FloatToStr(ExecutionTime)+' secs';
               end;
            MainForm.StatusPanel.Caption:=' Query complete';
            MainForm.UpdateTransactions;
            end;
      finally
         UpdatePreparedButton;
         EnableChildControls(QueryNotebook);
         MainForm.ProgressGauge.Visible:=False;
         Screen.Cursor:=crDefault;
      end;
      end;
end;

procedure TQueryForm.LoadSQLButtonClick(Sender: TObject);
var
   CanLoad: Boolean;
begin
   CanLoad:=(SaveSQLFirst(Sender) <> mrCancel);
   if CanLoad then
      begin
      OpenDialog.InitialDir:=MainForm.AppSessionSettings.FileDirectory;
      if OpenDialog.Execute then
         begin
         MainForm.AppSessionSettings.FileDirectory:=ExtractFilePath(OpenDialog.FileName);
         SQLMemo.Lines.LoadFromFile(OpenDialog.FileName);
         SQLMemo.Modified:=False;
         SQLMemo.ClearUndo;
         SQLMemo.SetFocus;
         QueryModified:=True;
         end;
      end;
end;

procedure TQueryForm.SaveSQLButtonClick(Sender: TObject);
begin
   SaveDialog.InitialDir:=MainForm.AppSessionSettings.FileDirectory;
   if SaveDialog.Execute then
      begin
      MainForm.AppSessionSettings.FileDirectory:=ExtractFilePath(SaveDialog.FileName);
      SQLMemo.Lines.SaveToFile(SaveDialog.FileName);
      SQLMemo.Modified:=False;
      SQLMemo.SetFocus;
      end;
end;

procedure TQueryForm.SaveResultSetButtonClick(Sender: TObject);
begin
   with MainForm,SaveTableDlg do
      begin
      Caption:='Save query result set as';
      Initialize;
      SaveAsEdit.Text:='new';
      if (AppSessionSettings.LocalRemote=SESSION_REMOTE) then
         LocalRadioButton.Enabled:=False
      else
         RemoteRadioButton.Enabled:=False;
      if (ShowModal=mrOk) then
         begin
         Screen.Cursor:=crHourGlass;
         StatusPanel.Caption:=' Saving...';
         ProgressGauge.Progress:=0;
         ProgressGauge.Visible:=True;
         Application.ProcessMessages;
         try
            InteractiveQuery.SaveToTable(AvailableDatabasesComboBox.Text,SaveAsEdit.Text);
         finally
            ProgressGauge.Progress:=0;
            ProgressGauge.Visible:=False;
            StatusPanel.Caption:='';
            Screen.Cursor:=crDefault;
         end;
         end;
      end;
end;

procedure TQueryForm.QueryGridColEnter(Sender: TObject);
begin
   if (InteractiveQuery.State=dsEdit) then
      MainForm.UpdateMenuItems(nil);
end;

procedure TQueryForm.InitializeWindow;
begin
   ReadQuerySettings(InteractiveQuery,MainForm.AppDirectory,
                     MainForm.AppVersionInformation.FileNameRoot);
   LiveResultCheckBox.Checked:=InteractiveQuery.RequestLive;
   MaxRowCountEdit.Text:=IntToStr(InteractiveQuery.MaxRowCount);
   CopyOnAppendCheckBox.Checked:=InteractiveQuery.CopyOnAppend;
   MainForm.SetupWindow(InteractiveQuery);
   MainForm.SetupOpenDatabases;
end;

procedure TQueryForm.FormDestroy(Sender: TObject);
begin
   SaveWindowSettings(Self,MainForm.AppDirectory,
                      MainForm.AppVersionInformation.FileNameRoot,'Query Window');
   QuerySource.OnStateChange:=nil;
   QuerySource.OnDataChange:=nil;
   QueryGrid.OnDBLClick:=nil;
   with InteractiveQuery do
      begin
      OnEditError:=nil;
      OnDeleteError:=nil;
      OnPostError:=nil;
      Close;
      end;
   MainForm.SetupOpenDatabases;
end;

procedure TQueryForm.QueryNotebookChange(Sender: TObject);
begin
   if (QueryNotebook.ActivePage=SQLSheet) then
      begin
      UpdatePreparedButton;
      SQLMemo.SetFocus;
      end;
end;

procedure TQueryForm.QueryGridCellClick(Column: TColumn);
begin
   { This is to get around focus issues with the DBGrid and the
     open databases combo box in the main tool bar }
   SelectFieldsButton.SetFocus;
   QueryGrid.SetFocus;
end;

procedure TQueryForm.MaxRowCountEditKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (Key in ['-','0'..'9',#8,#13]) then
      Key:=#0;
end;

procedure TQueryForm.CopyOnAppendCheckBoxClick(Sender: TObject);
begin
   InteractiveQuery.CopyOnAppend:=CopyOnAppendCheckBox.Checked;
end;

procedure TQueryForm.PrepareButtonClick(Sender: TObject);
var
   TempAction: TAbortAction;
begin
   with InteractiveQuery do
      begin
      if Prepared then
         begin
         if Active then
            Close;
         UnPrepare;
         SelectFieldsButton.Enabled:=False;
         SaveResultSetButton.Enabled:=False;
         end
      else
         begin
         if QueryModified then
            begin
            SQL.Text:=(SQLMemo.Lines.Text);
            QueryModified:=False;
            end;
         try
            Prepare;
         except
            on E: Exception do
               begin
               TempAction:=aaAbort;
               InteractiveQueryQueryError(InteractiveQuery,E,TempAction);
               end;
         end;
         end;
      UpdatePreparedButton;
      MainForm.UpdateMenuItems(nil);
      MainForm.SetupOpenDatabases;
      end;
end;

procedure TQueryForm.InteractiveQuerySaveProgress(Sender: TObject;
  PercentDone: Word);
begin
   MainForm.ProgressGauge.Progress:=PercentDone;
   Application.ProcessMessages;
end;

procedure TQueryForm.InteractiveQueryQueryProgress(Sender: TObject;
  PercentDone: Word; var Abort: Boolean);
begin
   with InteractiveQuery do
      MainForm.StatusPanel.Caption:=' Running '+
         StatementTypeToString(SQLStatementType)+' query...';
   MainForm.ProgressGauge.Progress:=PercentDone;
   Application.ProcessMessages;
   Abort:=QueryAborted;
end;

procedure TQueryForm.FormActivate(Sender: TObject);
begin
   MainForm.SetupOpenDatabases;
end;

procedure TQueryForm.UpdatePreparedButton;
begin
   if InteractiveQuery.Prepared then
      PrepareButton.Caption:='&UnPrepare'
   else
      PrepareButton.Caption:='&Prepare';
end;

procedure TQueryForm.InteractiveQueryDataLost(Sender: TObject;
  Cause: TDataLossCause; const ContextInfo: String; var Continue,
  StopAsking: Boolean);
var
   Response: Integer;
   UserMessage: string;
begin
   case Cause of
      dlKeyViolation:
         UserMessage:='Warning: There was data loss during the alter due to '+
                      'a key violation in the '+#39+ContextInfo+#39+' index. '+
                      'Do you wish to continue with the '+
                      'alter process ?';
      dlValidityCheckFail:
         UserMessage:='Warning: There was data loss during the alter due to '+
                      'a failure of a validity check for the '+#39+ContextInfo+#39+
                      ' field. '+'Do you wish to continue with the '+
                      'alter process ?';
      dlFieldDeletion:
         UserMessage:='Warning: There was data loss during the alter due to '+
                      'the deletion of the '+#39+ContextInfo+#39+' field.  Do you wish to '+
                      'continue with the alter process ?';
      dlFieldConversion:
         UserMessage:='Warning: There was data loss during the alter due to '+
                      'an unmanageable field conversion for the '+#39+ContextInfo+#39+
                      ' field.  Do you wish to continue with the '+
                       'alter process ?';
      dlUnknown:
         UserMessage:='Warning: There was data loss during the alter due to '+
                      'an unknown error.  Do you wish to continue with the '+
                        'alter process ?';
      end;
   Response:=MessageDlg(UserMessage,mtError,[mbYes,mbYesToAll,mbNo,mbCancel],0);
   case Response of
      mrYes:
         Continue:=True;
      mrYesToAll:
         begin
         Continue:=True;
         StopAsking:=True;
         end;
      mrNo,mrCancel:
         Continue:=False;
      end;
end;

procedure TQueryForm.InteractiveQueryBeforeExecute(Sender: TObject);
begin
   with InteractiveQuery do
      begin
      OnOptimizeProgress:=nil;
      OnIndexProgress:=nil;
      OnRepairProgress:=nil;
      OnRepairLog:=nil;
      OnVerifyProgress:=nil;
      OnVerifyLog:=nil;
      OnUpgradeProgress:=nil;
      OnUpgradeLog:=nil;
      case SQLStatementType of
         stOptimizeTable:
            OnOptimizeProgress:=MainForm.OptimizeProgress;
         stCreateIndex:
            OnIndexProgress:=MainForm.IndexProgress;
         stRepairTable:
            begin
            with RepairLogDlg do
               begin
               Caption:='Repair Table(s)';
               RepairGroupBox.Caption:='Repair Log Messages';
               RepairLogListBox.Items.Clear;
               end;
            OnRepairProgress:=MainForm.RepairProgress;
            OnRepairLog:=MainForm.RepairLog;
            end;
         stVerifyTable:
            begin
            with RepairLogDlg do
               begin
               Caption:='Verify Table(s)';
               RepairGroupBox.Caption:='Verification Log Messages';
               RepairLogListBox.Items.Clear;
               end;
            OnVerifyProgress:=MainForm.VerifyProgress;
            OnVerifyLog:=MainForm.VerifyLog;
            end;
         stUpgradeTable:
            begin
            UpgradeLogDlg.UpgradeLogListBox.Items.Clear;
            OnUpgradeProgress:=MainForm.UpgradeProgress;
            OnUpgradeLog:=MainForm.UpgradeLog;
            end;
         end;
      end;
end;

procedure TQueryForm.InteractiveQueryAfterExecute(Sender: TObject);
begin
   with InteractiveQuery do
      begin
      case SQLStatementType of
         stRepairTable,stVerifyTable:
            RepairLogDlg.ShowModal;
         stUpgradeTable:
            UpgradeLogDlg.ShowModal;
         end;
      if GeneratePlan then
         PlanMemo.Lines.Add(Plan.Text);
      end;
end;

procedure TQueryForm.LiveResultCheckBoxClick(Sender: TObject);
begin
   InteractiveQuery.RequestLive:=LiveResultCheckBox.Checked;
end;

procedure TQueryForm.MaxRowCountEditChange(Sender: TObject);
begin
   if IsAnInteger(MaxRowCountEdit.Text) then
      InteractiveQuery.MaxRowCount:=StrToInt(MaxRowCountEdit.Text)
   else
      InteractiveQuery.MaxRowCount:=-1;
end;

procedure TQueryForm.SQLMemoChange(Sender: TObject);
begin
   QueryModified:=True;
end;

procedure TQueryForm.GeneratePlanCheckBoxClick(Sender: TObject);
begin
   InteractiveQuery.GeneratePlan:=GeneratePlanCheckBox.Checked;
end;

procedure TQueryForm.InteractiveQueryQueryError(Sender: TObject;
  E: Exception; var Action: TAbortAction);
var
   I: Integer;
   TempPos: Integer;
   TempResponse: Integer;
begin
   if (E is EDBISAMEngineError) then
      begin
      with EDBISAMEngineError(E) do
         begin
         if (ErrorCode=DBISAM_SQLPARSE) then
            begin
            TempPos:=0;
            for I:=0 to ErrorLine-2 do
               Inc(TempPos,Length(SQLMemo.Lines[I])+Length(CRLF));
            Inc(TempPos,(ErrorColumn-1));
            ActiveControl:=SQLMemo;
            { Now insert the caret at the offending position }
            SQLMemo.SelStart:=TempPos;
            SQLMemo.SelLength:=0;
            UpdateLineAndColumn
            end;
         end;
      end;
   { Action=aaAbort indicates that we're preparing and manually calling
     this event handler }
   if (Action <> aaAbort) then
      begin
      TempResponse:=MessageDlg('An error has occurred in the current SQL statement and the error message '+
                               'is: '+CRLF+CRLF+E.Message,mtError,
                               [mbRetry,mbIgnore,mbAbort],0);
      case TempResponse of
         mrRetry:
            Action:=aaRetry;
         mrIgnore:
            Action:=aaContinue;
         mrAbort:
            Action:=aaAbort;
         end;
      end
   else
      MessageDlg('An error has occurred in the current SQL statement and the error message '+
                 'is: '+CRLF+CRLF+E.Message,mtError,[mbOk],0);
end;

procedure TQueryForm.SQLMemoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   UpdateLineAndColumn;
end;

procedure TQueryForm.UpdateLineAndColumn;
var
   TempRow: Integer;
begin
   with SQLMemo do
      begin
      TempRow:=Perform(EM_LINEFROMCHAR,SelStart,0);
      RowEdit.Text:=IntToStr((TempRow+1));
      ColumnEdit.Text:=IntToStr(SelStart-Perform(EM_LINEINDEX,TempRow,0)+1);
      end;
end;

procedure TQueryForm.SQLMemoKeyPress(Sender: TObject; var Key: Char);
begin
   UpdateLineAndColumn;
end;

procedure TQueryForm.SQLMemoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   UpdateLineAndColumn;
end;

procedure TQueryForm.SQLMemoMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   UpdateLineAndColumn;
end;

procedure TQueryForm.SQLMemoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   UpdateLineAndColumn;
end;

end.
