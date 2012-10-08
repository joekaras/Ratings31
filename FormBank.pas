unit FormBank;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
   Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
   cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCardView,
   cxGridDBCardView, cxGridCustomTableView, cxGridTableView,
   cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, mLog,
   cxCalendar, cxCurrencyEdit, dbisamtb;

type
   TBankForm = class(TForm)
      hLog: TmLog;
      dbWagers: TDBISAMDatabase;
      grdWager: TcxGrid;
      dsBank: TDataSource;
      lvBank: TcxGridLevel;
      cvBank: TcxGridDBCardView;
      cvBankWagerType: TcxGridDBCardViewRow;
      cvBankStartBank: TcxGridDBCardViewRow;
      cvBankWagerAmt: TcxGridDBCardViewRow;
      cvBankWagerRefund: TcxGridDBCardViewRow;
      cvBankWagerPayout: TcxGridDBCardViewRow;
      cvBankWagerPL: TcxGridDBCardViewRow;
      cvBankEndBank: TcxGridDBCardViewRow;
      cvBankWagerDate: TcxGridDBCardViewRow;
      tblBank: TDBISAMTable;
      cvBankRow1: TcxGridDBCardViewRow;
      cvBankRow2: TcxGridDBCardViewRow;
      cvBankRow3: TcxGridDBCardViewRow;
      cvBankRow4: TcxGridDBCardViewRow;
      procedure FormCreate(Sender: TObject);
      procedure FormDestroy(Sender: TObject);
      procedure cvBankStartBankPropertiesValidate(Sender: TObject;
         var DisplayValue: Variant; var ErrorText: TCaption;
         var Error: Boolean);
      procedure cvBankWagerPayoutPropertiesValidate(Sender: TObject;
         var DisplayValue: Variant; var ErrorText: TCaption;
         var Error: Boolean);
      procedure cvBankWagerRefundPropertiesValidate(Sender: TObject;
         var DisplayValue: Variant; var ErrorText: TCaption;
         var Error: Boolean);
      procedure cvBankWagerAmtPropertiesValidate(Sender: TObject;
         var DisplayValue: Variant; var ErrorText: TCaption;
         var Error: Boolean);
   private
      { Private declarations }
      procedure UpdateBank(fStartBank: double; fWagerAmt: double; fWagerRefund: double; fWagerPayout: double);

   public
      { Public declarations }
   end;

var
   BankForm: TBankForm;

implementation

{$R *.dfm}

procedure TBankForm.FormCreate(Sender: TObject);
begin

   tblBank.Active := True;
   //   tblBankWagers.Active := True;

end;

procedure TBankForm.FormDestroy(Sender: TObject);
begin

   tblBank.Active := False;
   //   tblBankWagers.Active := False;

end;


procedure TBankForm.UpdateBank(fStartBank: double; fWagerAmt: double; fWagerRefund: double; fWagerPayout: double);
var
   fWagerPL: double;
   fEndBank: double;
begin

   fWagerPL := (fWagerPayout + fWagerRefund) - fWagerAmt;
   fEndBank := fStartBank + fWagerPL;

   tblBank.Edit();
   tblBank.FieldByName('StartBank').AsFloat := fStartBank;
   tblBank.FieldByName('WagerAmt').AsFloat := fWagerAmt;
   tblBank.FieldByName('WagerRefund').AsFloat := fWagerRefund;
   tblBank.FieldByName('WagerPayout').AsFloat := fWagerPayout;
   tblBank.FieldByName('WagerPL').AsFloat := fWagerPL;
   tblBank.FieldByName('EndBank').AsFloat := fEndBank;
   tblBank.Post();

end;

procedure TBankForm.cvBankStartBankPropertiesValidate(Sender: TObject;
   var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);

begin

   UpdateBank(DisplayValue,
      tblBank.FieldByName('WagerAmt').AsFloat,
      tblBank.FieldByName('WagerRefund').AsFloat,
      tblBank.FieldByName('WagerPayout').AsFloat);

   Error := False;

end;

procedure TBankForm.cvBankWagerPayoutPropertiesValidate(Sender: TObject;
   var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin

   UpdateBank(tblBank.FieldByName('StartBank').AsFloat,
      tblBank.FieldByName('WagerAmt').AsFloat,
      tblBank.FieldByName('WagerRefund').AsFloat,
      DisplayValue);

   Error := False;

end;

procedure TBankForm.cvBankWagerRefundPropertiesValidate(Sender: TObject;
   var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin

   UpdateBank(tblBank.FieldByName('StartBank').AsFloat,
      tblBank.FieldByName('WagerAmt').AsFloat,
      DisplayValue,
      tblBank.FieldByName('WagerPayout').AsFloat);

   Error := False;

end;

procedure TBankForm.cvBankWagerAmtPropertiesValidate(Sender: TObject;
   var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin

   UpdateBank(tblBank.FieldByName('StartBank').AsFloat,
      DisplayValue,
      tblBank.FieldByName('WagerRefund').AsFloat,
      tblBank.FieldByName('WagerPayout').AsFloat);

   Error := False;

end;

end.
