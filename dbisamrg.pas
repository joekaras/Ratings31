{*************************************************************************
*
*      DBISAM Delphi TDataSet descendant registration and
*      property editors for Delphi 3.x +, C++Builder 3.x +,
*      and Kylix 2.x +
*
*      Copyright 1996-2005  Elevate Software
*      All rights reserved.
*
*************************************************************************}

unit dbisamrg;

interface

uses SysUtils, Classes,

{$I dbisamvr.inc}

{$WARNINGS OFF}
Windows, ShlObj, DesignEditors, DesignIntf, Controls, Forms, TypInfo,
   ColnEdit, DBReg, DB, DsnDBCst, DsnDB, DSDesign, DBLogDlg, DBPWDlg, FldLinks,
   ModelViews, ModelPrimitives, TreeIntf, DiagramSupport,
dbisamct,

dbisamdb, dbisamtb, dbisamcn, dbisamlb;

{$WARNINGS ON}


const
  cDefaultDBISAMSessionSprigName =    '<DefaultDBISAMSession>';
  cImpliedDBISAMSessionSprigPrefix =  '<ImpliedDBISAMSession>';
  cImpliedDBISAMDatabaseSprigPrefix = '<ImpliedDBISAMDatabase>';

type


   TDBISAMSessionSprig = class(TComponentSprig)
   public
      function Name: string; override;
      function Caption: string; override;
      function AnyProblems: Boolean; override;
   end;

   TDefaultDBISAMSessionSprig = class(TTransientSprig)
   public
      function UniqueName: string; override;
      function Caption: string; override;
      function ItemClass: TClass; override;
   end;

   TImpliedDBISAMSessionSprig = class(TTransientSprig)
   private
      FSessionName: string;
   public
      function UniqueName: string; override;
      function Caption: string; override;
      function ItemClass: TClass; override;
   end;

   TDBISAMDatabaseSprig = class(TComponentSprig)
   public
      function Name: string; override;
      function Caption: string; override;
      function AnyProblems: Boolean; override;
      procedure FigureParent; override;
      function DragDropTo(AItem: TSprig): Boolean; override;
      function DragOverTo(AItem: TSprig): Boolean; override;
      class function PaletteOverTo(AParent: TSprig; AClass: TClass): Boolean; override;
   end;

   TImpliedDBISAMDatabaseSprig = class(TTransientSprig)
   private
      FSessionName: string;
      FAlias: string;
   public
      function AnyProblems: Boolean; override;
      function UniqueName: string; override;
      function Caption: string; override;
      function ItemClass: TClass; override;
      procedure FigureParent; override;
      function DragDropTo(AItem: TSprig): Boolean; override;
      function DragOverTo(AItem: TSprig): Boolean; override;
   end;

   TDBISAMUpdateSQLSprig = class(TComponentSprig)
   public
      function AnyProblems: Boolean; override;
   end;


   TDBISAMDataSetSprig = class(TDataSetSprig)
   end;

   TDBISAMDBDataSetSprig = class(TDBISAMDataSetSprig)
   public
      function AnyProblems: Boolean; override;
      procedure FigureParent; override;
      procedure Reparent; override;
      function DragDropTo(AItem: TSprig): Boolean; override;
      function DragOverTo(AItem: TSprig): Boolean; override;
      class function PaletteOverTo(AParent: TSprig; AClass: TClass): Boolean; override;
   end;

   TDBISAMTableSprig = class(TDBISAMDBDataSetSprig)
   public
      function AnyProblems: Boolean; override;
      function Caption: string; override;
   end;

   TDBISAMQuerySprig = class(TDBISAMDBDataSetSprig)
   public
      function AnyProblems: Boolean; override;
   end;


   TDBISAMDataSetIsland = class(TDataSetIsland)
   end;

   TDBISAMDBDataSetIsland = class(TDBISAMDataSetIsland)
   end;

   TDBISAMTableIsland = class(TDBISAMDBDataSetIsland)
   end;

   TDBISAMTableMasterDetailBridge = class(TMasterDetailBridge)
   public
      function CanEdit: Boolean; override;
      class function OmegaIslandClass: TIslandClass; override;
      class function GetOmegaSource(AItem: TPersistent): TDataSource; override;
      class procedure SetOmegaSource(AItem: TPersistent; ADataSource: TDataSource); override;
      function Caption: string; override;
      function Edit: Boolean; override;
   end;

   TDBISAMQueryIsland = class(TDBISAMDBDataSetIsland)
   end;

   TDBISAMQueryMasterDetailBridge = class(TMasterDetailBridge)
   public
      class function RemoveMasterFieldsAsWell: Boolean; override;
      class function OmegaIslandClass: TIslandClass; override;
      class function GetOmegaSource(AItem: TPersistent): TDataSource; override;
      class procedure SetOmegaSource(AItem: TPersistent; ADataSource: TDataSource); override;
      function Caption: string; override;
   end;


function SprigDBISAMSessionName(const AName: string): string;
function SprigDBISAMImpliedDatabaseName(const AName: string): string;
function SprigDBISAMImpliedSessionName(const AName: string): string;


