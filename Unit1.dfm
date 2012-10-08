object Form1: TForm1
  Left = 0
  Top = 213
  Width = 696
  Height = 352
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxDBProgressBar1: TcxDBProgressBar
    Left = 288
    Top = 168
    TabOrder = 0
    Width = 121
  end
  object cxDBProgressBar2: TcxDBProgressBar
    Left = 296
    Top = 176
    TabOrder = 1
    Width = 121
  end
  object cxPageControl1: TcxPageControl
    Left = 56
    Top = 32
    Width = 289
    Height = 193
    ActivePage = cxTabSheet1
    TabOrder = 2
    ClientRectBottom = 193
    ClientRectRight = 289
    ClientRectTop = 24
    object cxTabSheet1: TcxTabSheet
      Caption = 'cxTabSheet1'
      ImageIndex = 0
    end
  end
  object tblPrevDayRH: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbPrevDayResultsReport'
    EngineVersion = '4.24 Build 1'
    IndexName = 'ByActualPrimary'
    MasterFields = 'TrkCode;RaceDate;RaceNbr'
    TableName = 'PrevDayRH'
    Left = 32
    Top = 112
  end
  object tblPrevDayHH: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    Filter = '(IsPrintedOnValueSheet=True) and (IsAngleSheetSelected=True)'
    Filtered = True
    DatabaseName = 'dbPrevDayResultsReport'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    IndexName = 'ByRaceDate'
    TableName = 'PrevDayHH'
    Left = 158
    Top = 112
  end
  object dbPrevDayResultsReport: TDBISAMDatabase
    EngineVersion = '4.24 Build 1'
    DatabaseName = 'dbPrevDayResultsReport'
    Directory = 'c:\RatingsData31'
    KeepTablesOpen = False
    SessionName = 'Default'
    Left = 336
    Top = 48
  end
end
