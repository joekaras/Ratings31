unit flddtls;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Mask, DBCtrls, DB, dbisamtb;

type
  TFieldDetailsDlg = class(TForm)
    OKButton: TButton;
    GroupBox1: TGroupBox;
    MinValueLabel: TLabel;
    GroupBox2: TGroupBox;
    DefaultValueLabel: TLabel;
    DefaultValueEdit: TDBEdit;
    MinValueEdit: TDBEdit;
    MaxValueLabel: TLabel;
    MaxValueEdit: TDBEdit;
    GroupBox3: TGroupBox;
    DescriptionLabel: TLabel;
    DescriptionEdit: TDBEdit;
    CancelButton: TButton;
    FieldsSource: TDataSource;
    CharacterCaseRadioGroup: TDBRadioGroup;
    CompressionGroupBox: TGroupBox;
    NoneLabel: TLabel;
    DefaultLabel: TLabel;
    MaxLabel: TLabel;
    CompressionTrackBar: TTrackBar;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CompressionTrackBarChange(Sender: TObject);
  private
    FSavePosition: Integer;
  public
    procedure SetupFields(NoModify: Boolean);
  end;

var
  FieldDetailsDlg: TFieldDetailsDlg;

implementation

uses main, struct, dbisamut, dbisamlb, dbisamen, dbisamcn;

{$R *.DFM}

procedure TFieldDetailsDlg.SetupFields(NoModify: Boolean);
begin
   with (FieldsSource.DataSet as TDBISAMTable) do
      begin
      Caption:='Details for Field '+FieldByName('FieldName').AsString;
      if NoModify then
         begin
         DescriptionLabel.Tag:=42;
         DescriptionEdit.Tag:=42;
         DescriptionEdit.ReadOnly:=True;
         DescriptionEdit.Color:=clBtnFace;
         DescriptionEdit.TabStop:=False;
         DefaultValueLabel.Tag:=43;
         DefaultValueEdit.Tag:=43;
         DefaultValueEdit.ReadOnly:=True;
         DefaultValueEdit.Color:=clBtnFace;
         DefaultValueEdit.TabStop:=False;
         MinValueLabel.Tag:=44;
         MinValueEdit.Tag:=44;
         MinValueEdit.ReadOnly:=True;
         MinValueEdit.Color:=clBtnFace;
         MinValueEdit.TabStop:=False;
         MaxValueLabel.Tag:=45;
         MaxValueEdit.Tag:=45;
         MaxValueEdit.ReadOnly:=True;
         MaxValueEdit.Color:=clBtnFace;
         MaxValueEdit.TabStop:=False;
         CharacterCaseRadioGroup.Tag:=187;
         CharacterCaseRadioGroup.ReadOnly:=True;
         CharacterCaseRadioGroup.TabStop:=False;
         NoneLabel.Tag:=185;
         DefaultLabel.Tag:=185;
         MaxLabel.Tag:=185;
         CompressionTrackBar.Tag:=185;
         FSavePosition:=FieldByName('Compression').AsInteger;
         CompressionTrackBar.Position:=FSavePosition;
         CompressionTrackBar.Hint:='';
         OKButton.Tag:=0;
         OkButton.Visible:=False;
         OkButton.Default:=False;
         CancelButton.Tag:=46;
         CancelButton.Caption:='&Close';
         CancelButton.Default:=True;
         ActiveControl:=CancelButton;
         end
      else
         begin
         DescriptionLabel.Tag:=139;
         DescriptionEdit.Tag:=139;
         DescriptionEdit.ReadOnly:=False;
         DescriptionEdit.Color:=clWindow;
         DescriptionEdit.TabStop:=True;
         DefaultValueLabel.Tag:=140;
         DefaultValueEdit.Tag:=140;
         MinValueLabel.Tag:=141;
         MinValueEdit.Tag:=141;
         MaxValueLabel.Tag:=142;
         MaxValueEdit.Tag:=142;
         if (FieldByName('DataType').AsString <> 'BLOB') and
            (FieldByName('DataType').AsString <> 'Graphic') and
            (FieldByName('DataType').AsString <> 'Memo') and
            (FieldByName('DataType').AsString <> 'Bytes') then
            begin
            DefaultValueEdit.ReadOnly:=False;
            DefaultValueEdit.Color:=clWindow;
            DefaultValueEdit.TabStop:=True;
            MinValueEdit.ReadOnly:=False;
            MinValueEdit.Color:=clWindow;
            MinValueEdit.TabStop:=True;
            MaxValueEdit.ReadOnly:=False;
            MaxValueEdit.Color:=clWindow;
            MaxValueEdit.TabStop:=True;
            end
         else
            begin
            DefaultValueEdit.ReadOnly:=True;
            DefaultValueEdit.Color:=clBtnFace;
            DefaultValueEdit.TabStop:=False;
            MinValueEdit.ReadOnly:=True;
            MinValueEdit.Color:=clBtnFace;
            MinValueEdit.TabStop:=False;
            MaxValueEdit.ReadOnly:=True;
            MaxValueEdit.Color:=clBtnFace;
            MaxValueEdit.TabStop:=False;
            end;
         CharacterCaseRadioGroup.Tag:=194;
         CharacterCaseRadioGroup.ReadOnly:=False;
         CharacterCaseRadioGroup.TabStop:=True;
         NoneLabel.Tag:=192;
         DefaultLabel.Tag:=192;
         MaxLabel.Tag:=192;
         if (FieldByName('DataType').AsString <> 'BLOB') and
            (FieldByName('DataType').AsString <> 'Graphic') and
            (FieldByName('DataType').AsString <> 'Memo') then
            begin
            CompressionTrackBar.Tag:=192;
            FSavePosition:=0;
            CompressionTrackBar.Position:=FSavePosition;
            CompressionTrackBar.Hint:='';
            end
         else
            begin
            CompressionTrackBar.Tag:=192;
            CompressionTrackBar.Hint:='Edit';
            FSavePosition:=FieldByName('Compression').AsInteger;
            CompressionTrackBar.Position:=FSavePosition;
            end;
         OKButton.Tag:=143;
         OkButton.Visible:=True;
         OkButton.Default:=True;
         CancelButton.Tag:=144;
         CancelButton.Caption:='&Cancel';
         CancelButton.Default:=False;
         ActiveControl:=DescriptionEdit;
         end;
      end;
