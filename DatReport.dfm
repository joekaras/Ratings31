object dmReport: TdmReport
  OldCreateOrder = False
  Left = 319
  Top = 288
  Height = 278
  Width = 277
  object dbReport: TDBISAMDatabase
    EngineVersion = '4.23 Build 2'
    DatabaseName = 'dbReport'
    Directory = 'k:\RatingsData31'
    KeepTablesOpen = False
    SessionName = 'Default'
    Left = 24
    Top = 16
  end
  object tblRaces: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbReport'
    SessionName = 'Default'
    EngineVersion = '4.23 Build 2'
    TableName = 'Race'
    Left = 96
    Top = 32
  end
  object tblEntries: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbReport'
    SessionName = 'Default'
    EngineVersion = '4.23 Build 2'
    TableName = 'Entry'
    Left = 176
    Top = 40
  end
end
