unit prtbtnopt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TPrintOptionsDlg = class(TForm)
    PrintButton: TButton;
    CancelButton: TButton;
    OptionsRadioGroup: TRadioGroup;
    OutputRadioGroup: TRadioGroup;
    SetupButton: TButton;
    PrintDialog: TPrintDialog;
    ShowDetailsCheckBox: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure SetupButtonClick(Sender: TObject);
    procedure OutputRadioGroupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintOptionsDlg: TPrintOptionsDlg;

implementation

uses main, query;

{$R *.DFM}

procedure TPrintOptionsDlg.FormShow(Sender: TObject);
begin
   if (MainForm.ActiveMDIChild is TQueryForm) and
      (MainForm.MDIChildCount=1) then
      begin
      OutputRadioGroup.ItemIndex:=1;
      OutputRadioGroup.Enabled:=False;
      ShowDetailsCheckBox.Enabled:=False;
      OptionsRadioGroup.ItemIndex:=0;
      OptionsRadioGroup.Enabled:=False;
      ActiveControl:=PrintButton;
      end
   else
      begin
      OutputRadioGroup.ItemIndex:=0;
      OutputRadioGroup.Enabled:=True;
      ShowDetailsCheckBox.Enabled:=True;
      OptionsRadioGroup.ItemIndex:=0;
      OptionsRadioGroup.Enabled:=True;
      ActiveControl:=OutputRadioGroup;
      end;
end;

procedure TPrintOptionsDlg.SetupButtonClick(Sender: TObject);
begin
   PrintDialog.Execute;
end;

procedure TPrintOptionsDlg.OutputRadioGroupClick(Sender: TObject);
begin
   if (OutputRadioGroup.ItemIndex=0) then
      ShowDetailsCheckBox.Enabled:=True
   else
      ShowDetailsCheckBox.Enabled:=False;   
end;

end.
