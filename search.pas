unit search;

interface

uses Windows, Messages, Classes, Graphics, Forms, Controls, Buttons,
     StdCtrls, ExtCtrls, DBGrids, Grids, DB, dbisamtb, dbisamct;

type
  TSearchDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    FindNearestCheckBox: TCheckBox;
    SearchGrid: TDBISAMDBGrid;
    SearchFieldsTable: TDBISAMTable;
    SearchFieldsTableKeyFieldNumber: TAutoIncField;
    SearchFieldsTableKeyFieldName: TStringField;
    SearchFieldsTableValue: TStringField;
    SearchFieldsSource: TDataSource;
    procedure SearchGridKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SearchFieldsTableBeforeDelete(DataSet: TDataSet);
    procedure SearchFieldsTableBeforeInsert(DataSet: TDataSet);
    procedure CancelBtnClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
  private
    IsLoading: Boolean;
  public
    procedure SetupKeyFields;
  end;

var
  SearchDlg: TSearchDlg;

implementation

uses SysUtils, Dialogs, main, browse, dbisamen, dbisamcn;

{$R *.DFM}

procedure TSearchDlg.SearchGridKeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in [#13,#8]) then
      begin
      with TBrowseForm(MainForm.ActiveMDIChild).BrowseTable do
         begin
         if (AnsiCompareText(SearchFieldsTableKeyFieldName.AsString,
                             RECORDID_FIELD_NAME)=0) then
            begin
            if (not (Key in ['+','-','0'..'9'])) then
               Key:=#0;
            end
         else if (AnsiCompareText(SearchFieldsTableKeyFieldName.AsString,
                                   RECORDHASH_FIELD_NAME)=0) then
            { Do nothing }
         else
            begin
            if (not FieldByName(SearchFieldsTableKeyFieldName.AsString).IsValidChar(Key)) then
               Key:=#0;
            end;
         end;
      end;
end;

procedure TSearchDlg.SetupKeyFields;
var
   I: Integer;
   TempKeyFields: string;
begin
   IsLoading:=True;
   try
      with TBrowseForm(MainForm.ActiveMDIChild).BrowseTable do
         begin
         IndexDefs.Update;
         if (IndexDefs.IndexOf(IndexName) <> -1) then
            TempKeyFields:=IndexDefs.Items[IndexDefs.IndexOf(IndexName)].Fields;
         end;
      with SearchFieldsTable do
         begin
         DisableControls;
         try
            EmptyTable;
            I:=1;
            while I <= Length(TempKeyFields) do
               begin
               Append;
               SearchFieldsTableKeyFieldName.AsString:=ExtractFieldName(TempKeyFields,I);
               Post;
               end;
            First;
         finally
            EnableControls;
         end;
         end;
   finally
      IsLoading:=False;
   end;
end;

procedure TSearchDlg.FormShow(Sender: TObject);
begin
   FindNearestCheckBox.Checked:=False;
   SearchGrid.SelectedField:=SearchFieldsTableValue;
   ActiveControl:=SearchGrid;
end;

procedure TSearchDlg.FormCreate(Sender: TObject);
begin
   IsLoading:=False;
   with SearchFieldsTable do
      begin
      IndexDefs.Clear;
      IndexDefs.Add('','KeyFieldNumber',[ixPrimary]);
      CreateTable;
      Open;
      end;
end;

procedure TSearchDlg.FormDestroy(Sender: TObject);
begin
   with SearchFieldsTable do
      begin
      Close;
      DeleteTable;
      end;
end;

procedure TSearchDlg.SearchFieldsTableBeforeDelete(DataSet: TDataSet);
begin
   Abort;
end;

procedure TSearchDlg.SearchFieldsTableBeforeInsert(DataSet: TDataSet);
begin
   if (not IsLoading) then
      Abort;
end;

procedure TSearchDlg.CancelBtnClick(Sender: TObject);
begin
   Close;
end;

procedure TSearchDlg.OKBtnClick(Sender: TObject);
var
   SearchBookmark: TBookmark;
   TotalFieldCount: Integer;
begin
   with SearchFieldsTable do
      begin
      with TBrowseForm(MainForm.ActiveMDIChild).BrowseTable do
         begin
         DisableControls;
         SetKey;
         end;
      DisableControls;
      SearchBookmark:=GetBookmark;
      try
         TotalFieldCount:=0;
         First;
         while (not EOF) do
            begin
            if (SearchFieldsTableValue.AsString <> '') then
               begin
               TotalFieldCount:=SearchFieldsTableKeyFieldNumber.AsInteger;
               try
                  if (AnsiCompareText(SearchFieldsTableKeyFieldName.AsString,
                                      RECORDID_FIELD_NAME) <> 0) and
                     (AnsiCompareText(SearchFieldsTableKeyFieldName.AsString,
                                      RECORDHASH_FIELD_NAME) <> 0) then
                     TBrowseForm(MainForm.ActiveMDIChild).BrowseTable.
                        FieldByName(SearchFieldsTableKeyFieldName.AsString).AsString:=
                        SearchFieldsTableValue.AsString
                  else
                     begin
                     MessageDlg('You cannot search on the RecordID or RecordHash '+
                                'system fields in this dialog',mtError,[mbOk],0);
                     Exit;
                     end;
               except
                  MessageDlg('The field value for '+
                             SearchFieldsTableKeyFieldNumber.AsString+
                             ' is invalid',mtError,[mbOk],0);
                  Exit;
               end;
               end;
            Next;
            end;
         with TBrowseForm(MainForm.ActiveMDIChild).BrowseTable do
            begin
            KeyFieldCount:=TotalFieldCount;
            if FindNearestCheckBox.Checked then
               GotoNearest
            else
               begin
               if not GotoKey then
                  MessageDlg('The key value specified was not found',mtError,[mbOk],0);
               end;
            end;
      finally
         GotoBookmark(SearchBookmark);
         FreeBookmark(SearchBookmark);
         EnableControls;
         with TBrowseForm(MainForm.ActiveMDIChild).BrowseTable do
            begin
            CheckBrowseMode;
            EnableControls;
            end;
      end;
      end;
   Close;
end;

end.
