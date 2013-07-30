unit opendb;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
     Buttons, ExtCtrls, DB, dbisamtb;

type
  TOpenDatabaseDlg = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    ConnectionGroupBox: TGroupBox;
    LocalRadioButton: TRadioButton;
    RemoteRadioButton: TRadioButton;
    AvailableDatabasesGroupBox: TGroupBox;
    AvailableDatabasesComboBox: TComboBox;
    SelectButton: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure AvailableDatabasesComboBoxChange(Sender: TObject);
    procedure LocalRadioButtonClick(Sender: TObject);
    procedure RemoteRadioButtonClick(Sender: TObject);
  private
    FCurDatabase: string;
    procedure LoadDatabases;
    procedure OpenCurDatabase;
    procedure SaveSettings;
  public
    procedure Initialize;
  end;

var
  OpenDatabaseDlg: TOpenDatabaseDlg;

implementation

uses FileCtrl, main, dbisamcn, dbisamlb, dbisamut;

{$R *.DFM}

procedure TOpenDatabaseDlg.Initialize;
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

procedure TOpenDatabaseDlg.LoadDatabases;
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
      OpenCurDatabase;
      end;
end;

procedure TOpenDatabaseDlg.OpenCurDatabase;
begin
   try
      if RemoteRadioButton.Checked then
         MainForm.RemoteSession.OpenDatabase(FCurDatabase)
      else
         Session.OpenDatabase(FCurDatabase);
      OKButton.Enabled:=True;
   except
      OKButton.Enabled:=False;
   end;
end;

procedure TOpenDatabaseDlg.SaveSettings;
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

procedure TOpenDatabaseDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if (ModalResult=mrOk) then
      begin
      AvailableDatabasesComboBox.Text:=RemoveBS(AvailableDatabasesComboBox.Text);
      SaveSettings;
      end;
end;

procedure TOpenDatabaseDlg.FormShow(Sender: TObject);
begin
   ActiveControl:=AvailableDatabasesComboBox;
end;

procedure TOpenDatabaseDlg.SelectButtonClick(Sender: TObject);
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
            OpenCurDatabase;
            end;
      finally
         Screen.Cursor:=crDefault;
      end;
      end;
end;

procedure TOpenDatabaseDlg.AvailableDatabasesComboBoxChange(
  Sender: TObject);
begin
   Screen.Cursor:=crHourGlass;
   try
      if RemoteRadioButton.Checked or
         (LocalRadioButton.Checked and (MemoryDirectory(AvailableDatabasesComboBox.Text) or
                                        DirectoryExists(AvailableDatabasesComboBox.Text))) then
         begin
         FCurDatabase:=AvailableDatabasesComboBox.Text;
         OpenCurDatabase;
         end
      else
         OkButton.Enabled:=False;
   finally
      Screen.Cursor:=crDefault;
   end;
end;

procedure TOpenDatabaseDlg.LocalRadioButtonClick(Sender: TObject);
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

procedure TOpenDatabaseDlg.RemoteRadioButtonClick(Sender: TObject);
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

end.