procedure Register;

implementation


{ TDBISAMIndexFieldNamesProperty }

type

   TDBISAMIndexFieldNamesProperty = class(TDBStringProperty)
   public
      procedure GetValueList(List: TStrings); override;
   end;

function GetPropertyValue(Instance: TPersistent; const PropName: string): TPersistent;
var
   PropInfo: PPropInfo;
begin
   Result:=nil;
   PropInfo:=TypInfo.GetPropInfo(Instance.ClassInfo,PropName);
   if (PropInfo <> nil) and (PropInfo^.PropType^.Kind=tkClass) then
      Result:=(TObject(GetOrdProp(Instance,PropInfo)) as TPersistent);
end;

function GetIndexDefs(Component: TPersistent): TDBISAMIndexDefs;
var
   DataSet: TDBISAMTable;
begin
   DataSet:=(Component as TDBISAMTable);
   Result:=(GetPropertyValue(DataSet,'IndexDefs') as TDBISAMIndexDefs);
   if Assigned(Result) then
      begin
      Result.Updated:=False;
      Result.Update;
      end;
end;

procedure TDBISAMIndexFieldNamesProperty.GetValueList(List: TStrings);
var
   I: Integer;
   IndexDefs: TDBISAMIndexDefs;
begin
   IndexDefs:=GetIndexDefs(GetComponent(0));
   for I:=0 to IndexDefs.Count-1 do
      begin
      with IndexDefs[I] do
         begin
         if (Options*[ixExpression,ixDescending]=[]) and (Fields <> '') then
            List.Add(Fields);
         end;
      end;
end;

{ TDBISAMIndexNameProperty }

type

   TDBISAMIndexNameProperty = class(TDBStringProperty)
   public
      procedure GetValueList(List: TStrings); override;
   end;

procedure TDBISAMIndexNameProperty.GetValueList(List: TStrings);
begin
   GetIndexDefs(GetComponent(0)).GetItemNames(List);
end;

{ TDBISAMSessionNameProperty }

type

   TDBISAMSessionNameProperty = class(TDBStringProperty)
   public
      procedure GetValueList(List: TStrings); override;
   end;

procedure TDBISAMSessionNameProperty.GetValueList(List: TStrings);
begin
   Engine.GetSessionNames(List);
end;

{ TDBISAMDatabaseNameProperty }

type

   TDBISAMDatabaseNameProperty = class(TDBStringProperty)
   public
      procedure GetValueList(List: TStrings); override;
   end;

procedure TDBISAMDatabaseNameProperty.GetValueList(List: TStrings);
begin
   (GetComponent(0) as TDBISAMDBDataSet).DBSession.GetDatabaseNames(List);
end;

{ TDBISAMTableNameProperty }

type

   TDBISAMTableNameProperty = class(TDBStringProperty)
   public
      procedure GetValueList(List: TStrings); override;
   end;

procedure TDBISAMTableNameProperty.GetValueList(List: TStrings);
var
   Table: TDBISAMTable;
begin
   Table:=GetComponent(0) as TDBISAMTable;
   Table.DBSession.GetTableNames(Table.DatabaseName,List);
end;

{ TDBISAMDatabaseDirectoryProperty }

type

   TDBISAMDatabaseDirectoryProperty = class(TStringProperty)
      procedure Edit; override;
      function GetAttributes: TPropertyAttributes; override;
      function GetValue: string; override;
   end;

function TDBISAMDatabaseDirectoryProperty.GetValue: string;
begin
   Result:=TDBISAMDatabase(GetComponent(0)).Directory;
end;

function TDBISAMDatabaseDirectoryProperty.GetAttributes: TPropertyAttributes;
begin
   Result:=[paDialog];
end;

{ Version 5}
function BrowseCallback(Wnd: HWND; uMsg: UINT; lParam,lpData: LPARAM): Integer; stdcall;
begin
   Result:=0;
   if (uMsg=BFFM_INITIALIZED) then
      begin
      if (StrLen(PChar(lpData)) > 0) then
         SendMessage(Wnd,BFFM_SETSELECTION,1,lpData);
      end;
end;

function GetDirectory(var DirectoryStr: string): Boolean;
var
   WindowList: Pointer;
   Buffer: array[0..MAX_PATH] of Char;
   ItemIdList: PItemIDList;
   BrowseInfo: TBrowseInfo;
begin
   Result:=False;
   with BrowseInfo do
      begin
      hwndOwner:=Screen.ActiveForm.Handle;
      pidlRoot:=nil;
      pszDisplayName:=Buffer;
      lpszTitle:='Select Database Directory';
      ulFlags:=(BIF_RETURNONLYFSDIRS+BIF_EDITBOX);
      lpfn:=BrowseCallback;
      lParam:=Integer(PChar(DirectoryStr));
      end;
   WindowList:=DisableTaskWindows(0);
   try
      ItemIdList:=ShBrowseForFolder(BrowseInfo);
   finally
      EnableTaskWindows(WindowList);
   end;
   if (ItemIDList=nil) then
      Exit;
   if SHGetPathFromIDList(ItemIDList,@Buffer) then
      begin
      Result:=True;
      DirectoryStr:=StrPas(@Buffer);
      end;
