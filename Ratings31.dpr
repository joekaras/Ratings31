program Ratings31;

{%ToDo 'Ratings31.todo'}
{%File 'Layouts\ProCaps.TXT'}
{%ToDo 'Ratings31.todo'}

uses
   fastmm4,
   madExcept,
   madLinkDisAsm,
   madListHardware,
   madListProcesses,
   madListModules,
   Forms,
   DatRatings in 'DatRatings.pas' {dm: TDataModule},
   HDataModule in 'HDataModule.pas' {hdm: TDataModule},
   StrMan in '..\Program Files\Borland\Delphi7\StrMan\StrMan.pas',
   FastStrings in '..\Program Files\Borland\Delphi7\FastStrings\FastStrings.pas',
   FastStringFuncs in '..\Program Files\Borland\Delphi7\FastStrings\FastStringFuncs.pas',
   ESBRtns in '..\Program Files\Borland\Delphi7\ESBRoutines\ESBRtns.pas',
   ESBMaths in '..\Program Files\Borland\Delphi7\ESBMaths\ESBMaths.pas',
   ESBMaths2 in '..\Program Files\Borland\Delphi7\ESBMaths\ESBMaths2.pas',
   GpTimezone in '..\Program Files\Borland\Delphi7\ESBDates\gptimezone.pas',
   ESBDates in '..\Program Files\Borland\Delphi7\ESBDates\ESBDates.pas',
   FormFinalOrder in 'FormFinalOrder.pas' {FinalOrderForm},
   FormEntry in 'FormEntry.pas' {EntryForm},
   FormRanking in 'FormRanking.pas' {RankingForm},
   FormConnection in 'FormConnection.pas' {ConnectionForm},
   ReportGimmick in 'ReportGimmick.pas' {GimmickReportForm},
   ReportSelection in 'ReportSelection.pas' {SelectionReportForm},
   ReportTip in 'ReportTip.pas' {TipReportForm},
   ReportValue in 'ReportValue.pas' {ValueReportForm},
   FormOptions in 'FormOptions.pas' {OptionsForm},
   UnitCommonCode in 'UnitCommonCode.pas',
   ReportWager in 'ReportWager.pas' {WagerReportForm},
   ReportContest in 'ReportContest.pas' {ContestReportForm},
   DatReport in 'DatReport.pas' {dmReport: TDataModule},
   Unit1 in 'Unit1.pas' {Form1},
   UnitRPIAndIV in 'UnitRPIAndIV.pas',
   UnitDBRoutines in 'UnitDBRoutines.pas',
   UnitSetRanking in 'UnitSetRanking.pas',
   UnitGenerateRankings in 'UnitGenerateRankings.pas',
   UnitGenerateRankingsByTrack in 'UnitGenerateRankingsByTrack.pas',
   UnitUpdateSummaryTables in 'UnitUpdateSummaryTables.pas',
   UnitProcessEquibaseTrackLeaders in 'UnitProcessEquibaseTrackLeaders.pas',
   UnitProcessDRFCharts in 'UnitProcessDRFCharts.pas',
   UnitProcessEquibaseResults in 'UnitProcessEquibaseResults.pas',
   UnitProcessPicksAndResults in 'UnitProcessPicksAndResults.pas',
   UnitProcessEquibaseCharts in 'UnitProcessEquibaseCharts.pas',
   UnitUpdateTipSelections in 'UnitUpdateTipSelections.pas',
   UnitUpdateOddsProbability in 'UnitUpdateOddsProbability.pas',
   UnitUpdateGimmicks in 'UnitUpdateGimmicks.pas',
   UnitUpdateNbrOfStarters in 'UnitUpdateNbrOfStarters.pas',
   UnitUpdateSuper in 'UnitUpdateSuper.pas',
   UnitUpdateFinalWinPct in 'UnitUpdateFinalWinPct.pas',
   UnitGetHandicappingKeys in 'UnitGetHandicappingKeys.pas',
   UnitUpdateKeysWinPct in 'UnitUpdateKeysWinPct.pas',
   UnitCreateFinalKeys in 'UnitCreateFinalKeys.pas',
   UnitHarness in 'UnitHarness.pas',
   UnitUpdateKeysInHorseHistory in 'UnitUpdateKeysInHorseHistory.pas',
   UnitCreateTodaysRatings in 'UnitCreateTodaysRatings.pas',
   UnitUpdateHHFromToday in 'UnitUpdateHHFromToday.pas',
   UnitUpdateWagers in 'UnitUpdateWagers.pas',
   UnitSetLiners in 'UnitSetLiners.pas',
   FormBank in 'FormBank.pas' {BankForm},
   ReportYouBetResults in 'ReportYouBetResults.pas' {YouBetResultsReportForm},
   ReportHospitalResults in 'ReportHospitalResults.pas' {HospitalResultsReportForm},
   FormWagers in 'FormWagers.pas' {WagersForm},
   ReportLinersResults in 'ReportLinersResults.pas' {LinerResultsReportForm},
   ReportWagerResults in 'ReportWagerResults.pas' {WagerResultsReportForm},
   UnitQrySQL in 'UnitQrySQL.pas',
   UnitUpdateHHMisc in 'UnitUpdateHHMisc.pas',
   UnitDownloadSireLists in 'UnitDownloadSireLists.pas',
   UnitProcessBloodHorseSireLists in 'UnitProcessBloodHorseSireLists.pas',
   UnitProcessEquibaseStats in 'UnitProcessEquibaseStats.pas',
   UnitUpdatePace in 'UnitUpdatePace.pas',
   UnitSireInfo in 'UnitSireInfo.pas',
   UnitCreatePrevious in 'UnitCreatePrevious.pas',
   DatDBF in 'DatDBF.pas' {dmDbf: TDataModule},
   UnitSpeedPoints in 'UnitSpeedPoints.pas',
   UnitAngles in 'UnitAngles.pas',
   UnitCalibrationHandicapping in 'UnitCalibrationHandicapping.pas',
   UnitIndexTodayFiles in 'UnitIndexTodayFiles.pas',
   ReportValueShort in 'ReportValueShort.pas' {ValueShortReportForm},
   FormMain in 'formmain.pas' {MainForm},
   createrace in 'CreateRace.pas',
   ReportTSNSheets in 'ReportTSNSheets.pas' {TSNReportForm},
   UnitUpdateTopFigures in 'UnitUpdateTopFigures.pas',
   UnitUpdateTodaysWinPct in 'UnitUpdateTodaysWinPct.pas',
   UnitUpdateLines in 'UnitUpdateLines.pas',
   UnitUpdateReportSelections in 'UnitUpdateReportSelections.pas',
   FormQuery in 'FormQuery.pas' {QueryForm},
   QueryWagerResults in 'QueryWagerResults.pas' {WagerQueryForm},
   FormTrainerConnections in 'FormTrainerConnections.pas' {TrainerConnectionsForm},
   ReportContestResults in 'ReportContestResults.pas' {ContestResultReportForm},
   UnitTSNImportMCP in 'UnitTSNImportMCP.pas',
   UnitUpdateTSN in 'UnitUpdateTSN.pas',
   UnitProcessTSNLists in 'UnitProcessTSNLists.pas',
   unitProcessTSNChanges in 'unitProcessTSNChanges.pas',
   UnitTSNImport in 'UnitTSNImport.pas',
   UnitHDWImportJCP in 'UnitHDWImportJCP.pas',
   UnitUpdateHDW in 'UnitUpdateHDW.pas',
   ReportHospital2 in 'ReportHospital2.pas' {HospitalReport2Form},
   ReportHospital in 'ReportHospital.pas' {HospitalReportForm};

{$R *.RES}

begin
   Application.Initialize;
   Application.CreateForm(TMainForm, MainForm);
   Application.CreateForm(Tdm, dm);
   Application.CreateForm(TdmDbf, dmDbf);
   Application.CreateForm(THospitalReport2Form, HospitalReport2Form);
   Application.CreateForm(THospitalReportForm, HospitalReportForm);
   Application.Run;
end.

