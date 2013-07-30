unit opentbl;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
     Buttons, ExtCtrls, DB, dbisamtb;

type
  TOpenTableDlg = class(TForm)
    OpenButton: TButton;
    CancelButton: TButton;
    AvailableDatabasesGroupBox: TGroupBox;
    AvailableTablesGroupBox: TGroupBox;
    ReadOnlyCheckBox: TCheckBox;
    AvailableTablesListBox: TListBox;
    AvailableDatabasesComboBox: TComboBox;
    SelectButton: TButton;
    ConnectionGroupBox: TGroupBox;
    LocalRadioButton: TRadioButton;
    RemoteRadioButton: TRadioButton;
    Label2: TLabel;
    LastUpdatedEdit: TEdit;
    Label3: TLabel;
    DescriptionEdit: TMemo;
    InfoTable: TDBISAMTable;
    ExclusiveCheckBox: TCheckBox;
    procedure AvailableDatabasesComboBoxChange(Sender: TObject);
    procedure AvailableTablesListBoxClick(Sender: TObject);
    procedure AvailableTablesListBoxDblClick(Sender: TObject);
    procedure LocalRadioButtonClick(Sender: TObject);
    procedure RemoteRadioButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    FExclusive: Boolean;
    FReadOnly: Boolean;
    FMultipleSelect: Boolean;
    FCurDatabase: string;
    procedure LoadDatabases;
    procedure LoadTables;
    procedure SaveSettings;
    procedure UpdateTableInfo(const TableToShow: string);
  public
    property Exclusive: Boolean read FExclusive write FExclusive;
    property ReadOnly: Boolean read FReadOnly write FReadOnly;
    property MultipleSelect: Boolean read FMultipleSelect write FMultipleSelect;
    procedure Initialize;
  end;

var
  OpenTableDlg: TOpenTableDlg;

implementation

uses FileCtrl, main, dbisamcn, dbisamlb, dbisamut;

{$R *.DFM}

procedure TOpenTableDlg.Initialize;
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
   if FExclusive then
      ExclusiveCheckBox.Visible:=True
   else
      ExclusiveCheckBox.Visible:=False;
   ExclusiveCheckBox.Checked:=False;
   if FReadOnly then
      ReadOnlyCheckBox.Visible:=True
   else
      ReadOnlyCheckBox.Visible:=False;
   ReadOnlyCheckBox.Checked:=False;
   if (FExclusive or FReadOnly) then
      begin
      AvailableTablesListBox.Height:=(AvailableTablesGroupBox.Height-
                                      (AvailableTablesListBox.Top*2)-
                                      ReadOnlyCheckBox.Height);
      end
   else
      begin
      AvailableTablesListBox.Height:=(AvailableTablesGroupBox.Height-
                                      (AvailableTablesListBox.Top*2));
      end;
   with AvailableTablesListBox do
      begin
      MultiSelect:=False;
      ItemIndex:=-1;
      MultiSelect:=FMultipleSelect;
      if MultiSelect then
         ExtendedSelect:=True;
      end;
   AvailableTablesListBoxClick(Self);
end;

procedure TOpenTableDlg.LoadDatabases;
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

procedure TOpenTableDlg.LoadTables;
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
                  if (AnsiCompareText(Copy(Items[I],1,Length('BeginRangeFields')),
                                      'BeginRangeFields')=0) or
                     (AnsiCompareText(Copy(Items[I],1,Length('EndRangeFields')),
                                      'EndRangeFields')=0) or
                     (AnsiCompareText(Copy(Items[I],1,Length('FieldsTable')),
                                      'FieldsTable')=0) or
                     (AnsiCompareText(Copy(Items[I],1,Length('IndexesTable')),
                                      'IndexesTable')=0) or
                     (AnsiCompareText(Copy(Items[I],1,Length('PrintFieldsTable')),
                                      'PrintFieldsTable')=0) or
                     (AnsiCompareText(Copy(Items[I],1,Length('PrintIndexesTable')),
                                      'PrintIndexesTable')=0) or
                     (AnsiCompareText(Copy(Items[I],1,Length('SearchFields')),
                                      'SearchFields')=0) then
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

procedure TOpenTableDlg.AvailableDatabasesComboBoxChange(Sender: TObject);
begin
   Screen.Cursor:=crHourGlass;
   try
      if RemoteRadioButton.Checked or
         (LocalRadioButton.Checked and (MemoryDirectory(AvailableDatabasesComboBox.Text) or
                                        DirectoryExists(AvailableDatabasesComboBox.Text))) then
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

procedure TOpenTableDlg.AvailableTablesListBoxClick(Sender: TObject);
begin
   with AvailableTablesListBox do
      begin
      if MultiSelect then
         begin
         if (SelCount <> 0) then
            OpenButton.Enabled:=True
         else
            OpenButton.Enabled:=False;
         if (SelCount=1) and (ItemIndex <> -1) then
            UpdateTableInfo(Items[ItemIndex])
         else
            UpdateTableInfo('');
         end
      else
         begin
         if (ItemIndex <> -1) then
            begin
            OpenButton.Enabled:=True;
            UpdateTableInfo(Items[ItemIndex]);
            end
         else
            begin
            OpenButton.Enabled:=False;
            UpdateTableInfo('');
            end;
         end;
      end;
end;

procedure TOpenTableDlg.UpdateTableInfo(const TableToShow: string);
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

procedure TOpenTableDlg.AvailableTablesListBoxDblClick(Sender: TObject);
begin
   ModalResult:=mrOk;
end;

procedure TOpenTableDlg.LocalRadioButtonClick(Sender: TObject);
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

procedure TOpenTableDlg.RemoteRadioButtonClick(Sender: TObject);
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

procedure TOpenTableDlg.SelectButtonClick(Sender: TObject);
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

procedure TOpenTableDlg.SaveSettings;
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

procedure TOpenTableDlg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if (ModalResult=mrOk) then
      begin
      AvailableDatabasesComboBox.Text:=RemoveBS(AvailableDatabasesComboBox.Text);
      SaveSettings;
      end;
end;

procedure TOpenTableDlg.FormShow(Sender: TObject);
begin
   ActiveControl:=AvailableTablesListBox;
end;

end.