end;
{ Version 5}

procedure TDBISAMDatabaseDirectoryProperty.Edit;
var
   TempString: string;
begin
   TempString:=TDBISAMDatabase(GetComponent(0)).Directory;
   if GetDirectory(TempString) then
      TDBISAMDatabase(GetComponent(0)).Directory:=TempString;
end;


{ TDBISAMDatabaseRemoteDatabaseProperty }

type

   TDBISAMDatabaseRemoteDatabaseProperty = class(TStringProperty)
      procedure Edit; override;
      function GetAttributes: TPropertyAttributes; override;
      function GetValue: string; override;
   end;

function GetDatabase(RemoteSession: TDBISAMSession; var DatabaseStr: string): Boolean;
begin
   Result:=False;
   BrowseDatabaseDlg:=TBrowseDatabaseDlg.Create(nil);
   try
      with BrowseDatabaseDlg do
         begin
         SetupDatabases(RemoteSession,DatabaseStr);
         if (ShowModal=mrOk) then
            begin
            DatabaseStr:=SelectedDatabase;
            Result:=True;
            end;
         end;
   finally
      BrowseDatabaseDlg.Free;
   end;
end;

function TDBISAMDatabaseRemoteDatabaseProperty.GetValue: string;
begin
   Result:=TDBISAMDatabase(GetComponent(0)).RemoteDatabase;
end;

function TDBISAMDatabaseRemoteDatabaseProperty.GetAttributes: TPropertyAttributes;
begin
   Result:=[paDialog];
end;

procedure TDBISAMDatabaseRemoteDatabaseProperty.Edit;
var
   TempString: string;
begin
   TempString:=TDBISAMDatabase(GetComponent(0)).RemoteDatabase;
   if ((GetComponent(0) as TDBISAMDatabase).Session.SessionType=stRemote) then
      begin
      if GetDatabase((GetComponent(0) as TDBISAMDatabase).Session,TempString) then
         TDBISAMDatabase(GetComponent(0)).RemoteDatabase:=TempString;
      end
   else
      raise Exception.Create('The TDBISAMDatabase component must be connected '+
                             'to a remote session in order to access this '+
                             'property editor');
end;

{ TDBISAMQueryParamsProperty }

type

   TDBISAMQueryParamsProperty = class(TCollectionProperty)
   public
      function GetColOptions: TColOptions; override;
   end;

function TDBISAMQueryParamsProperty.GetColOptions: TColOptions;
begin
   Result:=[];
end;

{ TDBISAMTableFieldLinkProperty }

type

  TDBISAMTableFieldLinkProperty = class(TFieldLinkProperty)
  private
    FTable: TDBISAMTable;
    FIndexDefs: TIndexDefs;
  protected
    procedure GetFieldNamesForIndex(List: TStrings); override;
    function GetIndexBased: Boolean; override;
    function GetIndexDefs: TIndexDefs; override;
    function GetIndexFieldNames: string; override;
    function GetIndexName: string; override;
    function GetMasterFields: string; override;
    procedure SetIndexFieldNames(const Value: string); override;
    procedure SetIndexName(const Value: string); override;
    procedure SetMasterFields(const Value: string); override;
  public
    property IndexBased: Boolean read GetIndexBased;
    property IndexDefs: TIndexDefs read GetIndexDefs;
    property IndexFieldNames: string read GetIndexFieldNames write SetIndexFieldNames;
    property IndexName: string read GetIndexName write SetIndexName;
    property MasterFields: string read GetMasterFields write SetMasterFields;
    procedure Edit; override;
  end;

procedure TDBISAMTableFieldLinkProperty.Edit;
var
   Table: TDBISAMTable;
begin
   Table:=(DataSet as TDBISAMTable);
   FTable:=TDBISAMTable.Create(nil);
   FIndexDefs:=TIndexDefs.Create(FTable);
   try
      FTable.SessionName:=Table.SessionName;
      FTable.DatabaseName:=Table.DatabaseName;
      FTable.TableName:=Table.TableName;
      if (Table.IndexFieldNames <> '') then
         FTable.IndexFieldNames:=Table.IndexFieldNames
      else
         FTable.IndexName:=Table.IndexName;
      FTable.MasterFields:=Table.MasterFields;
      FTable.Open;
      inherited Edit;
      if Changed then
         begin
         Table.MasterFields:=FTable.MasterFields;
         if (FTable.IndexFieldNames <> '') then
            Table.IndexFieldNames:=FTable.IndexFieldNames
         else
            Table.IndexName:=FTable.IndexName;
         end;
   finally
      FIndexDefs.Free;
      FTable.Free;
   end;
end;

procedure TDBISAMTableFieldLinkProperty.GetFieldNamesForIndex(List: TStrings);
var
   I: Integer;
begin
   for I:=0 to FTable.IndexFieldCount-1 do
      List.Add(FTable.IndexFields[I].FieldName);
end;

function TDBISAMTableFieldLinkProperty.GetIndexBased: Boolean;
begin
  Result:=True;
end;

