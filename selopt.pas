unit selopt;

interface

uses Windows, Messages, Classes, Graphics, Forms, Controls, Buttons, StdCtrls;

type
  TSelectOptimizeIndexDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    GroupBox1: TGroupBox;
    AvailableIndexesListBox: TListBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    KeyFieldsEdit: TEdit;
    KeyCaseInsensitiveEdit: TEdit;
    KeyUniqueEdit: TEdit;
    KeyDescFieldsEdit: TEdit;
    procedure FormShow(Sender: TObject);
    procedure AvailableIndexesListBoxClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure AvailableIndexesListBoxDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    IndexNameToUse: string;
    procedure SetupIndexes;
  end;

var
  SelectOptimizeIndexDlg: TSelectOptimizeIndexDlg;

implementation

uses DB, Dialogs, main, dbisamut;

{$R *.DFM}

procedure TSelectOptimizeIndexDlg.SetupIndexes;
begin
   IndexNameToUse:='';
   with MainForm.UtilitiesTable,AvailableIndexesListBox do
      begin
      GetIndexNames(Items);
      if (IndexDefs.Count > 0) and
         (ixPrimary in IndexDefs[0].Options) and
         (IndexDefs[0].Fields <> '') then
         Items.InsertObject(0,'Primary Index',TObject(High(Integer)))
      else
         Items.InsertObject(0,'Natural Order',TObject(High(Integer)));
      if (IndexName='') then
         ItemIndex:=0
      else
         ItemIndex:=Items.IndexOf(IndexName);
      end;
end;

procedure TSelectOptimizeIndexDlg.FormShow(Sender: TObject);
begin
   AvailableIndexesListBoxClick(Self);
   ActiveControl:=AvailableIndexesListBox;
end;

procedure TSelectOptimizeIndexDlg.AvailableIndexesListBoxClick(Sender: TObject);
begin
   with MainForm.UtilitiesTable,AvailableIndexesListBox do
      begin
      if (ItemIndex <> -1) and (IndexDefs.Count > 0) then
         begin
         if (ItemIndex > 0) and (Items[0]='Natural Order') then
            begin
            KeyFieldsEdit.Text:=IndexDefs[ItemIndex-1].Fields;
            KeyDescFieldsEdit.Text:=IndexDefs[ItemIndex-1].DescFields;
            KeyCaseInsensitiveEdit.Text:=BooleanToStr((ixCaseInsensitive in IndexDefs[ItemIndex-1].Options));
            KeyUniqueEdit.Text:=BooleanToStr((ixUnique in IndexDefs[ItemIndex-1].Options));
            end
         else
            begin
            KeyFieldsEdit.Text:=IndexDefs[ItemIndex].Fields;
            KeyDescFieldsEdit.Text:=IndexDefs[ItemIndex].DescFields;
            KeyCaseInsensitiveEdit.Text:=BooleanToStr((ixCaseInsensitive in IndexDefs[ItemIndex].Options));
            KeyUniqueEdit.Text:=BooleanToStr((ixUnique in IndexDefs[ItemIndex].Options));
            end;
         end
      else
         begin
         KeyFieldsEdit.Text:='';
         KeyDescFieldsEdit.Text:='';
         KeyCaseInsensitiveEdit.Text:='';
         KeyUniqueEdit.Text:='';
         end;
      end;
end;

procedure TSelectOptimizeIndexDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if (ModalResult=mrOk) then
      begin
      with AvailableIndexesListBox do
         begin
         if (ItemIndex <> -1) then
            begin
            if (ItemIndex=0) and
               ((Items[ItemIndex]='Primary Index') or
                (Items[ItemIndex]='Natural Order')) and
               (Integer(Items.Objects[ItemIndex])=High(Integer)) then
               IndexNameToUse:=''
            else
               IndexNameToUse:=Items[ItemIndex];
            CanClose:=True;
            end
         else
            begin
            MessageDlg('You must select an index first',mtError,[mbOk],0);
            CanClose:=False;
            end;
         end;
      end
   else
      CanClose:=True;
end;

procedure TSelectOptimizeIndexDlg.AvailableIndexesListBoxDblClick(Sender: TObject);
begin
   ModalResult:=mrOk;
end;

end.
