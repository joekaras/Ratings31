object hdm: Thdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 155
  Top = 347
  Height = 242
  Width = 517
  object dbBuggy: TDBISAMDatabase
    EngineVersion = '4.24 Build 1'
    DatabaseName = 'dbBuggy'
    Directory = 'k:\BuggyData'
    KeepTablesOpen = False
    SessionName = 'Default'
    Left = 48
    Top = 24
  end
  object tblTrack: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbBuggy'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'HarnessTrack'
    Left = 168
    Top = 24
  end
  object tblRaces: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbBuggy'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'HarnessRace'
    Left = 176
    Top = 104
  end
  object tblEntries: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbBuggy'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'HarnessEntry'
    Left = 304
    Top = 80
  end
  object tblVendor: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbBuggy'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'HarnessVendor'
    Left = 264
    Top = 16
  end
  object tblProcessed: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbBuggy'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'HarnessProcessed'
    Left = 392
    Top = 40
  end
  object tblFinalKey: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbBuggy'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'HarnessFinalKey'
    Left = 352
    Top = 120
  end
  object tblDriver: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbBuggy'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'HarnessDriver'
    Left = 40
    Top = 120
  end
  object tblTrainer: TDBISAMTable
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbBuggy'
    SessionName = 'Default'
    EngineVersion = '4.24 Build 1'
    TableName = 'HarnessTrainer'
    Left = 120
    Top = 152
  end
  object dbfHarnessTrainer: TDbf
    FilePath = 'D:\BuggyDownload\'
    IndexDefs = <>
    TableName = 'TRAINRHR.DBF'
    TableLevel = 4
    UseFloatFields = True
    Left = 432
    Top = 136
  end
  object dbfHarnessDriver: TDbf
    FilePath = 'D:\BuggyDownload\'
    IndexDefs = <>
    TableName = 'TRAINRHR.DBF'
    TableLevel = 4
    UseFloatFields = True
    Left = 392
    Top = 184
  end
  object dbfHarnessRace: TDbf
    FilePath = 'D:\BuggyDownload\'
    IndexDefs = <>
    TableName = 'RACESHR.DBF'
    TableLevel = 3
    UseFloatFields = True
    Left = 496
    Top = 184
  end
  object dbfHarnessEntry: TDbf
    FilePath = 'D:\BuggyDownload\'
    IndexDefs = <>
    TableName = 'HORSEHR.DBF'
    TableLevel = 3
    UseFloatFields = True
    Left = 512
    Top = 248
  end
  object dbfHarnessPast: TDbf
    FilePath = 'D:\BuggyDownload\'
    IndexDefs = <>
    TableName = 'RUNLINHR.DBF'
    TableLevel = 4
    UseFloatFields = True
    Left = 408
    Top = 256
  end
  object qryHarnessSQL: TDBISAMQuery
    AutoCalcFields = False
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbBuggy'
    EngineVersion = '4.24 Build 1'
    MaxRowCount = -1
    SQL.Strings = (
      'SELECT *'
      'INTO TodayRaces'
      'FROM HarnessRace'
      'WHERE RaceDate = :RaceDateParam;'
      ''
      'SELECT *'
      'INTO TodayEntries'
      'FROM HarnessEntry'
      'WHERE RaceDate = :RaceDateParam;'
      ''
      
        'CREATE INDEX IF NOT EXISTS "ByActualPrimary" ON "TodayRaces" Trk' +
        'Code","RaceDate","RaceNbr","ProgramNbr");'
      
        'CREATE INDEX IF NOT EXISTS "ByActualPrimary" ON "PrevDayRH" ("Tr' +
        'kCode","RaceDate","RaceNbr");'
      '')
    Params = <
      item
        DataType = ftDate
        Name = 'RaceDateParam'
      end>
    ReadOnly = True
    Left = 225
    Top = 236
    ParamData = <
      item
        DataType = ftDate
        Name = 'RaceDateParam'
      end>
  end
end
