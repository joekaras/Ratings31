unit struct;

interface

uses
   SysUtils, Classes,

   {$I dbisamvr.inc}
   Windows, Messages, Graphics, Forms, Controls, StdCtrls, Tabs,
   Buttons, ExtCtrls, Grids, DBISAMEn, Dialogs, ComCtrls, DBGrids, DB,

   {$IFDEF D6ORHIGHER}
   FMTBcd,
   {$ENDIF}

   dbisamtb, dbisamct, dbisamlb, dbisamcn;

type

  TStructureDlg = class(TForm)
    StructureNotebook: TPageControl;
    FieldsSheet: TTabSheet;
    IndexesSheet: TTabSheet;
    OKBtn: TButton;
    CancelBtn: TButton;
    Label3: TLabel;
    DescriptionEdit: TEdit;
    Label4: TLabel;
    TotalFieldsEdit: TEdit;
    Label5: TLabel;
    RecordSizeEdit: TEdit;
    Label1: TLabel;
    TotalIndexesEdit: TEdit;
    EncryptedCheckBox: TCheckBox;
    Label2: TLabel;
    PasswordEdit: TEdit;
    Label6: TLabel;
    BlobBlockSizeEdit: TEdit;
    LocaleComboBox: TComboBox;
    Label7: TLabel;
    Bevel1: TBevel;
    Label9: TLabel;
    UserMajorVersionEdit: TEdit;
    UserMinorVersionEdit: TEdit;
    FieldsTable: TDBISAMTable;
    FieldsGrid: TDBISAMDBGrid;
    FieldsSource: TDataSource;
    FieldsTableFieldName: TStringField;
    FieldsTableDataType: TStringField;
    FieldsTableSize: TWordField;
    FieldsTableRequired: TBooleanField;
    FieldsTableMinValue: TStringField;
    FieldsTableMaxValue: TStringField;
    FieldsTableDefaultValue: TStringField;
    FieldsTableDescription: TStringField;
    SourceTable: TDBISAMTable;
    IndexesTable: TDBISAMTable;
    IndexesTableIndexName: TStringField;
    IndexesTableCaseInsensitive: TBooleanField;
    IndexesTableUnique: TBooleanField;
    IndexesTableCompression: TStringField;
    IndexesTableIndexedFields: TStringField;
    IndexesSource: TDataSource;
    IndexesGrid: TDBISAMDBGrid;
    FieldsTableDetails: TStringField;
    IndexesTablePosition: TIntegerField;
    BorrowStructureBtn: TButton;
    FieldsTableCharCase: TSmallintField;
    Label11: TLabel;
    LastAutoIncValueEdit: TEdit;
    FieldsTableFieldNumber: TIntegerField;
    FieldsTablePosition: TIntegerField;
    MoveField: TUpDown;
    FullTextIndexSheet: TTabSheet;
    SelectTextIndexFieldsButton: TButton;
    StopWordsMemo: TMemo;
    TextIndexFieldsEdit: TEdit;
    Label12: TLabel;
    Bevel2: TBevel;
    Label13: TLabel;
    Label14: TLabel;
    SpaceCharsListBox: TListBox;
    Label15: TLabel;
    IncludeCharsListBox: TListBox;
    DefaultButton: TButton;
    IndexesTableDescendingFields: TStringField;
    FieldsTableCompression: TSmallintField;
    IndexesTablePrimary: TBooleanField;
    Label8: TLabel;
    IndexPageSizeEdit: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure StructureNotebookChanging(Sender: TObject; var AllowChange: Boolean);
    procedure PrimaryIndexDescendCheckBoxClick(Sender: TObject);
    procedure PrimaryIndexCaseCheckBoxClick(Sender: TObject);
    procedure DescriptionEditChange(Sender: TObject);
    procedure EncryptedCheckBoxClick(Sender: TObject);
    procedure PasswordEditChange(Sender: TObject);
    procedure BlobBlockSizeEditKeyPress(Sender: TObject; var Key: Char);
    procedure BlobBlockSizeEditChange(Sender: TObject);
    procedure LocaleComboBoxChange(Sender: TObject);
    procedure UserMajorVersionEditKeyPress(Sender: TObject; var Key: Char);
    procedure PrimaryIndexCompressComboBoxChange(Sender: TObject);
    procedure FieldsTableNewRecord(DataSet: TDataSet);
    procedure FieldsTableBeforePost(DataSet: TDataSet);
    procedure FieldsTablePostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure FieldsTableAfterDelete(DataSet: TDataSet);
    procedure FieldsTableBeforeDelete(DataSet: TDataSet);
    procedure IndexesTablePostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure IndexesTableBeforeDelete(DataSet: TDataSet);
    procedure IndexesTableAfterDelete(DataSet: TDataSet);
    procedure IndexesTableNewRecord(DataSet: TDataSet);
    procedure IndexesTableBeforePost(DataSet: TDataSet);
    procedure SourceTableDataLost(Sender: TObject; Cause: TDataLossCause;
      const ContextInfo: String; var Continue,
      StopAsking: Boolean);
    procedure IndexesGridEditButtonClick(Sender: TObject);
    procedure FieldsGridEditButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FieldsGridDblClick(Sender: TObject);
    procedure BorrowStructureBtnClick(Sender: TObject);
    procedure LastAutoIncValueEditChange(Sender: TObject);
    procedure LastAutoIncValueEditKeyPress(Sender: TObject; var Key: Char);
    procedure MoveFieldChangingEx(Sender: TObject;
      var AllowChange: Boolean; NewValue: Smallint;
      Direction: TUpDownDirection);
    procedure FieldsTableAfterPost(DataSet: TDataSet);
    procedure FieldsTableBeforeEdit(DataSet: TDataSet);
    procedure IndexesTableBeforeEdit(DataSet: TDataSet);
    procedure FieldsTableBeforeInsert(DataSet: TDataSet);
    procedure IndexesTableBeforeInsert(DataSet: TDataSet);
    procedure FieldsGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FieldsGridKeyPress(Sender: TObject; var Key: Char);
    procedure FieldsTableDataTypeChange(Sender: TField);
    procedure IndexesGridKeyPress(Sender: TObject; var Key: Char);
    procedure IndexesGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SelectTextIndexFieldsButtonClick(Sender: TObject);
    procedure SpaceCharsListBoxClick(Sender: TObject);
    procedure IncludeCharsListBoxClick(Sender: TObject);
    procedure StopWordsMemoChange(Sender: TObject);
    procedure DefaultButtonClick(Sender: TObject);
    procedure IndexesTableAfterScroll(DataSet: TDataSet);
    procedure FieldsTableAfterScroll(DataSet: TDataSet);
    procedure SourceTableAlterProgress(Sender: TObject; PercentDone: Word);
  private
    LastFieldUsed: Word;
    IncLastFieldUsed: Boolean;
    StructureModified: Boolean;
    InitialPassword: string;
    LastPassword: string;
    CloseDialog: Boolean;
    WasErrors: Boolean;
    IsLoading: Boolean;
    IsDeletingField: Boolean;
    IsResettingPositions: Boolean;
    IsInserting: Boolean;
    IsInsertingField: Boolean;
    InsertPos: Integer;
    HasAutoModifiedIndexes: Boolean;
    HasAutoModifiedFullTextIndex: Boolean;
    function VerifyStructure: Boolean;
    procedure UpdateFieldTotals;
    procedure UpdateIndexTotals;
    procedure ResetFieldPositions;
    procedure BumpFieldPositions(NewPos: Integer);
    procedure ResetStructureModified;
    procedure SetStructureModified;
    procedure AssignTableInfo;
    procedure HandlePickListKey(FieldToHandle: TField;
                                PickList: TStrings;
                                var KeyToHandle: Char);
    function ReplaceFieldInIndexFields(const OldFieldName: string;
                                       const NewFieldName: string;
                                       var IndexedFields: string): Boolean;
  public
    IsAdding: Boolean;
    SetupIsRemote: Boolean;
    SetupDatabaseName: string;
    SetupTableName: string;
    procedure SetupNewStructure(IsRemote: Boolean);
    procedure SetupExistingStructure(IsRemote: Boolean; CurDatabaseName: string;
                                     CurTableName: string);
  end;

var
  StructureDlg: TStructureDlg;

