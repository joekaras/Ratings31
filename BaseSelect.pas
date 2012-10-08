unit BaseSelect;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBISAMTb, Db, DBISAMIp, Wwdatsrc, wwDialog, Wwfltdlg, Mask, wwdbedit,
  Wwdotdot, Wwdbcomb, Wwkeycb, fcButton, fcImgBtn, fcShapeBtn, fcStatusBar,
  StdCtrls, ComCtrls, wwriched, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  fcLabel, Easysize, AHMSystemClass, AHMTFormManager, ppDB, ppComm,
  ppRelatv, ppCache, ppDBPipe, ppDBBDE, ppPrnabl, ppClass, ppStrtch,
  ppMemo, ppModule, daDatMod, ppBands, ppProd, ppReport, ppCtrls, ppSubRpt, TXtraDev;

type
  TBaseSelectRaceForm = class(TForm)
    pnlPrgBar: TPanel;
    prgBar: TProgressBar;
    tblRaces: TDBISAMTable;
    plRaces: TppDBPipeline;
    dbReports: TDBISAMDatabase;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnSelectAllClick(Sender: TObject);
    procedure btnUnselectAllClick(Sender: TObject);
  private
      { Private declarations }
  public
      { Public declarations }
  end;

var
  BaseSelectRaceForm: TBaseSelectRaceForm;

implementation

{$R *.DFM}

procedure TBaseSelectRaceForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  dbReports.Connected := False;
  Action := caFree;

end;

procedure TBaseSelectRaceForm.FormCreate(Sender: TObject);
var
  sFilePath: string;
begin

  try

    dbReports.Connected := False;
    sFilePath := ExtractFilePath(Application.ExeName);
    dbReports.Directory := sFilePath + 'data\';
    dbReports.Directory := 'd:\KskRatings\data\';
    dbReports.Connected := True;

    if tblRaces.Active = False then begin
      tblRaces.Active := True
    end;
  except
  end;

  rezForm.InitializeForm;

end;

procedure TBaseSelectRaceForm.FormResize(Sender: TObject);
begin

  rezForm.ResizeAll;

end;

procedure TBaseSelectRaceForm.btnFilterClick(Sender: TObject);
begin

  fltRace.Execute();
  grdRace.Refresh();

end;

procedure TBaseSelectRaceForm.btnSelectAllClick(Sender: TObject);
begin

  grdRace.SelectAll();

end;

procedure TBaseSelectRaceForm.btnUnselectAllClick(Sender: TObject);
begin

  grdRace.UnselectAll();

end;

end.

