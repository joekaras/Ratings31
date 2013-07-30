unit genopt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TReverseEngineerOptionsDlg = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    GroupBox2: TGroupBox;
    DelphiRadioButton: TRadioButton;
    CBuilder5RadioButton: TRadioButton;
    GroupBox3: TGroupBox;
    AddExistingDataCheckBox: TCheckBox;
    SQLRadioButton: TRadioButton;
    CBuilder6RadioButton: TRadioButton;
    HardCodeDatabaseNameCheckBox: TCheckBox;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReverseEngineerOptionsDlg: TReverseEngineerOptionsDlg;

implementation

uses main, dbisamut;

{$R *.DFM}

procedure TReverseEngineerOptionsDlg.FormShow(Sender: TObject);
begin
   ActiveControl:=HardCodeDatabaseNameCheckBox;
end;

end.
