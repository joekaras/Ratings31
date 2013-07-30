unit backup;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
     Buttons, ExtCtrls, Mask, Dialogs, ComCtrls, DB, dbisamtb;

type
  TBackupDatabaseDlg = class(TForm)
    BackupButton: TButton;
    CancelButton: TButton;
    SaveDialog: TSaveDialog;
    InfoTable: TDBISAMTable;
    PageControl: TPageControl;
    DatabaseSheet: TTabSheet;
    ConnectionGroupBox: TGroupBox;
    LocalRadioButton: TRadioButton;
    RemoteRadioButton: TRadioButton;
    AvailableDatabasesGroupBox: TGroupBox;
    AvailableDatabasesComboBox: TComboBox;
    SelectButton: TButton;
    AvailableTablesGroupBox: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    AvailableTablesListBox: TListBox;
    DescriptionEdit: TMemo;
    LastUpdatedEdit: TEdit;
    InformationSheet: TTabSheet;
    BackupInfoGroupBox: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    BackupFileNameEdit: TEdit;
    BackupDescriptionMemo: TMemo;
    SelectBackupFileButton: TButton;
    Label7: TLabel;
    Label9: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    CompressionTrackBar: TTrackBar;
    Label2: TLabel;
    procedure AvailableDatabasesComboBoxChange(Sender: TObject);
    procedure AvailableTablesListBoxClick(Sender: TObject);
    procedure AvailableTablesListBoxDblClick(Sender: TObject);
    procedure LocalRadioButtonClick(Sender: TObject);
    procedure RemoteRadioButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BackupFileNameEditChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SelectBackupFileButtonClick(Sender: TObject);
  private
    procedure LoadDatabases;
    procedure LoadTables;
    procedure SaveSettings;
    procedure UpdateTableInfo(const TableToShow: string);
  public
    FCurDatabase: string;
    procedure Initialize;
  end;

var
  BackupDatabaseDlg: TBackupDatabaseDlg;

implementation

uses FileCtrl, main, dbisamlb, dbisamcn, dbisamut;

{$R *.DFM}

procedure TBackupDatabaseDlg.Initialize;
var
   I: Integer;
begin
   FCurDatabase:=MainForm.AppSessionSettings.DatabaseDirectory;
   LocalRadioButton.Enabled:=True;
   RemoteRadioButton.Enabled:=True;
   RemoteRadioButton.Caption:='Remote (Client/Server)';
   AvailableDatabasesComboBox.Enabled:=True;
   if (MainForm.AppSessionSettings.LocalRemote=SESSION_REMOTE) and
      (not RemoteRadioButton.Checked) then
      RemoteRadioButton.Checked:=True
   else if (MainForm.AppSessionSettings.LocalRemote=SESSION_LOCAL) and
      (not LocalRadioButton.Checked) then
      LocalRadioButton.Checked:=True
   else
      begin
      if RemoteRadioButton.Checked then
         RemoteRadioButtonClick(Self)
      else
         LocalRadioButtonClick(Self);
      end;
   with AvailableTablesListBox do
      begin
      MultiSelect:=True;
      for I:=0 to Items.Count-1 do
         Selected[I]:=True;
      ItemIndex:=-1;
      end;
   AvailableTablesListBoxClick(Self);
end;

procedure TBackupDatabaseDlg.LoadDatabases;
begin
   with AvailableDatabasesComboBox do
      begin
      if RemoteRadioButton.Checked then
         MainForm.RemoteSession.GetRemoteDatabaseNames(Items)
      else
         Items.Assign(MainForm.AppMRUDatabaseDirectories);
      Items.Insert(0,INMEMORY_DATABASE_NAME);
      ItemIndex:=Items.IndexOf(FCurDatabase);
      if (ItemIndex=-1) then
         ItemIndex:=0;
      FCurDatabase:=Text;
      end;
end;

procedure TBackupDatabaseDlg.LoadTables;
var
   I: Integer;