implementation

uses main, flddtls, keyflds, opentbl, savetbl, dbisamut;

{$R *.DFM}

procedure TStructureDlg.FormShow(Sender: TObject);
begin
   if IsAdding then
      begin
      Caption:='New Table';
      OKBtn.Caption:='C&reate';
      BorrowStructureBtn.Visible:=True;
      end
   else
      begin
      if SetupIsRemote then
         Caption:='Alter Table - '+SetupTableName+
                  ' ('+AddBS(REMOTE_DRIVE)+AddBS(SetupDatabaseName)+SetupTableName+')'
      else
         Caption:='Alter Table - '+SetupTableName+
                  ' ('+AddBS(SetupDatabaseName)+SetupTableName+')';
      OKBtn.Caption:='&Alter';
      BorrowStructureBtn.Visible:=False;
      end;
   StructureNotebook.ActivePage:=FieldsSheet;
   ActiveControl:=FieldsGrid;
   FieldsGrid.SelectedField:=FieldsTableFieldName;
   FieldsGrid.RefreshCols;
   IndexesGrid.RefreshCols;
   MoveField.Max:=MAX_NUM_FIELDS;
end;

procedure TStructureDlg.AssignTableInfo;
begin
   with SourceTable do
      begin
      if SetupIsRemote then
         SourceTable.SessionName:='Remote'
      else
         SourceTable.SessionName:='';
      DatabaseName:=SetupDatabaseName;
      TableName:=SetupTableName;
      end;
end;

procedure TStructureDlg.SetupNewStructure(IsRemote: Boolean);
var
   TempStopWords: TStrings;
   TempSpaceChars: string;
   TempIncludeChars: string;
begin
   TempStopWords:=TStringList.Create;
   try
      IsAdding:=True;
      SetupIsRemote:=IsRemote;
      SetupDatabaseName:='';
      SetupTableName:='';
      LastFieldUsed:=1;
      LocaleComboBox.ItemIndex:=0;
      UserMajorVersionEdit.Text:='1';
      UserMinorVersionEdit.Text:='0';
      DescriptionEdit.Text:='';
      EncryptedCheckBox.Checked:=False;
      PasswordEdit.Text:='';
      EncryptedCheckBoxClick(Self);
      IndexPageSizeEdit.Text:=IntToStr(DEFAULT_PAGE_SIZE);
      BlobBlockSizeEdit.Text:=IntToStr(DEFAULT_BLOCK_SIZE);
      LastAutoIncValueEdit.Text:='0';
      TextIndexFieldsEdit.Text:='';
      Engine.GetDefaultTextIndexParams(TempStopWords,TempSpaceChars,TempIncludeChars);
      StopWordsMemo.Lines.Assign(TempStopWords);
      SetupCharacterValues(SpaceCharsListBox,TempSpaceChars);
      SetupCharacterValues(IncludeCharsListBox,TempIncludeChars);
      FieldsTable.EmptyTable;
      IndexesTable.EmptyTable;
      UpdateFieldTotals;
      UpdateIndexTotals;
      FieldsGrid.RefreshCols;
      IndexesGrid.RefreshCols;
      ResetStructureModified;
   finally
      TempStopWords.Free;
   end;
end;

procedure TStructureDlg.SetupExistingStructure(IsRemote: Boolean;
                                              CurDatabaseName: string;
                                              CurTableName: string);
begin
   IsAdding:=False;
   SetupIsRemote:=IsRemote;
   SetupDatabaseName:=CurDatabaseName;
   SetupTableName:=CurTableName;
   AssignTableInfo;
   IsLoading:=True;
   try
      with SourceTable do
         begin
         Exclusive:=False;
         Open;
         try
            UserMajorVersionEdit.Text:=IntToStr(UserMajorVersion);
            UserMinorVersionEdit.Text:=IntToStr(UserMinorVersion);
            DescriptionEdit.Text:=Description;
            EncryptedCheckBox.Checked:=Encrypted;
            PasswordEdit.Text:=Password;
            InitialPassword:=Password;
            EncryptedCheckBoxClick(Self);
            LocaleComboBox.ItemIndex:=LocaleComboBox.Items.IndexOf(Engine.ConvertIDToLocaleConstant(LocaleID));
            IndexPageSizeEdit.Text:=IntToStr(IndexPageSize);
            BlobBlockSizeEdit.Text:=IntToStr(BlobBlockSize);
            LastAutoIncValueEdit.Text:=IntToStr(LastAutoIncValue);
            TextIndexFieldsEdit.Text:=TextIndexFields;
            StopWordsMemo.Lines.Assign(TextIndexStopWords);
            SetupCharacterValues(SpaceCharsListBox,TextIndexSpaceChars);
            SetupCharacterValues(IncludeCharsListBox,TextIndexIncludeChars);
            MainForm.LoadStructure(SourceTable,FieldsTable,IndexesTable,LastFieldUsed);
         finally
            Close;
         end;
         end;
      UpdateFieldTotals;
      UpdateIndexTotals;
      FieldsGrid.RefreshCols;
      IndexesGrid.RefreshCols;
      ResetStructureModified;
   finally
      IsLoading:=False;
   end;
end;

procedure TStructureDlg.ResetStructureModified;
begin
   StructureModified:=False;
   OKBtn.Enabled:=False;
end;

procedure TStructureDlg.SetStructureModified;
begin
   StructureModified:=True;
   OKBtn.Enabled:=True;
end;

procedure TStructureDlg.UpdateFieldTotals;
var
   FieldBookmark: TBookmark;
   TotalRecordSize: Word;
   TempFieldSize: Word;
begin
   with FieldsTable do
      begin
      DisableControls;
      FieldBookmark:=GetBookmark;
      try
         TotalFieldsEdit.Text:=IntToStr(RecordCount);
         TotalFieldsEdit.Update;
         TotalRecordSize:=0;
         if (RecordCount <> 0) then
            begin
            TotalRecordSize:=SizeOf(TRecordHeader);
            First;
            while (not EOF) do
               begin
               TempFieldSize:=FieldsTableSize.AsInteger;
               case DisplayStringToDataType(FieldsTableDataType.AsString) of
                  ftString,ftFixedChar: Inc(TempFieldSize);
                  ftDate,ftTime,ftInteger,ftAutoInc: TempFieldSize:=4;
                  ftBoolean,ftSmallInt,ftWord: TempFieldSize:=2;
                  ftLargeInt,ftFloat,ftDateTime,ftCurrency,ftBlob,ftMemo,ftGraphic: TempFieldSize:=8;
                  ftBCD:
                     TempFieldSize:=SizeOf(TBCD);
                  end;
               Inc(TotalRecordSize,FLDCHG_DATA+TempFieldSize);
               Next;
               end
            end;
         TotalRecordSize:=BlockOffset(TotalRecordSize,CRYPTO_BLOCK_SIZE);
         RecordSizeEdit.Text:=IntToStr(TotalRecordSize);
         RecordSizeEdit.Update;
      finally
         GotoBookmark(FieldBookmark);
         FreeBookmark(FieldBookmark);
         EnableControls;
      end;
      end;
end;

procedure TStructureDlg.UpdateIndexTotals;
begin
   with IndexesTable do
      begin
      TotalIndexesEdit.Text:=IntToStr(RecordCount);
      TotalIndexesEdit.Update;
      end;
end;

procedure TStructureDlg.ResetFieldPositions;
var
   OldRecNo: Integer;
begin
   IsResettingPositions:=True;
   try
      with FieldsTable do
         begin
         OldRecNo:=RecNo;
         DisableControls;
         try
            RecNo:=OldRecNo;
            while (not EOF) do
               begin
               if (FieldsTablePosition.AsInteger <> RecNo) then
                  begin
                  Edit;
                  FieldsTablePosition.AsInteger:=RecNo;
                  Post;
                  end;
               Next;
               end;
         finally
            RecNo:=OldRecNo;
            EnableControls;
         end;
         end;
   finally
      IsResettingPositions:=False;
   end;
end;

