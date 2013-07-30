unit gotorec;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TGotoRecordDlg = class(TForm)
    GroupBox1: TGroupBox;
    RecordNumberEdit: TEdit;
    Label1: TLabel;
    OKBtn: TButton;
    CancelBtn: TButton;
    procedure FormShow(Sender: TObject);
    procedure RecordNumberEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GotoRecordDlg: TGotoRecordDlg;

implementation

{$R *.DFM}

procedure TGotoRecordDlg.FormShow(Sender: TObject);
begin
   RecordNumberEdit.Text:='';
   ActiveControl:=RecordNumberEdit;
end;

procedure TGotoRecordDlg.RecordNumberEditKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (Key in ['0'..'9',#8,#13]) then
      Key:=#0;
end;

end.