function TDBISAMTableFieldLinkProperty.GetIndexDefs: TIndexDefs;
begin
   FIndexDefs.Assign(FTable.IndexDefs);
   Result:=FIndexDefs;
end;

function TDBISAMTableFieldLinkProperty.GetIndexFieldNames: string;
begin
   Result:=FTable.IndexFieldNames;
end;

function TDBISAMTableFieldLinkProperty.GetIndexName: string;
begin
   Result:=FTable.IndexName;
end;

function TDBISAMTableFieldLinkProperty.GetMasterFields: string;
begin
   Result:=FTable.MasterFields;
end;

procedure TDBISAMTableFieldLinkProperty.SetIndexFieldNames(const Value: string);
begin
   FTable.IndexFieldNames:=Value;
end;

procedure TDBISAMTableFieldLinkProperty.SetIndexName(const Value: string);
begin
   if (Value=SPrimary) then
      FTable.IndexName:= ''
   else
      FTable.IndexName:=Value;
end;

procedure TDBISAMTableFieldLinkProperty.SetMasterFields(const Value: string);
begin
   FTable.MasterFields:=Value;
end;


{ Data model support }

function SprigDBISAMSessionName(const AName: string): string;
begin
   Result:=AName;
   if (Result='') or (AnsiCompareText(Result,Session.SessionName)=0) then
      Result:=cDefaultDBISAMSessionSprigName;
end;

function SprigDBISAMImpliedDatabaseName(const AName: string): string;
begin
   Result:=Format('%s.%s',[cImpliedDBISAMDatabaseSprigPrefix,AName]);
end;

function SprigDBISAMImpliedSessionName(const AName: string): string;
begin
   Result:=Format('%s.%s',[cImpliedDBISAMSessionSprigPrefix,AName]);
end;

{ TDBISAMUpdateSQLSprig }

function TDBISAMUpdateSQLSprig.AnyProblems: Boolean;
begin
   with TDBISAMUpdateSQL(Item) do
      Result := (ModifySQL.Count=0) and (InsertSQL.Count=0) and
                (DeleteSQL.Count=0);
end;

{ TDBISAMDBDataSetSprig }

function TDBISAMDBDataSetSprig.AnyProblems: Boolean;
begin
   Result:=inherited AnyProblems or (TDBISAMDBDataSet(Item).DatabaseName='');
end;

procedure TDBISAMDBDataSetSprig.FigureParent;
var
   vSessionName: string;
   vSession: TSprig;
   vDatabase: TSprig;
begin
   with TDBISAMDBDataSet(Item) do
      begin
      { Find real or default session }
      vSessionName:=SprigDBISAMSessionName(SessionName);
      vSession:=Root.Find(vSessionName, False);
       { If not found see if its the default session }
      if (vSession=nil) and (vSessionName=cDefaultDBISAMSessionSprigName) then
         vSession:=Root.Add(TDefaultDBISAMSessionSprig.Create(nil));
      { Still not found, try for an implied session }
      if (vSession=nil) then
         begin
         vSession:=Root.Find(SprigDBISAMImpliedSessionName(SessionName),False);
         { If not make an implied session }
         if (vSession=nil) then
            begin
            vSession:=Root.Add(TImpliedDBISAMSessionSprig.Create(nil));
            TImpliedDBISAMSessionSprig(vSession).FSessionName:=SessionName;
            end;
         end;
      { Find data base under session }
      vDatabase:=vSession.Find(DatabaseName,False);
      { If not find a database alias }
      if (vDatabase=nil) then
         begin
         vDatabase:=vSession.Find(SprigDBISAMImpliedDatabaseName(DatabaseName),False);
         { If not make a database alias }
         if (vDatabase=nil) then
            begin
            vDatabase:=vSession.Add(TImpliedDBISAMDatabaseSprig.Create(nil));
            TImpliedDBISAMDatabaseSprig(vDatabase).FAlias:=DatabaseName;
            TImpliedDBISAMDatabaseSprig(vDatabase).FSessionName:=SessionName;
            end;
         end;
      { Set parent to the database }
      vDatabase.Add(Self);
      end;
end;

function TDBISAMDBDataSetSprig.DragDropTo(AItem: TSprig): Boolean;
begin
   if (AItem is TImpliedDBISAMDatabaseSprig) then
      begin
      Result:=(not (AnsiCompareText(TImpliedDBISAMDatabaseSprig(AItem).FAlias,TDBISAMDBDataSet(Item).DatabaseName)=0)) or
                (not (AnsiCompareText(TImpliedDBISAMDatabaseSprig(AItem).FSessionName,TDBISAMDBDataSet(Item).SessionName)=0));
      if Result then
         begin
         TDBISAMDBDataSet(Item).DatabaseName:=TImpliedDBISAMDatabaseSprig(AItem).FAlias;
         TDBISAMDBDataSet(Item).SessionName:=TImpliedDBISAMDatabaseSprig(AItem).FSessionName;
         end;
      end
   else if (AItem is TDBISAMDatabaseSprig) then
      begin
      Result:=(not (AnsiCompareText(TDBISAMDatabase(AItem.Item).DatabaseName,TDBISAMDBDataSet(Item).DatabaseName)=0)) or
              (not (AnsiCompareText(TDBISAMDatabase(AItem.Item).SessionName,TDBISAMDBDataSet(Item).SessionName)=0));
      if Result then
         begin
         TDBISAMDBDataSet(Item).DatabaseName:=TDBISAMDatabase(AItem.Item).DatabaseName;
         TDBISAMDBDataSet(Item).SessionName:=TDBISAMDatabase(AItem.Item).SessionName;
         end;
      end
   else
      Result:=False;