procedure TStructureDlg.BumpFieldPositions(NewPos: Integer);
begin
   IsResettingPositions:=True;
   try
      with FieldsTable do
         begin
         DisableControls;
         try
            Last;
            while (not BOF) and (FieldsTablePosition.AsInteger >= NewPos) do
               begin
               Edit;
               FieldsTablePosition.AsInteger:=FieldsTablePosition.AsInteger+1;
               Post;
               Prior;
               end;
            First;
            Edit;
            FieldsTablePosition.AsInteger:=NewPos;
            Post;
         finally
            EnableControls;
         end;
         end;
   finally
      IsResettingPositions:=False;
   end;
end;

function TStructureDlg.VerifyStructure: Boolean;
var
   IndexBookmark: TBookmark;
   I: Integer;
   BadIndexesList: TStrings;
   BadIndexMessage: string;
begin
   Result:=True;
   try
      if (StrToInt(UserMajorVersionEdit.Text) < Low(Word)) or
         (StrToInt(UserMajorVersionEdit.Text) > High(Word)) then
         begin
         Result:=False;
         MessageDlg('The user-defined major version # must be between '+IntToStr(Low(Word))+
                    ' and '+IntToStr(High(Word)),mtError,[mbOk],0);
         Exit;
         end;
   except
      Result:=False;
      MessageDlg('The user-defined major version # must be between '+IntToStr(Low(Word))+
                 ' and '+IntToStr(High(Word)),mtError,[mbOk],0);
      Exit;
   end;
   try
      if (StrToInt(UserMinorVersionEdit.Text) < Low(Word)) or
         (StrToInt(UserMinorVersionEdit.Text) > High(Word)) then
         begin
         Result:=False;
         MessageDlg('The user-defined minor version # must be between '+IntToStr(Low(Word))+
                    ' and '+IntToStr(High(Word)),mtError,[mbOk],0);
         Exit;
         end;
   except
      Result:=False;
      MessageDlg('The user-defined minor version # must be between '+IntToStr(Low(Word))+
                 ' and '+IntToStr(High(Word)),mtError,[mbOk],0);
      Exit;
   end;
   if EncryptedCheckBox.Checked then
      begin
      if ((Trim(PasswordEdit.Text)='') or
          (Length(Trim(PasswordEdit.Text)) > MAX_PASSWORD_LENGTH)) then
         begin
         Result:=False;
         MessageDlg('The password provided is either blank or greater than '+
                    IntToStr(MAX_PASSWORD_LENGTH)+' characters in length',mtError,[mbOk],0);
         Exit;
         end;
      if (PasswordEdit.Text <> InitialPassword) then
         begin
         if (LastPassword='') then
            begin
            LastPassword:=PasswordEdit.Text;
            PasswordEdit.Text:='';
            if IsAdding then
               MessageDlg('Please re-enter the password for encryption and click on the '+
                          'Create button to continue',mtInformation,[mbOk],0)
            else
               MessageDlg('Please re-enter the password for encryption and click on the '+
                          'Alter button to continue',mtInformation,[mbOk],0);
            ActiveControl:=PasswordEdit;
            Result:=False;
            Exit;
            end
         else if (PasswordEdit.Text <> LastPassword) then
            begin
            LastPassword:='';
            PasswordEdit.Text:='';
            MessageDlg('The re-entered password does not match the original password '+
                       'entered',mtError,[mbOk],0);
            ActiveControl:=PasswordEdit;
            Result:=False;
            Exit;
            end
         else
            LastPassword:='';
         end;
      end;
   if (Engine.ConvertLocaleConstantToID(LocaleComboBox.Text) <> LOCALE_ANSI_STD) then
      begin
      if (not Engine.IsValidLocaleConstant(LocaleComboBox.Text)) then
         begin
         Result:=False;
         MessageDlg('The selected locale is not available or installed',mtError,[mbOk],0);
         Exit;
         end;
      end;
   try
      if (StrToInt(IndexPageSizeEdit.Text) < MIN_PAGE_SIZE) or
         (StrToInt(IndexPageSizeEdit.Text) > MAX_PAGE_SIZE) then
         begin
         Result:=False;
         MessageDlg('The index page size must be between '+IntToStr(MIN_PAGE_SIZE)+
                    ' and '+IntToStr(MAX_PAGE_SIZE),mtError,[mbOk],0);
         Exit;
         end;
   except
      Result:=False;
      MessageDlg('The index page size must be between '+IntToStr(MIN_PAGE_SIZE)+
                 ' and '+IntToStr(MAX_PAGE_SIZE),mtError,[mbOk],0);
      Exit;
   end;
   try
      if (StrToInt(BlobBlockSizeEdit.Text) < MIN_BLOCK_SIZE) or
         (StrToInt(BlobBlockSizeEdit.Text) > MAX_BLOCK_SIZE) then
         begin
         Result:=False;
         MessageDlg('The BLOB block size must be between '+IntToStr(MIN_BLOCK_SIZE)+
                    ' and '+IntToStr(MAX_BLOCK_SIZE),mtError,[mbOk],0);
         Exit;
         end;
   except
      Result:=False;
      MessageDlg('The BLOB block size must be between '+IntToStr(MIN_BLOCK_SIZE)+
                 ' and '+IntToStr(MAX_BLOCK_SIZE),mtError,[mbOk],0);
      Exit;
   end;
   try
      if (StrToInt(LastAutoIncValueEdit.Text) < 0) then
         begin
         Result:=False;
         MessageDlg('The next auto-increment value must be between 0 and '+
                    IntToStr(High(Integer)),mtError,[mbOk],0);
         Exit;
         end;
   except
      Result:=False;
      MessageDlg('The next auto-increment value must be between 0 and '+
                 IntToStr(High(Integer)),mtError,[mbOk],0);
      Exit;
   end;
   if (FieldsTable.RecordCount=0) then
      begin
      StructureNotebook.ActivePage:=FieldsSheet;
      FieldsGrid.SetFocus;
      MessageDlg('You must define at least one field in the structure',mtError,[mbOk],0);
      Result:=False;
      Exit;
      end;
   BadIndexesList:=TStringList.Create;
   try
      with IndexesTable do
         begin
         DisableControls;
         IndexBookmark:=GetBookmark;
         try
            First;
            while (not EOF) do
               begin
               if IndexesTableIndexedFields.IsNull then
                  BadIndexesList.Add(IndexesTableIndexName.AsString);
               Next;
               end;
         finally
            GotoBookmark(IndexBookmark);
            FreeBookmark(IndexBookmark);
            EnableControls;
         end;
         end;
      if (BadIndexesList.Count > 0) then
         begin
         BadIndexMessage:='You must define at least one field as part '+
                          'of the index(es) ';
         for I:=0 to BadIndexesList.Count-1 do
            begin
            if (I=0) then
               BadIndexMessage:=BadIndexMessage+BadIndexesList[I]
            else
               BadIndexMessage:=BadIndexMessage+', '+BadIndexesList[I];
            end;
         StructureNotebook.ActivePage:=IndexesSheet;
         IndexesGrid.SetFocus;
         MessageDlg(BadIndexMessage,mtError,[mbOk],0);
         Result:=False;
         Exit;
         end;
   finally
      BadIndexesList.Free;
   end;
end;

procedure TStructureDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
   Response: Integer;
