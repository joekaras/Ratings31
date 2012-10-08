unit DatReport;

interface

uses
   SysUtils, Classes, DB, dbisamtb;

type
   TdmReport = class(TDataModule)
      dbReport: TDBISAMDatabase;
      tblRaces: TDBISAMTable;
      tblEntries: TDBISAMTable;
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   dmReport: TdmReport;

implementation

{$R *.dfm}

end.
