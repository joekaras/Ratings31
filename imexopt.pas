unit imexopt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, dbisamtb;

type
  TImportExportOptionsDlg = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    GroupBox1: TGroupBox;
    FileNameEdit: TEdit;
    SelectButton: TButton;
    GroupBox3: TGroupBox;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    DelimiterEdit: TEdit;
    Label1: TLabel;
    SelectFieldsButton: TButton;
    DelimiterSpeedButton: TSpeedButton;
    Label2: TLabel;
    DateFormatEdit: TEdit;
    Label3: TLabel;
    TimeFormatEdit: TEdit;
    Label4: TLabel;
    DecSeparatorEdit: TEdit;
    UseHeadersCheckBox: TCheckBox;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DelimiterEditKeyPress(Sender: TObject; var Key: Char);
    procedure SelectFieldsButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DelimiterSpeedButtonClick(Sender: TObject);
    procedure UseHeadersCheckBoxClick(Sender: TObject);
  private
    AvailableList: TStrings;
  public
    Importing: Boolean;
    SelectedList: TStrings;
    procedure SetupFields;
  end;

var
  ImportExportOptionsDlg: TImportExportOptionsDlg;

implementation

uses FileCtrl, main, imexflds, browse, query, ascii, dbisamcn, dbisamut;

{$R *.DFM}

procedure TImportExportOptionsDlg.FormShow(Sender: TObject);
begin
   if Importing then
      begin
      if UseHeadersCheckBox.Checked then
         SelectFieldsButton.Enabled:=False
      else
         SelectFieldsButton.Enabled:=True;
      end
   else
      SelectFieldsButton.Enabled:=True;
   ActiveControl:=FileNameEdit;
end;

procedure TImportExportOptionsDlg.SetupFields;
var
   I: Integer;
begin
   if (MainForm.ActiveMDIChild is TBrowseForm) then
      begin
      with TBrowseForm(MainForm.ActiveMDIChild).BrowseTable do
         begin
         SelectedList.Clear;
         AvailableList.Clear;
         for I:=0 to Fields.Count-1 do
            SelectedList.Add(Fields[I].FieldName);
         if Importing then
            Caption:='Import Options for '+TableName
         else
            Caption:='Export Options for '+TableName;
         end;
      end
   else if (MainForm.ActiveMDIChild is TQueryForm) then
      begin
      with TQueryForm(MainForm.ActiveMDIChild).InteractiveQuery do
         begin
         SelectedList.Clear;
         AvailableList.Clear;
         for I:=0 to Fields.Count-1 do
            SelectedList.Add(Fields[I].FieldName);
         if Importing then
            Caption:='Import Options for Query Result Set'
         else
            Caption:='Export Options for Query Result Set';
         end;
      end
end;

procedure TImportExportOptionsDlg.SelectButtonClick(Sender: TObject);
begin
   if Importing then
      begin
      OpenDialog.InitialDir:=MainForm.AppSessionSettings.FileDirectory;
      if OpenDialog.Execute then
         begin
         MainForm.AppSessionSettings.FileDirectory:=ExtractFilePath(OpenDialog.FileName);
         FileNameEdit.Text:=OpenDialog.FileName;
         end;
      end
   else
      begin
      SaveDialog.InitialDir:=MainForm.AppSessionSettings.FileDirectory;
      if SaveDialog.Execute then
         begin
         MainForm.AppSessionSettings.FileDirectory:=ExtractFilePath(SaveDialog.FileName);
         FileNameEdit.Text:=SaveDialog.FileName;
         end;
      end;
end;

procedure TImportExportOptionsDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose:=True;
   if (not Self.Visible) then
      Exit;
   if (ModalResult=mrOk) then
      begin
      if (FileNameEdit.Text='') then
         begin
         if Importing then
            MessageDlg('You must specify a file to import',mtError,[mbOK],0)
         else
            MessageDlg('You must specify an export file',mtError,[mbOK],0);
         CanClose:=False;
         end;
      if Importing and (not FileExists(FileNameEdit.Text)) then
         begin
         MessageDlg('You must specify a valid file name',mtError,[mbOK],0);
         CanClose:=False;
         end;
      if (StrToInt(DelimiterEdit.Text) < 1) or
         (StrToInt(DelimiterEdit.Text) > High(Byte)) then
         begin
         MessageDlg('The delimiter ASCII value must be between 1 and '+IntToStr(High(Byte))+' msecs',mtError,[mbOK],0);
         CanClose:=False;
         Exit;
         end;
      if (DateFormatEdit.Text='') then
         begin
         MessageDlg('You must specify a date format',mtError,[mbOK],0);
         CanClose:=False;
         Exit;
         end;
      if (TimeFormatEdit.Text='') then
         begin
         MessageDlg('You must specify a time format',mtError,[mbOK],0);
         CanClose:=False;
         Exit;
         end;
      if (DecSeparatorEdit.Text='') then
         begin
         MessageDlg('You must specify a decimal separator',mtError,[mbOK],0);
         CanClose:=False;
         Exit;
         end;
      end;
end;

procedure TImportExportOptionsDlg.DelimiterEditKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (Key in ['0'..'9',#8,#13]) then
      Key:=#0;
end;

procedure TImportExportOptionsDlg.SelectFieldsButtonClick(Sender: TObject);
begin
   with ImportExportFldsDlg do
      begin
      AvailableListBox.Items.Assign(AvailableList);
      SelectedListBox.Items.Assign(SelectedList);
      if (ShowModal=mrOk) then
         begin
         SelectedList.Assign(SelectedListBox.Items);
         AvailableList.Assign(AvailableListBox.Items);
         end;
      end;
end;

procedure TImportExportOptionsDlg.FormCreate(Sender: TObject);
begin
   SelectedList:=TStringList.Create;
   AvailableList:=TStringList.Create;
   DelimiterEdit.Text:=IntToStr(Ord(','));
   DateFormatEdit.Text:=ANSI_DATE_FORMAT;
   TimeFormatEdit.Text:=ANSI_TIME_FORMAT;
   DecSeparatorEdit.Text:=ANSI_DECIMAL_SEPARATOR;
end;

procedure TImportExportOptionsDlg.FormDestroy(Sender: TObject);
begin
   SelectedList.Free;
   AvailableList.Free;
end;

procedure TImportExportOptionsDlg.DelimiterSpeedButtonClick(
  Sender: TObject);
begin
   with SelectASCIIValueDlg do
      begin
      if (ShowModal=mrOk) then
         DelimiterEdit.Text:=IntToStr(ASCIIValuesListBox.ItemIndex+1);
      end;
end;

procedure TImportExportOptionsDlg.UseHeadersCheckBoxClick(
  Sender: TObject);
begin
   if Importing then
      begin
      if UseHeadersCheckBox.Checked then
         SelectFieldsButton.Enabled:=False
      else
         SelectFieldsButton.Enabled:=True;
      end
   else
      SelectFieldsButton.Enabled:=True;
end;

end.

