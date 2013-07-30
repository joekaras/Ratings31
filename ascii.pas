unit ascii;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
     Buttons, ExtCtrls;

type
  TSelectASCIIValueDlg = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    ASCIIValuesGroupBox: TGroupBox;
    ASCIIValuesListBox: TListBox;
    procedure ASCIIValuesListBoxClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ASCIIValuesListBoxDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectASCIIValueDlg: TSelectASCIIValueDlg;

implementation

uses main, dbisamut;

{$R *.DFM}

procedure TSelectASCIIValueDlg.ASCIIValuesListBoxClick(Sender: TObject);
begin
   if ASCIIValuesListBox.ItemIndex <> -1 then
      OKButton.Enabled:=True
   else
      OKButton.Enabled:=False;
end;

procedure TSelectASCIIValueDlg.FormShow(Sender: TObject);
begin
   ASCIIValuesListBox.ItemIndex:=0;
   ActiveControl:=ASCIIValuesListBox;
end;

procedure TSelectASCIIValueDlg.FormCreate(Sender: TObject);
var
   I: Byte;
begin
   with ASCIIValuesListBox.Items do
      begin
      Clear;
      for I:=1 to High(Byte) do
         Add('  '+PadRight(IntToStr(I),3,' ')+'  '+Chr(Byte(I))+'  '+IntToHex(I,2));
      end;
end;

procedure TSelectASCIIValueDlg.ASCIIValuesListBoxDblClick(Sender: TObject);
begin
   ModalResult:=mrOk;
end;

end.
