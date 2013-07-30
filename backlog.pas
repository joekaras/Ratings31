unit BackLog;

interface

uses Windows, Messages, Classes, Graphics, Forms, Controls, Buttons,
     StdCtrls, Dialogs;

type
  TBackupLogDlg = class(TForm)
    CloseBtn: TButton;
    BackupGroupBox: TGroupBox;
    SaveDialog: TSaveDialog;
    SaveButton: TButton;
    BackupLogListBox: TListBox;
    procedure FormShow(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BackupLogDlg: TBackupLogDlg;

implementation

uses SysUtils, Main, dbisamut;

{$R *.DFM}

procedure TBackupLogDlg.FormShow(Sender: TObject);
begin
   BackupLogListBox.ItemIndex:=0;
   ActiveControl:=BackupLogListBox;
end;

procedure TBackupLogDlg.SaveButtonClick(Sender: TObject);
begin
   SaveDialog.InitialDir:=MainForm.AppSessionSettings.FileDirectory;
   if SaveDialog.Execute then
      begin
      MainForm.AppSessionSettings.FileDirectory:=ExtractFilePath(SaveDialog.FileName);
      BackupLogListBox.Items.SaveToFile(SaveDialog.FileName);
      end;
end;

procedure TBackupLogDlg.FormCreate(Sender: TObject);
var
   LogWidth: Integer;
begin
   LogWidth:=BackupLogListBox.Canvas.TextWidth(Replicate('0',512));
   SendMessage(BackupLogListBox.Handle,LB_SETHORIZONTALEXTENT,LogWidth,0);
end;

end.