begin
   CanClose:=True;
   if (not Self.Visible) then
      Exit;
   try
      FieldsTable.CheckBrowseMode;
      IndexesTable.CheckBrowseMode;
   except
      CanClose:=False;
      Exit;
   end;
   if HasAutoModifiedIndexes then
      begin
      HasAutoModifiedIndexes:=False;
      if (MessageDlg('The indexes were automatically modified due to field '+
                     'modifications.  Would you like to review these modifications '+
                     'before you save the new table structure ?',
                     mtConfirmation,[mbYes,mbNo],0)=mrYes) then
         begin
         StructureNotebook.ActivePage:=IndexesSheet;
         IndexesGrid.SetFocus;
         CanClose:=False;
         Exit;
         end;
      end;
   if HasAutoModifiedFullTextIndex then
      begin
      HasAutoModifiedFullTextIndex:=False;
      if (MessageDlg('The full text index wsa automatically modified due to field '+
                     'modifications.  Would you like to review these modifications '+
                     'before you save the new table structure ?',
                     mtConfirmation,[mbYes,mbNo],0)=mrYes) then
         begin
         StructureNotebook.ActivePage:=FullTextIndexSheet;
         TextIndexFieldsEdit.SetFocus;
         CanClose:=False;
         Exit;
         end;
      end;
   if IsAdding then
      begin
      if StructureModified then
         begin
         if (ModalResult <> mrOk) then
            begin
            Response:=MessageDlg('Would you like to save the new table structure ?',
                                 mtConfirmation,mbYesNoCancel,0);
            if (Response=mrNo) then
               Exit
            else if (Response=mrCancel) then
               begin
               CanClose:=False;
               Exit;
               end;
            end;
         if (not VerifyStructure) then
            begin
            CanClose:=False;
            Exit;
            end;
         with SaveTableDlg do
            begin
            Caption:='Create new table as';
            SaveButton.Caption:='&Create';
            SaveAsGroupBox.Caption:='Create As';
            SaveAsEdit.Text:='new';
            Initialize;
            if (ShowModal=mrOk) then
               begin
               SetupIsRemote:=RemoteRadioButton.Checked;
               SetupDatabaseName:=AvailableDatabasesCombobox.Text;
               SetupTableName:=SaveAsEdit.Text;
               AssignTableInfo;
               with SourceTable do
                  begin
                  Exclusive:=True;
                  MainForm.SaveStructure(SourceTable,FieldsTable,IndexesTable,True);
                  if Exists then
                     DeleteTable;
                  CreateTable(Engine.ConvertLocaleConstantToID(LocaleComboBox.Text),
                              StrToInt(UserMajorVersionEdit.Text),
                              StrToInt(UserMinorVersionEdit.Text),
                              EncryptedCheckBox.Checked,
                              PasswordEdit.Text,Self.DescriptionEdit.Text,
                              StrToInt(IndexPageSizeEdit.Text),
                              StrToInt(BlobBlockSizeEdit.Text),
                              StrToInt(LastAutoIncValueEdit.Text),
                              TextIndexFieldsEdit.Text,StopWordsMemo.Lines,
                              SelectedCharacterValues(SpaceCharsListBox),
                              SelectedCharacterValues(IncludeCharsListBox));
                  if SetupIsRemote then
                     MessageDlg('The table '+AddBS(REMOTE_DRIVE)+AddBS(DatabaseName)+TableName+
                                 ' was successfully created',mtInformation,[mbOk],0)
                  else
                     MessageDlg('The table '+AddBS(DatabaseName)+TableName+
                                 ' was successfully created',mtInformation,[mbOk],0);
                  end;
               end
            else
               begin
               CanClose:=False;
               Exit;
               end;
            end;
         end;
      end
   else
      begin
      if StructureModified then
         begin
         if (ModalResult <> mrOk) then
            begin
            Response:=MessageDlg('The table structure has been changed, would '+
                                   'you like to save the changes ?',mtConfirmation,mbYesNoCancel,0);
            if (Response=mrNo) then
               Exit
            else if (Response=mrCancel) then
               begin
               CanClose:=False;
               Exit;
               end;
            end;
         if (not VerifyStructure) then
            begin
            CanClose:=False;
            Exit;
            end;
         Self.Hide;
         CloseDialog:=True;
         WasErrors:=False;
         try
            Screen.Cursor:=crHourGlass;
            Application.ProcessMessages;
            MainForm.Enabled:=False;
            MainForm.ProgressGauge.Progress:=0;
            MainForm.ProgressGauge.Visible:=True;
            Application.ProcessMessages;
            try
               try
                  with SourceTable do
                     begin
                     Exclusive:=True;
                     MainForm.SaveStructure(SourceTable,FieldsTable,IndexesTable,False);
                     AlterTable(Engine.ConvertLocaleConstantToID(LocaleComboBox.Text),
                                StrToInt(UserMajorVersionEdit.Text),
                                StrToInt(UserMinorVersionEdit.Text),
                                EncryptedCheckBox.Checked,
                                PasswordEdit.Text,DescriptionEdit.Text,
                                StrToInt(IndexPageSizeEdit.Text),
                                StrToInt(BlobBlockSizeEdit.Text),
                                StrToInt(LastAutoIncValueEdit.Text),
                                TextIndexFieldsEdit.Text,StopWordsMemo.Lines,
                                SelectedCharacterValues(SpaceCharsListBox),
                                SelectedCharacterValues(IncludeCharsListBox),
                                False);
                     end;
               except
                  CloseDialog:=False;
                  WasErrors:=False;
                  raise;
               end;
            finally
               MainForm.ProgressGauge.Visible:=False;
               MainForm.StatusPanel.Caption:='';
               MainForm.Enabled:=True;
               Screen.Cursor:=crDefault;
            end;
         finally
            CanClose:=CloseDialog;
            if not CanClose then
               Self.Show
            else
               begin
               if not WasErrors then
                  begin
                  if (SourceTable.SessionName='Remote') then
                     MessageDlg('The table '+AddBS(REMOTE_DRIVE)+
                                 AddBS(SourceTable.DatabaseName)+SourceTable.TableName+
                                ' was successfully altered',mtInformation,[mbOk],0)
                  else
                     MessageDlg('The table '+AddBS(SourceTable.DatabaseName)+
                                SourceTable.TableName+
                                ' was successfully altered',mtInformation,[mbOk],0);
                  end;
               end;
         end;
         end;
      end;
end;

procedure TStructureDlg.StructureNotebookChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   AllowChange:=True;
   if (StructureNotebook.ActivePage=FieldsSheet) then
      begin
      try
         FieldsTable.CheckBrowseMode;
      except
         AllowChange:=False;
      end;
      end
   else if (StructureNotebook.ActivePage=IndexesSheet) then
      begin
      try
         IndexesTable.CheckBrowseMode;
      except
         AllowChange:=False;
      end;
      end
end;

procedure TStructureDlg.PrimaryIndexDescendCheckBoxClick(Sender: TObject);
begin
   SetStructureModified;
end;

procedure TStructureDlg.PrimaryIndexCaseCheckBoxClick(Sender: TObject);
begin
   SetStructureModified;
end;

procedure TStructureDlg.DescriptionEditChange(Sender: TObject);
begin
   SetStructureModified;
end;

procedure TStructureDlg.EncryptedCheckBoxClick(Sender: TObject);
begin
   SetStructureModified;
   if EncryptedCheckBox.Checked then
      begin
      PasswordEdit.ReadOnly:=False;
      PasswordEdit.Color:=clWindow;
      PasswordEdit.TabStop:=True;
      end
   else
      begin
      PasswordEdit.Text:='';
      PasswordEdit.ReadOnly:=True;
      PasswordEdit.Color:=clBtnFace;
      PasswordEdit.TabStop:=False;
      end;
end;

procedure TStructureDlg.PasswordEditChange(Sender: TObject);
begin
   SetStructureModified;
end;

