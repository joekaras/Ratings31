unit range;

interface

uses Windows, Messages, Classes, Graphics, Forms, Controls, Buttons,
  StdCtrls, ExtCtrls, Grids, DB, DBGrids, dbisamtb, dbisamct;

type
  TRangeDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    ClearBtn: TButton;
    BeginRangeGrid: TDBISAMDBGrid;
    EndRangeGrid: TDBISAMDBGrid;
    EndRangeFieldsTable: TDBISAMTable;
    EndRangeFieldsTableKeyFieldNumber: TAutoIncField;
    EndRangeFieldsTableKeyFieldName: TStringField;
    EndRangeFieldsTableValue: TStringField;
    EndRangeFieldsSource: TDataSource;
    BeginRangeFieldsSource: TDataSource;
    BeginRangeFieldsTable: TDBISAMTable;
    BeginRangeFieldsTableKeyFieldNumber: TAutoIncField;
    BeginRangeFieldsTableKeyFieldName: TStringField;
    BeginRangeFieldsTableValue: TStringField;
    procedure FormShow(Sender: TObject);
    procedure ClearBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BeginRangeGridKeyPress(Sender: TObject; var Key: Char);
    procedure EndRangeGridKeyPress(Sender: TObject; var Key: Char);
    procedure BeginRangeFieldsTableBeforeInsert(DataSet: TDataSet);
    procedure BeginRangeFieldsTableBeforeDelete(DataSet: TDataSet);
    procedure OKBtnClick(Sender: TObject);
  private
    IsLoading: Boolean;
  public
    procedure SetupKeyFields;
  end;

var
  RangeDlg: TRangeDlg;

implementation

uses SysUtils, Dialogs, main, browse, dbisamen, dbisamcn;

{$R *.DFM}

procedure TRangeDlg.FormShow(Sender: TObject);
begin
   BeginRangeGrid.SelectedField:=BeginRangeFieldsTableValue;
   EndRangeGrid.SelectedField:=EndRangeFieldsTableValue;
   ActiveControl:=BeginRangeGrid;
end;

procedure TRangeDlg.ClearBtnClick(Sender: TObject);
begin
   with TBrowseForm(MainForm.ActiveMDIChild) do
      BrowseTable.CancelRange;
   Close;
end;

procedure TRangeDlg.CancelBtnClick(Sender: TObject);
begin
   Close;
end;

procedure TRangeDlg.FormCreate(Sender: TObject);
begin
   IsLoading:=False;
   with BeginRangeFieldsTable do
      begin
      IndexDefs.Clear;
      IndexDefs.Add('','KeyFieldNumber',[ixPrimary]);
      CreateTable;
      Open;
      end;
   with EndRangeFieldsTable do
      begin
      IndexDefs.Clear;
      IndexDefs.Add('','KeyFieldNumber',[ixPrimary]);
      CreateTable;
      Open;
      end;
end;

procedure TRangeDlg.FormDestroy(Sender: TObject);
begin
   with BeginRangeFieldsTable do
      begin
      Close;
      DeleteTable;
      end;
   with EndRangeFieldsTable do
      begin
      Close;
      DeleteTable;
      end;
end;

