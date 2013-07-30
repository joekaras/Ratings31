unit replog;

interface

uses Windows, Messages, Classes, Graphics, Forms, Controls, Buttons,
     StdCtrls, Dialogs;

type
  TRepairLogDlg = class(TForm)
    CloseBtn: TButton;
    RepairGroupBox: TGroupBox;
    SaveDialog: TSaveDialog;
    SaveButton: TButton;
    RepairLogListBox: TListBox;
    procedure FormShow(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RepairLogDlg: TRepairLogDlg;

implementation

uses SysUtils, main, dbisamut;

{$R *.DFM}

procedure TRepairLogDlg.FormShow(Sender: TObject);
begin
   RepairLogListBox.ItemIndex:=0;
   ActiveControl:=RepairLogListBox;
end;

procedure TRepairLogDlg.SaveButtonClick(Sender: TObject);
begin
   SaveDialog.InitialDir:=MainForm.AppSessionSettings.FileDirectory;
   if SaveDialog.Execute then
      begin
      MainForm.AppSessionSettings.FileDirectory:=ExtractFilePath(SaveDialog.FileName);
      RepairLogListBox.Items.SaveToFile(SaveDialog.FileName);
      end;
end;

procedure TRepairLogDlg.FormCreate(Sender: TObject);
var
   LogWidth: Integer;
begin
   LogWidth:=RepairLogListBox.Canvas.TextWidth(Replicate('0',512));
   SendMessage(RepairLogListBox.Handle,LB_SETHORIZONTALEXTENT,LogWidth,0);
end;

end.
