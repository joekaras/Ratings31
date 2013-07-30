unit option;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Mask, DBCtrls, ExtCtrls;


type
  TOptionsDlg = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    OptionsPageControl: TPageControl;
    RemoteSheet: TTabSheet;
    GroupBox6: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    HostNameEdit: TEdit;
    PortEdit: TEdit;
    IPAddressEdit: TEdit;
    ServiceEdit: TEdit;
    EnableTracingCheckbox: TCheckBox;
    ViewTraceLogButton: TButton;
    CompressionTrackBar: TTrackBar;
    Bevel4: TBevel;
    EnablePingingCheckBox: TCheckBox;
    PingIntervalEdit: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel7: TBevel;
    Label19: TLabel;
    TimeoutEdit: TEdit;
    Label20: TLabel;
    procedure FormShow(Sender: TObject);
    procedure LockRetryCountEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure MaintainLocalButtonClick(Sender: TObject);
    procedure ViewTraceLogButtonClick(Sender: TObject);
    procedure MaintainRemoteButtonClick(Sender: TObject);
    procedure EnablePingingCheckBoxClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OptionsDlg: TOptionsDlg;

implementation

uses FileCtrl, DB, main, tracedsp, dbisamtb, dbisamcn;

{$R *.DFM}

procedure TOptionsDlg.FormShow(Sender: TObject);
begin
   EnablePingingCheckBoxClick(nil);
   OptionsPageControl.ActivePage:=RemoteSheet;
   ActiveControl:=IPAddressEdit;
end;

procedure TOptionsDlg.LockRetryCountEditKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (Key in ['0'..'9',#8,#13]) then
      Key:=#0;
end;

procedure TOptionsDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose:=True;
   if (not Self.Visible) then
      Exit;
   if (ModalResult=mrOk) then
      begin
      if (HostNameEdit.Text='') and (IPAddressEdit.Text='') then
         begin
         MessageDlg('You must specify a host name or IP address for a remote connection',mtError,[mbOK],0);
         CanClose:=False;
         Exit;
         end;
      if (PortEdit.Text='') and (ServiceEdit.Text='') then
         begin
         MessageDlg('You must specify a port or service for a remote connection',mtError,[mbOK],0);
         CanClose:=False;
         Exit;
         end;
      if (StrToInt(PortEdit.Text) < 0) or
         (StrToInt(PortEdit.Text) > High(Word)) then
         begin
         MessageDlg('The port must be between 0 and '+IntToStr(High(Word)),mtError,[mbOK],0);
         CanClose:=False;
         Exit;
         end;
      if (StrToInt(PingIntervalEdit.Text) < 0) or
         (StrToInt(PingIntervalEdit.Text) > High(Word)) then
         begin
         MessageDlg('The ping interval must be between '+IntToStr(MIN_PING)+' and '+IntToStr(High(Word)),mtError,[mbOK],0);
         CanClose:=False;
         Exit;
         end;
      if (StrToInt(TimeoutEdit.Text) < 0) or
         (StrToInt(TimeoutEdit.Text) > High(Word)) then
         begin
         MessageDlg('The timeout must be between '+IntToStr(MIN_TIMEOUT)+' and '+IntToStr(High(Word)),mtError,[mbOK],0);
         CanClose:=False;
         Exit;
         end;
      end;
end;

procedure TOptionsDlg.MaintainLocalButtonClick(Sender: TObject);
begin
   Session.GetPassword;
end;

procedure TOptionsDlg.ViewTraceLogButtonClick(Sender: TObject);
var
   WasTracing: Boolean;
begin
   WasTracing:=MainForm.RemoteSession.RemoteTrace;
   MainForm.RemoteSession.RemoteTrace:=False;
   try
      MainForm.CloseLogFile;
      try
         with TraceLogDlg do
            begin
            TraceMessagesListBox.Items.Clear;
            if FileExists(MainForm.LogFileName) then
               TraceMessagesListBox.Items.LoadFromFile(MainForm.LogFileName);
            ShowModal;
            end;
      finally
         MainForm.OpenLogFile;
      end;
   finally
      MainForm.RemoteSession.RemoteTrace:=WasTracing;
   end;
end;

procedure TOptionsDlg.MaintainRemoteButtonClick(Sender: TObject);
begin
   MainForm.RemoteSession.GetPassword;
end;

procedure TOptionsDlg.EnablePingingCheckBoxClick(Sender: TObject);
begin
   if (not EnablePingingCheckBox.Checked) then
      begin
      PingIntervalEdit.Color:=clBtnFace;
      PingIntervalEdit.TabStop:=False;
      PingIntervalEdit.ReadOnly:=True;
      end
   else
      begin
      PingIntervalEdit.Color:=clWindow;
      PingIntervalEdit.TabStop:=True;
      PingIntervalEdit.ReadOnly:=False;
      end;
end;

end.
