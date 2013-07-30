unit find;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFindDlg = class(TForm)
    GroupBox4: TGroupBox;
    FilterExpressionMemo: TMemo;
    FirstBtn: TButton;
    PriorBtn: TButton;
    CancelBtn: TButton;
    GroupBox5: TGroupBox;
    NoPartialCheckBox: TCheckBox;
    CaseInsensitiveCheckBox: TCheckBox;
    NextBtn: TButton;
    LastBtn: TButton;
    GroupBox1: TGroupBox;
    AvailableFieldsList: TListBox;
    GroupBox2: TGroupBox;
    RelationalOperatorsList: TListBox;
    GroupBox3: TGroupBox;
    JoinOperatorsList: TListBox;
    procedure AvailableFieldsListDblClick(Sender: TObject);
    procedure RelationalOperatorsListDblClick(Sender: TObject);
    procedure JoinOperatorsListDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PriorBtnClick(Sender: TObject);
    procedure FirstBtnClick(Sender: TObject);
    procedure NextBtnClick(Sender: TObject);
    procedure LastBtnClick(Sender: TObject);
    procedure CaseInsensitiveCheckBoxClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetupFilter;
    procedure AddAvailableFields;
  end;

var
  FindDlg: TFindDlg;

implementation

uses DB, main, browse, query, dbisamen;

{$R *.DFM}

procedure TFindDlg.AvailableFieldsListDblClick(Sender: TObject);
var
   TempFieldName: string;
   OptPos: Integer;
begin
   with FilterExpressionMemo do
      begin
      TempFieldName:=Trim(AvailableFieldsList.Items[AvailableFieldsList.ItemIndex]);
      OptPos:=Pos('  (Optimized)',TempFieldName);
      if (OptPos > 0) then
         Delete(TempFieldName,OptPos,Length('  (Optimized)'));
      SelText:=TempFieldName;
      SetFocus;
      end;
end;

procedure TFindDlg.RelationalOperatorsListDblClick(Sender: TObject);
begin
   with FilterExpressionMemo do
      begin
      SelText:=' '+
               Trim(Copy(RelationalOperatorsList.Items[RelationalOperatorsList.ItemIndex],1,
                    Length(RelationalOperatorsList.Items[RelationalOperatorsList.ItemIndex])))+
               ' ';
      SetFocus;
      end;
end;

procedure TFindDlg.JoinOperatorsListDblClick(Sender: TObject);
begin
   with FilterExpressionMemo do
      begin
      SelText:=' '+
               Trim(Copy(JoinOperatorsList.Items[JoinOperatorsList.ItemIndex],1,
                    Length(JoinOperatorsList.Items[JoinOperatorsList.ItemIndex])))+
               ' ';
      SetFocus;
      end;
end;

procedure TFindDlg.FormShow(Sender: TObject);
begin
   AvailableFieldsList.ItemIndex:=0;
   RelationalOperatorsList.ItemIndex:=0;
   JoinOperatorsList.ItemIndex:=0;
   ActiveControl:=FilterExpressionMemo;
end;

procedure TFindDlg.PriorBtnClick(Sender: TObject);
begin
   if (MainForm.ActiveMDIChild is TBrowseForm) then
      begin
      with TBrowseForm(MainForm.ActiveMDIChild) do
         begin
         Screen.Cursor:=crHourGlass;
         try
            BrowseTable.FindPrior;
         finally
            Screen.Cursor:=crDefault;
         end;
         end;
      end
   else if (MainForm.ActiveMDIChild is TQueryForm) then
      begin
      with TQueryForm(MainForm.ActiveMDIChild) do
         begin
         Screen.Cursor:=crHourGlass;
         try
            InteractiveQuery.FindPrior;
         finally
            Screen.Cursor:=crDefault;
         end;
         end;
      end;
   Close;
end;

procedure TFindDlg.SetupFilter;
begin
   AddAvailableFields;
   if (MainForm.ActiveMDIChild is TBrowseForm) then
      begin
      with TBrowseForm(MainForm.ActiveMDIChild) do
         begin
         FilterExpressionMemo.Lines.Text:=BrowseTable.Filter;
         NoPartialCheckBox.Checked:=(foNoPartialCompare in BrowseTable.FilterOptions);
         CaseInsensitiveCheckBox.Checked:=(foCaseInsensitive in BrowseTable.FilterOptions);
         end;
      end
   else if (MainForm.ActiveMDIChild is TQueryForm) then
      begin
      with TQueryForm(MainForm.ActiveMDIChild) do
         begin
         FilterExpressionMemo.Lines.Text:=InteractiveQuery.Filter;
         NoPartialCheckBox.Checked:=(foNoPartialCompare in InteractiveQuery.FilterOptions);
         CaseInsensitiveCheckBox.Checked:=(foCaseInsensitive in InteractiveQuery.FilterOptions);
         end;
      end;
