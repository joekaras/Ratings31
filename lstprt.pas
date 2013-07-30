unit lstprt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, DB, dbisamtb;

type
  TListingReportForm = class(TForm)
    ListingReport: TQuickRep;
    HeaderBand: TQRBand;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData3: TQRSysData;
    DetailBand: TQRBand;
    QRSysData2: TQRSysData;
    QRShape2: TQRShape;
    QRShape11: TQRShape;
    QRShape1: TQRShape;
    procedure ListingReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListingReportForm: TListingReportForm;

implementation

uses Printers, main;

{$R *.DFM}

procedure TListingReportForm.ListingReportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   with Sender.PrinterSettings do
      begin
      if (PrinterIndex <> Printer.PrinterIndex) then
         PrinterIndex:=Printer.PrinterIndex;
      end;
end;

end.