end;

procedure TFieldDetailsDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   CanClose:=True;
   if (not Self.Visible) then
      Exit;
   if (ModalResult=mrOk) then
      begin
      with (FieldsSource.DataSet as TDBISAMTable) do
         begin
         if (not ReadOnly) then
            begin
            if (not VerifyValidityExpression(FieldByName('DefaultValue').AsString,
                  DisplayStringToDataType(FieldByName('DataType').AsString))) then
               begin
               MessageDlg('The default value specified is not a '+
                          FieldByName('DataType').AsString+' value',
                          mtError,[mbOk],0);
               CanClose:=False;
               Exit;
               end;
            if (not VerifyValidityExpression(FieldByName('MinValue').AsString,
                  DisplayStringToDataType(FieldByName('DataType').AsString))) then
               begin
               MessageDlg('The minimum value specified is not a '+
                          FieldByName('DataType').AsString+' value',
                          mtError,[mbOk],0);
               CanClose:=False;
               Exit;
               end;
            if (not VerifyValidityExpression(FieldByName('MaxValue').AsString,
                  DisplayStringToDataType(FieldByName('DataType').AsString))) then
               begin
               MessageDlg('The maximum value specified is not a '+
                          FieldByName('DataType').AsString+' value',
                          mtError,[mbOk],0);
               CanClose:=False;
               Exit;
               end;
            end;
         end;
      end;
end;

procedure TFieldDetailsDlg.CompressionTrackBarChange(Sender: TObject);
begin
   with (FieldsSource.DataSet as TDBISAMTable) do
      begin
      if (State in [dsInsert,dsEdit]) and (CompressionTrackBar.Hint='Edit') then
         FieldByName('Compression').AsInteger:=CompressionTrackBar.Position
      else
         begin
         if (CompressionTrackBar.Position <> FSavePosition) then
            CompressionTrackBar.Position:=FSavePosition;
         end;
      end;
end;

end.