begin
   if (AvailableDatabasesComboBox.Items.Count > 0) then
      begin
      with AvailableTablesListBox do
         begin
         if RemoteRadioButton.Checked then
            MainForm.RemoteSession.GetTableNames(AvailableDatabasesComboBox.Text,Items)
         else
            begin
            Session.GetTableNames(AvailableDatabasesComboBox.Text,Items);
            if (AnsiCompareText(AvailableDatabasesComboBox.Text,INMEMORY_DATABASE_NAME)=0) then
               begin
               for I:=Items.Count-1 downto 0 do
                  begin
                  if (AnsiCompareText(Items[I],'BeginRangeFields')=0) or
                     (AnsiCompareText(Items[I],'EndRangeFields')=0) or
                     (AnsiCompareText(Items[I],'FieldsTable')=0) or
                     (AnsiCompareText(Items[I],'IndexesTable')=0) or
                     (AnsiCompareText(Items[I],'PrintFieldsTable')=0) or
                     (AnsiCompareText(Items[I],'PrintIndexesTable')=0) or
                     (AnsiCompareText(Items[I],'SearchFields')=0) then
                     Items.Delete(I);
                  end;
               end;
            end;
         ItemIndex:=-1;
         end;
      end
   else
      begin
      with AvailableTablesListBox do
         begin
         Items.Clear;
         ItemIndex:=-1;
         end;
      end;
   AvailableTablesListBoxClick(nil);
end;

procedure TBackupDatabaseDlg.AvailableDatabasesComboBoxChange(Sender: TObject);
begin
   Screen.Cursor:=crHourGlass;
   try
      if RemoteRadioButton.Checked or
         (LocalRadioButton.Checked and DirectoryExists(AvailableDatabasesComboBox.Text)) then
         begin
         FCurDatabase:=AvailableDatabasesComboBox.Text;
         LoadTables;
         end
      else
         begin
         with AvailableTablesListBox do
            begin
            Items.Clear;
            ItemIndex:=-1;
            end;
         AvailableTablesListBoxClick(nil);
         end;
   finally
      Screen.Cursor:=crDefault;
   end;
end;

procedure TBackupDatabaseDlg.AvailableTablesListBoxClick(Sender: TObject);
begin
   with AvailableTablesListBox do
      begin
      if (ItemIndex <> -1) then
         UpdateTableInfo(Items[ItemIndex])
      else
         UpdateTableInfo('');
      end;
end;

procedure TBackupDatabaseDlg.UpdateTableInfo(const TableToShow: string);
begin
   if (TableToShow='') then
      begin
      DescriptionEdit.Text:='';
      LastUpdatedEdit.Text:='';
      end
   else
      begin
      Screen.Cursor:=crHourglass;
      try
         try
            with InfoTable do
               begin
               if RemoteRadioButton.Checked then
                  SessionName:='Remote'
               else
                  SessionName:='';
               DatabaseName:=FCurDatabase;
               TableName:=TableToShow;
               DescriptionEdit.Text:=Description;
               LastUpdatedEdit.Text:=DateTimeToStr(LastUpdated);
               end;
         except
            on E: Exception do
               begin
               if (E is EDBISAMEngineError) then
                  begin
                  DescriptionEdit.Text:='';
                  LastUpdatedEdit.Text:='';
                  end
               else
                  raise;
               end;
         end;
      finally
         Screen.Cursor:=crDefault;
      end;
      end;
end;

procedure TBackupDatabaseDlg.AvailableTablesListBoxDblClick(Sender: TObject);
begin
   ModalResult:=mrOk;
end;

procedure TBackupDatabaseDlg.LocalRadioButtonClick(Sender: TObject);
begin
   Screen.Cursor:=crHourGlass;
   try
      SelectButton.Visible:=True;
      AvailableDatabasesComboBox.Style:=csDropDown;
      AvailableDatabasesComboBox.Width:=SelectButton.Left-
                  AvailableDatabasesComboBox.Left-20;
      LoadDatabases;
      LoadTables;
   finally
      Screen.Cursor:=crDefault;
   end;
end;

