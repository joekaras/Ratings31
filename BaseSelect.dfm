object BaseSelectRaceForm: TBaseSelectRaceForm
  Left = -30
  Top = 1
  Width = 798
  Height = 570
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  Align = alClient
  Caption = 'BaseSelectRaceForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Scaled = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 14
  object pnlPrgBar: TPanel
    Left = 5
    Top = 167
    Width = 788
    Height = 41
    BorderStyle = bsSingle
    Caption = 'pnlPrgBar'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    Visible = False
    object prgBar: TProgressBar
      Left = 10
      Top = 11
      Width = 767
      Height = 16
      Min = 0
      Max = 100
      TabOrder = 0
    end
  end
  object tblRaces: TDBISAMTable
    AutoDisplayLabels = False
    CopyOnAppend = False
    DatabaseName = 'dbReports'
    EngineVersion = '3.10'
    FieldDefs = <
      item
        Name = 'TrkCode'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'RaceDate'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'RaceNbr'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'Surface'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DistanceInFeet'
        DataType = ftSmallint
      end
      item
        Name = 'DistanceInYards'
        DataType = ftSmallint
      end
      item
        Name = 'DistanceInFurlongs'
        DataType = ftFloat
      end
      item
        Name = 'DistanceDesc'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'RaceType'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'RaceTypeDesc'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'RaceCondition'
        DataType = ftMemo
      end
      item
        Name = 'TurfRace'
        DataType = ftBoolean
      end
      item
        Name = 'RouteRace'
        DataType = ftBoolean
      end
      item
        Name = 'MaidenSpecialRace'
        DataType = ftBoolean
      end
      item
        Name = 'MaidenClaimingRace'
        DataType = ftBoolean
      end
      item
        Name = 'MaidenOrTurfRace'
        DataType = ftBoolean
      end
      item
        Name = 'TwoYearOldRace'
        DataType = ftBoolean
      end
      item
        Name = 'ClaimingRace'
        DataType = ftBoolean
      end
      item
        Name = 'WagerType'
        DataType = ftMemo
      end
      item
        Name = 'AgeSexRestriction'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'Purse'
        DataType = ftFloat
      end
      item
        Name = 'ClaimingPrice'
        DataType = ftFloat
      end
      item
        Name = 'SimulcastTrkCode'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'SimulcastRaceNbr'
        DataType = ftSmallint
      end
      item
        Name = 'EstTimeOfRace'
        DataType = ftTime
      end
      item
        Name = 'LocalTimeOfRace'
        DataType = ftTime
      end
      item
        Name = 'RaceAutoInc'
        DataType = ftAutoInc
      end
      item
        Name = 'TimeDiff'
        DataType = ftTime
      end>
    IndexDefs = <
      item
        Name = 'tblRacesIndex1'
        Fields = 'TrkCode;RaceDate;RaceNbr'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'ByEstTimeOfRace'
        Fields = 'RaceDate;EstTimeOfRace'
      end
      item
        Name = 'ByTrkCodeRaceNbr'
        Fields = 'TrkCode;RaceNbr'
      end>
    TableName = 'Race.DAT'
    StoreDefs = True
    Left = 552
    Top = 280
  end
  object plRaces: TppDBPipeline
    UserName = 'plRaces'
    Left = 648
    Top = 304
  end
  object dbReports: TDBISAMDatabase
    EngineVersion = '3.10'
    Connected = True
    DatabaseName = 'dbReports'
    Directory = 'd:\KskRatings\Data'
    SessionName = 'Default'
    Left = 416
    Top = 248
  end
end
