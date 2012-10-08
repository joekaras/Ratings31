unit HDataModule;

interface

uses
   SysUtils, Classes, dbisamtb, DB, Dbf;

type
   Thdm = class(TDataModule)
      dbBuggy: TDBISAMDatabase;
      tblTrack: TDBISAMTable;
      tblRaces: TDBISAMTable;
      tblEntries: TDBISAMTable;
      tblVendor: TDBISAMTable;
      tblProcessed: TDBISAMTable;
      tblFinalKey: TDBISAMTable;
      tblDriver: TDBISAMTable;
      tblTrainer: TDBISAMTable;
      dbfHarnessTrainer: TDbf;
      dbfHarnessDriver: TDbf;
      dbfHarnessRace: TDbf;
      dbfHarnessEntry: TDbf;
      dbfHarnessPast: TDbf;
      qryHarnessSQL: TDBISAMQuery;
      procedure DataModuleCreate(Sender: TObject);
      procedure DataModuleDestroy(Sender: TObject);
   private
      { Private declarations }
      procedure CloseTable(t: TDBISAMTable);
      procedure OpenTable(t: TDBISAMTable);
      function OpenConnection: Boolean;
      function CloseConnection: Boolean;
   public
      { Public declarations }
   end;

var
   hdm: Thdm;

implementation

uses UnitCommonCode;

{$R *.dfm}

procedure Thdm.DataModuleCreate(Sender: TObject);
begin

   OpenConnection();

   try


   except
      raise;
   end;


end;

procedure Thdm.DataModuleDestroy(Sender: TObject);
begin
   try
      CloseTable(tblRaces);
      CloseTable(tblEntries);
      CloseTable(tblTrack);
   except
      CloseConnection();
      raise;
   end;

   CloseConnection();


end;

function Thdm.OpenConnection: Boolean;
begin

   try
      dbBuggy.Connected := False;
      dbBuggy.Directory := DATA_BUGGY_PATH;
      dbBuggy.Connected := True;

   except
      Result := False;
      exit;
   end;

   Result := True

end;

function Thdm.CloseConnection: Boolean;
begin

   try
      dbBuggy.Connected := False;
      dbBuggy.Directory := DATA_PATH;
      dbBuggy.Connected := True;

   except
      Result := False;
      exit;
   end;

   Result := True
end;

procedure Thdm.CloseTable(t: TDBISAMTable);
begin

   try

      if t.Active = True then begin
         t.FlushBuffers();
         t.Active := False;
         t.Exclusive := False;
      end;

   except
      raise;
   end;
end;

procedure Thdm.OpenTable(t: TDBISAMTable);
begin

   try

      if t.Active = False then begin
         t.Active := True;
      end;

   except
      raise;
   end;
end;

end.
