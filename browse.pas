unit browse;

interface

uses Windows, Classes, Graphics, Forms, Controls, ExtCtrls,  DBCtrls, Grids,
     DBGrids, DB, StdCtrls, ComCtrls, main, dbisamtb, dbisamlb, dbisamct;

type
  TBrowseForm = class(TForm)
    BrowseTable: TDBISAMTable;
    BrowseSource: TDataSource;
    Panel1: TPanel;
    BrowseNotebook: TPageControl;
    DataSheet: TTabSheet;
    StructureSheet: TTabSheet;
    IndexesSheet: TTabSheet;
    FieldsTable: TDBISAMTable;
    FieldsTableFieldName: TStringField;
    FieldsTableDataType: TStringField;
    FieldsTableSize: TWordField;
    FieldsTableRequired: TBooleanField;
    FieldsTableDetails: TStringField;
    FieldsTableMinValue: TStringField;
    FieldsTableMaxValue: TStringField;
    FieldsTableDefaultValue: TStringField;
    FieldsTableDescription: TStringField;
    FieldsSource: TDataSource;
    IndexesTable: TDBISAMTable;
    IndexesTableIndexName: TStringField;
    IndexesTableCaseInsensitive: TBooleanField;
    IndexesTableUnique: TBooleanField;
    IndexesTableCompression: TStringField;
    IndexesTableIndexedFields: TStringField;
    IndexesSource: TDataSource;
    IndexesTablePosition: TIntegerField;
    FieldsTableCharCase: TSmallintField;
    FieldsTablePosition: TIntegerField;
    FieldsTableFieldNumber: TIntegerField;
    FieldsTableTextIndex: TBooleanField;
    FullTextIndexSheet: TTabSheet;
    IndexesTableDescendingFields: TStringField;
    FieldsTableCompression: TSmallintField;
    BrowseGrid: TDBISAMDBGrid;
    SelectFieldsButton: TButton;
    CopyOnAppendCheckBox: TCheckBox;
    BrowseNavigator: TDBNavigator;
    Label1: TLabel;
    Label5: TLabel;
    LastUpdateEdit: TEdit;
    Label11: TLabel;
    UserMajorVersionEdit: TEdit;
    UserMinorVersionEdit: TEdit;
    Label2: TLabel;
    DescriptionEdit: TEdit;
    Label13: TLabel;
    EncryptedEdit: TEdit;
    Label7: TLabel;
    PasswordEdit: TEdit;
    Label9: TLabel;
    LocaleEdit: TEdit;
    Label8: TLabel;
    BlobBlockSizeEdit: TEdit;
    Label16: TLabel;
    LastAutoIncValueEdit: TEdit;
    Bevel1: TBevel;
    FieldsGrid: TDBISAMDBGrid;
    Label4: TLabel;
    TotalFieldsEdit: TEdit;
    Label3: TLabel;
    RecordSizeEdit: TEdit;
    Label6: TLabel;
    TotalIndexesEdit: TEdit;
    IndexesGrid: TDBISAMDBGrid;
    Label17: TLabel;
    TextIndexFieldsEdit: TEdit;
    Bevel2: TBevel;
    Label18: TLabel;
    StopWordsMemo: TMemo;
    Label20: TLabel;
    SpaceCharsListBox: TListBox;
    Label19: TLabel;
    IncludeCharsListBox: TListBox;
    Label10: TLabel;
    IndexPageSizeEdit: TEdit;
    IndexesTablePrimary: TBooleanField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectFieldsButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FieldsGridEditButtonClick(Sender: TObject);
    procedure FieldsGridDblClick(Sender: TObject);
    procedure BrowseGridColEnter(Sender: TObject);
    procedure BrowseGridCellClick(Column: TColumn);
    procedure CopyOnAppendCheckBoxClick(Sender: TObject);
    procedure FieldsGridCellClick(Column: TColumn);
    procedure IndexesGridCellClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    procedure InitializeWindow;
    procedure SetupExistingStructure;
  end;

implementation

uses SysUtils, Dialogs, graphic, memo, flddtls, blob, visible, dbisamen, dbisamut;

{$R *.DFM}

procedure TBrowseForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   SaveTableSettings(BrowseTable,MainForm.AppDirectory,
                     MainForm.AppVersionInformation.FileNameRoot);
   try
      BrowseTable.Active:=False;
   except
   end;
   Action := caFree;
end;

procedure TBrowseForm.SelectFieldsButtonClick(Sender: TObject);
begin
   MainForm.SelectVisibleFields(BrowseTable);
end;

procedure TBrowseForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose:=MainForm.CheckWindowClose(BrowseTable);
end;

procedure TBrowseForm.FormCreate(Sender: TObject);
var
   TempFieldsNumber: Integer;
   TempIndexesNumber: Integer;