end;

procedure TFindDlg.FirstBtnClick(Sender: TObject);
begin
   if (MainForm.ActiveMDIChild is TBrowseForm) then
      begin
      with TBrowseForm(MainForm.ActiveMDIChild) do
         begin
         Screen.Cursor:=crHourGlass;
         try
            try
               BrowseTable.Filter:=FilterExpressionMemo.Text;
               if NoPartialCheckBox.Checked then
                  BrowseTable.FilterOptions:=BrowseTable.FilterOptions+[foNoPartialCompare]
               else
                  BrowseTable.FilterOptions:=BrowseTable.FilterOptions-[foNoPartialCompare];
               if CaseInsensitiveCheckBox.Checked then
                  BrowseTable.FilterOptions:=BrowseTable.FilterOptions+[foCaseInsensitive]
               else
                  BrowseTable.FilterOptions:=BrowseTable.FilterOptions-[foCaseInsensitive];
               BrowseTable.FindFirst;
            except
               on E: Exception do
                  begin
                  MessageDlg(E.Message,mtError,[mbOk],0);
                  FilterExpressionMemo.SetFocus;
                  Exit;
                  end;
            end;
         finally
            Screen.Cursor:=crDefault;
         end;
         end;
      end
   else if (MainForm.ActiveMDIChild is TQueryForm) then
      begin
      with TQueryForm(MainForm.ActiveMDIChild) do
         begin
         Screen.Cursor:=crHourGlass;
         try
            try
               InteractiveQuery.Filter:=FilterExpressionMemo.Text;
               if NoPartialCheckBox.Checked then
                  InteractiveQuery.FilterOptions:=InteractiveQuery.FilterOptions+[foNoPartialCompare]
               else
                  InteractiveQuery.FilterOptions:=InteractiveQuery.FilterOptions-[foNoPartialCompare];
               if CaseInsensitiveCheckBox.Checked then
                  InteractiveQuery.FilterOptions:=InteractiveQuery.FilterOptions+[foCaseInsensitive]
               else
                  InteractiveQuery.FilterOptions:=InteractiveQuery.FilterOptions-[foCaseInsensitive];
               InteractiveQuery.FindFirst;
            except
               on E: Exception do
                  begin
                  MessageDlg(E.Message,mtError,[mbOk],0);
                  FilterExpressionMemo.SetFocus;
                  Exit;
                  end;
            end;
         finally
            Screen.Cursor:=crDefault;
         end;
         end;
      end;
   Close;
end;

procedure TFindDlg.AddAvailableFields;
var
   I: Integer;
   J: Integer;
   TempFieldName: string;
   TempFieldPos: Integer;
   KeyFields: string;
   TempField: TField;
begin
   AvailableFieldsList.Items.Clear;
   if (MainForm.ActiveMDIChild is TBrowseForm) then
      begin
      with TBrowseForm(MainForm.ActiveMDIChild) do
         begin
         BrowseTable.GetFieldNames(AvailableFieldsList.Items);
         BrowseTable.IndexDefs.Update;
         for I:=0 to BrowseTable.IndexDefs.Count-1 do
            begin
            KeyFields:=BrowseTable.IndexDefs[I].Fields;
            if (KeyFields <> '') then
               begin
               J:=1;
               TempFieldName:=ExtractFieldName(KeyFields,J);
               TempField:=BrowseTable.FindField(TempFieldName);
               if (TempField <> nil) then
                  begin
                  if (TempField.DataType=ftString) then
                     begin
                     if ((not (ixCaseInsensitive in BrowseTable.IndexDefs[I].Options)) and
                         (not CaseInsensitiveCheckBox.Checked)) or
                        ((ixCaseInsensitive in BrowseTable.IndexDefs[I].Options) and
                          CaseInsensitiveCheckBox.Checked) then
                        begin
                        TempFieldPos:=AvailableFieldsList.Items.IndexOf(TempFieldName);
                        if (TempFieldPos <> -1) then
                           AvailableFieldsList.Items[TempFieldPos]:=
                                          AvailableFieldsList.Items[TempFieldPos]+'  (Optimized)';
                        end;
                     end
                  else
                     begin
                     TempFieldPos:=AvailableFieldsList.Items.IndexOf(TempFieldName);
                     if (TempFieldPos <> -1) then
                        AvailableFieldsList.Items[TempFieldPos]:=
                                       AvailableFieldsList.Items[TempFieldPos]+'  (Optimized)';
                     end;
                  end;
               end;
            end;
         end;
      end
   else if (MainForm.ActiveMDIChild is TQueryForm) then
      begin
      with TQueryForm(MainForm.ActiveMDIChild) do
         InteractiveQuery.GetFieldNames(AvailableFieldsList.Items);
      end;