end;

function TDBISAMDBDataSetSprig.DragOverTo(AItem: TSprig): Boolean;
begin
   Result:=((AItem is TDBISAMDatabaseSprig) and (TDBISAMDatabase(AItem.Item).DatabaseName <> '')) or
            (AItem is TImpliedDBISAMDatabaseSprig);
end;

class function TDBISAMDBDataSetSprig.PaletteOverTo(AParent: TSprig; AClass: TClass): Boolean;
begin
   Result:=((AParent is TDBISAMDatabaseSprig) and (TDBISAMDatabase(AParent.Item).DatabaseName <> '')) or
            (AParent is TImpliedDBISAMDatabaseSprig);
end;

procedure TDBISAMDBDataSetSprig.Reparent;
begin
   if (Parent is TDBISAMDatabaseSprig) then
      TDBISAMDBDataSet(Item).SessionName:=TDBISAMDatabase(Parent.Item).SessionName
   else if (Parent is TImpliedDBISAMDatabaseSprig) then
      TDBISAMDBDataSet(Item).SessionName:=TImpliedDBISAMDatabaseSprig(Parent).FSessionName;
end;

{ TDBISAMSessionSprig }

function TDBISAMSessionSprig.Name: string;
begin
   Result:=TDBISAMSession(Item).SessionName;
end;

function TDBISAMSessionSprig.AnyProblems: Boolean;
begin
   Result:=(TDBISAMSession(Item).SessionName='');
end;

function TDBISAMSessionSprig.Caption: string;
begin
   Result:=CaptionFor(Name,UniqueName);
end;

{ TDefaultDBISAMSessionSprig }

function TDefaultDBISAMSessionSprig.Caption: string;
begin
   Result:=CaptionFor(Session.SessionName,Copy(Session.ClassName,2,255));
end;

function TDefaultDBISAMSessionSprig.ItemClass: TClass;
begin
   Result:=TDBISAMSession;
end;

function TDefaultDBISAMSessionSprig.UniqueName: string;
begin
   Result:=cDefaultDBISAMSessionSprigName;
end;


{ TImpliedDBISAMSessionSprig }

function TImpliedDBISAMSessionSprig.Caption: string;
begin
   Result:=CaptionFor(FSessionName,'Implied Session');
end;

function TImpliedDBISAMSessionSprig.ItemClass: TClass;
begin
   Result:=TDBISAMSession;
end;

function TImpliedDBISAMSessionSprig.UniqueName: string;
begin
   Result:=SprigDBISAMImpliedSessionName(FSessionName);
end;


{ TDBISAMDatabaseSprig }

function TDBISAMDatabaseSprig.Name: string;
begin
   Result:=TDBISAMDatabase(Item).DatabaseName;
end;

function TDBISAMDatabaseSprig.AnyProblems: Boolean;
begin
   Result:=(TDBISAMDatabase(Item).DatabaseName='');
end;

function TDBISAMDatabaseSprig.Caption: string;
var
   vName: string;
begin
   vName:=Name;
   Result:=CaptionFor(vName,UniqueName);
end;

procedure TDBISAMDatabaseSprig.FigureParent;
var
   vSessionName: string;
   vSession: TSprig;
begin
   with TDBISAMDatabase(Item) do
      begin
      { Find real or default session }
      vSessionName:=SprigDBISAMSessionName(SessionName);
      vSession:=Root.Find(vSessionName,False);
      { If not found see if its the default session }
      if (vSession=nil) and (vSessionName=cDefaultDBISAMSessionSprigName) then
         vSession:=Root.Add(TDefaultDBISAMSessionSprig.Create(nil));
      { Still not found, try for an implied session }
      if (vSession=nil) then
         begin
         vSession:=Root.Find(SprigDBISAMImpliedSessionName(SessionName),False);
         { If not make an implied session }
         if (vSession=nil) then
            begin
            vSession:=Root.Add(TImpliedDBISAMSessionSprig.Create(nil));
            TImpliedDBISAMSessionSprig(vSession).FSessionName:=SessionName;
            end;
         end;
      vSession.Add(Self);
      end;
end;

