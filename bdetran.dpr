program bdetran;

uses
  dbisammm,
  Windows,
  Forms,
  main in 'main.pas' {MainForm},
  about in 'about.pas' {AboutBox},
  option in 'option.pas' {OptionsDlg},
  tracedsp in 'tracedsp.pas' {TraceLogDlg};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TOptionsDlg, OptionsDlg);
  Application.CreateForm(TTraceLogDlg, TraceLogDlg);
  Application.Run;
end.
