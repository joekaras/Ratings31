unit fldprt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, DB, dbisamtb;

type
  TDetailedFieldsReportForm = class(TForm)
    DetailedFieldsReport: TQuickRep;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData3: TQRSysData;
    QRBand5: TQRBand;
    QRDBText1: TQRDBText;
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
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape1: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape9: TQRShape;
    QRDBText5: TQRDBText;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRDBText7: TQRDBText;
    QRShape16: TQRShape;
    QRLabel10: TQRLabel;
    QRShape17: TQRShape;
    QRDBText8: TQRDBText;
    QRLabel18: TQRLabel;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRLabel19: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel22: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRLabel24: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel8: TQRLabel;
    RecordSizeLabel: TQRLabel;
    QRLabel11: TQRLabel;
    IndexPageSizeLabel: TQRLabel;
    QRLabel21: TQRLabel;
    BlobBlockSizeLabel: TQRLabel;
    QRLabel26: TQRLabel;
    LastAutoIncValueLabel: TQRLabel;
    procedure DetailedFieldsReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DetailedFieldsReportForm: TDetailedFieldsReportForm;

implementation

uses Printers, main;

{$R *.DFM}

procedure TDetailedFieldsReportForm.DetailedFieldsReportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   with Sender.PrinterSettings do
      begin
      if (PrinterIndex <> Printer.PrinterIndex) then
         PrinterIndex:=Printer.PrinterIndex;
      end;
end;

end.
