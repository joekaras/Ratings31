unit restore;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Mask, Dialogs, ComCtrls, DB, dbisamtb;

type
  TRestoreDatabaseDlg = class(TForm)
    RestoreButton: TButton;
    CancelButton: TButton;
    OpenDialog: TOpenDialog;
    PageControl: TPageControl;
    BackupSheet: TTabSheet;
    BackupInfoGroupBox: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    BackupFileNameEdit: TEdit;
    BackupDescriptionMemo: TMemo;
    SelectBackupFileButton: TButton;
    BackedUpOnEdit: TEdit;
    TablesToRestoreListBox: TListBox;
    DestinationSheet: TTabSheet;
    ConnectionGroupBox: TGroupBox;
    LocalRadioButton: TRadioButton;
    RemoteRadioButton: TRadioButton;
    AvailableDatabasesGroupBox: TGroupBox;
    AvailableDatabasesComboBox: TComboBox;
    SelectButton: TButton;
    Label3: TLabel;
    procedure AvailableDatabasesComboBoxChange(Sender: TObject);
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
    procedure SaveSettings;
  public
    FCurDatabase: string;
    CurDescription: string;
    CurDateTime: TDateTime;
    procedure Initialize;
  end;

var
  RestoreDatabaseDlg: TRestoreDatabaseDlg;

implementation

uses FileCtrl, main, dbisamlb, dbisamcn, dbisamut;

{$R *.DFM}

procedure TRestoreDatabaseDlg.Initialize;
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
end;

procedure TRestoreDatabaseDlg.LoadDatabases;
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

procedure TRestoreDatabaseDlg.AvailableDatabasesComboBoxChange(Sender: TObject);
begin
   Screen.Cursor:=crHourGlass;
   try
      FCurDatabase:=AvailableDatabasesComboBox.Text;
   finally
      Screen.Cursor:=crDefault;
   end;
end;

procedure TRestoreDatabaseDlg.LocalRadioButtonClick(Sender: TObject);
begin
   Screen.Cursor:=crHourGlass;
   try
      SelectButton.Visible:=True;
      AvailableDatabasesComboBox.Style:=csDropDown;
      AvailableDatabasesComboBox.Width:=SelectButton.Left-
                  AvailableDatabasesComboBox.Left-20;
      LoadDatabases;
   finally
      Screen.Cursor:=crDefault;
   end;
end;

procedure TRestoreDatabaseDlg.RemoteRadioButtonClick(Sender: TObject);
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

procedure TRestoreDatabaseDlg.SelectButtonClick(Sender: TObject);
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
      finally
         Screen.Cursor:=crDefault;
      end;
      end;
end;

procedure TRestoreDatabaseDlg.SaveSettings;
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

procedure TRestoreDatabaseDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if (ModalResult=mrOk) then
      begin
      AvailableDatabasesComboBox.Text:=RemoveBS(AvailableDatabasesComboBox.Text);
      SaveSettings;
      end;
end;

procedure TRestoreDatabaseDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose:=True;
   if (ModalResult=mrOk) then
      begin
      if (not OSFileExists(BackupFileNameEdit.Text,False)) then
         begin
         MessageDlg('The backup file specified does not exist',
                    mtError,[mbOk],0);
         CanClose:=False;
         Exit;
         end;
      if (TablesToRestoreListBox.SelCount=0) then
         begin
         MessageDlg('You must select at least one table for restore',
                    mtError,[mbOk],0);
         CanClose:=False;
         Exit;
         end;
      end;
end;

procedure TRestoreDatabaseDlg.BackupFileNameEditChange(Sender: TObject);
var
   I: Integer;
   InfoDatabase: TDBISAMDatabase;
begin
   if (BackupFileNameEdit.Text <> '') then
      begin
      try
         RestoreButton.Enabled:=True;
         if RemoteRadioButton.Checked then
            InfoDatabase:=MainForm.RemoteSession.OpenDatabase(FCurDatabase)
         else
            InfoDatabase:=Session.OpenDatabase(FCurDatabase);
         try
            with InfoDatabase do
               begin
               if BackupInfo(BackupFileNameEdit.Text,
                             CurDescription,CurDateTime,TablesToRestoreListBox.Items) then
                  begin
                  BackupDescriptionMemo.Lines.Text:=CurDescription;
                  BackedUpOnEdit.Text:=DateTimeToStr(CurDateTime);
                  with TablesToRestoreListBox do
                     begin
                     for I:=0 to Items.Count-1 do
                        Selected[I]:=True;
                     ItemIndex:=-1;
                     end;
                  end
               else
                  begin
                  RestoreButton.Enabled:=False;
                  CurDescription:='Error retrieving backup information';
                  BackupDescriptionMemo.Lines.Text:=CurDescription;
                  CurDateTime:=0;
                  BackedUpOnEdit.Text:='';
                  with TablesToRestoreListBox do
                     begin
                     Items.Clear;
                     ItemIndex:=-1;
                     end;
                  end;
               end;
         finally
            if RemoteRadioButton.Checked then
               MainForm.RemoteSession.CloseDatabase(InfoDatabase)
            else
               Session.CloseDatabase(InfoDatabase);
         end;
      except
         RestoreButton.Enabled:=False;
         raise;
      end;
      end
   else
      begin
      RestoreButton.Enabled:=False;
      CurDescription:='';
      BackupDescriptionMemo.Lines.Text:=CurDescription;
      CurDateTime:=0;
      BackedUpOnEdit.Text:='';
      with TablesToRestoreListBox do
         begin
         Items.Clear;
         ItemIndex:=-1;
         end;
      end;
end;

procedure TRestoreDatabaseDlg.FormShow(Sender: TObject);
begin
   PageControl.ActivePage:=BackupSheet;
   BackupFileNameEditChange(nil);
   ActiveControl:=BackupFileNameEdit;
end;

procedure TRestoreDatabaseDlg.SelectBackupFileButtonClick(Sender: TObject);
begin
   OpenDialog.InitialDir:=MainForm.AppSessionSettings.FileDirectory;
   if OpenDialog.Execute then
      begin
      MainForm.AppSessionSettings.FileDirectory:=ExtractFilePath(OpenDialog.FileName);
      BackupFileNameEdit.Text:=OpenDialog.FileName;
      end;
end;

end.
