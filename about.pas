unit about;

interface

{$R verinfo.res}

uses SysUtils, Classes,

{$I dbisamvr.inc}

Windows, Forms, Graphics, Controls, StdCtrls, ExtCtrls,

dbisamut;

type
  TAboutBox = class(TForm)
    CloseButton: TButton;
    GroupBox1: TGroupBox;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Bevel1: TBevel;
    VersionMemo: TMemo;
    ProductLabel: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

uses main;

{$R *.dfm}


procedure TAboutBox.FormCreate(Sender: TObject);
begin
   with VersionMemo,MainForm.AppVersionInformation do
      begin
      ProgramIcon.Picture.Assign(Application.Icon);
      ProductLabel.Caption:=ProductName;
      Lines.Add('');
      Lines.Add('Version '+ProductVersion+' ('+FileVersion+')');
      Lines.Add('');
      Lines.Add(LegalCopyright);
      Lines.Add('All Rights Reserved');
      Lines.Add('');
      end;
end;

end.

