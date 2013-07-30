unit verdsp;

interface

uses Windows, Messages, Classes, Graphics, Forms, Controls, Buttons,
     StdCtrls, Dialogs;

type
  TVersionDlg = class(TForm)
    CloseBtn: TButton;
    GroupBox1: TGroupBox;
    SaveDialog: TSaveDialog;
    SaveButton: TButton;
    VersionInfoListBox: TListBox;
    procedure FormShow(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VersionDlg: TVersionDlg;

implementation

uses SysUtils, main, dbisamut;

{$R *.DFM}

procedure TVersionDlg.FormShow(Sender: TObject);
begin
   VersionInfoListBox.ItemIndex:=0;
   ActiveControl:=VersionInfoListBox;
end;

procedure TVersionDlg.SaveButtonClick(Sender: TObject);
begin
   if SaveDialog.Execute then
      VersionInfoListBox.Items.SaveToFile(SaveDialog.FileName);
end;

end.
