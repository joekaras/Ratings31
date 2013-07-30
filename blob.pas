unit blob;

interface

uses Windows, Messages, Classes, SysUtils, Graphics, Forms, Controls, Buttons,
     StdCtrls, DBCtrls, Dialogs, ExtCtrls, ComCtrls;

type
  TBlobDlg = class(TForm)
    CloseBtn: TButton;
    GroupBox3: TGroupBox;
    LoadBtn: TButton;
    SaveBtn: TButton;
    GroupBox4: TGroupBox;
    BLOBSizeLabel: TLabel;
    GroupBox1: TGroupBox;
    ClearBlobButton: TButton;
    procedure LoadBtnClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure ClearBlobButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BlobDlg: TBlobDlg;

implementation

uses DB, browse, query, main;

{$R *.DFM}

procedure TBlobDlg.LoadBtnClick(Sender: TObject);
begin
   if (MainForm.ActiveMDIChild is TBrowseForm) then
      begin
      with (MainForm.ActiveMDIChild as TBrowseForm) do
         BlobSizeLabel.Caption:=IntToStr(MainForm.LoadBlobData(
                        TBlobField(BrowseGrid.SelectedField)));
      end
   else if (MainForm.ActiveMDIChild is TQueryForm) then
      begin
      with (MainForm.ActiveMDIChild as TQueryForm) do
         BlobSizeLabel.Caption:=IntToStr(MainForm.LoadBlobData(
                        TBlobField(QueryGrid.SelectedField)));
      end;
end;

procedure TBlobDlg.SaveBtnClick(Sender: TObject);
begin
   if (MainForm.ActiveMDIChild is TBrowseForm) then
      begin
      with (MainForm.ActiveMDIChild as TBrowseForm) do
         MainForm.SaveBlobData(TBlobField(BrowseGrid.SelectedField));
      end
   else if (MainForm.ActiveMDIChild is TQueryForm) then
      begin
      with (MainForm.ActiveMDIChild as TQueryForm) do
         MainForm.SaveBlobData(TBlobField(QueryGrid.SelectedField));
      end;
end;

procedure TBlobDlg.ClearBlobButtonClick(Sender: TObject);
begin
   if (MainForm.ActiveMDIChild is TBrowseForm) then
      begin
      with (MainForm.ActiveMDIChild as TBrowseForm) do
         MainForm.ClearBlobData(TBlobField(BrowseGrid.SelectedField));
      end
   else if (MainForm.ActiveMDIChild is TQueryForm) then
      begin
      with (MainForm.ActiveMDIChild as TQueryForm) do
         MainForm.ClearBlobData(TBlobField(QueryGrid.SelectedField));
      end;
   BlobSizeLabel.Caption:='0 bytes';
end;

procedure TBlobDlg.FormShow(Sender: TObject);
begin
   Screen.Cursor:=crDefault;
end;

end.