function TDBISAMDatabaseSprig.DragDropTo(AItem: TSprig): Boolean;
begin
   if (AItem is TDBISAMSessionSprig) then
      begin
      Result:=(not (AnsiCompareText(TDBISAMSession(AItem.Item).SessionName,TDBISAMDatabase(Item).SessionName)=0));
      if Result then
         TDBISAMDatabase(Item).SessionName:=TDBISAMSession(AItem.Item).SessionName;
      end
   else if (AItem is TImpliedDBISAMSessionSprig) then
      begin
      Result:=(not (AnsiCompareText(TImpliedDBISAMSessionSprig(AItem).FSessionName,TDBISAMDatabase(Item).SessionName)=0));
      if Result then
         TDBISAMDatabase(Item).SessionName:=TImpliedDBISAMSessionSprig(AItem).FSessionName;
      end
   else if (AItem is TDefaultDBISAMSessionSprig) then
      begin
      Result:=(not (AnsiCompareText(TDBISAMDatabase(Item).SessionName,Session.SessionName)=0)) or
                (TDBISAMDatabase(Item).SessionName <> '');
      if Result then
         TDBISAMDatabase(Item).SessionName:='';
      end
   else
      Result:=False;
   ReparentChildren;
end;

function TDBISAMDatabaseSprig.DragOverTo(AItem: TSprig): Boolean;
begin
   Result:=((AItem is TDBISAMSessionSprig) and (TDBISAMSession(AItem.Item).SessionName <> '')) or
            (AItem is TImpliedDBISAMSessionSprig) or
            (AItem is TDefaultDBISAMSessionSprig);
end;

class function TDBISAMDatabaseSprig.PaletteOverTo(AParent: TSprig; AClass: TClass): Boolean;
begin
   Result:=((AParent is TDBISAMSessionSprig) and (TDBISAMSession(AParent.Item).SessionName <> '')) or
            (AParent is TImpliedDBISAMSessionSprig) or
            (AParent is TDefaultDBISAMSessionSprig);
end;

{ TImpliedDBISAMDatabaseSprig }

function TImpliedDBISAMDatabaseSprig.AnyProblems: Boolean;
begin
   Result:=(FAlias='');
end;

function TImpliedDBISAMDatabaseSprig.Caption: string;
begin
   Result:=CaptionFor(FAlias,'Alias');
end;

function TImpliedDBISAMDatabaseSprig.DragDropTo(AItem: TSprig): Boolean;
begin
   if (AItem is TDBISAMSessionSprig) then
      begin
      Result:=(not (AnsiCompareText(TDBISAMSession(AItem.Item).SessionName,FSessionName)=0));
      if Result then
         FSessionName:=TDBISAMSession(AItem.Item).SessionName;
      end
   else if (AItem is TImpliedDBISAMSessionSprig) then
      begin
      Result:=(not (AnsiCompareText(TImpliedDBISAMSessionSprig(AItem).FSessionName,FSessionName)=0));
      if Result then
         FSessionName:=TImpliedDBISAMSessionSprig(AItem).FSessionName;
      end
   else if (AItem is TDefaultDBISAMSessionSprig) then
      begin
      Result:=(not (AnsiCompareText(FSessionName,Session.SessionName)=0)) or
              (FSessionName <> '');
      if Result then
         FSessionName:='';
      end
   else
      Result:=False;
   ReparentChildren;
end;

function TImpliedDBISAMDatabaseSprig.DragOverTo(AItem: TSprig): Boolean;
begin
   Result:=(AItem is TDBISAMSessionSprig) or
           (AItem is TImpliedDBISAMSessionSprig) or
           (AItem is TDefaultDBISAMSessionSprig);
end;

procedure TImpliedDBISAMDatabaseSprig.FigureParent;
var
   vSessionName: string;
   vSession: TSprig;
begin
   { Find real or default session }
   vSessionName:=SprigDBISAMSessionName(FSessionName);
   vSession:=Root.Find(vSessionName,False);
   { If not found see if its the default session }
   if (vSession=nil) and (vSessionName=cDefaultDBISAMSessionSprigName) then
      vSession:=Root.Add(TDefaultDBISAMSessionSprig.Create(nil));
   { Still not found, try for an implied session }
   if (vSession=nil) then
      begin
      vSession:=Root.Find(SprigDBISAMImpliedSessionName(FSessionName),False);
      { If not make an implied session }
      if (vSession=nil) then
         begin
         vSession:=Root.Add(TImpliedDBISAMSessionSprig.Create(nil));
         TImpliedDBISAMSessionSprig(vSession).FSessionName:=FSessionName;
         end;
      end;
   vSession.Add(Self);
end;

function TImpliedDBISAMDatabaseSprig.ItemClass: TClass;
begin
   Result:=TDBISAMDatabase;
end;

function TImpliedDBISAMDatabaseSprig.UniqueName: string;
begin
   Result:=SprigDBISAMImpliedDatabaseName(FAlias);
end;


{ TDBISAMTableSprig }

function TDBISAMTableSprig.AnyProblems: Boolean;
begin
   Result:=inherited AnyProblems or (TDBISAMTable(Item).TableName='');
end;

function TDBISAMTableSprig.Caption: string;
begin
   Result:=CaptionFor(TDBISAMTable(Item).TableName,UniqueName);
end;

{ TDBISAMQuerySprig }

function TDBISAMQuerySprig.AnyProblems: Boolean;
begin
   Result:=inherited AnyProblems or (TDBISAMQuery(Item).SQL.Count=0);
end;


