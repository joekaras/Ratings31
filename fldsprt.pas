unit fldsprt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, DB, dbisamtb;

type
  TSummaryFieldsReportForm = class(TForm)
    SummaryFieldsReport: TQuickRep;
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
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape15: TQRShape;
    QRShape1: TQRShape;
    QRShape11: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    RecordSizeLabel: TQRLabel;
    QRLabel11: TQRLabel;
    IndexPageSizeLabel: TQRLabel;
    QRLabel21: TQRLabel;
    BlobBlockSizeLabel: TQRLabel;
    QRLabel20: TQRLabel;
    LastAutoIncValueLabel: TQRLabel;
    procedure SummaryFieldsReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SummaryFieldsReportForm: TSummaryFieldsReportForm;

implementation

uses Printers, main;

{$R *.DFM}

procedure TSummaryFieldsReportForm.SummaryFieldsReportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   with Sender.PrinterSettings do
      begin
      if (PrinterIndex <> Printer.PrinterIndex) then
         PrinterIndex:=Printer.PrinterIndex;
      end;
end;

end.
