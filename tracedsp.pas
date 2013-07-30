unit tracedsp;

interface

uses Windows, Messages, Classes, Graphics, Forms, Controls, Buttons,
     StdCtrls, Dialogs;

type
  TTraceLogDlg = class(TForm)
    CloseBtn: TButton;
    GroupBox1: TGroupBox;
    TraceMessagesListBox: TListBox;
    ClearTraceLogButton: TButton;
    SaveDialog: TSaveDialog;
    SaveButton: TButton;
    procedure FormShow(Sender: TObject);
    procedure ClearTraceLogButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TraceLogDlg: TTraceLogDlg;

implementation

uses SysUtils, main, dbisamlb;

{$R *.DFM}

procedure TTraceLogDlg.FormShow(Sender: TObject);
begin
   TraceMessagesListBox.ItemIndex:=0;
   ActiveControl:=TraceMessagesListBox;
end;

procedure TTraceLogDlg.ClearTraceLogButtonClick(Sender: TObject);
begin
   if (MessageDlg('Are you sure you want to clear the current trace log '+
                  'messages ?',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
      begin
      TraceMessagesListBox.Items.Clear;
      TraceMessagesListBox.Items.SaveToFile(MainForm.LogFileName);
      end;
end;

procedure TTraceLogDlg.FormCreate(Sender: TObject);
var
   TraceMessageWidth: Integer;
begin
   TraceMessageWidth:=TraceMessagesListBox.Canvas.TextWidth(Replicate('0',512));
   SendMessage(TraceMessagesListBox.Handle,LB_SETHORIZONTALEXTENT,TraceMessageWidth,0);
end;

procedure TTraceLogDlg.SaveButtonClick(Sender: TObject);
begin
   SaveDialog.InitialDir:=MainForm.AppDirectory;
   if SaveDialog.Execute then
      TraceMessagesListBox.Items.SaveToFile(SaveDialog.FileName);
end;

end.
