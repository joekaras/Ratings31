unit Unit1;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, DB, dbisamtb, cxControls, cxContainer, cxEdit,
   cxProgressBar, cxDBProgressBar, cxPC;

type
   TForm1 = class(TForm)
      tblPrevDayRH: TDBISAMTable;
      tblPrevDayHH: TDBISAMTable;
      dbPrevDayResultsReport: TDBISAMDatabase;
      cxDBProgressBar1: TcxDBProgressBar;
      cxDBProgressBar2: TcxDBProgressBar;
      cxPageControl1: TcxPageControl;
      cxTabSheet1: TcxTabSheet;
   private
      { Private declarations }
   public
      { Public declarations }
   end;

var
   Form1: TForm1;

implementation

uses DatReport;

{$R *.dfm}

end.
