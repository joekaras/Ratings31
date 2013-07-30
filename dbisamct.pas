{*************************************************************************
*
*      Controls used in DBISAM utilities
*
*      Copyright 1996-2005  Elevate Software
*      All rights reserved.
*
*************************************************************************}

unit dbisamct;

interface

{$R dbisamct.res}

uses SysUtils, Classes,

{$I dbisamvr.inc}

  Windows, Messages, Graphics, Controls, Forms, Dialogs, Grids, DBGrids,
  StdCtrls, ComCtrls,

{$WARNINGS OFF}
FileCtrl;
{$WARNINGS ON}


type

  { TDBISAMDBGrid }

  TDBISAMDBGrid = class(TDBGrid)
  private
    FIsLoaded: Boolean;
    FFitColumns: Boolean;
    FAutoSizing: Boolean;
    procedure UpdateColWidths;
    procedure SetFitColumns(Value: Boolean);
  protected
    procedure ColWidthsChanged; override;
    procedure SizeChanged(OldColCount, OldRowCount: Integer); override;
    procedure TopLeftChanged; override;
    procedure LayoutChanged; override;
    procedure Loaded; override;
    function DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean; override;
    function DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure RefreshCols;
  published
    property FitColumns: Boolean read FFitColumns write SetFitColumns;
  end;

  { TDBISAMFileListBox }

  TDBISAMFileListBox = class(TFileListBox)
  protected
    procedure ReadBitmaps; override;
  end;

  { TDBISAMDirectoryListBox }

  TDBISAMDirectoryListBox = class(TDirectoryListBox)
  private
  protected
    procedure ReadBitmaps; override;
  end;

  { TDBISAMDriveComboBox }

  TDBISAMDriveComboBox = class(TDriveComboBox)
  protected
    procedure BuildList; override;
  end;

  { TDBISAMStatusBar }

  TDBISAMStatusBar = class(TStatusBar)
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{ TDBISAMDBGrid }

constructor TDBISAMDBGrid.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   FIsLoaded:=False;
   FAutoSizing:=False;
   FFitColumns:=False;
end;

procedure TDBISAMDBGrid.UpdateColWidths;
var
   TotalWidth: Integer;
   DesiredWidth: Integer;
   MaxWidth: Integer;
   I: Integer;
   TempColumnsToFit: Integer;
begin
   if (not (csReading in ComponentState)) and
      (not (csLoading in ComponentState)) and FIsLoaded then
      begin
      if (not FAutoSizing) and FFitColumns and
         (UpdateLock=0) and (LayoutLock=0) then
         begin
         FAutoSizing:=True;
         try
            TempColumnsToFit:=ColCount;
            if (TempColumnsToFit=0) then Exit;
            TotalWidth:=0;
            DesiredWidth:=ClientWidth;
            for I:=0 to TempColumnsToFit-1 do
               Inc(TotalWidth,(ColWidths[I]+GridLineWidth));
            if (TotalWidth <> DesiredWidth) then
               begin
               for I:=(TempColumnsToFit-1) downto 0 do
                  begin
                  if (TotalWidth <> DesiredWidth) then
                     begin
                     if (TotalWidth > DesiredWidth) then
                        begin
                        if ((TotalWidth-DesiredWidth) > ColWidths[I]) then
                           begin
                           Dec(TotalWidth,ColWidths[I]);
                           ColWidths[I]:=0;
                           end
                        else
                           begin
                           ColWidths[I]:=(ColWidths[I]-(TotalWidth-DesiredWidth));
                           Dec(TotalWidth,(TotalWidth-DesiredWidth));
                           end;
                        end
                     else
                        begin
                        ColWidths[I]:=(ColWidths[I]+(DesiredWidth-TotalWidth));
                        Inc(TotalWidth,(DesiredWidth-TotalWidth));
                        end;
                     end
                  else
                     Break;
                  end;
               end;
         finally
            FAutoSizing:=False;
         end;
         end
      else
         begin
         if (not FFitColumns) then
            begin
            MaxWidth:=(ClientWidth div 2);
            for I:=0 to ColCount-1 do
               begin
               if ((ColWidths[I]+GridLineWidth) > MaxWidth) then
                  ColWidths[I]:=MaxWidth;
               end;
            end;
         end;
      end;
