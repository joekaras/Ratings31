unit graphic;

interface

uses Windows, Messages, Classes, Graphics, Forms, Controls, Buttons,
     StdCtrls, DBCtrls, Dialogs, ExtCtrls, ComCtrls, dbisamtb;

type
  TGraphicDlg = class(TForm)
    CloseBtn: TButton;
    GroupBox1: TGroupBox;
    DBImage: TDBImage;
    GroupBox2: TGroupBox;
    CenterCheckBox: TCheckBox;
    StretchCheckBox: TCheckBox;
    GroupBox3: TGroupBox;
    LoadBtn: TButton;
    SaveBtn: TButton;
    QuickDrawCheckBox: TCheckBox;
    GroupBox4: TGroupBox;
    GraphicSizeLabel: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CenterCheckBoxClick(Sender: TObject);
    procedure StretchCheckBoxClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure QuickDrawCheckBoxClick(Sender: TObject);
    procedure LoadBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GraphicDlg: TGraphicDlg;

implementation

uses SysUtils, DB, main, browse, query, dbisamcn, dbisamut;

{$R *.DFM}

procedure TGraphicDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   try
      with TGraphicField(DBImage.DataSource.DataSet.FieldByName(DBImage.DataField)) do
         begin
         if (DataSet.State in [dsEdit,dsInsert]) then
            begin
            if DBImage.Picture.Graphic is TBitmap then
               Assign(DBImage.Picture.Graphic)
            else
               Clear;
            end;
         end;
   except
      on E: Exception do
         begin
         if (E is EDBISAMEngineError) then
            begin
            if (EDBISAMEngineError(E).ErrorCode <> DBISAM_REMOTECOMMLOST) then
               raise;
            end
         else
            raise;
         end;
   end;
   DBImage.DataSource:=nil;
   DBImage.DataField:='';
end;

procedure TGraphicDlg.CenterCheckBoxClick(Sender: TObject);
begin
   DBImage.Center:=CenterCheckBox.Checked;
end;

procedure TGraphicDlg.StretchCheckBoxClick(Sender: TObject);
begin
   DBImage.Stretch:=StretchCheckBox.Checked;
end;

procedure TGraphicDlg.QuickDrawCheckBoxClick(Sender: TObject);
begin
   DBImage.QuickDraw:=QuickDrawCheckBox.Checked;
end;

procedure TGraphicDlg.LoadBtnClick(Sender: TObject);
begin
   if (MainForm.ActiveMDIChild is TBrowseForm) then
      begin
      with (MainForm.ActiveMDIChild as TBrowseForm) do
         GraphicSizeLabel.Caption:=IntToStr(MainForm.LoadBlobData(
                        TGraphicField(BrowseGrid.SelectedField)));
      end
   else if (MainForm.ActiveMDIChild is TQueryForm) then
      begin
      with (MainForm.ActiveMDIChild as TQueryForm) do
         GraphicSizeLabel.Caption:=IntToStr(MainForm.LoadBlobData(
                        TGraphicField(QueryGrid.SelectedField)));
      end;
end;

procedure TGraphicDlg.SaveBtnClick(Sender: TObject);
begin
   if (MainForm.ActiveMDIChild is TBrowseForm) then
      begin
      with (MainForm.ActiveMDIChild as TBrowseForm) do
         MainForm.SaveBlobData(TGraphicField(BrowseGrid.SelectedField));
      end
   else if (MainForm.ActiveMDIChild is TQueryForm) then
      begin
      with (MainForm.ActiveMDIChild as TQueryForm) do
         MainForm.SaveBlobData(TGraphicField(QueryGrid.SelectedField));
      end;
end;

procedure TGraphicDlg.FormShow(Sender: TObject);
begin
   Screen.Cursor:=crDefault;
end;

procedure TGraphicDlg.FormCreate(Sender: TObject);
begin
   ReadWindowSettings(Self,MainForm.AppDirectory,
                      MainForm.AppVersionInformation.FileNameRoot,'Graphic Window');
end;

procedure TGraphicDlg.FormDestroy(Sender: TObject);
begin
   SaveWindowSettings(Self,MainForm.AppDirectory,
                      MainForm.AppVersionInformation.FileNameRoot,'Graphic Window');
end;

end.