end;

procedure TFindDlg.NextBtnClick(Sender: TObject);
begin
   if (MainForm.ActiveMDIChild is TBrowseForm) then
      begin
      with TBrowseForm(MainForm.ActiveMDIChild) do
         begin
         Screen.Cursor:=crHourGlass;
         try
            BrowseTable.FindNext;
         finally
            Screen.Cursor:=crDefault;
         end;
         end;
      end
   else if (MainForm.ActiveMDIChild is TQueryForm) then
      begin
      with TQueryForm(MainForm.ActiveMDIChild) do
         begin
         Screen.Cursor:=crHourGlass;
         try
            InteractiveQuery.FindNext;
         finally
            Screen.Cursor:=crDefault;
         end;
         end;
      end;
   Close;
end;

procedure TFindDlg.LastBtnClick(Sender: TObject);
begin
   if (MainForm.ActiveMDIChild is TBrowseForm) then
      begin
      with TBrowseForm(MainForm.ActiveMDIChild) do
         begin
         Screen.Cursor:=crHourGlass;
         try
            try
               BrowseTable.Filter:=FilterExpressionMemo.Text;
               if NoPartialCheckBox.Checked then
                  BrowseTable.FilterOptions:=BrowseTable.FilterOptions+[foNoPartialCompare]
               else
                  BrowseTable.FilterOptions:=BrowseTable.FilterOptions-[foNoPartialCompare];
               if CaseInsensitiveCheckBox.Checked then
                  BrowseTable.FilterOptions:=BrowseTable.FilterOptions+[foCaseInsensitive]
               else
                  BrowseTable.FilterOptions:=BrowseTable.FilterOptions-[foCaseInsensitive];
               BrowseTable.FindLast;
            except
               on E: Exception do
                  begin
                  MessageDlg(E.Message,mtError,[mbOk],0);
                  FilterExpressionMemo.SetFocus;
                  Exit;
                  end;
            end;
         finally
            Screen.Cursor:=crDefault;
         end;
         end;
      end
   else if (MainForm.ActiveMDIChild is TQueryForm) then
      begin
      with TQueryForm(MainForm.ActiveMDIChild) do
         begin
         Screen.Cursor:=crHourGlass;
         try
            try
               InteractiveQuery.Filter:=FilterExpressionMemo.Text;
               if NoPartialCheckBox.Checked then
                  InteractiveQuery.FilterOptions:=InteractiveQuery.FilterOptions+[foNoPartialCompare]
               else
                  InteractiveQuery.FilterOptions:=InteractiveQuery.FilterOptions-[foNoPartialCompare];
               if CaseInsensitiveCheckBox.Checked then
                  InteractiveQuery.FilterOptions:=InteractiveQuery.FilterOptions+[foCaseInsensitive]
               else
                  InteractiveQuery.FilterOptions:=InteractiveQuery.FilterOptions-[foCaseInsensitive];
               InteractiveQuery.FindLast;
            except
               on E: Exception do
                  begin
                  MessageDlg(E.Message,mtError,[mbOk],0);
                  FilterExpressionMemo.SetFocus;
                  Exit;
                  end;
            end;
         finally
            Screen.Cursor:=crDefault;
         end;
         end;
      end;
   Close;
end;

procedure TFindDlg.CaseInsensitiveCheckBoxClick(Sender: TObject);
begin
   AddAvailableFields;
end;

procedure TFindDlg.CancelBtnClick(Sender: TObject);
begin
   Close;
end;

end.
