unit DatDBF;

interface

uses
   SysUtils, Classes, DB, Dbf;

type
   TdmDbf = class(TDataModule)
      dbfTrainer: TDbf;
      dbfJockey: TDbf;
      dbfEntry: TDbf;
      dbfSire: TDbf;
      dbfDam: TDbf;
      dbfPast: TDbf;
      dbfRace: TDbf;
      dbfMatchup: TDbf;
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   dmDbf: TdmDbf;

implementation

{$R *.dfm}

end.
