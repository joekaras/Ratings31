unit upglog;

interface

uses Windows, Messages, Classes, Graphics, Forms, Controls, Buttons,
     StdCtrls, Dialogs;

type
  TUpgradeLogDlg = class(TForm)
    CloseBtn: TButton;
    GroupBox1: TGroupBox;
    SaveDialog: TSaveDialog;
    SaveButton: TButton;
    UpgradeLogListBox: TListBox;
    procedure FormShow(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpgradeLogDlg: TUpgradeLogDlg;

implementation

uses SysUtils, main, dbisamut;

{$R *.DFM}

procedure TUpgradeLogDlg.FormShow(Sender: TObject);
begin
   UpgradeLogListBox.ItemIndex:=0;
   ActiveControl:=UpgradeLogListBox;
end;

procedure TUpgradeLogDlg.SaveButtonClick(Sender: TObject);
begin
   SaveDialog.InitialDir:=MainForm.AppSessionSettings.FileDirectory;
   if SaveDialog.Execute then
      begin
      MainForm.AppSessionSettings.FileDirectory:=ExtractFilePath(SaveDialog.FileName);
      UpgradeLogListBox.Items.SaveToFile(SaveDialog.FileName);
      end;
end;

procedure TUpgradeLogDlg.FormCreate(Sender: TObject);
var
   LogWidth: Integer;
begin
   LogWidth:=UpgradeLogListBox.Canvas.TextWidth(Replicate('0',512));
   SendMessage(UpgradeLogListBox.Handle,LB_SETHORIZONTALEXTENT,LogWidth,0);
end;

end.