end;

procedure TDBISAMDBGrid.ColWidthsChanged;
begin
   inherited ColWidthsChanged;
   UpdateColWidths;
end;

procedure TDBISAMDBGrid.SizeChanged(OldColCount, OldRowCount: Integer);
begin
   inherited SizeChanged(OldColCount,OldRowCount);
   UpdateColWidths;
end;

procedure TDBISAMDBGrid.SetFitColumns(Value: Boolean);
begin
   if (Value <> FFitColumns) then
      begin
      FFitColumns:=Value;
      UpdateColWidths;
      end;
end;

procedure TDBISAMDBGrid.TopLeftChanged;
begin
   inherited TopLeftChanged;
   UpdateColWidths;
end;

procedure TDBISAMDBGrid.LayoutChanged;
begin
   inherited LayoutChanged;
   UpdateColWidths;
end;

procedure TDBISAMDBGrid.Loaded;
begin
   inherited Loaded;
   FIsLoaded:=True;
   UpdateColWidths;
end;

procedure TDBISAMDBGrid.RefreshCols;
begin
   UpdateColWidths;
end;

function TDBISAMDBGrid.DoMouseWheelDown(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
   if Assigned(InplaceEditor) and InplaceEditor.Focused then
      Result := False // Not handled here
   else
      begin
      Perform(WM_VScroll,SB_LINEDOWN,0);
      Result:=True;
      end;
end;

function TDBISAMDBGrid.DoMouseWheelUp(Shift: TShiftState; MousePos: TPoint): Boolean;
begin
   if Assigned(InplaceEditor) and InplaceEditor.Focused then
      Result:=False // Not handled here
   else
      begin
      Perform(WM_VScroll,SB_LINEUP,0);
      Result:=True;
      end;
end;

{ TDBISAMFileListBox }

procedure TDBISAMFileListBox.ReadBitmaps;
begin
   inherited;
   ExeBMP.LoadFromResourceName(HInstance,'DBISAM_EXECUTABLE');
   DirBMP.LoadFromResourceName(HInstance,'DBISAM_CLOSEDFOLDER');
   UnknownBMP.LoadFromResourceName(HInstance,'DBISAM_UNKNOWN');
end;

{ TDBISAMDirectoryListBox }

procedure TDBISAMDirectoryListBox.ReadBitmaps;
begin
   inherited;
   OpenedBMP.LoadFromResourceName(HInstance,'DBISAM_OPENFOLDER');
   ClosedBMP.LoadFromResourceName(HInstance,'DBISAM_CLOSEDFOLDER');
   CurrentBMP.LoadFromResourceName(HInstance,'DBISAM_CURRENTFOLDER');
end;

{ TDBISAMDriveComboBox }

procedure TDBISAMDriveComboBox.BuildList;
begin
   inherited;
   FloppyBMP.LoadFromResourceName(HInstance,'DBISAM_FLOPPY');
   FixedBMP.LoadFromResourceName(HInstance,'DBISAM_HARD');
   NetworkBMP.LoadFromResourceName(HInstance,'DBISAM_NETWORK');
   CDROMBMP.LoadFromResourceName(HInstance,'DBISAM_CDROM');
   RAMBMP.LoadFromResourceName(HInstance,'DBISAM_RAM');
end;

{ TDBISAMStatusBar }

constructor TDBISAMStatusBar.Create(AOwner: TComponent);
begin
   inherited Create(AOwner);
   ControlStyle:=ControlStyle+[csAcceptsControls];
end;

end.
