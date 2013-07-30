unit visible;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
     Buttons, ExtCtrls, dbisamtb;

type
  TVisibleFieldsDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    IncludeBtn: TButton;
    IncAllBtn: TButton;
    ExcludeBtn: TButton;
    ExAllBtn: TButton;
    GroupBox1: TGroupBox;
    AvailableListBox: TListBox;
    GroupBox2: TGroupBox;
    VisibleListBox: TListBox;
    Bevel1: TBevel;
    DefaultButton: TButton;
    procedure IncludeBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExcAllBtnClick(Sender: TObject);
    procedure MoveSelected(List: TCustomListBox; Items: TStrings; MoveIndex: Integer);
    procedure SetItem(List: TListBox; Index: Integer);
    function GetFirstSelection(List: TCustomListBox): Integer;
    procedure SetButtons;
    procedure FormShow(Sender: TObject);
    procedure VisibleListBoxDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure VisibleListBoxDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure AvailableListBoxDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DefaultButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    CurDataSet: TDBISAMDataSet;
  end;

var
  VisibleFieldsDlg: TVisibleFieldsDlg;

implementation

uses main;

{$R *.DFM}

procedure TVisibleFieldsDlg.IncludeBtnClick(Sender: TObject);
var
   Index: Integer;
begin
   Index:=GetFirstSelection(AvailableListBox);
   MoveSelected(AvailableListBox,VisibleListBox.Items,-1);
   SetItem(AvailableListBox, Index);
end;

procedure TVisibleFieldsDlg.ExcludeBtnClick(Sender: TObject);
var
   Index: Integer;
begin
   Index:=GetFirstSelection(VisibleListBox);
   MoveSelected(VisibleListBox,AvailableListBox.Items,-1);
   SetItem(VisibleListBox, Index);
end;

procedure TVisibleFieldsDlg.IncAllBtnClick(Sender: TObject);
var
   I: Integer;
begin
   for I:=0 to AvailableListBox.Items.Count - 1 do
      VisibleListBox.Items.AddObject(AvailableListBox.Items[I],
                                     AvailableListBox.Items.Objects[I]);
   AvailableListBox.Items.Clear;
   SetItem(AvailableListBox, 0);
end;

procedure TVisibleFieldsDlg.ExcAllBtnClick(Sender: TObject);
var
   I: Integer;
begin
   for I:=0 to VisibleListBox.Items.Count - 1 do
      AvailableListBox.Items.AddObject(VisibleListBox.Items[I],
                                       VisibleListBox.Items.Objects[I]);
   VisibleListBox.Items.Clear;
   SetItem(VisibleListBox, 0);
end;

procedure TVisibleFieldsDlg.MoveSelected(List: TCustomListBox;
                                         Items: TStrings; MoveIndex: Integer);
var
  I: Integer;
  TempStrings: TStrings;
begin
  TempStrings:=TStringList.Create;
  try
      for I:=0 to List.Items.Count-1 do
        if List.Selected[I] then
          TempStrings.AddObject(List.Items[I], List.Items.Objects[I]);
      for I:=List.Items.Count-1 downto 0 do
          begin
         if List.Selected[I] then
           List.Items.Delete(I);
         end;
      for I:=0 to TempStrings.Count-1 do
         begin
         if (MoveIndex=-1) then
            Items.AddObject(TempStrings[I],TempStrings.Objects[I])
         else
            Items.InsertObject(MoveIndex, TempStrings[I], TempStrings.Objects[I]);
         if (MoveIndex <> -1) then
            Inc(MoveIndex);
         end;
   finally
      TempStrings.Free;
   end;
end;

procedure TVisibleFieldsDlg.SetButtons;
var
   SrcEmpty: Boolean;
   DstEmpty: Boolean;
