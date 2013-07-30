unit keyflds;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
     Buttons, ExtCtrls;

type
  TKeyFieldsDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    IncludeBtn: TButton;
    IncAllBtn: TButton;
    ExcludeBtn: TButton;
    ExAllBtn: TButton;
    GroupBox1: TGroupBox;
    AvailableListBox: TListBox;
    GroupBox2: TGroupBox;
    KeyListBox: TListBox;
    Bevel1: TBevel;
    procedure IncludeBtnClick(Sender: TObject);
    procedure ExcludeBtnClick(Sender: TObject);
    procedure IncAllBtnClick(Sender: TObject);
    procedure ExcAllBtnClick(Sender: TObject);
    procedure MoveSelected(List: TCustomListBox; Items: TStrings; MoveIndex: Integer);
    procedure SetItem(List: TListBox; Index: Integer);
    function GetFirstSelection(List: TCustomListBox): Integer;
    procedure SetButtons;
    procedure FormShow(Sender: TObject);
    procedure KeyListBoxDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure KeyListBoxDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure AvailableListBoxDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KeyFieldsDlg: TKeyFieldsDlg;

implementation

uses main, browse;

{$R *.DFM}

procedure TKeyFieldsDlg.IncludeBtnClick(Sender: TObject);
var
   Index: Integer;
begin
   Index:=GetFirstSelection(AvailableListBox);
   MoveSelected(AvailableListBox,KeyListBox.Items,-1);
   SetItem(AvailableListBox, Index);
end;

procedure TKeyFieldsDlg.ExcludeBtnClick(Sender: TObject);
var
   Index: Integer;
begin
   Index:=GetFirstSelection(KeyListBox);
   MoveSelected(KeyListBox,AvailableListBox.Items,-1);
   SetItem(KeyListBox, Index);
end;

procedure TKeyFieldsDlg.IncAllBtnClick(Sender: TObject);
var
   I: Integer;
begin
   for I:=0 to AvailableListBox.Items.Count - 1 do
      KeyListBox.Items.AddObject(AvailableListBox.Items[I],
                                     AvailableListBox.Items.Objects[I]);
   AvailableListBox.Items.Clear;
   SetItem(AvailableListBox, 0);
end;

procedure TKeyFieldsDlg.ExcAllBtnClick(Sender: TObject);
var
   I: Integer;
begin
   for I:=0 to KeyListBox.Items.Count - 1 do
      AvailableListBox.Items.AddObject(KeyListBox.Items[I],
                                       KeyListBox.Items.Objects[I]);
   KeyListBox.Items.Clear;
   SetItem(KeyListBox, 0);
end;

procedure TKeyFieldsDlg.MoveSelected(List: TCustomListBox;
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

procedure TKeyFieldsDlg.SetButtons;
var
   SrcEmpty: Boolean;
   DstEmpty: Boolean;
begin
   SrcEmpty:=AvailableListBox.Items.Count = 0;
   DstEmpty:=KeyListBox.Items.Count = 0;
   IncludeBtn.Enabled:=not SrcEmpty;
   IncAllBtn.Enabled:=not SrcEmpty;
   ExcludeBtn.Enabled:=not DstEmpty;
   ExAllBtn.Enabled:=not DstEmpty;
end;

function TKeyFieldsDlg.GetFirstSelection(List: TCustomListBox): Integer;
begin
   for Result:=0 to List.Items.Count - 1 do
      begin
      if List.Selected[Result] then
         Exit;
      end;
   Result:=LB_ERR;
end;

procedure TKeyFieldsDlg.SetItem(List: TListBox; Index: Integer);
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

procedure TKeyFieldsDlg.FormShow(Sender: TObject);
begin
   AvailableListBox.ItemIndex:=0;
   KeyListBox.ItemIndex:=0;
   SetButtons;
   ActiveControl:=AvailableListBox;
end;

procedure TKeyFieldsDlg.KeyListBoxDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=False;
   if (Source=KeyListBox) or (Source=AvailableListBox) then
      Accept:=True;
end;

procedure TKeyFieldsDlg.KeyListBoxDragDrop(Sender, Source: TObject;
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

procedure TKeyFieldsDlg.AvailableListBoxDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=False;
   if (Source=KeyListBox) or (Source=AvailableListBox) then
      Accept:=True;
end;

end.