procedure TBackupDatabaseDlg.RemoteRadioButtonClick(Sender: TObject);
begin
   Screen.Cursor:=crHourGlass;
   try
      SelectButton.Visible:=False;
      AvailableDatabasesComboBox.Style:=csDropDownList;
      AvailableDatabasesComboBox.Width:=AvailableDatabasesGroupBox.Width-
               (AvailableDatabasesComboBox.Left*2);
      try
         MainForm.RemoteSession.Active:=True;
         LoadDatabases;
         LoadTables;
         RemoteRadioButton.Caption:='Remote (Client/Server)';
      except
         on E: Exception do
            begin
            if (E is EDBISAMEngineError) or (E is EAbort) then
               begin
               if RemoteRadioButton.Checked then
                  begin
                  RemoteRadioButton.Checked:=False;
                  RemoteRadioButton.Caption:='Remote (Client/Server) - Not Available';
                  LocalRadioButton.Checked:=True;
                  end
               else
                  raise;
               end
            else
               raise;
            end;
      end;
   finally
      Screen.Cursor:=crDefault;
   end;
end;

procedure TBackupDatabaseDlg.SelectButtonClick(Sender: TObject);
var
   DefaultDir: string;
begin
   if not DirectoryExists(AvailableDatabasesComboBox.Text) then
      DefaultDir:=MainForm.AppSessionSettings.DatabaseDirectory
   else
      DefaultDir:=AvailableDatabasesComboBox.Text;
   if GetDirectory(DefaultDir) then
      begin
      Screen.Cursor:=crHourGlass;
      try
         with AvailableDatabasesComboBox do
            begin
            Items.Add(DefaultDir);
            ItemIndex:=Items.IndexOf(DefaultDir);
            FCurDatabase:=Text;
            end;
         LoadTables;
      finally
         Screen.Cursor:=crDefault;
      end;
      end;
end;

procedure TBackupDatabaseDlg.SaveSettings;
var
   I: Integer;
   DirPos: Integer;
begin
   with MainForm,AppSessionSettings do
      begin
      DatabaseDirectory:=AvailableDatabasesComboBox.Text;
      if RemoteRadioButton.Checked then
         LocalRemote:=SESSION_REMOTE
      else
         begin
         LocalRemote:=SESSION_LOCAL;
         with AppMRUDatabaseDirectories do
            begin
            DirPos:=-1;
            for I:=0 to Count-1 do
               begin
               if (AnsiCompareText(Strings[I],DatabaseDirectory)=0) then
                  begin
                  DirPos:=I;
                  Break;
                  end;
               end;
            if (DirPos <> -1) then
               Move(DirPos,0)
            else if (AnsiCompareText(DatabaseDirectory,INMEMORY_DATABASE_NAME) <> 0) then
               Insert(0,DatabaseDirectory);
            if (Count > MAX_MRU_DIRECTORIES) then
               Delete(MAX_MRU_DIRECTORIES);
            end;
         end;
      end;
end;

procedure TBackupDatabaseDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if (ModalResult=mrOk) then
      begin
      AvailableDatabasesComboBox.Text:=RemoveBS(AvailableDatabasesComboBox.Text);
      SaveSettings;
      end;
end;

procedure TBackupDatabaseDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose:=True;
   if (ModalResult=mrOk) then
      begin
      if (AvailableTablesListBox.SelCount=0) then
         begin
         MessageDlg('You must select at least one table for backup',
                    mtError,[mbOk],0);
         CanClose:=False;
         Exit;
         end;
      if OSFileExists(BackupFileNameEdit.Text,False) then
         begin
         if (MessageDlg('The backup file specified already exists, are you sure you want '+
                          'to overwrite it?',mtWarning,[mbYes,mbNo],0)=mrNo) then
            begin
            CanClose:=False;
            Exit;
            end;
         end;
      end;
end;

procedure TBackupDatabaseDlg.BackupFileNameEditChange(Sender: TObject);
begin
   if (BackupFileNameEdit.Text <> '') then
      BackupButton.Enabled:=True
   else
      BackupButton.Enabled:=False;
end;

procedure TBackupDatabaseDlg.FormShow(Sender: TObject);
begin
   PageControl.ActivePage:=DatabaseSheet;
   BackupFileNameEditChange(nil);
   ActiveControl:=AvailableTablesListBox;
end;

procedure TBackupDatabaseDlg.SelectBackupFileButtonClick(Sender: TObject);
begin
   SaveDialog.InitialDir:=MainForm.AppSessionSettings.FileDirectory;
   if SaveDialog.Execute then
      begin
      MainForm.AppSessionSettings.FileDirectory:=ExtractFilePath(SaveDialog.FileName);
      BackupFileNameEdit.Text:=SaveDialog.FileName;
      end;
end;

end.
