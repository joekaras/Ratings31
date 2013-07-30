unit textprt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls, DB, dbisamtb;

type
  TFullTextIndexReportForm = class(TForm)
    FullTextIndexReport: TQuickRep;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData3: TQRSysData;
    QRBand5: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel6: TQRLabel;
    UserVersionLabel: TQRLabel;
    QRLabel4: TQRLabel;
    DescriptionLabel: TQRLabel;
    QRLabel5: TQRLabel;
    EncryptedLabel: TQRLabel;
    QRLabel7: TQRLabel;
    LocaleLabel: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel12: TQRLabel;
    FieldsIndexedLabel: TQRLabel;
    QRLabel19: TQRLabel;
    StopWordsMemo: TQRMemo;
    QRLabel18: TQRLabel;
    SpaceCharactersMemo: TQRMemo;
    IncludeCharactersMemo: TQRMemo;
    QRLabel22: TQRLabel;
    QRLabel8: TQRLabel;
    RecordSizeLabel: TQRLabel;
    QRLabel10: TQRLabel;
    IndexPageSizeLabel: TQRLabel;
    QRLabel21: TQRLabel;
    BlobBlockSizeLabel: TQRLabel;
    QRLabel14: TQRLabel;
    LastAutoIncValueLabel: TQRLabel;
    procedure FullTextIndexReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FullTextIndexReportForm: TFullTextIndexReportForm;

implementation

uses Printers, main;

{$R *.DFM}

procedure TFullTextIndexReportForm.FullTextIndexReportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
   with Sender.PrinterSettings do
      begin
      if (PrinterIndex <> Printer.PrinterIndex) then
         PrinterIndex:=Printer.PrinterIndex;
      end;
end;

end.
