Program Test;

{%ToDo 'Test.todo'}

uses
  Forms,
  DatRatings in 'DatRatings.pas' {dm: TDataModule},
  CommonCode in 'CommonCode.pas',
  ESBDates in '..\Program Files\ESBDates\ESBDates.pas',
  ESBRtns in '..\Program Files\ESBRoutines\ESBRtns.pas',
  ESBMaths in '..\Program Files\ESBMaths\ESBMaths.pas',
  ESBMaths2 in '..\Program Files\ESBMaths\ESBMaths2.pas',
  FastStrings in '..\Program Files\FastStrings\FastStrings.pas',
  FastStringFuncs in '..\Program Files\FastStrings\FastStringFuncs.pas',
  StrMan in '..\Program Files\StrMan\StrMan.pas',
  ReportValueShort in 'ReportValueShort.pas' {ValueShortReportForm},
  QueryWagerResults in 'QueryWagerResults.pas' {WagerQueryReportForm},
  ReportContestResults in 'ReportContestResults.pas' {ContestResultReportForm},
  ReportTipSheet in 'ReportTipSheet.pas';

{$R *.RES}

Begin
  Application.Initialize;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TValueShortReportForm, ValueShortReportForm);
  Application.CreateForm(TWagerQueryReportForm, WagerQueryReportForm);
  Application.CreateForm(TContestResultReportForm, ContestResultReportForm);
  Application.Run;
End.