{ TDBISAMTableMasterDetailBridge }

class function TDBISAMTableMasterDetailBridge.GetOmegaSource(AItem: TPersistent): TDataSource;
begin
   Result:=TDBISAMTable(AItem).MasterSource;
end;

class function TDBISAMTableMasterDetailBridge.OmegaIslandClass: TIslandClass;
begin
   Result:=TDBISAMTableIsland;
end;

class procedure TDBISAMTableMasterDetailBridge.SetOmegaSource(AItem: TPersistent;
                                                              ADataSource: TDataSource);
begin
   TDBISAMTable(AItem).MasterSource:=ADataSource;
end;

function TDBISAMTableMasterDetailBridge.CanEdit: Boolean;
begin
   Result:=True;
end;

function TDBISAMTableMasterDetailBridge.Edit: Boolean;
var
   vPropEd: TDBISAMTableFieldLinkProperty;
begin
   vPropEd:=TDBISAMTableFieldLinkProperty.CreateWith(TDataSet(Omega.Item));
   try
      vPropEd.Edit;
      Result:=vPropEd.Changed;
   finally
      vPropEd.Free;
   end;
end;

function TDBISAMTableMasterDetailBridge.Caption: string;
begin
   if (TDBISAMTable(Omega.Item).MasterFields='') then
      Result:=SNoMasterFields
   else
      Result:=TDBISAMTable(Omega.Item).MasterFields;
end;

{ TDBISAMQueryMasterDetailBridge }

function TDBISAMQueryMasterDetailBridge.Caption: string;
begin
   Result:=SParamsFields;
end;

class function TDBISAMQueryMasterDetailBridge.GetOmegaSource(AItem: TPersistent): TDataSource;
begin
   Result:=TDBISAMQuery(AItem).DataSource;
end;

class function TDBISAMQueryMasterDetailBridge.OmegaIslandClass: TIslandClass;
begin
   Result:=TDBISAMQueryIsland;
end;

class function TDBISAMQueryMasterDetailBridge.RemoveMasterFieldsAsWell: Boolean;
begin
   Result:=False;
end;

class procedure TDBISAMQueryMasterDetailBridge.SetOmegaSource(AItem: TPersistent;
                                                              ADataSource: TDataSource);
begin
   TDBISAMQuery(AItem).DataSource:=ADataSource;
end;


{ Registration }


