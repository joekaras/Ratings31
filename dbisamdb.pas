{*************************************************************************
*
*      DBISAM Delphi TDataSet descendant database selection
*      dialog for Delphi 5.x, C++Builder 5.x, and Kylix 2.x and later
*
*      Copyright 1996-2005  Elevate Software
*      All rights reserved.
*
*************************************************************************}

unit dbisamdb;

interface

uses SysUtils, Classes,

{$I dbisamvr.inc}

Windows, Graphics, Forms, Controls, StdCtrls, ExtCtrls, ImgList, ComCtrls,


dbisamtb;

type
  TBrowseDatabaseDlg = class(TForm)
    OKButton: TButton;
    CancelButton: TButton;
    OperationLabel: TLabel;
    DatabaseTreeView: TTreeView;
    DatabaseImageList: TImageList;
    procedure DatabaseTreeViewClick(Sender: TObject);
  private
    RootNode: TTreeNode;
  public
    SelectedDatabase: string;
    procedure SetupDatabases(RemoteSession: TDBISAMSession;
                             const CurDatabaseName: string);
  end;

var
  BrowseDatabaseDlg: TBrowseDatabaseDlg;

implementation

{$R *.dfm}


procedure TBrowseDatabaseDlg.SetupDatabases(RemoteSession: TDBISAMSession;
                                            const CurDatabaseName: string);
var
   TempString: string;
   TempStrings: TStrings;
   I: Integer;
begin
   TempStrings:=TStringList.Create;
   try
      TempString:=RemoteSession.GetRemoteServerName;
      if (TempString='') then
         TempString:='Remote Server';
      if (RemoteSession.RemoteHost <> '') then
         RootNode:=DatabaseTreeView.Items.Add(nil,TempString+' at '+RemoteSession.RemoteHost)
      else
         RootNode:=DatabaseTreeView.Items.Add(nil,TempString+' at '+RemoteSession.RemoteAddress);
      RootNode.ImageIndex:=0;
      DatabaseTreeView.Selected:=RootNode;
      RemoteSession.GetRemoteDatabaseNames(TempStrings);
      for I:=0 to TempStrings.Count-1 do
         begin
         with DatabaseTreeView.Items.AddChild(RootNode,TempStrings[I]) do
            begin
            ImageIndex:=1;
            SelectedIndex:=2;
            if (AnsiCompareText(TempStrings[I],CurDatabaseName)=0) then
               begin
               Selected:=True;
               SelectedDatabase:=TempStrings[I];
               end;
            end;
         end;
   finally
      TempStrings.Free;
   end;
end;

procedure TBrowseDatabaseDlg.DatabaseTreeViewClick(Sender: TObject);
begin
   if (DatabaseTreeView.Selected <> nil) and
      (DatabaseTreeView.Selected <> RootNode) then
      begin
      SelectedDatabase:=DatabaseTreeView.Selected.Text;
      OkButton.Enabled:=True;
      end
   else
      begin
      SelectedDatabase:='';
      OkButton.Enabled:=False;
      end;
end;

end.
