unit memo;

interface

uses Windows, Messages, Classes, Graphics, Forms, Controls, Buttons,
     StdCtrls, DBCtrls, Dialogs, ComCtrls, ExtCtrls, dbisamtb;

type
  TMemoDlg = class(TForm)
    CloseBtn: TButton;
    GroupBox1: TGroupBox;
    DBMemo: TDBMemo;
    GroupBox2: TGroupBox;
    TabsCheckBox: TCheckBox;
    WrapCheckBox: TCheckBox;
    GroupBox3: TGroupBox;
    SaveBtn: TButton;
    LoadBtn: TButton;
    GroupBox4: TGroupBox;
    MemoSizeLabel: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WrapCheckBoxClick(Sender: TObject);
    procedure TabsCheckBoxClick(Sender: TObject);
    procedure LoadBtnClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MemoDlg: TMemoDlg;

implementation

uses SysUtils, DB, main, browse, query, dbisamcn, dbisamut;

{$R *.DFM}

procedure TMemoDlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   try
      with TMemoField(DBMemo.DataSource.DataSet.FieldByName(DBMemo.DataField)) do
         begin
         if (DataSet.State in [dsEdit,dsInsert]) then
            Assign(DBMemo.Lines);
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
   DBMemo.DataSource:=nil;
   DBMemo.DataField:='';
end;

procedure TMemoDlg.WrapCheckBoxClick(Sender: TObject);
begin
   if WrapCheckBox.Checked then
      DBMemo.Scrollbars:=ssVertical
   else
      DBMemo.Scrollbars:=ssBoth;
   DBMemo.WordWrap:=WrapCheckBox.Checked;
end;

procedure TMemoDlg.TabsCheckBoxClick(Sender: TObject);
begin
   DBMemo.WantTabs:=TabsCheckBox.Checked;
end;

procedure TMemoDlg.LoadBtnClick(Sender: TObject);
begin
   if (MainForm.ActiveMDIChild is TBrowseForm) then
      begin
      with (MainForm.ActiveMDIChild as TBrowseForm) do
         MemoSizeLabel.Caption:=IntToStr(MainForm.LoadBlobData(
                        TMemoField(BrowseGrid.SelectedField)));
      end
   else if (MainForm.ActiveMDIChild is TQueryForm) then
      begin
      with (MainForm.ActiveMDIChild as TQueryForm) do
         MemoSizeLabel.Caption:=IntToStr(MainForm.LoadBlobData(
                        TMemoField(QueryGrid.SelectedField)));
      end;
end;

procedure TMemoDlg.SaveBtnClick(Sender: TObject);
begin
   if (MainForm.ActiveMDIChild is TBrowseForm) then
      begin
      with (MainForm.ActiveMDIChild as TBrowseForm) do
         MainForm.SaveBlobData(TMemoField(BrowseGrid.SelectedField));
      end
   else if (MainForm.ActiveMDIChild is TQueryForm) then
      begin
      with (MainForm.ActiveMDIChild as TQueryForm) do
         MainForm.SaveBlobData(TMemoField(QueryGrid.SelectedField));
      end;
end;

procedure TMemoDlg.FormShow(Sender: TObject);
begin
   Screen.Cursor:=crDefault;
end;

procedure TMemoDlg.FormCreate(Sender: TObject);
begin
   ReadWindowSettings(Self,MainForm.AppDirectory,
                      MainForm.AppVersionInformation.FileNameRoot,'Memo Window');
end;

procedure TMemoDlg.FormDestroy(Sender: TObject);
begin
   SaveWindowSettings(Self,MainForm.AppDirectory,
                      MainForm.AppVersionInformation.FileNameRoot,'Memo Window');
end;

end.