procedure Register;
begin
   RegisterComponents('DBISAM', [TDBISAMTable,TDBISAMQuery,TDBISAMUpdateSQL,
                      TDBISAMDatabase,TDBISAMSession,TDBISAMEngine]);
   RegisterComponents('DBISAM Utilities', [TDBISAMDBGrid,TDBISAMFileListBox,
                      TDBISAMDirectoryListBox,TDBISAMDriveComboBox,TDBISAMStatusBar]);
   RegisterPropertyEditor(TypeInfo(string),TDBISAMDatabase,'Directory',
                          TDBISAMDatabaseDirectoryProperty);
   RegisterPropertyEditor(TypeInfo(string),TDBISAMDatabase,'RemoteDatabase',
                          TDBISAMDatabaseRemoteDatabaseProperty);
   RegisterPropertyEditor(TypeInfo(string),TDBISAMDatabase,'SessionName',
                          TDBISAMSessionNameProperty);
   RegisterPropertyEditor(TypeInfo(string),TDBISAMDBDataSet,'SessionName',
                          TDBISAMSessionNameProperty);
   RegisterPropertyEditor(TypeInfo(string),TDBISAMDBDataSet,'DatabaseName',
                          TDBISAMDatabaseNameProperty);
   RegisterPropertyEditor(TypeInfo(string),TDBISAMTable,'TableName',
                          TDBISAMTableNameProperty);
   RegisterPropertyEditor(TypeInfo(string),TDBISAMTable,'IndexName',
                          TDBISAMIndexNameProperty);
   RegisterPropertyEditor(TypeInfo(string),TDBISAMTable,'IndexFieldNames',
                          TDBISAMIndexFieldNamesProperty);
   RegisterPropertyEditor(TypeInfo(string),TDBISAMTable,'MasterFields',
                          TDBISAMTableFieldLinkProperty);
   RegisterPropertyEditor(TypeInfo(TDBISAMParams),TDBISAMQuery,'Params',
                          TDBISAMQueryParamsProperty);

   RegisterSprigType(TDBISAMSession,TDBISAMSessionSprig);
   RegisterSprigType(TDBISAMDatabase,TDBISAMDatabaseSprig);
   RegisterSprigType(TDBISAMUpdateSQL, TDBISAMUpdateSQLSprig);
   RegisterSprigType(TDBISAMDataSet,TDBISAMDataSetSprig);
   RegisterSprigType(TDBISAMDBDataSet,TDBISAMDBDataSetSprig);
   RegisterSprigType(TDBISAMTable,TDBISAMTableSprig);
   RegisterSprigType(TDBISAMQuery,TDBISAMQuerySprig);

   RegisterIslandType(TDBISAMDataSetSprig,TDBISAMDataSetIsland);
   RegisterIslandType(TDBISAMDBDataSetSprig,TDBISAMDBDataSetIsland);
   RegisterIslandType(TDBISAMTableSprig,TDBISAMTableIsland);
   RegisterIslandType(TDBISAMQuerySprig,TDBISAMQueryIsland);

   RegisterBridgeType(TDataSetIsland,TDBISAMTableIsland,TDBISAMTableMasterDetailBridge);
   RegisterBridgeType(TDataSetIsland,TDBISAMQueryIsland,TDBISAMQueryMasterDetailBridge);


   RegisterPropertiesInCategory('Action',TDBISAMDataSet,
                                ['Active']);
   RegisterPropertiesInCategory('Database',TDBISAMDataSet,
                                ['AutoDisplayLabels','CopyOnAppend',
                                 'Before*','After*','OnNewRecord',
                                 'OnUpdateRecord']);
   RegisterPropertiesInCategory('Progress',TDBISAMDataSet,
                                ['OnAlterProgress','OnCopyProgress',
                                 'OnExportProgress','OnImportProgress',
                                 'OnIndexProgress','OnLoadFromStreamProgress',
                                 'OnOptimizeProgress','OnRepairProgress',
                                 'OnSaveToStreamProgress','OnUpgradeProgress',
                                 'OnVerifyProgress']);
   RegisterPropertiesInCategory('Log',TDBISAMDataSet,
                                ['OnRepairLog','OnUpgradeLog','OnVerifyLog']);
   RegisterPropertiesInCategory('Error',TDBISAMDataSet,
                                ['OnDataLost','OnEditError','OnDeleteError',
                                 'OnPostError','OnCachedUpdateError']);

   RegisterPropertiesInCategory('Database',TDBISAMDBDataSet,
                                ['EngineVersion','DatabaseName','SessionName']);

   RegisterPropertiesInCategory('Database',TDBISAMTable,
                                ['Exclusive','ReadOnly',
                                 'Before*','After*']);
   RegisterPropertiesInCategory('Linkage',TDBISAMTable,
                                ['MasterFields']);

   RegisterPropertiesInCategory('Database',TDBISAMQuery,
                                ['MaxRowCount','ReadOnly',
                                 'Before*','After*','OnGetParams']);
   RegisterPropertiesInCategory('Progress',TDBISAMQuery,
                                ['OnQueryProgress','OnSaveProgress']);
   RegisterPropertiesInCategory('Error',TDBISAMQuery,
                                ['OnQueryError']);

   RegisterPropertiesInCategory('Database',TDBISAMUpdateSQL,
                                ['ModifySQL','InsertSQL',
                                 'DeleteSQL']);

   RegisterPropertiesInCategory('Action',TDBISAMDatabase,
                                ['Connected']);
   RegisterPropertiesInCategory('Database',TDBISAMDatabase,
                                ['EngineVersion','SessionName','DatabaseName',
                                 'Directory','RemoteDatabase','KeepConnection',
                                 'KeepTablesOpen','Before*','After*']);
   RegisterPropertiesInCategory('Remote',TDBISAMDatabase,
                                ['RemoteDatabase']);
   RegisterPropertiesInCategory('Progress',TDBISAMDatabase,
                                ['OnBackupProgress','OnRestoreProgress']);
   RegisterPropertiesInCategory('Log',TDBISAMDatabase,
                                ['OnBackupLog','OnRestoreLog']);

   RegisterPropertiesInCategory('Action',TDBISAMSession,
                                ['Active']);
   RegisterPropertiesInCategory('Database',TDBISAMSession,
                                ['EngineVersion','AutoSessionName',
                                 'Session*','DatabaseName',
                                 'KeepConnections','ProgressSteps',
                                 'ForceBufferFlush','PrivateDir',
                                 'StrictChangeDetection',
                                 'Before*','After*','OnPassword',
                                 'OnShutdown','OnStartup']);
   RegisterPropertiesInCategory('Locking',TDBISAMSession,
                                ['Lock*']);
   RegisterPropertiesInCategory('Remote',TDBISAMSession,
                                ['Remote*','OnRemote*']);

   RegisterPropertiesInCategory('Action',TDBISAMEngine,
                                ['Active']);
   RegisterPropertiesInCategory('Database',TDBISAMEngine,
                                ['Engine*','Functions','TableFilterIndexThreshhold',
                                 'CreateTempTablesInDatabase',
                                 'Before*','After*',
                                 'OnCompress','OnDecompress',
                                 'OnCrypto*','OnEncryptBlock','OnDecryptBlock',
                                 'OnCustomFunction','OnText*',
                                 'OnInsertError','OnUpdateError','OnDeleteError']);
   RegisterPropertiesInCategory('Server',TDBISAMEngine,
                                ['Server*','OnServer*']);
   RegisterPropertiesInCategory('Locking',TDBISAMEngine,
                                ['LockFileName',
                                 'TableRead*','TableTrans*','TableWrite*']);
   RegisterPropertiesInCategory('Tables',TDBISAMEngine,
                                ['MaxTable*',
                                 'TableData*','TableIndex*','TableBlob*',
                                 'LargeFileSupport']);

end;

end.
