{*************************************************************************
*
*      DBISAM Delphi TDataSet descendant session password
*      dialog for Delphi 5.x, C++Builder 5.x, and Kylix 2.x and later 
*
*      Copyright 1996-2005  Elevate Software
*      All rights reserved.
*
*************************************************************************}

unit dbisampw;

interface

uses SysUtils, Classes,

{$I dbisamvr.inc}

Windows, Graphics, Forms, Controls, StdCtrls,

dbisamtb;

type
   TDBISAMPasswordDialog = class(TForm)
      GroupBox1: TGroupBox;
      Edit: TEdit;
      AddButton: TButton;
      RemoveButton: TButton;
      RemoveAllButton: TButton;
      OKButton: TButton;
      CancelButton: TButton;
      procedure EditChange(Sender: TObject);
      procedure AddButtonClick(Sender: TObject);
      procedure RemoveButtonClick(Sender: TObject);
      procedure RemoveAllButtonClick(Sender: TObject);
      procedure OKButtonClick(Sender: TObject);
   private
      PasswordAdded: Boolean;
      FSession: TComponent;
   end;

function PasswordDialog(ASession: TComponent): Boolean;

implementation

{$R *.dfm}


function PasswordDialog(ASession: TComponent): Boolean;
begin
   with TDBISAMPasswordDialog.Create(Application) do
      begin
      try
         FSession:=ASession;
         Result:=(ShowModal=mrOk);
      finally
         Free;
      end;
      end;
end;

procedure TDBISAMPasswordDialog.EditChange(Sender: TObject);
var
   HasText: Boolean;
begin
   HasText:=(Edit.Text <> '');
   AddButton.Enabled:=HasText;
   RemoveButton.Enabled:=HasText;
   OKButton.Enabled:=(HasText or PasswordAdded);
end;

procedure TDBISAMPasswordDialog.AddButtonClick(Sender: TObject);
begin
   (FSession as TDBISAMSession).AddPassword(Edit.Text);
   PasswordAdded:=True;
   Edit.Clear;
   Edit.SetFocus;
end;

procedure TDBISAMPasswordDialog.RemoveButtonClick(Sender: TObject);
begin
   (FSession as TDBISAMSession).RemovePassword(Edit.Text);
   Edit.Clear;
   Edit.SetFocus;
end;

procedure TDBISAMPasswordDialog.RemoveAllButtonClick(Sender: TObject);
begin
   (FSession as TDBISAMSession).RemoveAllPasswords;
   Edit.SetFocus;
end;

procedure TDBISAMPasswordDialog.OKButtonClick(Sender: TObject);
begin
   (FSession as TDBISAMSession).AddPassword(Edit.Text);
end;

end.