procedure TStructureDlg.BlobBlockSizeEditKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (Key in ['0'..'9',#8,#13]) then
      Key:=#0;
end;

procedure TStructureDlg.BlobBlockSizeEditChange(Sender: TObject);
begin
   SetStructureModified;
end;

procedure TStructureDlg.LocaleComboBoxChange(Sender: TObject);
begin
   SetStructureModified;
end;

procedure TStructureDlg.UserMajorVersionEditKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (Key in ['0'..'9',#8,#13]) then
      Key:=#0;
end;

procedure TStructureDlg.PrimaryIndexCompressComboBoxChange(Sender: TObject);
begin
   SetStructureModified;
end;

procedure TStructureDlg.FieldsTableNewRecord(DataSet: TDataSet);
begin
   with FieldsTable do
      begin
      FieldsTablePosition.AsInteger:=0;
      FieldsTableDataType.AsString:=DataTypesList[0];
      FieldsTableSize.AsInteger:=10;
      FieldsTableRequired.AsBoolean:=False;
      FieldsTableDetails.AsString:='No';
      FieldsTableCharCase.AsInteger:=NO_CHANGE;
      FieldsTableCompression.AsInteger:=NO_COMPRESSION;
      FieldsTableFieldNumber.AsInteger:=LastFieldUsed;
      end;
end;

function TStructureDlg.ReplaceFieldInIndexFields(const OldFieldName: string;
                                                 const NewFieldName: string;
                                                 var IndexedFields: string): Boolean;
var
   I: Integer;
   FieldPos: Integer;
begin
   Result:=False;
   if (AnsiCompareText(OldFieldName,IndexedFields)=0) then
      begin
      Result:=True;
      IndexedFields:=NewFieldName;
      end
   else
      begin
      I:=1;
      while I <= Length(IndexedFields) do
         begin
         if (AnsiCompareText(OldFieldName,ExtractFieldName(IndexedFields,I))=0) then
            begin
            Result:=True;
            FieldPos:=AnsiPos(AnsiUpperCase(OldFieldName)+';',AnsiUpperCase(IndexedFields));
            if (FieldPos > 0) then
               begin
               if (NewFieldName <> '') then
                  IndexedFields:=Copy(IndexedFields,1,FieldPos-1)+NewFieldName+';'+
                          Copy(IndexedFields,FieldPos+Length(AnsiUpperCase(OldFieldName)+';'),Length(IndexedFields))
               else
                  IndexedFields:=Copy(IndexedFields,1,FieldPos-1)+
                          Copy(IndexedFields,FieldPos+Length(AnsiUpperCase(OldFieldName)+';'),Length(IndexedFields));
               end
            else
               begin
               FieldPos:=AnsiPos(AnsiUpperCase(';'+OldFieldName),AnsiUpperCase(IndexedFields));
               if (FieldPos > 0) then
                  begin
                  if (NewFieldName <> '') then
                     IndexedFields:=Copy(IndexedFields,1,FieldPos-1)+';'+NewFieldName+
                             Copy(IndexedFields,FieldPos+Length(';'+AnsiUpperCase(OldFieldName)),Length(IndexedFields))
                  else
                     IndexedFields:=Copy(IndexedFields,1,FieldPos-1)+
                             Copy(IndexedFields,FieldPos+Length(';'+AnsiUpperCase(OldFieldName)),Length(IndexedFields));
                  end;
               end;
            { Reset back to the beginning }
            I:=1;
            end;
         end;
      end;
end;

procedure TStructureDlg.FieldsTableBeforePost(DataSet: TDataSet);
var
   IndexBookmark: TBookmark;
   TempIndexedFields: string;
begin
   if IsLoading or IsResettingPositions then
      Exit;
   if (FieldsTableFieldName.IsNull) then
      begin
      MessageDlg('The field name must be specified',mtError,[mbOk],0);
      Abort;
      end;
   if (FieldsTableDataType.IsNull) then
      begin
      MessageDlg('The data type must be specified',mtError,[mbOk],0);
      Abort;
      end;
   if (DataTypesList.IndexOf(FieldsTableDataType.AsString)=-1) then
      begin
      MessageDlg('The data type specified is invalid',mtError,[mbOk],0);
      Abort;
      end;
   if (FieldsTableSize.IsNull) then
      begin
      if ((FieldsTableDataType.AsString='String') or
          (FieldsTableDataType.AsString='FixedChar') or
          (FieldsTableDataType.AsString='GUID') or
          (FieldsTableDataType.AsString='Bytes') or
          (FieldsTableDataType.AsString='BCD')) then
         begin
         MessageDlg('The size must be specified for this data type',mtError,[mbOk],0);
         Abort;
         end;
      end
   else
      begin
      if ((FieldsTableDataType.AsString='BCD') and
          (FieldsTableSize.AsInteger > 4)) then
         begin
         MessageDlg('The size (decimals) for BCD '+
                    'fields must be less than or equal to 4',mtError,[mbOk],0);
         Abort;
         end
      else if ((FieldsTableDataType.AsString='String') or
               (FieldsTableDataType.AsString='FixedChar') or
               (FieldsTableDataType.AsString='Bytes')) and
                (FieldsTableSize.AsInteger > MAX_FIELD_SIZE) then
         begin
         MessageDlg('The size for String or Bytes '+
                    'fields must be less than or equal to '+
                    IntToStr(MAX_FIELD_SIZE),mtError,[mbOk],0);
         Abort;
         end
      else if (FieldsTableDataType.AsString='GUID') and
               (FieldsTableSize.AsInteger <> TYPE_GUID_LENGTH) then
         begin
         MessageDlg('The size for GUID '+
                    'fields must be equal to '+
                    IntToStr(TYPE_GUID_LENGTH),mtError,[mbOk],0);
         Abort;
         end
      else if ((FieldsTableDataType.AsString <> 'String') and
               (FieldsTableDataType.AsString <> 'FixedChar') and
               (FieldsTableDataType.AsString <> 'GUID') and
               (FieldsTableDataType.AsString <> 'Bytes') and
               (FieldsTableDataType.AsString <> 'BCD')) then
         FieldsTableSize.AsInteger:=0;
      end;
   if (not IsAlpha(FieldsTableFieldName.AsString[1])) then
      begin
      MessageDlg('The field name must begin with an alpha character',mtError,[mbOk],0);
      Abort;
      end;
   if (AnsiCompareText(FieldsTableFieldName.AsString,RECORDID_FIELD_NAME)=0) or
      (AnsiCompareText(FieldsTableFieldName.AsString,RECORDHASH_FIELD_NAME)=0) then
      begin
      MessageDlg('The field name '+FieldsTableFieldName.AsString+' is a reserved field name',mtError,[mbOk],0);
      Abort;
      end;
   if (FieldsTable.State=dsInsert) then
      begin
      IncLastFieldUsed:=True;
      if (not IsInsertingField) then
         FieldsTablePosition.AsInteger:=FieldsTable.RecordCount+1;
      FieldsTableFieldNumber.AsInteger:=LastFieldUsed;
      end
   else
      begin
      IncLastFieldUsed:=False;
      { If the field name changed, then check to see if we need to modify
        any indexes also }
      if (AnsiCompareText(FieldsTableFieldName.AsString,FieldsTableFieldName.OldValue) <> 0) then
         begin
         with IndexesTable do
            begin
            DisableControls;
            IndexBookmark:=GetBookmark;
            try
               First;
               while (not EOF) do
                  begin
                  TempIndexedFields:=IndexesTableIndexedFields.AsString;
                  if ReplaceFieldInIndexFields(FieldsTableFieldName.OldValue,
                                               FieldsTableFieldName.AsString,
                                               TempIndexedFields) then
                     begin
                     HasAutoModifiedIndexes:=True;
                     Edit;
                     IndexesTableIndexedFields.AsString:=TempIndexedFields;
                     Post;
                     end;
                  TempIndexedFields:=IndexesTableDescendingFields.AsString;
                  if ReplaceFieldInIndexFields(FieldsTableFieldName.OldValue,
                                               FieldsTableFieldName.AsString,
                                               TempIndexedFields) then
                     begin
                     HasAutoModifiedIndexes:=True;
                     Edit;
                     IndexesTableDescendingFields.AsString:=TempIndexedFields;
                     Post;
                     end;
                  Next;
                  end;
            finally
               if (RecordCount <> 0) then
                  GotoBookmark(IndexBookmark);
               FreeBookmark(IndexBookmark);
               EnableControls;
            end;
            end;
         TempIndexedFields:=TextIndexFieldsEdit.Text;
         if ReplaceFieldInIndexFields(FieldsTableFieldName.OldValue,
                                      FieldsTableFieldName.AsString,
                                      TempIndexedFields) then
            begin
            HasAutoModifiedFullTextIndex:=True;
            TextIndexFieldsEdit.Text:=TempIndexedFields;
            end;
         end;
      end;
   if (FieldsTableDataType.AsString='BLOB') or
      (FieldsTableDataType.AsString='Graphic') or
      (FieldsTableDataType.AsString='Memo') or
      (FieldsTableDataType.AsString='Bytes') then
      begin
      FieldsTableDefaultValue.Clear;
      FieldsTableMinValue.Clear;
      FieldsTableMaxValue.Clear;
      end;
   if (FieldsTableMinValue.IsNull and FieldsTableMaxValue.IsNull and
       FieldsTableDefaultValue.IsNull and FieldsTableDescription.IsNull and
      (FieldsTableCharCase.AsInteger=NO_CHANGE) and
      (FieldsTableCompression.AsInteger=NO_COMPRESSION)) then
      FieldsTableDetails.AsString:='No'
   else
      FieldsTableDetails.AsString:='Yes';
end;

procedure TStructureDlg.FieldsTablePostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
   Action:=daAbort;
   if (E is EDBISAMEngineError) then
      begin
      if (EDBISAMEngineError(E).ErrorCode=DBISAM_KEYVIOL) then
         MessageDlg('This field name already exists',mtError,[mbOk],0)
      else
         MessageDlg(E.Message,mtError,[mbOK],0);
       end
   else
      MessageDlg(E.Message,mtError,[mbOK],0);
end;

procedure TStructureDlg.FieldsTableAfterDelete(DataSet: TDataSet);
begin
   ResetFieldPositions;
   SetStructureModified;
   UpdateFieldTotals;
   FieldsGrid.RefreshCols;
end;

procedure TStructureDlg.FieldsTableBeforeDelete(DataSet: TDataSet);
var
   IndexBookmark: TBookmark;
   TempIndexedFields: string;
begin
   IsDeletingField:=True;
   try
      with IndexesTable do
         begin
         DisableControls;
         IndexBookmark:=GetBookmark;
         try
            First;
            while (not EOF) do
               begin
               if (not IndexesTableIndexedFields.IsNull) then
                  begin
                  TempIndexedFields:=IndexesTableIndexedFields.AsString;
                  TempIndexedFields:=IndexesTableIndexedFields.AsString;
                  if ReplaceFieldInIndexFields(FieldsTableFieldName.AsString,
                                               '',TempIndexedFields) then
                     begin
                     if (TempIndexedFields='') then
                        begin
                        if (MessageDlg('This field is the only field in the index '+
                                       IndexesTableIndexName.AsString+' and will cause '+
                                       'the index to be removed if it is deleted. '+
                                       'Are you sure you want to delete this field ?',
                                       mtConfirmation,[mbYes,mbNo],0)=mrNo) then
                           Abort;
                        end
                     else
                        begin
                        if (MessageDlg('This field is part of the index '+
                                       IndexesTableIndexName.AsString+' and will be removed '+
                                       'from the index if it is deleted. '+
                                       'Are you sure you want to delete this field ?',
                                       mtConfirmation,[mbYes,mbNo],0)=mrNo) then
                           Abort;
                        end;
                     end;
                  end;
               Next;
               end;
         finally
            if (RecordCount <> 0) then
               GotoBookmark(IndexBookmark);
            FreeBookmark(IndexBookmark);
            EnableControls;
         end;
         end;
      TempIndexedFields:=TextIndexFieldsEdit.Text;
      if ReplaceFieldInIndexFields(FieldsTableFieldName.AsString,'',
                                   TempIndexedFields) then
         begin
         if (TempIndexedFields='') then
            begin
            if (MessageDlg('This field is the only field in the full text index '+
                           'and will cause the index to be removed if it '+
                           'is deleted. Are you sure you want to delete this field ?',
                           mtConfirmation,[mbYes,mbNo],0)=mrNo) then
               Abort;
            end
         else
            begin
            if (MessageDlg('This field is part of the full text index '+
                           'and will be removed from the full text index '+
                           'if it is deleted. Are you sure you want to '+
                           'delete this field ?',mtConfirmation,[mbYes,mbNo],0)=mrNo) then
               Abort;
            end;
         end;
      if (MessageDlg('Are you sure you want to delete this field ?',
                     mtConfirmation,[mbYes,mbNo],0)=mrNo) then
         Abort;
      { Check to see if we need to modify any indexes also }
      with IndexesTable do
         begin
         DisableControls;
         IndexBookmark:=GetBookmark;
         try
            First;
            while (not EOF) do
               begin
               TempIndexedFields:=IndexesTableIndexedFields.AsString;
               if ReplaceFieldInIndexFields(FieldsTableFieldName.AsString,'',
                                            TempIndexedFields) then
                  begin
                  HasAutoModifiedIndexes:=True;
                  if (TempIndexedFields='') then
                     Delete
                  else
                     begin
                     Edit;
                     IndexesTableIndexedFields.AsString:=TempIndexedFields;
                     Post;
                     TempIndexedFields:=IndexesTableDescendingFields.AsString;
                     if ReplaceFieldInIndexFields(FieldsTableFieldName.AsString,'',
                                                  TempIndexedFields) then
                        begin
                        Edit;
                        IndexesTableDescendingFields.AsString:=TempIndexedFields;
                        Post;
                        end;
                     Next;
                     end;
                  end
               else
                  Next;
               end;
         finally
            if (RecordCount <> 0) then
               GotoBookmark(IndexBookmark);
            FreeBookmark(IndexBookmark);
            EnableControls;
         end;
         end;
      TempIndexedFields:=TextIndexFieldsEdit.Text;
      if ReplaceFieldInIndexFields(FieldsTableFieldName.AsString,'',
                                   TempIndexedFields) then
         begin
         HasAutoModifiedFullTextIndex:=True;
         TextIndexFieldsEdit.Text:=TempIndexedFields;
         end;
   finally
      IsDeletingField:=False;
   end;
end;

procedure TStructureDlg.IndexesTablePostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
   Action:=daAbort;
   if (E is EDBISAMEngineError) then
      begin
      if (EDBISAMEngineError(E).ErrorCode=DBISAM_KEYVIOL) then
         MessageDlg('This index name already exists',mtError,[mbOk],0)
      else
         MessageDlg(E.Message,mtError,[mbOK],0);
       end
   else
      MessageDlg(E.Message,mtError,[mbOK],0);
end;

procedure TStructureDlg.IndexesTableBeforeDelete(DataSet: TDataSet);
begin
   if (not IsDeletingField) then
      begin
      if (MessageDlg('Delete this index ?',mtConfirmation,[mbYes,mbNo],0)=mrNo) then
         Abort;
      end;
end;

procedure TStructureDlg.IndexesTableAfterDelete(DataSet: TDataSet);
begin
   SetStructureModified;
   UpdateIndexTotals;
   IndexesGrid.RefreshCols;
end;

procedure TStructureDlg.IndexesTableNewRecord(DataSet: TDataSet);
begin
   with IndexesTable do
      begin
      IndexesTablePosition.AsInteger:=RecordCount+1;
      IndexesTablePrimary.AsBoolean:=False;
      IndexesTableCaseInsensitive.AsBoolean:=False;
      IndexesTableUnique.AsBoolean:=False;
      IndexesTableCompression.AsString:='None';
      end;
end;

procedure TStructureDlg.IndexesTableBeforePost(DataSet: TDataSet);
begin
   if IsLoading then
      Exit;
   if (not IndexesTablePrimary.AsBoolean) then
      begin
      if IndexesTableIndexName.IsNull then
         begin
         MessageDlg('The index name must be specified',mtError,[mbOk],0);
         Abort;
         end;
      if (not IsAlpha(IndexesTableIndexName.AsString[1])) then
         begin
         MessageDlg('The index name must begin with an alpha character',mtError,[mbOk],0);
         Abort;
         end;
      end;         
   if IndexesTableIndexedFields.IsNull then
      begin
      MessageDlg('The indexed fields must be specified',mtError,[mbOk],0);
      Abort;
      end;
end;

procedure TStructureDlg.SourceTableDataLost(Sender: TObject;
  Cause: TDataLossCause; const ContextInfo: String;
  var Continue, StopAsking: Boolean);
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
         begin
         Continue:=True;
         WasErrors:=False;
         end;
      mrYesToAll:
         begin
         Continue:=True;
         StopAsking:=True;
         WasErrors:=False;
         end;
      mrNo:
         begin
         Continue:=False;
         WasErrors:=True;
         end;
      mrCancel:
         begin
         Continue:=False;
         CloseDialog:=False;
         WasErrors:=False;
         end;
      end;
end;

procedure TStructureDlg.IndexesGridEditButtonClick(Sender: TObject);
var
   I: Integer;
   TempIndexedFields: string;
   FieldBookmark: TBookmark;
begin
   if (IndexesGrid.SelectedField=IndexesTableIndexedFields) or
      (IndexesGrid.SelectedField=IndexesTableDescendingFields)   then
      begin
      if (FieldsTable.RecordCount=0) then
         begin
         MessageDlg('You must first define at least one field',mtError,[mbOk],0);
         Exit;
         end;
      with KeyFieldsDlg do
         begin
         if (IndexesGrid.SelectedField=IndexesTableIndexedFields) then
            Caption:='Fields for Index '+IndexesTableIndexName.AsString
         else
            Caption:='Descending Fields for Index '+IndexesTableIndexName.AsString;
         AvailableListBox.Items.Clear;
         KeyListBox.Items.Clear;
         if (not IndexesGrid.SelectedField.IsNull) then
            begin
            TempIndexedFields:=IndexesGrid.SelectedField.AsString;
            I:=1;
            while I <= Length(TempIndexedFields) do
               KeyListBox.Items.Add(ExtractFieldName(TempIndexedFields,I));
            end;
         if (KeyListBox.Items.IndexOf(RECORDID_FIELD_NAME)=-1) then
            AvailableListBox.Items.Add(RECORDID_FIELD_NAME);
         if (KeyListBox.Items.IndexOf(RECORDHASH_FIELD_NAME)=-1) then
            AvailableListBox.Items.Add(RECORDHASH_FIELD_NAME);
         with FieldsTable do
            begin
            DisableControls;
            FieldBookmark:=GetBookmark;
            try
               First;
               while (not EOF) do
                  begin
                  if (KeyListBox.Items.IndexOf(FieldsTableFieldName.AsString)=-1) then
                     AvailableListBox.Items.Add(FieldsTableFieldName.AsString);
                  Next;
                  end;
            finally
               GotoBookmark(FieldBookmark);
               FreeBookmark(FieldBookmark);
               EnableControls;
            end;
            end;
         if (ShowModal=mrOk) then
            begin
            Self.ActiveControl:=IndexesGrid;
            with IndexesTable do
               begin
               Edit;
               IndexesGrid.SelectedField.Clear;
               TempIndexedFields:=IndexesGrid.SelectedField.AsString;
               for I:=0 to KeyListBox.Items.Count-1 do
                  begin
                  if (I=0) then
                     TempIndexedFields:=KeyListBox.Items[I]
                  else
                     TempIndexedFields:=TempIndexedFields+';'+KeyListBox.Items[I];
                  end;
               IndexesGrid.SelectedField.AsString:=TempIndexedFields;
               end;
            end;
         end;
      end;
end;

procedure TStructureDlg.FieldsGridEditButtonClick(Sender: TObject);
begin
   with FieldDetailsDlg do
      begin
      FieldsTable.CheckBrowseMode;
      FieldsTable.Edit;
      FieldsSource.DataSet:=FieldsTable;
      SetupFields(False);
      if (ShowModal=mrOk) then
         FieldsTable.Post
      else
         FieldsTable.Cancel;
      FieldsSource.DataSet:=nil;
      end;
end;

procedure TStructureDlg.FormCreate(Sender: TObject);
begin
   ReadWindowSettings(Self,MainForm.AppDirectory,
                      MainForm.AppVersionInformation.FileNameRoot,'Structure Window');
   InitialPassword:='';
   LastPassword:='';
   IsLoading:=False;
   IsDeletingField:=False;
   IsResettingPositions:=False;
   IsInserting:=False;
   IsInsertingField:=False;
   InsertPos:=0;
   HasAutoModifiedIndexes:=False;
   HasAutoModifiedFullTextIndex:=False;
   Engine.GetLocaleNames(LocaleComboBox.Items);
   MainForm.CreateStructureTables(FieldsTable,IndexesTable);
   FieldsGrid.Columns[2].PickList.Assign(DataTypesList);
   PopulateAsciiValues(SpaceCharsListBox);
   PopulateAsciiValues(IncludeCharsListBox);
end;

procedure TStructureDlg.FormDestroy(Sender: TObject);
begin
   MainForm.DeleteStructureTables(FieldsTable,IndexesTable);
   SaveWindowSettings(Self,MainForm.AppDirectory,
                      MainForm.AppVersionInformation.FileNameRoot,'Structure Window');
end;

procedure TStructureDlg.FieldsGridDblClick(Sender: TObject);
begin
   Keybd_Event(VK_F2,0,0,0);
   Keybd_Event(VK_F2,0,KEYEVENTF_KEYUP,0);
end;

procedure TStructureDlg.BorrowStructureBtnClick(Sender: TObject);
var
   SaveIsAdding: Boolean;
   SaveIsRemote: Boolean;
   SaveDatabaseName: string;
   SaveTableName: string;
begin
   SaveIsAdding:=IsAdding;
   SaveIsRemote:=SetupIsRemote;
   SaveDatabaseName:=SetupDatabaseName;
   SaveTableName:=SetupTableName;
   try
      with OpenTableDlg do
         begin
         Caption:='Select table to borrow structure';
         Exclusive:=False;
         ReadOnly:=True;
         MultipleSelect:=False;
         Initialize;
         if (ShowModal=mrOk) then
            begin
            SetupExistingStructure(RemoteRadioButton.Checked,
                                   AvailableDatabasesCombobox.Text,
                                   AvailableTablesListbox.Items[
                                   AvailableTablesListBox.ItemIndex]);
            SetStructureModified;
            end;
         end;
   finally
      IsAdding:=SaveIsAdding;
      SetupIsRemote:=SaveIsRemote;
      SetupDatabaseName:=SaveDatabaseName;
      SetupTableName:=SaveTableName;
      AssignTableInfo;
   end;
end;

procedure TStructureDlg.LastAutoIncValueEditChange(Sender: TObject);
begin
   SetStructureModified;
end;

procedure TStructureDlg.LastAutoIncValueEditKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (Key in ['0'..'9',#8,#13]) then
      Key:=#0;
end;

procedure TStructureDlg.MoveFieldChangingEx(Sender: TObject;
  var AllowChange: Boolean; NewValue: Smallint;
  Direction: TUpDownDirection);
var
   OldPosition: Integer;
begin
   FieldsTable.CheckBrowseMode;
   IsResettingPositions:=True;
   try
      with FieldsTable do
         begin
         DisableControls;
         try
            if (Direction=updUp) then
               begin
               if (FieldsTablePosition.AsInteger > 1) then
                  begin
                  OldPosition:=FieldsTablePosition.AsInteger;
                  Prior;
                  Edit;
                  FieldsTablePosition.AsInteger:=High(Integer);
                  Post;
                  FindKey([OldPosition]);
                  Edit;
                  FieldsTablePosition.AsInteger:=(OldPosition-1);
                  Post;
                  FindKey([High(Integer)]);
                  Edit;
                  FieldsTablePosition.AsInteger:=OldPosition;
                  Post;
                  FindKey([(OldPosition-1)]);
                  end;
               end
            else
               begin
               if (FieldsTablePosition.AsInteger < RecordCount) then
                  begin
                  OldPosition:=FieldsTablePosition.AsInteger;
                  Next;
                  Edit;
                  FieldsTablePosition.AsInteger:=High(Integer);
                  Post;
                  FindKey([OldPosition]);
                  Edit;
                  FieldsTablePosition.AsInteger:=(OldPosition+1);
                  Post;
                  FindKey([High(Integer)]);
                  Edit;
                  FieldsTablePosition.AsInteger:=OldPosition;
                  Post;
                  FindKey([(OldPosition+1)]);
                  end;
               end;
         finally
            EnableControls;
         end;
         end;
   finally
      IsResettingPositions:=False;
      SetStructureModified;
   end;
end;

procedure TStructureDlg.FieldsTableAfterPost(DataSet: TDataSet);
begin
   if IsLoading or IsResettingPositions then
      Exit;
   if IsInsertingField then
      BumpFieldPositions(InsertPos);
   if IncLastFieldUsed then
      Inc(LastFieldUsed);
   SetStructureModified;
   UpdateFieldTotals;
   FieldsGrid.RefreshCols;
   IsInsertingField:=False;
end;

procedure TStructureDlg.FieldsTableBeforeEdit(DataSet: TDataSet);
begin
   SetStructureModified;
end;

procedure TStructureDlg.IndexesTableBeforeEdit(DataSet: TDataSet);
begin
   SetStructureModified;
end;

procedure TStructureDlg.FieldsTableBeforeInsert(DataSet: TDataSet);
begin
   SetStructureModified;
   if IsInserting then
      IsInsertingField:=True
   else
      IsInsertingField:=False;
end;

procedure TStructureDlg.IndexesTableBeforeInsert(DataSet: TDataSet);
begin
   SetStructureModified;
end;

procedure TStructureDlg.FieldsGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key=VK_INSERT) then
      begin
      IsInserting:=True;
      InsertPos:=FieldsTable.RecNo;
      end
   else
      begin
      IsInserting:=False;
      if (Key=VK_DELETE) and FieldsGrid.EditorMode then
         begin
         with FieldsGrid do
            begin
            if (SelectedField <> nil) then
               begin
               if (SelectedField=FieldsTableDataType) or
                  (SelectedField=FieldsTableRequired) then
                  Key:=0;
               end;
            end;
         end;
      end;
end;

procedure TStructureDlg.FieldsGridKeyPress(Sender: TObject; var Key: Char);
begin
   with FieldsGrid do
      begin
      if (SelectedField <> nil) and (Key <> #13) then
         begin
         if (SelectedField=FieldsTableDataType) or
            (SelectedField=FieldsTableRequired) then
            begin
            with Columns[SelectedIndex] do
               HandlePickListKey(SelectedField,PickList,Key);
            end;
         end;
      end;
end;

procedure TStructureDlg.HandlePickListKey(FieldToHandle: TField;
                                          PickList: TStrings;
                                          var KeyToHandle: Char);
var
   I: Integer;
   SelectedPos: Integer;
   ItemPos: Integer;
   ItemFound: Boolean;
begin
   SelectedPos:=-1;
   for I:=0 to PickList.Count-1 do
      begin
      if (FieldToHandle.AsString=PickList[I]) then
         begin
         SelectedPos:=I;
         Break;
         end;
      end;
   ItemPos:=-1;
   ItemFound:=False;
   for I:=0 to PickList.Count-1 do
      begin
      if (UpperCase(Copy(PickList[I],1,1))=UpperCase(KeyToHandle)) then
         begin
         ItemPos:=I;
         if (ItemPos >= SelectedPos) and
            (FieldToHandle.AsString <> PickList[I]) then
            begin
            ItemFound:=True;
            Break;
            end;
         end;
      end;
   if (not ItemFound) then
      begin
      SelectedPos:=-1;
      ItemFound:=False;
      for I:=0 to PickList.Count-1 do
         begin
         if (UpperCase(Copy(PickList[I],1,1))=UpperCase(KeyToHandle)) then
            begin
            ItemPos:=I;
            if (ItemPos >= SelectedPos) and
               (FieldToHandle.AsString <> PickList[I]) then
               begin
               ItemFound:=True;
               Break;
               end;
            end;
         end;
      end;
   if ItemFound then
      begin
      FieldToHandle.DataSet.Edit;
      FieldToHandle.AsString:=PickList[ItemPos];
      KeyToHandle:=#0;
      end
   else
      KeyToHandle:=#0;
end;

procedure TStructureDlg.FieldsTableDataTypeChange(Sender: TField);
begin
   if (FieldsTableDataType.AsString <> 'String') and
      (FieldsTableDataType.AsString <> 'FixedChar') and
      (FieldsTableDataType.AsString <> 'GUID') and
      (FieldsTableDataType.AsString <> 'Bytes') and
      (FieldsTableDataType.AsString <> 'BCD') then
      FieldsTableSize.AsInteger:=0
   else if (FieldsTableDataType.AsString='String') or
           (FieldsTableDataType.AsString='FixedChar') or
           (FieldsTableDataType.AsString='Bytes') then
      FieldsTableSize.AsInteger:=10
   else if (FieldsTableDataType.AsString='GUID') then
      FieldsTableSize.AsInteger:=TYPE_GUID_LENGTH
   else if (FieldsTableDataType.AsString='BCD') then
      FieldsTableSize.AsInteger:=4;
end;

procedure TStructureDlg.IndexesGridKeyPress(Sender: TObject;
  var Key: Char);
begin
   with IndexesGrid do
      begin
      if (SelectedField <> nil) and (Key <> #13) then
         begin
         if (SelectedField=IndexesTablePrimary) or
            (SelectedField=IndexesTableCaseInsensitive) or
            (SelectedField=IndexesTableUnique) or
            (SelectedField=IndexesTableCompression) then
            begin
            with Columns[SelectedIndex] do
               HandlePickListKey(SelectedField,PickList,Key);
            end;
         end;
      end;
end;

procedure TStructureDlg.IndexesGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key=VK_DELETE) and IndexesGrid.EditorMode then
      begin
      with IndexesGrid do
         begin
         if (SelectedField <> nil) then
            begin
            if (SelectedField=IndexesTablePrimary) or
               (SelectedField=IndexesTableCaseInsensitive) or
               (SelectedField=IndexesTableUnique) or
               (SelectedField=IndexesTableCompression) then
               Key:=0;
            end;
         end;
      end;
end;

procedure TStructureDlg.SelectTextIndexFieldsButtonClick(Sender: TObject);
var
   I: Integer;
   TempIndexedFields: string;
   FieldBookmark: TBookmark;
begin
   if (FieldsTable.RecordCount=0) then
      begin
      MessageDlg('You must first define at least one field',mtError,[mbOk],0);
      Exit;
      end;
   with KeyFieldsDlg do
      begin
      Caption:='Fields for Full Text Index';
      AvailableListBox.Items.Clear;
      KeyListBox.Items.Clear;
      if (TextIndexFieldsEdit.Text <> '') then
         begin
         TempIndexedFields:=TextIndexFieldsEdit.Text;
         I:=1;
         while I <= Length(TempIndexedFields) do
            KeyListBox.Items.Add(ExtractFieldName(TempIndexedFields,I));
         end;
      with FieldsTable do
         begin
         DisableControls;
         FieldBookmark:=GetBookmark;
         try
            First;
            while (not EOF) do
               begin
               if (KeyListBox.Items.IndexOf(FieldsTableFieldName.AsString)=-1) then
                  AvailableListBox.Items.Add(FieldsTableFieldName.AsString);
               Next;
               end;
         finally
            GotoBookmark(FieldBookmark);
            FreeBookmark(FieldBookmark);
            EnableControls;
         end;
         end;
      if (ShowModal=mrOk) then
         begin
         TempIndexedFields:='';
         for I:=0 to KeyListBox.Items.Count-1 do
            begin
            if (I=0) then
               TempIndexedFields:=KeyListBox.Items[I]
            else
               TempIndexedFields:=TempIndexedFields+';'+KeyListBox.Items[I];
            end;
         TextIndexFieldsEdit.Text:=TempIndexedFields;
         SetStructureModified;
         end;
      end;
end;

procedure TStructureDlg.SpaceCharsListBoxClick(Sender: TObject);
begin
   SetStructureModified;
end;

procedure TStructureDlg.IncludeCharsListBoxClick(Sender: TObject);
begin
   SetStructureModified;
end;

procedure TStructureDlg.StopWordsMemoChange(Sender: TObject);
begin
   SetStructureModified;
end;

procedure TStructureDlg.DefaultButtonClick(Sender: TObject);
var
   TempStopWords: TStrings;
   TempSpaceChars: string;
   TempIncludeChars: string;
begin
   TempStopWords:=TStringList.Create;
   try
      SetStructureModified;
      Engine.GetDefaultTextIndexParams(TempStopWords,TempSpaceChars,TempIncludeChars);
      StopWordsMemo.Lines.Assign(TempStopWords);
      SetupCharacterValues(SpaceCharsListBox,TempSpaceChars);
      SetupCharacterValues(IncludeCharsListBox,TempIncludeChars);
   finally
      TempStopWords.Free;
   end;
end;

procedure TStructureDlg.IndexesTableAfterScroll(DataSet: TDataSet);
begin
   IndexesGrid.RefreshCols;
end;

procedure TStructureDlg.FieldsTableAfterScroll(DataSet: TDataSet);
begin
   FieldsGrid.RefreshCols;
end;

procedure TStructureDlg.SourceTableAlterProgress(Sender: TObject;
  PercentDone: Word);
begin
   with (Sender as TDBISAMTable) do
      begin
      if (SessionName='Remote') then
         MainForm.StatusPanel.Caption:=' Altering table '+AddBS(REMOTE_DRIVE)+
                                       AddBS(DatabaseName)+TableName+'...'
      else
         MainForm.StatusPanel.Caption:=' Altering table '+AddBS(DatabaseName)+
                                       TableName+'...';
      MainForm.ProgressGauge.Progress:=PercentDone;
      Application.ProcessMessages;
      end;
end;

end.
