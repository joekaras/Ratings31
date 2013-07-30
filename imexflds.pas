unit imexflds;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
     Buttons, ExtCtrls;

type
  TImportExportFldsDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    IncludeBtn: TButton;
    IncAllBtn: TButton;
    ExcludeBtn: TButton;
    ExAllBtn: TButton;
    GroupBox1: TGroupBox;
    AvailableListBox: TListBox;
    GroupBox2: TGroupBox;
    SelectedListBox: TListBox;
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
    procedure SelectedListBoxDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure SelectedListBoxDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure AvailableListBoxDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ImportExportFldsDlg: TImportExportFldsDlg;

implementation

uses main, browse;

{$R *.DFM}

procedure TImportExportFldsDlg.IncludeBtnClick(Sender: TObject);
var
   Index: Integer;
begin
   Index:=GetFirstSelection(AvailableListBox);
   MoveSelected(AvailableListBox,SelectedListBox.Items,-1);
   SetItem(AvailableListBox, Index);
end;

procedure TImportExportFldsDlg.ExcludeBtnClick(Sender: TObject);
var
   Index: Integer;
begin
   Index:=GetFirstSelection(SelectedListBox);
   MoveSelected(SelectedListBox,AvailableListBox.Items,-1);
   SetItem(SelectedListBox, Index);
end;

procedure TImportExportFldsDlg.IncAllBtnClick(Sender: TObject);
var
   I: Integer;
begin
   for I:=0 to AvailableListBox.Items.Count - 1 do
      SelectedListBox.Items.AddObject(AvailableListBox.Items[I],
                                     AvailableListBox.Items.Objects[I]);
   AvailableListBox.Items.Clear;
   SetItem(AvailableListBox, 0);
end;

procedure TImportExportFldsDlg.ExcAllBtnClick(Sender: TObject);
var
   I: Integer;
begin
   for I:=0 to SelectedListBox.Items.Count - 1 do
      AvailableListBox.Items.AddObject(SelectedListBox.Items[I],
                                       SelectedListBox.Items.Objects[I]);
   SelectedListBox.Items.Clear;
   SetItem(SelectedListBox, 0);
end;

procedure TImportExportFldsDlg.MoveSelected(List: TCustomListBox;
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

procedure TImportExportFldsDlg.SetButtons;
var
   SrcEmpty: Boolean;
   DstEmpty: Boolean;
begin
   SrcEmpty:=AvailableListBox.Items.Count = 0;
   DstEmpty:=SelectedListBox.Items.Count = 0;
   IncludeBtn.Enabled:=not SrcEmpty;
   IncAllBtn.Enabled:=not SrcEmpty;
   ExcludeBtn.Enabled:=not DstEmpty;
   ExAllBtn.Enabled:=not DstEmpty;
end;

function TImportExportFldsDlg.GetFirstSelection(List: TCustomListBox): Integer;
begin
   for Result:=0 to List.Items.Count - 1 do
      begin
      if List.Selected[Result] then
         Exit;
      end;
   Result:=LB_ERR;
end;

procedure TImportExportFldsDlg.SetItem(List: TListBox; Index: Integer);
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

procedure TImportExportFldsDlg.FormShow(Sender: TObject);
begin
   AvailableListBox.ItemIndex:=0;
   SelectedListBox.ItemIndex:=0;
   SetButtons;
   ActiveControl:=AvailableListBox;
end;

procedure TImportExportFldsDlg.SelectedListBoxDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=False;
   if (Source=SelectedListBox) or (Source=AvailableListBox) then
      Accept:=True;
end;

procedure TImportExportFldsDlg.SelectedListBoxDragDrop(Sender, Source: TObject;
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

procedure TImportExportFldsDlg.AvailableListBoxDragOver(Sender,
  Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=False;
   if (Source=SelectedListBox) or (Source=AvailableListBox) then
      Accept:=True;
end;

end.