begin
   TempFieldsNumber:=MainForm.MDIChildCount;
   TempIndexesNumber:=MainForm.MDIChildCount;
   FieldsTable.TableName:='FieldsTable'+IntToStr(TempFieldsNumber);
   IndexesTable.TableName:='IndexesTable'+IntToStr(TempIndexesNumber);
   while FieldsTable.Exists and IndexesTable.Exists do
      begin
      Inc(TempFieldsNumber);
      Inc(TempIndexesNumber);
      FieldsTable.TableName:='FieldsTable'+IntToStr(TempFieldsNumber);
      IndexesTable.TableName:='IndexesTable'+IntToStr(TempIndexesNumber);
      end;
   MainForm.CreateStructureTables(FieldsTable,IndexesTable);
   PopulateAsciiValues(SpaceCharsListBox);
   PopulateAsciiValues(IncludeCharsListBox);
   ReadWindowSettings(Self,MainForm.AppDirectory,
                      MainForm.AppVersionInformation.FileNameRoot,'Browse Window');
   BrowseSource.OnStateChange:=MainForm.WindowStateChange;
   BrowseSource.OnDataChange:=MainForm.WindowDataChange;
   BrowseGrid.OnDBLClick:=MainForm.WindowGridDBLClick;
   with BrowseTable do
      begin
      OnEditError:=MainForm.WindowEditError;
      OnDeleteError:=MainForm.WindowDeleteError;
      OnPostError:=MainForm.WindowPostError;
      end;
   BrowseNotebook.ActivePage:=DataSheet;
   ActiveControl:=BrowseGrid;
end;

procedure TBrowseForm.InitializeWindow;
begin
   ReadTableSettings(BrowseTable,MainForm.AppDirectory,
                     MainForm.AppVersionInformation.FileNameRoot);
   CopyOnAppendCheckBox.Checked:=BrowseTable.CopyOnAppend;
   MainForm.SetupWindow(BrowseTable);
   MainForm.SetupOpenDatabases;
end;

procedure TBrowseForm.FormDestroy(Sender: TObject);
begin
   SaveWindowSettings(Self,MainForm.AppDirectory,
                      MainForm.AppVersionInformation.FileNameRoot,'Browse Window');
   BrowseSource.OnStateChange:=nil;
   BrowseSource.OnDataChange:=nil;
   BrowseGrid.OnDBLClick:=nil;
   with BrowseTable do
      begin
      OnEditError:=nil;
      OnDeleteError:=nil;
      OnPostError:=nil;
      Close;
      end;
   MainForm.DeleteStructureTables(FieldsTable,IndexesTable);
   MainForm.SetupOpenDatabases;
end;

procedure TBrowseForm.SetupExistingStructure;
var
   LastFieldUsed: Word;
begin
   with BrowseTable do
      begin
      UserMajorVersionEdit.Text:=IntToStr(UserMajorVersion);
      UserMinorVersionEdit.Text:=IntToStr(UserMinorVersion);
      DescriptionEdit.Text:=Description;
      EncryptedEdit.Text:=BooleanToStr(Encrypted);
      PasswordEdit.Text:=Password;
      LocaleEdit.Text:=Engine.ConvertIDToLocaleConstant(LocaleID);
      RecordSizeEdit.Text:=IntToStr(RecordSize);
      IndexPageSizeEdit.Text:=IntToStr(IndexPageSize);
      BlobBlockSizeEdit.Text:=IntToStr(BlobBlockSize);
      LastAutoIncValueEdit.Text:=IntToStr(LastAutoIncValue);
      TextIndexFieldsEdit.Text:=TextIndexFields;
      StopWordsMemo.Lines.Assign(TextIndexStopWords);
      CreateAsciiList(TextIndexSpaceChars,SpaceCharsListBox.Items);
      CreateAsciiList(TextIndexIncludeChars,IncludeCharsListBox.Items);
      MainForm.LoadStructure(BrowseTable,FieldsTable,IndexesTable,LastFieldUsed);
      TotalFieldsEdit.Text:=IntToStr(FieldsTable.RecordCount);
      TotalIndexesEdit.Text:=IntToStr(IndexesTable.RecordCount);
      FieldsGrid.RefreshCols;
      IndexesGrid.RefreshCols;
      end;
end;

procedure TBrowseForm.FieldsGridEditButtonClick(Sender: TObject);
begin
   with FieldDetailsDlg do
      begin
      FieldsSource.DataSet:=FieldsTable;
      SetupFields(True);
      ShowModal;
      FieldsSource.DataSet:=nil;
      end;
end;

procedure TBrowseForm.FieldsGridDblClick(Sender: TObject);
begin
   Keybd_Event(VK_F2,0,0,0);
   Keybd_Event(VK_F2,0,KEYEVENTF_KEYUP,0);
end;

procedure TBrowseForm.BrowseGridColEnter(Sender: TObject);
begin
   if (BrowseTable.State=dsEdit) then
      MainForm.UpdateMenuItems(nil);
end;

procedure TBrowseForm.BrowseGridCellClick(Column: TColumn);
begin
   { This is to get around focus issues with the DBGrid and the
     open databases combo box in the main tool bar }
   SelectFieldsButton.SetFocus;
   BrowseGrid.SetFocus;
end;

procedure TBrowseForm.CopyOnAppendCheckBoxClick(Sender: TObject);
begin
   BrowseTable.CopyOnAppend:=CopyOnAppendCheckBox.Checked;
end;

procedure TBrowseForm.FieldsGridCellClick(Column: TColumn);
begin
   { This is to get around focus issues with the DBGrid and the
     open databases combo box in the main tool bar }
   TotalFieldsEdit.SetFocus;
   FieldsGrid.SetFocus;
end;

procedure TBrowseForm.IndexesGridCellClick(Column: TColumn);
begin
   { This is to get around focus issues with the DBGrid and the
     open databases combo box in the main tool bar }
   TotalIndexesEdit.SetFocus;
   IndexesGrid.SetFocus;
end;

procedure TBrowseForm.FormActivate(Sender: TObject);
begin
   MainForm.SetupOpenDatabases;
end;

procedure TBrowseForm.FormResize(Sender: TObject);
begin
   FieldsGrid.RefreshCols;
   IndexesGrid.RefreshCols;
end;

end.