begin
   SrcEmpty:=AvailableListBox.Items.Count = 0;
   DstEmpty:=VisibleListBox.Items.Count = 0;
   IncludeBtn.Enabled:=not SrcEmpty;
   IncAllBtn.Enabled:=not SrcEmpty;
   ExcludeBtn.Enabled:=not DstEmpty;
   ExAllBtn.Enabled:=not DstEmpty;
end;

function TVisibleFieldsDlg.GetFirstSelection(List: TCustomListBox): Integer;
begin
   for Result:=0 to List.Items.Count - 1 do
      begin
      if List.Selected[Result] then
         Exit;
      end;
   Result:=LB_ERR;
end;

procedure TVisibleFieldsDlg.SetItem(List: TListBox; Index: Integer);
var
   MaxIndex: Integer;
begin
   with List do
      begin
      SetFocus;
      if (List.Items.Count > 0) then
         begin
         MaxIndex:=List.Items.Count - 1;
         if Index = LB_ERR then
            Index:=0
         else if Index > MaxIndex then
            Index:=MaxIndex;
         Selected[Index]:=True;
         end;
      end;
   SetButtons;
end;

procedure TVisibleFieldsDlg.FormShow(Sender: TObject);
var
   I: Integer;
begin
   AvailableListBox.Items.Clear;
   VisibleListBox.Items.Clear;
   with CurDataSet do
      begin
      for I:=0 to FieldCount-1 do
         begin
         if Fields[I].Visible then
            VisibleListBox.Items.Add(Fields[I].FieldName)
         else
            AvailableListBox.Items.Add(Fields[I].FieldName);
         end;
      end;
   AvailableListBox.ItemIndex:=0;
   VisibleListBox.ItemIndex:=0;
   ActiveControl:=AvailableListBox;
   SetButtons;
end;

procedure TVisibleFieldsDlg.VisibleListBoxDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=False;
   if (Source=VisibleListBox) or (Source=AvailableListBox) then
      Accept:=True;
end;

procedure TVisibleFieldsDlg.VisibleListBoxDragDrop(Sender, Source: TObject;
  X, Y: Integer);
var
   CurPoint: TPoint;
   CurItemPos: Integer;
begin
   CurPoint.X:=X;
   CurPoint.Y:=Y;
   CurItemPos:=TListBox(Sender).ItemAtPos(CurPoint,True);
   MoveSelected(TListBox(Source),TListBox(Sender).Items,CurItemPos);
   SetItem(TListBox(Source),CurItemPos);
end;

procedure TVisibleFieldsDlg.AvailableListBoxDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=False;
   if (Source=VisibleListBox) or (Source=AvailableListBox) then
      Accept:=True;
end;

procedure TVisibleFieldsDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
   I: Integer;
begin
   CanClose:=True;
   if (not Self.Visible) then
      Exit;
   if (ModalResult=mrOk) then
      begin
      with CurDataSet do
         begin
         DisableControls;
         try
            for I:=0 to AvailableListBox.Items.Count-1 do
               FieldByName(AvailableListBox.Items[I]).Visible:=False;
            for I:=0 to VisibleListBox.Items.Count-1 do
               begin
               FieldByName(VisibleListBox.Items[I]).Index:=I;
               FieldByName(VisibleListBox.Items[I]).Visible:=True;
               end;
         finally
            EnableControls;
         end;
         end;
      end;
end;

procedure TVisibleFieldsDlg.DefaultButtonClick(Sender: TObject);
var
   I: Integer;
begin
   AvailableListBox.Items.Clear;
   VisibleListBox.Items.Clear;
   with CurDataSet do
      begin
      DisableControls;
      try
         FieldDefs.Update;
         for I:=0 to FieldDefs.Count-1 do
            VisibleListBox.Items.Add(FieldDefs[I].Name);
      finally
         EnableControls;
      end;
      end;
   AvailableListBox.ItemIndex:=0;
   VisibleListBox.ItemIndex:=0;
   ActiveControl:=AvailableListBox;
   SetButtons;
end;

end.
