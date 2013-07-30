unit idxprt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, DB, dbisamtb;

type
  TIndexesReportForm = class(TForm)
    IndexesReport: TQuickRep;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData3: TQRSysData;
    QRBand5: TQRBand;
    QRDBText2: TQRDBText;
    QRSysData2: TQRSysData;
    QRLabel6: TQRLabel;
    UserVersionLabel: TQRLabel;
    QRLabel4: TQRLabel;
    DescriptionLabel: TQRLabel;
    QRLabel5: TQRLabel;
    EncryptedLabel: TQRLabel;
    QRLabel7: TQRLabel;
    LocaleLabel: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRDBText4: TQRDBText;
    QRShape9: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRShape12: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel20: TQRLabel;
    RecordSizeLabel: TQRLabel;
    QRLabel21: TQRLabel;
    BlobBlockSizeLabel: TQRLabel;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape7: TQRShape;
    QRLabel12: TQRLabel;
    QRShape10: TQRShape;
    QRDBText3: TQRDBText;
    QRLabel8: TQRLabel;
    IndexPageSizeLabel: TQRLabel;
    QRShape11: TQRShape;
    QRLabel11: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel14: TQRLabel;
    LastAutoIncValueLabel: TQRLabel;
    QRShape13: TQRShape;
    procedure IndexesReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  IndexesReportForm: TIndexesReportForm;

implementation

uses Printers, main;

{$R *.DFM}

procedure TIndexesReportForm.IndexesReportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   with Sender.PrinterSettings do
      begin
      if (PrinterIndex <> Printer.PrinterIndex) then
         PrinterIndex:=Printer.PrinterIndex;
      end;
end;

end.
