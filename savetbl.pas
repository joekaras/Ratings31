unit savetbl;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
     Buttons, ExtCtrls, DB, dbisamtb;

type
  TSaveTableDlg = class(TForm)
    SaveButton: TButton;
    CancelButton: TButton;
    AvailableDatabasesGroupBox: TGroupBox;
    AvailableTablesGroupBox: TGroupBox;
    AvailableTablesListBox: TListBox;
    AvailableDatabasesComboBox: TComboBox;
    SelectButton: TButton;
    ConnectionGroupBox: TGroupBox;
    LocalRadioButton: TRadioButton;
    RemoteRadioButton: TRadioButton;
    InfoTable: TDBISAMTable;
    SaveAsGroupBox: TGroupBox;
    SaveAsEdit: TEdit;
    Label3: TLabel;
    DescriptionEdit: TMemo;
    Label2: TLabel;
    LastUpdatedEdit: TEdit;
    procedure AvailableDatabasesComboBoxChange(Sender: TObject);
    procedure AvailableTablesListBoxClick(Sender: TObject);
    procedure AvailableTablesListBoxDblClick(Sender: TObject);
    procedure LocalRadioButtonClick(Sender: TObject);
    procedure RemoteRadioButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SaveAsEditChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FCurDatabase: string;
    procedure LoadDatabases;
    procedure LoadTables;
    procedure SaveSettings;
    procedure UpdateTableInfo(const TableToShow: string);
  public
    procedure Initialize;
  end;

var
  SaveTableDlg: TSaveTableDlg;

implementation

uses FileCtrl, Dialogs, main, dbisamcn, dbisamut;

{$R *.DFM}

procedure TSaveTableDlg.Initialize;
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
      MultiSelect:=False;
      ItemIndex:=-1;
      end;
   AvailableTablesListBoxClick(Self);
end;

procedure TSaveTableDlg.LoadDatabases;
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

procedure TSaveTableDlg.LoadTables;
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
end;

procedure TSaveTableDlg.AvailableDatabasesComboBoxChange(Sender: TObject);
begin
   Screen.Cursor:=crHourGlass;
   try
      FCurDatabase:=AvailableDatabasesComboBox.Text;
      LoadTables;
   finally
      Screen.Cursor:=crDefault;
   end;
end;

procedure TSaveTableDlg.AvailableTablesListBoxClick(Sender: TObject);
begin
   with AvailableTablesListBox do
      begin
      if (ItemIndex <> -1) then
         begin
         UpdateTableInfo(Items[ItemIndex]);
         SaveAsEdit.Text:=Items[ItemIndex];
         end
      else
         UpdateTableInfo('');
      end;
end;

procedure TSaveTableDlg.UpdateTableInfo(const TableToShow: string);
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

procedure TSaveTableDlg.AvailableTablesListBoxDblClick(Sender: TObject);
begin
   ModalResult:=mrOk;
end;

procedure TSaveTableDlg.LocalRadioButtonClick(Sender: TObject);
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

procedure TSaveTableDlg.RemoteRadioButtonClick(Sender: TObject);
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

procedure TSaveTableDlg.SelectButtonClick(Sender: TObject);
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

procedure TSaveTableDlg.SaveSettings;
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

procedure TSaveTableDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if (ModalResult=mrOk) then
      SaveSettings;
end;

procedure TSaveTableDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if (ModalResult=mrOk) then
      begin
      CanClose:=False;
      with InfoTable do
         begin
         if RemoteRadioButton.Checked then
            SessionName:='Remote'
         else
            SessionName:='';
         try
            DatabaseName:=FCurDatabase;
            TableName:=SaveAsEdit.Text;
            if Exists then
               begin
               if (MessageDlg('This table already exists, do you want to overwrite it ?',
                              mtConfirmation,[mbYes,mbNo],0)=mrYes) then
                  CanClose:=True;
               end
            else
               CanClose:=True;
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
         end;
      end
   else
      CanClose:=True;
end;

procedure TSaveTableDlg.SaveAsEditChange(Sender: TObject);
begin
   if (SaveAsEdit.Text <> '') then
      SaveButton.Enabled:=True
   else
      SaveButton.Enabled:=False;
end;

procedure TSaveTableDlg.FormShow(Sender: TObject);
begin
   ActiveControl:=SaveAsEdit;
   SaveAsEdit.SelectAll;
end;

end.