procedure TRangeDlg.BeginRangeGridKeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in [#13,#8]) then
      begin
      with TBrowseForm(MainForm.ActiveMDIChild).BrowseTable do
         begin
         if (AnsiCompareText(BeginRangeFieldsTableKeyFieldName.AsString,
                             RECORDID_FIELD_NAME)=0) then
            begin
            if (not (Key in ['+','-','0'..'9'])) then
               Key:=#0;
            end
         else if (AnsiCompareText(BeginRangeFieldsTableKeyFieldName.AsString,
                                   RECORDHASH_FIELD_NAME)=0) then
            { Do nothing }
         else
            begin
            if (not FieldByName(BeginRangeFieldsTableKeyFieldName.AsString).IsValidChar(Key)) then
               Key:=#0;
            end;
         end;
      end;
end;

procedure TRangeDlg.EndRangeGridKeyPress(Sender: TObject; var Key: Char);
begin
   if not (Key in [#13,#8]) then
      begin
      with TBrowseForm(MainForm.ActiveMDIChild).BrowseTable do
         begin
         if (AnsiCompareText(EndRangeFieldsTableKeyFieldName.AsString,
                             RECORDID_FIELD_NAME)=0) then
            begin
            if (not (Key in ['+','-','0'..'9'])) then
               Key:=#0;
            end
         else if (AnsiCompareText(EndRangeFieldsTableKeyFieldName.AsString,
                                   RECORDHASH_FIELD_NAME)=0) then
            { Do nothing }
         else
            begin
            if (not FieldByName(EndRangeFieldsTableKeyFieldName.AsString).IsValidChar(Key)) then
               Key:=#0;
            end;
         end;
      end;
end;

procedure TRangeDlg.SetupKeyFields;
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
      with BeginRangeFieldsTable do
         begin
         DisableControls;
         try
            EmptyTable;
            I:=1;
            while I <= Length(TempKeyFields) do
               begin
               Append;
               BeginRangeFieldsTableKeyFieldName.AsString:=ExtractFieldName(TempKeyFields,I);
               Post;
               end;
            First;
         finally
            EnableControls;
         end;
         end;
      with EndRangeFieldsTable do
         begin
         DisableControls;
         try
            EmptyTable;
            I:=1;
            while I <= Length(TempKeyFields) do
               begin
               Append;
               EndRangeFieldsTableKeyFieldName.AsString:=ExtractFieldName(TempKeyFields,I);
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

procedure TRangeDlg.BeginRangeFieldsTableBeforeInsert(DataSet: TDataSet);
begin
   if (not IsLoading) then
      Abort;
end;

procedure TRangeDlg.BeginRangeFieldsTableBeforeDelete(DataSet: TDataSet);
begin
   Abort;
end;

procedure TRangeDlg.OKBtnClick(Sender: TObject);
var
   RangeBookmark: TBookmark;
   TotalFieldCount: Integer;
begin
   with BeginRangeFieldsTable do
      begin
      with TBrowseForm(MainForm.ActiveMDIChild).BrowseTable do
         begin
         DisableControls;
         SetRangeStart;
         end;
      DisableControls;
      RangeBookmark:=GetBookmark;
      try
         TotalFieldCount:=0;
         First;
         while (not EOF) do
            begin
            if (BeginRangeFieldsTableValue.AsString <> '') then
               begin
               TotalFieldCount:=BeginRangeFieldsTableKeyFieldNumber.AsInteger;
               try
                  if (AnsiCompareText(BeginRangeFieldsTableKeyFieldName.AsString,
                                      RECORDID_FIELD_NAME) <> 0) and
                     (AnsiCompareText(BeginRangeFieldsTableKeyFieldName.AsString,
                                      RECORDHASH_FIELD_NAME) <> 0) then
                     TBrowseForm(MainForm.ActiveMDIChild).BrowseTable.
                        FieldByName(BeginRangeFieldsTableKeyFieldName.AsString).AsString:=
                        BeginRangeFieldsTableValue.AsString
                  else
                     begin
                     MessageDlg('You cannot set a range on the RecordID or RecordHash '+
                                'system fields in this dialog',mtError,[mbOk],0);
                     Exit;
                     end;
               except
                  MessageDlg('The field value for '+
                             BeginRangeFieldsTableKeyFieldNumber.AsString+
                             ' is invalid',mtError,[mbOk],0);
                  Exit;
               end;
               end;
            Next;
            end;
         with TBrowseForm(MainForm.ActiveMDIChild).BrowseTable do
            KeyFieldCount:=TotalFieldCount;
      finally
         GotoBookmark(RangeBookmark);
         FreeBookmark(RangeBookmark);
         EnableControls;
         with TBrowseForm(MainForm.ActiveMDIChild).BrowseTable do
            begin
            CheckBrowseMode;
            EnableControls;
            end;
      end;
      end;
   with EndRangeFieldsTable do
      begin
      with TBrowseForm(MainForm.ActiveMDIChild).BrowseTable do
         begin
         DisableControls;
         SetRangeEnd;
         end;
      DisableControls;
      RangeBookmark:=GetBookmark;
      try
         TotalFieldCount:=0;
         First;
         while (not EOF) do
            begin
            if (EndRangeFieldsTableValue.AsString <> '') then
               begin
               TotalFieldCount:=EndRangeFieldsTableKeyFieldNumber.AsInteger;
               try
                  if (AnsiCompareText(BeginRangeFieldsTableKeyFieldName.AsString,
                                      RECORDID_FIELD_NAME) <> 0) and
                     (AnsiCompareText(BeginRangeFieldsTableKeyFieldName.AsString,
                                      RECORDHASH_FIELD_NAME) <> 0) then
                     TBrowseForm(MainForm.ActiveMDIChild).BrowseTable.
                        FieldByName(EndRangeFieldsTableKeyFieldName.AsString).AsString:=
                        EndRangeFieldsTableValue.AsString
                  else
                     begin
                     MessageDlg('You cannot set a range on the RecordID or RecordHash '+
                                'system fields in this dialog',mtError,[mbOk],0);
                     Exit;
                     end;
               except
                  MessageDlg('The field value for '+
                             EndRangeFieldsTableKeyFieldNumber.AsString+
                             ' is invalid',mtError,[mbOk],0);
                  Exit;
               end;
               end;
            Next;
            end;
         with TBrowseForm(MainForm.ActiveMDIChild).BrowseTable do
            KeyFieldCount:=TotalFieldCount;
         TBrowseForm(MainForm.ActiveMDIChild).BrowseTable.ApplyRange;
      finally
         GotoBookmark(RangeBookmark);
         FreeBookmark(RangeBookmark);
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
