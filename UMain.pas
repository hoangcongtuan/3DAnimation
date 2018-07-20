﻿unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GLScene, GLObjects, GLCoordinates, GLWin32Viewer,
  GLCrossPlatform, BaseClasses, ExtCtrls, GLSimpleNavigation, GLGizmoEx,
  Buttons,
  GLBitmapFont, GLWindowsFont, Vectorgeometry, GLCadencer, GLGeomObjects,
  InspectorBar, RTTIInspectorBar, LMDTypes, LMDInsClass, LMDInsPropEditors,
  LMDInsPropPage, LMDInsPropInsp, Grids, ExtDlgs, AdvPageControl, ComCtrls,
  AdvMemo, AdvmPS, Menus, shellapi, ToolWin, ImgList, GLPolyhedron,
  GLAnimatedSprite, GLExtrusion, GLMultiPolygon, GLGui, GLWindows, GLGraph,
  GLWaterPlane, GLTree, GLTeapot, GLSpaceText,acselectskin, GLVectorFileObjects, GLMesh,
  sSkinProvider, sSkinManager;

type
  TFmain = class(TForm)
    GLScene1: TGLScene;
    GLMaincamera: TGLCamera;
    GLmainlight: TGLLightSource;
    GLDummycubecenter: TGLDummyCube;
    Panel1: TPanel;
    WindowsBitmapFont: TGLWindowsBitmapFont;
    GLCadencer1: TGLCadencer;
    GLRootObjects: TGLDummyCube;
    RootTempObjects: TGLDummyCube;
    Timer1: TTimer;
    Image1: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    Panel3: TPanel;
    Panel4: TPanel;
    Edit1: TEdit;
    PN_obj: TPanel;
    LMDSimplePropInspector1: TLMDSimplePropInspector;
    Splitter1: TSplitter;
    Pn_scn_code: TPanel;
    Scene: TGLSceneViewer;
    pn_code: TPanel;
    Splitter2: TSplitter;
    AdvPascalMemoStyler1: TAdvPascalMemoStyler;
    MemoSource: TAdvMemoSource;
    StatusBar1: TStatusBar;
    Popupshape: TPopupMenu;
    N1: TMenuItem;
    X1: TMenuItem;
    pc_shape: TPageControl;
    TabSheet1: TTabSheet;
    Splitter3: TSplitter;
    Tree_obj: TTreeView;
    SpeedButton16: TSpeedButton;
    SpeedButton25: TSpeedButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Panel2: TPanel;
    spb_pause: TSpeedButton;
    spb_resume: TSpeedButton;
    spb_run: TSpeedButton;
    SpeedButton18: TSpeedButton;
    OBJ_Imglist: TImageList;
    MainMenu1: TMainMenu;
    ptin1: TMenuItem;
    Cit1: TMenuItem;
    Cngc1: TMenuItem;
    rgip1: TMenuItem;
    M1: TMenuItem;
    Lu1: TMenuItem;
    Luvitnkhc1: TMenuItem;
    hot1: TMenuItem;
    SpeedButton19: TSpeedButton;
    omi1: TMenuItem;
    nhton1: TMenuItem;
    Lptrnh1: TMenuItem;
    hngtinphnmm1: TMenuItem;
    Hngdn1: TMenuItem;
    ScrollBox1: TScrollBox;
    SpeedButton10: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton24: TSpeedButton;
    SpeedButton22: TSpeedButton;
    SpeedButton26: TSpeedButton;
    SpeedButton27: TSpeedButton;
    TabSheet2: TTabSheet;
    ScrollBox2: TScrollBox;
    SpeedButton34: TSpeedButton;
    SpeedButton35: TSpeedButton;
    SpeedButton36: TSpeedButton;
    SpeedButton37: TSpeedButton;
    SpeedButton39: TSpeedButton;
    SpeedButton40: TSpeedButton;
    SpeedButton41: TSpeedButton;
    SpeedButton42: TSpeedButton;
    TabSheet3: TTabSheet;
    ScrollBox3: TScrollBox;
    SpeedButton30: TSpeedButton;
    SpeedButton32: TSpeedButton;
    GLBitmapFont1: TGLBitmapFont;
    TabSheet4: TTabSheet;
    ScrollBox4: TScrollBox;
    SpeedButton29: TSpeedButton;
    SpeedButton31: TSpeedButton;
    SpeedButton33: TSpeedButton;
    SpeedButton38: TSpeedButton;
    TabSheet5: TTabSheet;
    ScrollBox5: TScrollBox;
    SpeedButton44: TSpeedButton;
    SpeedButton45: TSpeedButton;
    Npdliu1: TMenuItem;
    pp_tree: TPopupMenu;
    NpTexture1: TMenuItem;
    Xa1: TMenuItem;
    NpdliuMesh1: TMenuItem;
    SpeedButton43: TSpeedButton;
    TabSheet6: TTabSheet;
    ScrollBox6: TScrollBox;
    SpeedButton47: TSpeedButton;
    SpeedButton48: TSpeedButton;
    Panel5: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton17: TSpeedButton;
    edt_nameobj: TEdit;
    Panel6: TPanel;
    AdvMemo1: TAdvMemo;
    tlmtrungtm1: TMenuItem;
    Panel7: TPanel;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton11: TSpeedButton;
    sbutton: TSpeedButton;
    Skin1: TMenuItem;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    Scene1: TMenuItem;
    Luscenevofilegls1: TMenuItem;
    Npscenetfilegls1: TMenuItem;
    OpenDialog2: TOpenDialog;
    SaveDialog2: TSaveDialog;
    Scene2: TMenuItem;
    sp_resto: TSpeedButton;
    SpeedButton100: TSpeedButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Plane: TSpeedButton;
    D1: TMenuItem;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure open(LocalFile: string);
    procedure save(nameprj: String); { luu du an }
    procedure SceneMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SceneMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure SceneMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SceneMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure GLCadencer1Progress(Sender: TObject;
      const deltaTime, newTime: Double);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure PropertygridEditUpdate(Sender: TObject;
      AInspectorPanel: TInspectorPanel; AInspectorItem: TInspectorItem);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure CreateShapeData;
    Procedure MakeTree;
    // Procedure UpdateTreeView;
    Procedure DrawDataToscene;
    Procedure Docommand(Command: string);
    // procedure WMCopyData(var Msg : TWMCopyData); message WM_COPYDATA;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure spb_runClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton19Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure PopupshapePopup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure X1Click(Sender: TObject);
    procedure SpeedButton25Click(Sender: TObject);
    procedure spb_pauseClick(Sender: TObject);
      procedure saves(name,local:string);{luu du an}
    procedure spb_resumeClick(Sender: TObject);
    procedure SpeedButton18Click(Sender: TObject);
    procedure Tree_objClick(Sender: TObject);
    procedure hot1Click(Sender: TObject);
    procedure M1Click(Sender: TObject);
    procedure Lu1Click(Sender: TObject);
    procedure omi1Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure SpeedButton22Click(Sender: TObject);
    procedure SpeedButton23Click(Sender: TObject);
    procedure SpeedButton24Click(Sender: TObject);
    procedure SpeedButton26Click(Sender: TObject);
    procedure SpeedButton27Click(Sender: TObject);
    procedure SpeedButton42Click(Sender: TObject);
    procedure SpeedButton41Click(Sender: TObject);
    procedure SpeedButton40Click(Sender: TObject);
    procedure SpeedButton39Click(Sender: TObject);
    procedure SpeedButton37Click(Sender: TObject);
    procedure SpeedButton36Click(Sender: TObject);
    procedure SpeedButton35Click(Sender: TObject);
    procedure SpeedButton34Click(Sender: TObject);
    procedure SpeedButton32Click(Sender: TObject);
    procedure SpeedButton30Click(Sender: TObject);
    procedure SpeedButton33Click(Sender: TObject);
    procedure SpeedButton31Click(Sender: TObject);
    procedure SpeedButton29Click(Sender: TObject);
    procedure SpeedButton38Click(Sender: TObject);
    procedure GLCadencer2Progress(Sender: TObject; const deltaTime,
      newTime: Double);
    procedure SpeedButton45Click(Sender: TObject);
    procedure SpeedButton44Click(Sender: TObject);
    procedure SpeedButton43Click(Sender: TObject);
    procedure Npdliu1Click(Sender: TObject);
    procedure pp_treePopup(Sender: TObject);
    procedure NpTexture1Click(Sender: TObject);
    procedure Xa1Click(Sender: TObject);
    procedure NpdliuMesh1Click(Sender: TObject);
    procedure hngtinphnmm1Click(Sender: TObject);
    procedure SpeedButton48Click(Sender: TObject);
    procedure SpeedButton47Click(Sender: TObject);
    procedure tlmtrungtm1Click(Sender: TObject);
    procedure SpeedButton17Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure sbuttonClick(Sender: TObject);
    procedure Skin1Click(Sender: TObject);
    procedure Luvitnkhc1Click(Sender: TObject);
    function AlertSave: integer;
    procedure sSkinProvider1AfterAnimation(AnimType: TacAnimEvent);
    procedure CheckBox1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Luscenevofilegls1Click(Sender: TObject);
    procedure Npscenetfilegls1Click(Sender: TObject);
    procedure Scene2Click(Sender: TObject);
    procedure BackupBeforeRun;
    procedure RestoreAfterRun;
    procedure sp_restoClick(Sender: TObject);
    procedure LMDSimplePropInspector1Change(Sender: TObject);
    procedure Hngdn1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure SpeedButton100Click(Sender: TObject);
    procedure PlaneClick(Sender: TObject);
    procedure D1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Mx, my: Integer;
    MouseMoving: Boolean;
  end;

Type
  TShapeStyle = (STCone, stcylinder, stcube, stplane, stsphere,
    stcapsule,stdisk,stannulus,starowArc,starowline,
    stpolygon,stmultipolygon,strevolutonsolid,sttorus,stflatext,stxyzgrid,
    stspacetext,stteapot,sttree,stwaterplane,stactor,stfreeform,
    stdodecahedron,sticosaheron,stoctaheron,stfrustrum,stlight,stcamera);

Type
  TLightStyle = (CustomLsspot, CustomlsLsomni, CustomlsLsparallel);




Type Tposition=record
  X:Real;
  Y:Real;
  Z:Real;
end;
Type TDirection=record
  X:Real;
  Y:Real;
  Z:Real;
end;
Type TScale=record
  X:Real;
  Y:Real;
  Z:Real;
end;
Type TTexture=record
  adr:string[255];
  Disable:Boolean;
  Brightness:Single;
  Procedure Load(ADR: String);
end;
Type Tnode=record
    x,y,z:real;
end;
Type TNodes=record
   nodes: array [1..100] of Tnode;
   Count: integer;
   procedure Addnode(x,y,z:real);
end;
Type TAnimationMode=(TNone, TplayOne,TLoop,TBounceForward,TBounceBackward,
  TLoopBackWard,TExternal);

Type TShape=record
  Name:string[255];
  Style: TShapeStyle;
  Expression:String[255];
  Position:Tposition;
  Nodes: Tnodes;
  Color:Integer;
  Depth,Width,Height:Real;
  TopRadius,BottomRadius,Radius:Real;
  Direction: TDirection;
  Scale: TScale;
  TurnAngle:Real;
  RollAngle:Real;
  PitchAngle:real;
  Texture:TTexture;
  Showaxes:Boolean;
  Visible:Boolean;
  Shining:Boolean;
  LightStyle: TLightStyle;
  LightColor:Longint;
  FocalLength:Real;
  DepthOfView:Real;
  Slice:Integer;
  AnimationMode: TAnimationMode;
  Animation:string[200];
  SmoothAni:boolean;
  ActorFile:string[200];
  Procedure Translate(tx,ty,tz:real);
  Procedure Moveto(wx,wy,wz:real);
  Procedure TranslateRender(tx,ty,tz:real;Time:integer);
  Procedure MoveToRender(wx,wy,wz:real;time:integer);
  Procedure SwitchToAnimation(NameAni: string;Smooth:boolean);
  Procedure LoadActorFromFile(ADR:STRING);
end;

var
  Fmain: TFmain;
  Gizmo: TGLGizmoEx;
  FCreationScenarious: Integer;
  ACube: TGLCube;
  AMesh: TGLMesh;
  AActor: TGLActor;
  AFreeForm: TGLFreeForm;
  Acone: TGLCone;
  asphere: tglsphere;
  ADodecaheron: TGLDodecahedron;
  acylinder: TGLCylinder;
  AOctahedron: TGLOctahedron;
  ACamera: TGLCamera;
  Alight: TGLLightSource;
  AFlatText: TGLFlatText;
  AXYZGrid: TGLXYZGrid;
  AIcosahedron: TGLIcosahedron;
  ATetrahedron1: TGLTetrahedron;
  ASuperellipsoid1: TGLSuperellipsoid;
  aplane: tglplane;
  AAnnulus: TGLAnnulus;
  AArowArc: TGLArrowArc;
  AArowLine: TGLArrowLine;
  ASpaceText: TGLSpaceText;
  AWaterPlane: TGLWaterPlane;
  ATeaPot: TGLTeapot;
  ATree: TGLTree;
  AExtrusionSolid: TGLExtrusionSolid;
  AMultiPolygon: TGLMultiPolygon;
  apolygon: TGLPolygon;
  APipe: TGLPipe;
  ARevolutionSolid: TGLRevolutionSolid;
  ATorus: TGLTorus;
  adummycube: TGLDummyCube;
  acapsule: TGLCapsule;
  Adisk: TGLDisk;
  Output: File of TShape;
  Input: file of TShape;
  AniFile: text;
  Running: Boolean = false;
  stop: Boolean = false;
  Pause: Boolean = false;
  Cancel: Boolean = false;
  Resume: Boolean = false;
  LastIndex: Integer;
  AniStr: TStringlist;
  Dangmo: Boolean = false;
  PrjDangmo: string;
  Prj_name_backup,LocalBackup:string;

type
  TPicturePropEditor = class(TLMDClassPropEditor)
  protected
    function GetValue: TLMDString; override;
    function GetAttrs: TLMDPropAttrs; override;
    procedure Edit; override;
  end;

type
  TRun = class(TThread)
  private
  protected
    procedure Execute; override;
  public

  end;

  TCopyDataType = (cdtString = 0, cdtImage = 1, cdtRecord = 2);

var
  AFrustrum: tglfrustrum;
  pickobj, SelObj: TGLBaseSceneObject;

implementation

uses umessage, u_loadDatatoMesh, u_pro, u_info, u_set;

Const
  MaxShape = 1024;
  compiler = 'C:\FPC\2.6.4\bin\i386-win32\ppc386.exe';

Var
  Shape: Array [0 .. MaxShape] of TShape;
  CountShape: Integer;
  Saved: Boolean = false;
  local:string;
  TargetWin: HWnd;
  mm_code: TStringlist;
  resr: string;
  send: Boolean = false;
  Mainproject: text;
  PrjName, localtosave: string;
  Filen: string;
  Run: TRun;
  CountS: Integer;
  mainprj: text;
  adr:string;
{$R *.dfm}
procedure TFmain.RestoreAfterRun;
var Adr,tmp:string;
begin
adr:=ExtractFilePath(Application.ExeName)+'Tmp';
try
  OpenDialog1.FileName:=adr+'\'+'tmp.3ap';
  local:= Adr+'\';
  LocalTosave:= Adr+'\';
  tmp:= Fmain.Caption;
 open('tmp');
 Fmain.Caption:= tmp;
except
 MessageDlg('Không thể khôi phục, có lỗi !', mterror,[mbOK],0);
end;
end;
procedure TFmain.BackupBeforeRun;
var Adr,tmp:string;

begin

 adr:=ExtractFilePath(Application.ExeName)+'Tmp';
 //delete tmp file
 if FileExists(adr+'\'+'tmp.3ap')  then
   DeleteFile(adr+'\'+'tmp.pas');
  if FileExists(adr+'\'+'tmp.gls')  then
   DeleteFile(adr+'\'+'tmp.gls');

 SaveDialog1.FileName:= adr+'\'+'tmp';
 local:= adr+'\';
 tmp:= Fmain.Caption;

 save('tmp');
 Fmain.Caption:= tmp;
end;


Procedure TTexture.load(adr:string);
begin
 self.adr:=adr;
end;
procedure TNodes.Addnode(x: Real; y: Real; z: Real);
begin
  self.Count:=self.Count+1;
  nodes[Count-1].x:=x;
  nodes[Count-1].y:=y;
  nodes[Count-1].z:=z;
end;
function Tfmain.AlertSave: integer;
var tmp:integer;
begin
tmp:= messagedlg(' Bạn có muốn lưu dự án không?', mtConfirmation, [mbyes, mbno,mbcancel],0);
Result:= tmp;
case  tmp of
  IDYES:
   SpeedButton25Click(self);
  IDNO:
  begin
  end;
  IDCANCEL: exit;
end;
end;
procedure tfmain.saves(name: string; local: string);
begin
  //dfghdgdf
  AssignFile(Mainproject, local+name+'.3ap');
Rewrite(Mainproject);
write( Mainproject,name);
closefile(Mainproject);
  MemoSource.Lines.SaveToFile(local+name+ '.pas');
  Gizmo.FREE;
  GLScene1.SaveToFile(local+name + '.gls');
  Gizmo := TGLGizmoEx.Create(self);
  Gizmo.LabelFont := WindowsBitmapFont;
  Gizmo.Viewer := Scene;
  Scene.SetFocus;
  Gizmo.RootGizmo := GLDummycubecenter;
  Gizmo.RootObjects := GLRootObjects;
  Gizmo.GizmoTmpRoot := RootTempObjects;
  Gizmo.ExcludeObjects := true;
  Gizmo.ExcludeObjectsList.Add('GLXYZGrid1');
  Gizmo.ExcludeObjectsList.Add('GLHUDText1');

end;
 Procedure TShape.SwitchToAnimation(NameAni: string;Smooth:boolean);
 begin
  self.Animation:= NameAni;
  self.SmoothAni:= Smooth;
 end;
Procedure Tshape.moveToRender(wx,wy,wz:real;time:integer);
begin
 self.translateRender(wx-self.position.x,wy-self.position.y,wz-self.position.z,time);
end;
 Procedure TShape.LoadActorFromFile(ADR:STRING);
 begin
   Self.actorfile:=adr;
 end;
Procedure Tshape.translateRender(tx,ty,tz:real;Time:integer);
Var StepX,Stepy,Stepz:real;
    TimeIndex:Integer;
Begin
timeindex:=0;
 stepx:=tx/time;
 stepy:=ty/time;
 stepz:=tz/time;
 repeat
 inc(timeindex);
  self.position.x:=self.position.x+stepx;
  self.position.y:=self.position.y+stepy;
  self.position.z:=self.position.z+stepz;

 until timeindex=time;
end;

Procedure tshape.translate(tx,ty,tz:real);
begin
 self.position.x:=self.position.x+tx;
 self.position.y:=self.position.y+ty;
 self.position.z:=self.position.z+tz;
end;
Procedure Tshape.Moveto(wx,wy,wz:real);
begin
 self.position.x:=wx;
 self.position.y:=wy;
 self.position.z:=wz;
end;

function CountChild(OBJ: TGLBaseSceneObject): Integer;
begin
  result := OBJ.Count;
end;

procedure ColorToRGB(const Color: Integer; out R, G, B: integer);
	begin
	  R := Color and $FF;
	  G := (Color shr 8) and $FF;
	  B := (Color shr 16) and $FF;
	end;
	function RGBToColor(const R, G, B: Byte): Integer;
  	begin
      Result := R or (G shl 8) or (B shl 16);
end;
procedure TFmain.M1Click(Sender: TObject);
begin
  Fmain.SpeedButton18Click(self);
end;

procedure TFmain.MakeTree;
  Function AddNode(Parent: TTreeNode; OBJ: TGLBaseSceneObject): TTreeNode;
  var
    c: Integer;
    i: Integer;
    Parents: TTreeNode;
  begin
    c := CountChild(OBJ);
    if c = 0 then
    begin

      Parents := Tree_obj.Items.AddChild(Parent, OBJ.Name);
      if OBJ is TGLCube then
        Parents.ImageIndex := 2
      else if OBJ is tglsphere then
        Parents.ImageIndex := 13
      else if OBJ is TGLCamera then
        Parents.ImageIndex := 17
      else if OBJ is TGLLightSource then
        Parents.ImageIndex := 18
      else if OBJ is TGLCone then
        Parents.ImageIndex := 1
      else if OBJ is TGLCylinder then
        Parents.ImageIndex := 3
      else if  obj is TGLDisk  then  Parents.ImageIndex:=4
      else if obj is TGLDodecahedron then  Parents.ImageIndex:=5
      else if OBJ is TGLFrustrum then
        Parents.ImageIndex:=6
      else if OBJ is TGLIcosahedron then Parents.ImageIndex:=7
        else if obj is TGLLines then
          Parents.ImageIndex:=8
        else if obj is TGLOctahedron then  Parents.ImageIndex:=9
        else if obj is TGLPlane then
          Parents.ImageIndex:=10
        else if obj is TGLPolygon then
          Parents.ImageIndex:=12
        else if obj is TGLSphere then
          Parents.ImageIndex:=13
        else if OBJ is TGLSuperellipsoid then
          Parents.ImageIndex:=15
        else if obj is TGLTetrahedron then
          Parents.ImageIndex:= 16
        else if obj is TGLWaterPlane then
          Parents.ImageIndex:=19
        else if obj is TGLSpaceText then
          Parents.ImageIndex:=20
        else if obj is TGLTree then
          Parents.ImageIndex:=22
        else if obj is TGLTorus then
          Parents.ImageIndex:=23
        else if obj is TGLAnnulus then
          Parents.ImageIndex:=24
        else if  obj is TGLArrowLine then
          Parents.ImageIndex:=26
        else if OBJ is TGLArrowArc then
          Parents.ImageIndex:=25
        else if obj is TGLXYZGrid then
          Parents.ImageIndex:=27
        else if obj is TGLFlatText then
          Parents.ImageIndex:=28
        else if obj is TGLHeightField then
          Parents.ImageIndex:=29
        else if obj is TGLMultiPolygon then
          Parents.ImageIndex:=31
        else if obj is TGLPipe then
          Parents.ImageIndex:=32
        else if obj is TGLRevolutionSolid then
          Parents.ImageIndex:=33
        else if obj is TGLMesh then
          Parents.ImageIndex:=34
        else if obj is TGLActor then
          Parents.ImageIndex:=35
        else if obj is TGLFreeForm then
          Parents.ImageIndex:=36;
    end
    else
    begin
      Parents := Tree_obj.Items.AddChild(Parent, OBJ.Name);
      if OBJ is TGLCube then
        Parents.ImageIndex := 2
      else if OBJ is tglsphere then
        Parents.ImageIndex := 13
      else if OBJ is TGLCamera then
        Parents.ImageIndex := 17
      else if OBJ is TGLLightSource then
        Parents.ImageIndex := 18
      else if OBJ is TGLCone then
        Parents.ImageIndex := 1
      else if OBJ is TGLCylinder then
        Parents.ImageIndex := 3
      else if  obj is TGLDisk  then  Parents.ImageIndex:=4
      else if obj is TGLDodecahedron then  Parents.ImageIndex:=5
      else if OBJ is TGLFrustrum then
        Parents.ImageIndex:=6
      else if OBJ is TGLIcosahedron then Parents.ImageIndex:=7
        else if obj is TGLLines then
          Parents.ImageIndex:=8
        else if obj is TGLOctahedron then  Parents.ImageIndex:=9
        else if obj is TGLPlane then
          Parents.ImageIndex:=10
        else if obj is TGLPolygon then
          Parents.ImageIndex:=12
        else if obj is TGLSphere then
          Parents.ImageIndex:=13
        else if OBJ is TGLSuperellipsoid then
          Parents.ImageIndex:=15
        else if obj is TGLTetrahedron then
          Parents.ImageIndex:= 16
        else if obj is TGLWaterPlane then
          Parents.ImageIndex:=19
        else if obj is TGLSpaceText then
          Parents.ImageIndex:=20
        else if obj is TGLTree then
          Parents.ImageIndex:=22
        else if obj is TGLTorus then
          Parents.ImageIndex:=23
        else if obj is TGLAnnulus then
          Parents.ImageIndex:=24
        else if  obj is TGLArrowLine then
          Parents.ImageIndex:=26
        else if OBJ is TGLArrowArc then
          Parents.ImageIndex:=25
        else if obj is TGLXYZGrid then
          Parents.ImageIndex:=27
        else if obj is TGLFlatText then
          Parents.ImageIndex:=28
        else if obj is TGLHeightField then
          Parents.ImageIndex:=29
        else if obj is TGLMultiPolygon then
          Parents.ImageIndex:=31
        else if obj is TGLPipe then
          Parents.ImageIndex:=32
        else if obj is TGLRevolutionSolid then
          Parents.ImageIndex:=33
        else if obj is TGLMesh then
          Parents.ImageIndex:=34
        else if obj is TGLActor then
          Parents.ImageIndex:=35
        else if obj is TGLFreeForm then
          Parents.ImageIndex:=36;

      for i := 0 to c - 1 do
        AddNode(Parents, OBJ.Children[i]);
    end;
  end;

var
  i, j: Integer;
  CountC: Integer;
begin
  Tree_obj.Items.Clear;
  for i := 0 to GLScene1.Objects.Count - 1 do
  begin
    if (GLScene1.Objects[i].Name = GLDummycubecenter.name) or
      (GLScene1.Objects[i].Name = RootTempObjects.Name) or
      (GLScene1.Objects[i].Name = GLRootObjects.Name) then
      Continue;

    AddNode(nil, GLScene1.Objects[i])
  end;
end;
function Compile(const CommandLine, InputFile, OutputFile, ErrMsg: string)
  : Boolean; forward;
function ExecAndWait(const FileName: string; const CmdShow: Integer): Longword;
  forward;

// ___________________________________________________

procedure TRun.Execute;
var
  istar: Integer;
  i: Integer;
  index: Integer;
begin

  with Fmain do
  begin
    spb_pause.Enabled := true;
    spb_run.Enabled := false;
    StatusBar1.Panels[0].text := 'Đang dịch...';
   // Application.ProcessMessages;
    Pause := false;

    AssignFile(Output,'c:\input.txt');
    rewrite(Output);
    CreateShapeData;
    Application.ProcessMessages;
    for i := 0 to CountS-1 do
    begin
      Write(Output, Shape[i]);
      Application.ProcessMessages;
    end;
    closefile(Output);
    if FileExists(adr+'FPC\3DAnimation\code.exe') then
      DeleteFile(adr+'FPC\3DAnimation\code.exe');
    if FileExists(adr+'FPC\3DAnimation\result.txt') then
      DeleteFile(adr+'FPC\3DAnimation\result.txt');
    if FileExists('c:\ani.txt') Then
      DeleteFile('c:\ani.txt');
    mm_code.Clear;
    mm_code.LoadFromFile(adr+'FPC\3DAnimation\3DAnimation.pas');
    istar := mm_code.IndexOf('//code here') + 1;
    // ShowMessage(inttostr(istar));
    for i := 0 to MemoSource.Lines.Count - 1 do
    begin
      Application.ProcessMessages;
      mm_code.Insert(istar, MemoSource.Lines[i]);
      inc(istar);
    end;
    mm_code.SaveToFile((adr+'FPC\3DAnimation\code.txt'));
    // MemoSource.Lines.SaveToFile('c:\code.txt');
    fmsg.show;
    fmsg.mm_msg.Lines.Clear;
    // CaptureConsoleOutput('C:\FPC\2.6.4\bin\i386-win32\ppc386.exe','c:\FPC\3DAnimation\code.TXT',fmsg.mm_msg);
    Compile
      (adr+'FPC\2.6.4\bin\i386-win32\ppc386.exe '+adr+'FPC\3DAnimation\code.TXT ', adr+'FPC\3DAnimation\code.TXT ', adr+'FPC\3DAnimation\result.txt', '');
    fmsg.mm_msg.Lines.LoadFromFile(adr+'FPC\3DAnimation\result.txt');
    fmsg.mm_msg.Lines.delete(0);
    fmsg.mm_msg.Lines.delete(0);
    fmsg.mm_msg.Lines.delete(0);
    fmsg.mm_msg.Lines.delete(0);
    // fmsg.mm_msg.Lines.Delete(fmsg.mm_msg.Lines.Count-1);
    // fmsg.mm_msg.Lines.Delete(fmsg.mm_msg.Lines.Count-1);
    // fmsg.mm_msg.Lines.Delete(fmsg.mm_msg.Lines.Count-1);
    // Kiem tra loi
    // Run
    Running := true;
    index := -1;
    // assignfile(Anifile,'c:\FPC\3DAnimation\Ani.txt');
    // reset(AniFile);
    if FileExists(adr+'FPC\3DAnimation\code.exe') then
    begin
      StatusBar1.Panels[0].text := 'Đang kết xuất dữ liệu...';
      ExecAndWait(adr+'FPC\3DAnimation\code.exe', SW_hide);
      repeat

      until (Running = false);
     AniStr.LoadFromFile('c:\Ani.txt');
      StatusBar1.Panels[0].text := 'Đang Chạy...';
      while (index < AniStr.Count - 1) and (not self.Terminated) do
      begin
        if Pause then
        begin
          StatusBar1.Panels[0].text := 'Dừng';
          LastIndex := index;
          Exit;
        end;
        inc(index);
        Docommand(AniStr[index]);
      end;
      StatusBar1.Panels[0].text := 'Kết thúc';
      // fmsg.Close;
    end;
    spb_pause.Enabled := false;
    spb_run.Enabled := true;
    spb_resume.Enabled := false;
  end;
end;

procedure TFmain.save(nameprj: string);
var
  i: Integer;
begin
AssignFile(Mainproject, SaveDialog1.FileName+'.3ap');
Rewrite(Mainproject);
write( Mainproject,nameprj);
closefile(Mainproject);
  MemoSource.Lines.SaveToFile(local+nameprj+ '.pas');
  Prj_name_backup:= nameprj;
  Gizmo.FREE;
  GLScene1.SaveToFile(local+nameprj + '.gls');
  Gizmo := TGLGizmoEx.Create(self);
  Gizmo.LabelFont := WindowsBitmapFont;
  Gizmo.Viewer := Scene;
  Scene.SetFocus;
  Gizmo.RootGizmo := GLDummycubecenter;
  Gizmo.RootObjects := GLRootObjects;
  Gizmo.GizmoTmpRoot := RootTempObjects;
  Gizmo.ExcludeObjects := true;
  Gizmo.ExcludeObjectsList.Add('GLXYZGrid1');
  Gizmo.ExcludeObjectsList.Add('GLHUDText1');
  Fmain.Caption:= ' Lập trình tạo hình chuyển động 3DAnimation - '+Prj_name_backup+'.3ap';

end;

procedure TFmain.sbuttonClick(Sender: TObject);
begin
AdvMemo1.CopyToClipBoard;
end;

function ExecAndWait(const FileName: string; const CmdShow: Integer): Longword;
var { by Pat Ritchey }
  zAppName: array [0 .. 512] of Char;
  zCurDir: array [0 .. 255] of Char;
  WorkDir: string;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  AppIsRunning: DWORD;
begin
  StrPCopy(zAppName, FileName);
  GetDir(0, WorkDir);
  StrPCopy(zCurDir, WorkDir);
  FillChar(StartupInfo, SizeOf(StartupInfo), #0);
  StartupInfo.cb := SizeOf(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := CmdShow;
  if not CreateProcess(nil, zAppName, // pointer to command line string
    nil, // pointer to process security attributes
    nil, // pointer to thread security attributes
    false, // handle inheritance flag
    CREATE_NEW_CONSOLE or // creation flags
      NORMAL_PRIORITY_CLASS, nil, // pointer to new environment block
    nil, // pointer to current directory name
    StartupInfo, // pointer to STARTUPINFO
    ProcessInfo) // pointer to PROCESS_INF
    then
    result := WAIT_FAILED
  else
  begin
    while WaitForSingleObject(ProcessInfo.hProcess, 0) = WAIT_TIMEOUT do
    begin
      Application.ProcessMessages;
      Sleep(50);
    end;
    {
      // or:
      repeat
      AppIsRunning := WaitForSingleObject(ProcessInfo.hProcess, 100);
      Application.ProcessMessages;
      Sleep(50);
      until (AppIsRunning <> WAIT_TIMEOUT);
      }
    if Cancel then
    begin
      ShowMessage(('breaking'));
      Exit;

    end;
    WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
   //  Running := false;
    GetExitCodeProcess(ProcessInfo.hProcess, result);
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);   Running := false;
  end;
end;

function Compile(const CommandLine, InputFile, OutputFile, ErrMsg: string)
  : Boolean;
const
  ROUTINE_ID = '[function: CreateDOSProcessRedirected ]';
var
  OldCursor: TCursor;
  pCommandLine: array [0 .. MAX_PATH] of Char;
  pInputFile, pOutPutFile: array [0 .. MAX_PATH] of Char;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  SecAtrrs: TSecurityAttributes;
  hAppProcess, hAppThread, hInputFile, hOutputFile: THandle;
begin
  result := false;

  { check for InputFile existence }
  if not FileExists(InputFile) then
    raise Exception.CreateFmt
      (ROUTINE_ID + #10 + #10 + 'Input file * %s *' + #10 +
        'does not exist' + #10 + #10 + ErrMsg, [InputFile]);

  { save the cursor }
  OldCursor := Screen.Cursor;
  Screen.Cursor := crHourglass;

  { copy the parameter Pascal strings to null terminated strings }
  StrPCopy(pCommandLine, CommandLine);
  StrPCopy(pInputFile, InputFile);
  StrPCopy(pOutPutFile, OutputFile);

  try

    { prepare SecAtrrs structure for the CreateFile calls
      This SecAttrs structure is needed in this case because
      we want the returned handle can be inherited by child process
      This is true when running under WinNT.
      As for Win95 the documentation is quite ambiguous }
    FillChar(SecAtrrs, SizeOf(SecAtrrs), #0);
    SecAtrrs.nLength := SizeOf(SecAtrrs);
    SecAtrrs.lpSecurityDescriptor := nil;
    SecAtrrs.bInheritHandle := true;

    { create the appropriate handle for the input file }
    hInputFile := CreateFile(pInputFile,
      { pointer to name of the file }
      GENERIC_READ or GENERIC_WRITE,
      { access (read-write) mode }
      FILE_SHARE_READ or FILE_SHARE_WRITE,
      { share mode } @SecAtrrs, { pointer to security attributes }
      OPEN_ALWAYS, { how to create }
      FILE_ATTRIBUTE_TEMPORARY, { file attributes }
      0); { handle to file with attributes to copy }

    { is hInputFile a valid handle? }
    if hInputFile = INVALID_HANDLE_VALUE then
      raise Exception.CreateFmt(ROUTINE_ID + #10 + #10 +
          'WinApi function CreateFile returned an invalid handle value' + #10 +
          'for the input file * %s *' + #10 + #10 + ErrMsg, [InputFile]);

    { create the appropriate handle for the output file }
    hOutputFile := CreateFile(pOutPutFile,
      { pointer to name of the file }
      GENERIC_READ or GENERIC_WRITE,
      { access (read-write) mode }
      FILE_SHARE_READ or FILE_SHARE_WRITE,
      { share mode } @SecAtrrs, { pointer to security attributes }
      CREATE_ALWAYS, { how to create }
      FILE_ATTRIBUTE_TEMPORARY, { file attributes }
      0); { handle to file with attributes to copy }

    { is hOutputFile a valid handle? }
    if hOutputFile = INVALID_HANDLE_VALUE then
      raise Exception.CreateFmt(ROUTINE_ID + #10 + #10 +
          'WinApi function CreateFile returned an invalid handle value' + #10 +
          'for the output file * %s *' + #10 + #10 + ErrMsg, [OutputFile]);

    { prepare StartupInfo structure }
    FillChar(StartupInfo, SizeOf(StartupInfo), #0);
    StartupInfo.cb := SizeOf(StartupInfo);
    StartupInfo.dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
    StartupInfo.wShowWindow := SW_HIDE;
    StartupInfo.hStdOutput := hOutputFile;
    StartupInfo.hStdInput := hInputFile;

    { create the app }
    result := CreateProcess(nil, { pointer to name of executable module }
      pCommandLine,
      { pointer to command line string }
      nil, { pointer to process security attributes }
      nil, { pointer to thread security attributes }
      true, { handle inheritance flag }
      CREATE_NEW_CONSOLE or REALTIME_PRIORITY_CLASS, { creation flags }
      nil, { pointer to new environment block }
      nil, { pointer to current directory name }
      StartupInfo, { pointer to STARTUPINFO }
      ProcessInfo); { pointer to PROCESS_INF }

    { wait for the app to finish its job and take the handles to free them later }
    if result then
    begin
      WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
      hAppProcess := ProcessInfo.hProcess;
      hAppThread := ProcessInfo.hThread;
    end
    else
      raise Exception.Create
        (ROUTINE_ID + #10 + #10 + 'Function failure' + #10 + #10 + ErrMsg);

  finally
    { close the handles
      Kernel objects, like the process and the files we created in this case,
      are maintained by a usage count.
      So, for cleaning up purposes we have to close the handles
      to inform the system that we don't need the objects anymore }
    if hOutputFile <> 0 then
      CloseHandle(hOutputFile);
    if hInputFile <> 0 then
      CloseHandle(hInputFile);
    if hAppThread <> 0 then
      CloseHandle(hAppThread);
    if hAppProcess <> 0 then
      CloseHandle(hAppProcess);
    { restore the old cursor }
    Screen.Cursor := OldCursor;
  end;
end;

procedure CaptureConsoleOutput(const ACommand, AParameters: String;
  AMemo: TMemo);
const
  CReadBuffer = 2400;
var
  saSecurity: TSecurityAttributes;
  hRead: THandle;
  hWrite: THandle;
  suiStartup: TStartupInfo;
  piProcess: TProcessInformation;
  pBuffer: array [0 .. CReadBuffer] of ansiChar;
  dRead: DWORD;
  dRunning: DWORD;
begin
  saSecurity.nLength := SizeOf(TSecurityAttributes);
  saSecurity.bInheritHandle := true;
  saSecurity.lpSecurityDescriptor := nil;

  if CreatePipe(hRead, hWrite, @saSecurity, 0) then
  begin
    FillChar(suiStartup, SizeOf(TStartupInfo), #0);
    suiStartup.cb := SizeOf(TStartupInfo);
    suiStartup.hStdInput := hRead;
    suiStartup.hStdOutput := hWrite;
    suiStartup.hStdError := hWrite;
    suiStartup.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
    suiStartup.wShowWindow := SW_HIDE;

    if CreateProcess(nil, PChar(ACommand + ' ' + AParameters), @saSecurity,
      @saSecurity, true, NORMAL_PRIORITY_CLASS, nil, nil, suiStartup,
      piProcess) then
    begin
      repeat
        dRunning := WaitForSingleObject(piProcess.hProcess, 100);
        Application.ProcessMessages();
        repeat
          dRead := 0;
          ReadFile(hRead, pBuffer[0], CReadBuffer, dRead, nil);
          pBuffer[dRead] := #0;
          OemToAnsi(pBuffer, pBuffer);
          AMemo.Lines.Add(String(pBuffer));
        until (dRead < CReadBuffer);
      until (dRunning <> WAIT_TIMEOUT);
      CloseHandle(piProcess.hProcess);
      CloseHandle(piProcess.hThread);
    end;
    CloseHandle(hRead);
    CloseHandle(hWrite);
  end;
end;

procedure TFmain.D1Click(Sender: TObject);
begin
if Gizmo.SelectedObj= NIL then
  EXIT;
 GLMaincamera.TargetObject:= Gizmo.SelectedObj;
end;

Procedure TFmain.Docommand(Command: string);
var
  Nameobj: String;
  i,j,tmpi: Integer;
  tmpx,tmpy,tmpz:real;
  Param, Pro { property } : String;
  OBJ: TGLBaseSceneObject;
  Parval { parameter value } : Single;
  captions, str: string;
  cmd: string;
  HeadCmd, Par1, par2: string;
  ST: TShapeStyle;
  r,g,b:integer;

Begin
obj:=nil;
  LowerCase(Command);
  cmd := Command;
  if pos('target',cmd)=1   then
    begin
       par1:=copy(cmd,pos('=',cmd)+1,length(cmd)-pos('=',cmd)+1);
       if Par1<>''  then
         begin
           OBJ:= GLScene1.FindSceneObject(Par1);
           if OBJ=nil then
             exit
           else GLMaincamera.TargetObject:=OBJ;
         end;
    end;
  if pos('add', cmd) = 1 then
  begin
    HeadCmd := Copy(cmd, 0, pos('=', cmd) - 1);
    Par1 := Copy(cmd, pos('=', cmd) + 1, pos('_', cmd) - pos('=', cmd) - 1);
    delete(cmd, 1, pos('_', cmd));
    par2 := cmd;
    ST := TShapeStyle(strtoint(par2));
    if ST = STCone then
    begin
      Acone := TGLCone.Create(GLScene1.Objects);
      Acone.Parent := GLScene1.Objects;
      Acone.Name := Par1;
    //  Acone.Visible := true;
      acone.Material.FrontProperties.Diffuse.RandomColor;
    end
    else if ST = stcylinder then
    begin
      acylinder := TGLCylinder.Create(GLScene1.Objects);
      acylinder.Parent := GLScene1.Objects;
      acylinder.Name := Par1;
      acylinder. Material.FrontProperties.Diffuse.RandomColor;
    end
    else if st= stcube   then
    begin
     ACube:= TGLCube.Create(GLScene1.Objects);
     ACube.Parent:= GLScene1.Objects;
     ACube.Name:= par1;
    ACube.Material.FrontProperties.Diffuse.RandomColor;
    end
    else if st= stcamera  then
        begin
     ACamera:= TGLCamera.Create(GLScene1.Objects);
     ACamera.Parent:= GLScene1.Objects;
     ACamera.Name:= par1;
    end
    else if st=stflatext then
        begin
     AFlatText:= TGLFlatText.Create(GLScene1.Objects);
     AFlatText.Parent:= GLScene1.Objects;
     AFlatText.Name:= par1;
    end


     else if st=stpolygon then
     begin
     apolygon:= TGLPolygon.Create(GLScene1.Objects);
     apolygon.Parent:= GLScene1.Objects;
     apolygon.Name:= par1;
     apolygon. Material.FrontProperties.Diffuse.RandomColor;
     end
    else if st= STlight then
      begin
     Alight:= TGLLightSource.Create(GLScene1.Objects);
     Alight.Parent:= GLScene1.Objects;
     Alight.Name:= par1;
    end
    else if st= stplane  then
      begin
     aplane:= TGLplane.Create(GLScene1.Objects);
     aplane.Parent:= GLScene1.Objects;
     aplane.Name:= par1;
     aplane. Material.FrontProperties.Diffuse.RandomColor;
    end
    else if st= stsphere   then
       begin
     asphere:= TGLSphere.Create(GLScene1.Objects);
     asphere.Parent:= GLScene1.Objects;
     asphere.Name:= par1;
     asphere. Material.FrontProperties.Diffuse.RandomColor;
    end
    else if st= stcapsule then
      begin
     acapsule:= TGLCapsule.Create(GLScene1.Objects);
     acapsule.Parent:= GLScene1.Objects;
     acapsule.Name:= par1;
     acapsule. Material.FrontProperties.Diffuse.RandomColor;
    end
    else if st=stannulus then
      begin
    AAnnulus:= TGLAnnulus.Create(GLScene1.Objects);
     AAnnulus.Parent:= GLScene1.Objects;
     AAnnulus.Name:= par1;
     AAnnulus. Material.FrontProperties.Diffuse.RandomColor;
    end
    else if st= stspacetext then
     begin
       ASpaceText:= TGLSpaceText.Create(GLScene1.Objects);
       ASpaceText.Parent:=GLScene1.Objects;
       ASpaceText.Name:= Par1;
     end
    else if st= stdisk  then
    begin
      Adisk:= TGLDisk.Create(GLScene1.Objects);
  Adisk.Parent:=GLScene1.Objects;
     Adisk.Name:= Par1;
     Adisk. Material.FrontProperties.Diffuse.RandomColor;
    end
   else if st= starowArc then
      begin
    AArowArc:= TGLArrowArc.Create(GLScene1.Objects);
       AArowArc.Parent:=GLScene1.Objects;
       AArowArc.Name:= Par1;
       AArowArc. Material.FrontProperties.Diffuse.RandomColor;
    end
    else if st= starowline then
       begin
       AArowLine:= TGLArrowLine.Create(GLScene1.Objects);
       AArowLine.Parent:=GLScene1.Objects;
       AArowLine.Name:= Par1;
       AArowLine. Material.FrontProperties.Diffuse.RandomColor;
    end
    else if st= stmultipolygon then
       begin
        AMultiPolygon:= TGLMultiPolygon.Create(GLScene1.Objects);
      AMultiPolygon .Parent:=GLScene1.Objects;
       AMultiPolygon.Name:= Par1;
       AMultiPolygon. Material.FrontProperties.Diffuse.RandomColor;
    end
    else if st=strevolutonsolid then
       begin
       ARevolutionSolid:= TGLRevolutionSolid.Create(GLScene1.Objects);
       ARevolutionSolid.Parent:=GLScene1.Objects;
      ARevolutionSolid .Name:= Par1;
      ARevolutionSolid. Material.FrontProperties.Diffuse.RandomColor;
    end
    else if st= sttorus then
       begin
      ATorus:= TGLTorus.Create(GLScene1.Objects);
       ATorus.Parent:=GLScene1.Objects;
       ATorus.Name:= Par1;
       ATorus. Material.FrontProperties.Diffuse.RandomColor;
    end
    else if st= stxyzgrid then
       begin
       AXYZGrid:= TGLXYZGrid.Create(GLScene1.Objects);
        AXYZGrid.Parent:=GLScene1.Objects;
       AXYZGrid.Name:= Par1;
       end
    else if st= stteapot then
      begin
       ATeaPot:= TGLTeapot.Create(GLScene1.Objects);
       ATeaPot.Parent:=GLScene1.Objects;
       ATeaPot.Name:= Par1;
       end
    else if st=sttree then
      begin
       ATree:= TGLTree.Create(GLScene1.Objects);
       ATree.Parent:=GLScene1.Objects;
       ATree.Name:= Par1;
       end
      else if st=stwaterplane then
        begin
       AWaterPlane:= TGLWaterPlane.Create(GLScene1.Objects);
       AWaterPlane.Parent:=GLScene1.Objects;
       AWaterPlane.Name:= Par1;
       end
      else if st= stactor then
        begin
       AActor:= TGLActor.Create(GLScene1.Objects);
       AActor.Parent:=GLScene1.Objects;
       AActor.Name:= Par1;
       end
      else if st=stfreeform then
        begin
       AFreeForm:= TGLFreeForm.Create(GLScene1.Objects);
       AFreeForm.Parent:=GLScene1.Objects;
       AFreeForm.Name:= Par1;
       end
       else if ST=stdodecahedron then
         begin
       ADodecaheron:= TGLDodecahedron.Create(GLScene1.Objects);
       ADodecaheron.Parent:=GLScene1.Objects;
       ADodecaheron.Name:= Par1;
       end
      else if st=sticosaheron then
        begin
       AIcosahedron:= TGLIcosahedron.Create(GLScene1.Objects);
       AIcosahedron.Parent:=GLScene1.Objects;
       AIcosahedron.Name:= Par1;
       end
       else if st=stoctaheron then
         begin
       AOctahedron:= TGLOctahedron.Create(GLScene1.Objects);
       AOctahedron.Parent:=GLScene1.Objects;
       AOctahedron.Name:= Par1;
       end
       else if st=stfrustrum then
         begin
       AFrustrum:= TGLFrustrum.Create(GLScene1.Objects);
       AFrustrum.Parent:=GLScene1.Objects;
       AFrustrum.Name:= Par1;
       end;
       MakeTree;
    // showmessage('head is '+ HeadCmd+', par1 is '+Par1+', par2 is '+par2);
    Exit;
  end;

  if pos('sleep', cmd) = 1 then
  begin
    Sleep(strtoint(Copy(cmd, 7, length(cmd) - 6)));
    Exit;
  end;
  With Fmain.GLScene1.Objects do
  begin
    Nameobj := Copy(Command, 0, pos('.', Command) - 1);
    Pro := Copy(Command, pos('.', Command) + 1, pos('=', Command) - pos('.',
        Command) - 1);
    Param := Command;
    delete(Param, 1, length(Nameobj + '.' + Pro + '='));
    // Showmessage(pro);
    // Showmessage(pro);
    TryStrToFloat(Param, Parval);
    OBJ := Fmain.GLScene1.FindSceneObject(Nameobj);
    if OBJ = nil then
    Begin
      ShowMessage('Không tồn tại đối tượng ' + Nameobj);
      Exit;
    End;
    if pro='color' then
    begin
    ColorToRGB(StrToInt(Param),r,g,b);
     (obj as
      TGLCustomSceneObject).Material.FrontProperties.Diffuse.Red:=r;
     (obj as TGLCustomSceneObject).Material.FrontProperties.Diffuse.Green:=g;
     (obj as TGLCustomSceneObject).Material.FrontProperties.Diffuse.Blue:=b;
     // Showmessage(Param);
    end;

    if Pro = 'texture.brightness' then (OBJ as TGLCustomSceneObject)
      .Material.Texture.ImageBrightness := strtofloat(Param)
    else if Pro = 'texture.adres' then begin (OBJ as TGLCustomSceneObject)
      .Material.Texture.Image.LoadFromFile(Param);
      (obj as TGLCustomSceneObject).Material.Texture.Disabled:=false;
    end
    else if Pro = 'texture.disable' then (OBJ as TGLCustomSceneObject)
      .Material.Texture.Disabled := (Param = 'true')
    else if Pro = 'position.x' then
      // Showmessage('Updating...');
      (OBJ as TGLBasesceneobject).Position.X := strtofloat(Param)
    else if Pro = 'position.y' then
      (OBJ as TGLBasesceneobject).Position.Y := strtofloat(Param)
    else if Pro = 'position.z' then
      (OBJ as TGLBasesceneobject).Position.Z := Parval
    else if Pro = 'scale.x' then
      (OBJ as TGLBasesceneobject).Scale.X := Parval
    else if Pro = 'scale.y' then
      (OBJ as TGLBasesceneobject).Scale.Y := Parval
    else if Pro = 'scale.z' then
      (OBJ as TGLBasesceneobject).Scale.Z := Parval
    else if Pro = 'direction.x' then
      (OBJ as TGLBasesceneobject).Direction.X := Parval
    else if Pro = 'direction.y' then
      (OBJ as TGLBasesceneobject).Direction.Y := Parval
    else if Pro = 'direction.z' then
      (OBJ as TGLBasesceneobject).Direction.Z := Parval
    else if Pro = 'rollangle' then
      (OBJ as TGLBasesceneobject).RollAngle := Parval
    else if Pro = 'pitchangle' then
      (OBJ as TGLBasesceneobject).PitchAngle := Parval
    else if Pro = 'turnangle' then
      (OBJ as TGLBasesceneobject).TurnAngle := Parval
    else if (OBJ as TGLBasesceneobject) is TGLPolygon then
    begin
      if Pro='nodes.count' then
      for j:= (obj as TGLPolygon).Nodes.Count+1  to StrToInt(param) do
      (OBJ as TGLPolygon).Nodes.Add;
    if pos ('nodes.nodes[',Pro)=1 then
    begin
      tmpi:= StrToInt(copy(pro,pos('[',Pro)+1,pos(']',Pro)-pos('[',Pro)-1)) ;
      if pro=('nodes.nodes['+inttostr(tmpi)+'].x') then (obj as
        TGLPolygon).Nodes[tmpi].x:=strtofloat(Param)
      else if pro=('nodes.nodes['+inttostr(tmpi)+'].y') then (obj as
        TGLPolygon).Nodes[tmpi].y:=strtofloat(Param)
      else if pro=('nodes.nodes['+inttostr(tmpi)+'].z') then (obj as
        TGLPolygon).Nodes[tmpi].z:=strtofloat(Param)

    end
    end
     else if OBJ is TGLRevolutionSolid then
    begin

      if Pro='nodes.count' then
      for j:= (obj as TGLRevolutionSolid).Nodes.Count+1  to StrToInt(param) do
      (OBJ as TGLRevolutionSolid).Nodes.Add;
    if pos ('nodes.nodes[',Pro)=1 then
    begin
      tmpi:= StrToInt(copy(pro,pos('[',Pro)+1,pos(']',Pro)-pos('[',Pro)-1)) ;
      if pro=('nodes.nodes['+inttostr(tmpi)+'].x') then (obj as
        TGLRevolutionSolid).Nodes[tmpi].x:=strtofloat(Param)
      else if pro=('nodes.nodes['+inttostr(tmpi)+'].y') then (obj as
        TGLRevolutionSolid).Nodes[tmpi].y:=strtofloat(Param)
      else if pro=('nodes.nodes['+inttostr(tmpi)+'].z') then (obj as
       TGLRevolutionSolid).Nodes[tmpi].z:=strtofloat(Param)
    end


    end
    else if obj is TGLActor then
      begin
        if pro='actorfile' then
          (obj as TGLActor).LoadFromFile(Param)
        else if pro='animationmode' then
          (obj as TGLActor).AnimationMode:= tactoranimationmode(strtoint(
            param))
        else if pro='animation' then
        (obj as TGLActor).SwitchToAnimation(Param,true);

    end
    else if OBJ is TGLCone then
    begin
      if Pro = 'radius' then (OBJ as TGLCone)
        .BottomRadius := strtofloat(Param)
      else if Pro = 'slice' then (OBJ as TGLCone)
        .Slices := strtoint(Param)
    end
    else if OBJ is TGLCylinder then
    begin
      if Pro = 'bottomradius' then (OBJ as TGLCylinder)
        .BottomRadius := strtofloat(Param)
      else if Pro = 'topradius' then (OBJ as TGLCylinder)
        .TopRadius := strtofloat(Param)
      else if Pro = 'slice' then (OBJ as TGLCylinder)
        .Slices := strtoint(Param)
    end
    else if OBJ is tglsphere then
    begin
      if Pro = 'radius' then (OBJ as tglsphere)
        .Radius := strtofloat(Param)
      else if Pro = 'slice' then (OBJ as tglsphere)
        .Radius := strtofloat(Param)
    end
    else if OBJ is TGLCapsule then
    begin
      if Pro = 'radius' then (OBJ as TGLCapsule)
        .Radius := strtofloat(Param)
      else if Pro = 'slice' then (OBJ as TGLCapsule)
        .Slices := strtoint(Param);
    end
    else if OBJ is TGLCube then
    begin
      if Pro = 'width' then (OBJ as TGLCube)
        .CubeWidth := strtofloat(Param)
      else if Pro = 'height' then (OBJ as TGLCube)
        .CubeHeight := strtofloat(Param)
      else if Pro = 'depth' then (OBJ as TGLCube)
        .CubeHeight := strtofloat(Param)
    end
    else if (OBJ is TGLCamera) and (Pro = 'focallength') then (OBJ as TGLCamera)
      .FocalLength := strtofloat(Param)
    else if (OBJ is TGLCamera) and (Pro = 'depthofview') then (OBJ as TGLCamera)
      .DepthOfView := strtofloat(Param)
    else if OBJ is TGLLightSource then
    begin
      if Pro = 'shining' then (OBJ as TGLLightSource)
        .Shining := Param = 'true'
      else if Pro = 'lightstyle' then
      begin
        if Param = 'customlsspot' then (OBJ as TGLLightSource)
          .LightStyle := lsSpot
        else if Param = 'customlsomni' then (OBJ as TGLLightSource)
          .LightStyle := lsOmni
        else if Param = 'customlsparalle' then (OBJ as TGLLightSource)
          .LightStyle := lsParallel
      end
      else if Pro = 'lightcolor' then (OBJ as TGLLightSource)
        .Diffuse.AsWinColor := (strtoint(Param));
    end;
  end;
  Application.ProcessMessages ;
End;

procedure TFmain.DrawDataToscene;
var
  i: Integer;
begin
  for i := 0 to CountShape do
  begin
    With Shape[i] do
    begin
      case Shape[i].Style of
        stcube:
          begin
            ACube := TGLCube.Create(GLScene1.Objects);
            ACube.CubeWidth := Width;
            ACube.CubeHeight := Height;
            ACube.CubeDepth := Depth;
            ACube.Position.X := Position.X;
            ACube.Position.Y := Position.Y;
            ACube.Position.Z := Position.Z;
          end;
      end; { END CASE }
    end;
  end;
  Scene.ResetPerformanceMonitor;
end;

procedure TFmain.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Docommand(Edit1.text);
end;

procedure TFmain.CheckBox1Click(Sender: TObject);
begin
sSkinManager1.Active:= not sSkinManager1.Active;
end;

procedure TFmain.CheckBox2Click(Sender: TObject);
begin
GLDummycubecenter.ShowAxes:= CheckBox2.Checked;
end;

procedure TFmain.CreateShapeData;
  Procedure WriteShapeToFile(OBJ: TGLBaseSceneObject);
  begin
    inc(CountS);
    with Shape[CountS-1] do
    Begin
      Name := OBJ.Name;
      if OBJ Is TGLLightSource then
      begin
        Style := TShapeStyle.STlight;
        Shining := (OBJ as TGLLightSource).Shining;
        Color := (OBJ as TGLLightSource).Diffuse.AsWinColor;
        case (OBJ as TGLLightSource).LightStyle of
          lsSpot:
            LightStyle := TLightStyle.CustomLsspot;
          lsOmni:
            LightStyle := TLightStyle.CustomlsLsomni;
          lsParallel:
            LightStyle := TLightStyle.CustomlsLsparallel;
        end;

      end
      else if OBJ is TGLCamera then
      begin
        Style := TShapeStyle.stcamera;
        FocalLength := (OBJ as TGLCamera).FocalLength;
        DepthOfView := (OBJ as TGLCamera).DepthOfView;
      end
      else if OBJ is TGLCube then
      Begin
        Style := stcube;
        Width := (OBJ as TGLCube).CubeWidth;
        Height := (OBJ as TGLCube).CubeHeight;
        Depth := (OBJ as TGLCube).CubeDepth;
        Texture.Brightness := (OBJ as TGLCube).Material.Texture.ImageBrightness;
        Texture.Disable := (OBJ as TGLCube).Material.Texture.Disabled;

      End
      Else if OBJ is TGLCone then
      begin
        Style := STCone;
        BottomRadius := (OBJ as TGLCone).BottomRadius;
        Slice := (OBJ as TGLCone).Slices;
        Texture.Brightness := (OBJ as TGLCone).Material.Texture.ImageBrightness;
        Texture.Disable := (OBJ as TGLCone).Material.Texture.Disabled;
      end
      else if OBJ is TGLCylinder then
      begin
        Style := stcylinder;
        BottomRadius := (OBJ as TGLCylinder).BottomRadius;
        TopRadius := (OBJ as TGLCylinder).TopRadius;
        Height := (OBJ as TGLCylinder).Height;
        Slice := (OBJ as TGLCylinder).Slices;
        Texture.Brightness := (OBJ as TGLCylinder)
          .Material.Texture.ImageBrightness;
        Texture.Disable := (OBJ as TGLCylinder).Material.Texture.Disabled;
      end
      Else if OBJ is tglsphere then
      begin
        Style := stsphere;
        Radius := (OBJ as tglsphere).Radius;
        Slice := (OBJ as tglsphere).Slices;
        Texture.Brightness := (OBJ as tglsphere)
          .Material.Texture.ImageBrightness;
        Texture.Disable := (OBJ as tglsphere).Material.Texture.Disabled;
      end
      Else if OBJ is TGLCapsule then
      begin
        Style := stcapsule;
        Height := (OBJ as TGLCapsule).Height;
        Slice := (OBJ as TGLCapsule).Slices;
        Texture.Brightness := (OBJ as TGLCapsule)
          .Material.Texture.ImageBrightness;
        Texture.Disable := (OBJ as TGLCapsule).Material.Texture.Disabled;
      end
    else if obj is TGLActor then
      begin
        Style:= stactor;
        Animation:='';
        AnimationMode:= TNone;
        SmoothAni:=true;
        ActorFile:='';
      end;
      Position.X := OBJ.Position.X;
      Position.Y := OBJ.Position.Y;
      Position.Z := OBJ.Position.Z;
      Scale.X := OBJ.Scale.X;
      Scale.Y := OBJ.Scale.Y;
      Scale.Z := OBJ.Scale.Z;
      Direction.X := OBJ.Direction.X;
      Direction.Y := OBJ.Direction.Y;
      Direction.Z := OBJ.Direction.Z;
      TurnAngle := OBJ.TurnAngle;
      RollAngle := OBJ.RollAngle;

      Visible := OBJ.Visible;

    end;
  end;
  Function ReadShape(OBJ: TGLBaseSceneObject): TGLBaseSceneObject;
  var
    j: Integer;
  begin
    if OBJ.Count = 0 then
      WriteShapeToFile(OBJ)
    else
    begin
      // ghi Obj vo file
      inc(CountS);
      with Shape[CountS-1] do
      Begin
        Name := OBJ.Name;
        if OBJ Is TGLLightSource then
        begin
          Style := TShapeStyle.STlight;
          Shining := (OBJ as TGLLightSource).Shining;
          Color := (OBJ as TGLLightSource).Diffuse.AsWinColor;
          case (OBJ as TGLLightSource).LightStyle of
            lsSpot:
              LightStyle := TLightStyle.CustomLsspot;
            lsOmni:
              LightStyle := TLightStyle.CustomlsLsomni;
            lsParallel:
              LightStyle := TLightStyle.CustomlsLsparallel;
          end;

        end
        else if OBJ is TGLCamera then
        begin
          Style := TShapeStyle.stcamera;
          FocalLength := (OBJ as TGLCamera).FocalLength;
          DepthOfView := (OBJ as TGLCamera).DepthOfView;
        end
        else if OBJ is TGLCube then
        Begin
          Style := stcube;
          Width := (OBJ as TGLCube).CubeWidth;
          Height := (OBJ as TGLCube).CubeHeight;
          Depth := (OBJ as TGLCube).CubeDepth;
          Texture.Brightness := (OBJ as TGLCube)
            .Material.Texture.ImageBrightness;
          Texture.Disable := (OBJ as TGLCube).Material.Texture.Disabled;

        End
        Else if OBJ is TGLCone then
        begin
          Style := STCone;
          BottomRadius := (OBJ as TGLCone).BottomRadius;
          Slice := (OBJ as TGLCone).Slices;
          Texture.Brightness := (OBJ as TGLCone)
            .Material.Texture.ImageBrightness;
          Texture.Disable := (OBJ as TGLCone).Material.Texture.Disabled;
        end
        else if OBJ is TGLCylinder then
        begin
          Style := stcylinder;
          BottomRadius := (OBJ as TGLCylinder).BottomRadius;
          TopRadius := (OBJ as TGLCylinder).TopRadius;
          Height := (OBJ as TGLCylinder).Height;
          Slice := (OBJ as TGLCylinder).Slices;
          Texture.Brightness := (OBJ as TGLCylinder)
            .Material.Texture.ImageBrightness;
          Texture.Disable := (OBJ as TGLCylinder).Material.Texture.Disabled;
        end
        Else if OBJ is tglsphere then
        begin
          Style := stsphere;
          Radius := (OBJ as tglsphere).Radius;
          Slice := (OBJ as tglsphere).Slices;
          Texture.Brightness := (OBJ as tglsphere)
            .Material.Texture.ImageBrightness;
          Texture.Disable := (OBJ as tglsphere).Material.Texture.Disabled;
        end
        Else if OBJ is TGLCapsule then
        begin
          Style := stcapsule;
          Height := (OBJ as TGLCapsule).Height;
          Slice := (OBJ as TGLCapsule).Slices;
          Texture.Brightness := (OBJ as TGLCapsule)
            .Material.Texture.ImageBrightness;
          Texture.Disable := (OBJ as TGLCapsule).Material.Texture.Disabled;
        end;
        Position.X := OBJ.Position.X;
        Position.Y := OBJ.Position.Y;
        Position.Z := OBJ.Position.Z;
        Scale.X := OBJ.Scale.X;
        Scale.Y := OBJ.Scale.Y;
        Scale.Z := OBJ.Scale.Z;
        Direction.X := OBJ.Direction.X;
        Direction.Y := OBJ.Direction.Y;
        Direction.Z := OBJ.Direction.Z;
        TurnAngle := OBJ.TurnAngle;
        RollAngle := OBJ.RollAngle;

        Visible := OBJ.Visible;

      end;
      // ghi children cua obj
      for j := 0 to OBJ.Count - 1 do
      begin
        ReadShape(OBJ[j])
      end;

    end;
  end;

Var
  i: Integer;
  OBJ: TGLBaseSceneObject;
begin
  CountS := 0;
  for i := 3 to GLScene1.Objects.Count - 1 do
    ReadShape(GLScene1.Objects[i]);
end;

function TPicturePropEditor.GetValue: TLMDString;
begin
  if TPicture(GetOrdValue(0)).Graphic = nil then
    result := '(None)'
  else
    result := '(Picture)';
end;

procedure TPicturePropEditor.Edit;
begin (Gizmo.SelectedObj as TGLCustomSceneObject)
  .Material.Texture.Image.Assign(TPicture(GetOrdValue(0)));
  with Fmain do
    if OpenPictureDialog1.Execute then
    begin
      Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
      SetOrdValue(Longint(Image1.Picture))
    end;

end;

function TPicturePropEditor.GetAttrs: TLMDPropAttrs;
begin
  result := [praMultiSelect, praDialog, praReadOnly];
end;

procedure TFmain.BitBtn1Click(Sender: TObject);
begin
spb_run.Enabled:=true;
spb_pause.Enabled:=false;
spb_resume.Enabled:=false;
Run.Terminate;
end;

procedure TFmain.BitBtn2Click(Sender: TObject);
begin
  Gizmo.FREE;
  GLScene1.SaveToFile('blank.gls');
  Gizmo := TGLGizmoEx.Create(self);
  Gizmo.LabelFont := WindowsBitmapFont;
  Gizmo.Viewer := Scene;
  Scene.SetFocus;
  Gizmo.RootGizmo := GLDummycubecenter;
  Gizmo.RootObjects := GLRootObjects;
  Gizmo.GizmoTmpRoot := RootTempObjects;
  Gizmo.ExcludeObjects := true;
  Gizmo.ExcludeObjectsList.Add('GLXYZGrid1');
  Gizmo.ExcludeObjectsList.Add('GLHUDText1');
end;

procedure TFmain.BitBtn3Click(Sender: TObject);
var
  i: Integer;
  tmp: string;
begin
  if OpenDialog1.Execute then
  begin
    tmp := OpenDialog1.FileName;
    Filen := tmp;
    for i := length(tmp) downto 0 do
      if tmp[i] = '\' then
        break;
    PrjName := Copy(tmp, i + 1, length(tmp) - i - 4);
    localtosave := Copy(tmp, 0, i - 1);
    // ShowMessage(PrjName);
    open(tmp);
  end;

end;

procedure TFmain.Button1Click(Sender: TObject);
begin
  ShowMessage(IntToStr(pos('delay', 'elay=100')));
end;

procedure TFmain.Button2Click(Sender: TObject);
begin
  stop := true;
end;

procedure TFmain.Button3Click(Sender: TObject);
begin
  { begin
    Compile('c:\FPC\3DAnimation\code.exe','c:\FPC\3DAnimation\code.txt','c:\FPC\3DAnimation\result.txt','' );
    fmsg.mm_msg.Lines.LoadFromFile('c:\FPC\3DAnimation\result.txt');
    end }

end;

procedure TFmain.Button4Click(Sender: TObject);
begin
  { Resume := True;
    SpeedButton18.OnClick(Fmain); }

end;

procedure TFmain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // CloseFile(Output);
  // Closefile(Input);
  mm_code.FREE;
  AniStr.FREE;
end;

procedure TFmain.FormCreate(Sender: TObject);
var
  IPanel: TRTTIInspectorPanel;
begin
sSkinManager1.SkinDirectory:= ExtractFilePath(Application.ExeName)+'skins';
sSkinManager1.Active:=true;
  Dangmo := false;
  PrjDangmo := '';
  Run := TRun.Create(true);
  Gizmo := TGLGizmoEx.Create(self);
  Gizmo.LabelFont := WindowsBitmapFont;
  Gizmo.Viewer := Scene;
  Gizmo.ExcludeClassnameList.Add('TGLSphere');
  FCreationScenarious := -1;
  // Propertygrid.Panels[0].RTTIComponent:=BitBtn1;
  LMDSimplePropInspector1.RegisterPropEditor(TypeInfo(TPicture), nil, '',
    TPicturePropEditor);
  LMDSimplePropInspector1.Objects.SetOne(Image1);
  AssignFile(Input, 'C:\output.txt');
  // Reset(input);
  CountShape := -1;
  // ShowMessage(GLScene1.Objects[3].Name);
  // ShowMessage(IntToStr(GLScene1.Objects.Count));
  mm_code := TStringlist.Create;
  AniStr := TStringlist.Create;
  // mm_code.Parent:= Fmain;
  // mm_code.Visible:=false;
   {LMDSimplePropInspector1.Color := clWindow;
  LMDSimplePropInspector1.SelectionStyle := ssFlat;
  LMDSimplePropInspector1.GridVisible := False;
  LMDSimplePropInspector1.GutterVisible := True;
  LMDSimplePropInspector1.CursorVisible := True;
  LMDSimplePropInspector1.CategoryBackgroundColor := $00E8E8E8;
  LMDSimplePropInspector1.CategoryFont.Color := clMaroon;
  LMDSimplePropInspector1.FlatSelectionBackgroundColor := $00E8E8E8;
  LMDSimplePropInspector1.FlatSelectionColor := clWindowText; }
  adr:= ExtractFilePath(Application.ExeName);
   // showmessage(adr);

end;

procedure TFmain.FormDestroy(Sender: TObject);
begin
 Gizmo.FREE;
  Run.FREE;
end;

procedure TFmain.omi1Click(Sender: TObject);
begin
  Fmain.SpeedButton19Click(self);
end;

procedure TFmain.open(LocalFile: string);
var
  i: Integer;
  tmps:string;
begin
//try
AssignFile(mainprj, OpenDialog1.FileName);
reset(mainprj);
   read(mainprj,tmps);
   CloseFile(mainprj);
  MemoSource.Lines.LoadFromFile(Local+'\'+tmps+'.pas');
  Prj_name_backup:=tmps;
 // delete(Filen, length(Filen) - 3, 4);
  //ShowMessage(Filen);
 Gizmo.FREE;
 // GLDummycubecenter.DeleteChildren;
  // GLScene1.Objects.DeleteChildren;
//  showmessage(local+tmps + '.gls');
  GLScene1.LoadFromFile(local+'\'+tmps + '.gls');
  Gizmo := TGLGizmoEx.Create(self);
  Gizmo.LabelFont := WindowsBitmapFont;
  Gizmo.Viewer := Scene;
  Scene.SetFocus;
  Gizmo.RootGizmo := GLDummycubecenter;
  Gizmo.RootObjects := GLRootObjects;
  Gizmo.GizmoTmpRoot := RootTempObjects;
  Gizmo.ExcludeObjects := true;
  Gizmo.ExcludeObjectsList.Add('GLXYZGrid1');
  Gizmo.ExcludeObjectsList.Add('GLHUDText1');
  MakeTree;
  PrjDangmo := Filen;
  Dangmo := true;
  pickobj := nil;
Fmain.Caption:='Lập trình tạo hình chuyển động 3DAnimation-'+ local+ Prj_name_backup +'.3ap';
//except
//Messagedlg('Không thể mở', mterror,[mbok],0);
end;
//end;

procedure TFmain.FormShow(Sender: TObject);
begin
  Scene.SetFocus;
  Gizmo.RootGizmo := GLDummycubecenter;
  Gizmo.RootObjects := GLRootObjects;
  Gizmo.GizmoTmpRoot := RootTempObjects;
  Gizmo.ExcludeObjects := true;
  Gizmo.ExcludeObjectsList.Add('GLXYZGrid1');
  Gizmo.ExcludeObjectsList.Add('GLHUDText1');
  // GLMaincamera.TurnAngle:=45;
  // GLMaincamera.PitchAngle:=-45;
  // UpdateTreeView;
  MakeTree;
end;

procedure TFmain.GLCadencer1Progress(Sender: TObject;
  const deltaTime, newTime: Double);
begin
  Scene.invalidate;
end;

procedure TFmain.GLCadencer2Progress(Sender: TObject; const deltaTime,
  newTime: Double);
begin
//GLWaterPlane1.CreateRippleAtWorldPos();
end;

procedure TFmain.Hngdn1Click(Sender: TObject);
VAR ADR:STRING;
begin
  adr:=  ExtractFilePath(Application.ExeName)+'help.chm' ;
ShellExecute(0,nil,pchar(ADR),'','',SW_SHOW )
end;

procedure TFmain.hngtinphnmm1Click(Sender: TObject);
begin
frm_info.showmodal;
end;

procedure TFmain.hot1Click(Sender: TObject);
begin
  close;
end;

procedure TFmain.LMDSimplePropInspector1Change(Sender: TObject);
begin
MakeTree;
end;

procedure TFmain.Lu1Click(Sender: TObject);
begin
  Fmain.SpeedButton25Click(self);
end;

procedure TFmain.Luscenevofilegls1Click(Sender: TObject);
begin
if SaveDialog2.Execute then
  begin
    Gizmo.FREE;
GLScene1.SaveToFile(SaveDialog2.FileName+'.GLS');
Gizmo := TGLGizmoEx.Create(Self);
Gizmo.LabelFont := WindowsBitmapFont;
  Gizmo.Viewer := scene;
  scene.SetFocus;
  Gizmo.RootGizmo := GLDummycubecenter;
  Gizmo.RootObjects := GLRootObjects;
  Gizmo.GizmoTmpRoot := RootTempObjects;
  Gizmo.ExcludeObjects := True;
  Gizmo.ExcludeObjectsList.Add('GLXYZGrid1');
  Gizmo.ExcludeObjectsList.Add('GLHUDText1');
  end;
end;

procedure TFmain.Luvitnkhc1Click(Sender: TObject);
var
  i: Integer;
  tmp: string;
begin
if SaveDialog1.Execute then
    begin
      tmp:= SaveDialog1.FileName;
    //tach dia chi va ten du an
    for I :=  Length(tmp) downto 0 do
      if tmp[i]='\' then
      break;
     PrjName:=  Copy(tmp,i+1,length(tmp)-i) ;
    Local:= Copy(tmp,0, i);
      // -------------------------------------------
      save(PrjName);
      Saved := true;
    end;

end;

procedure TFmain.N1Click(Sender: TObject);
begin
 if OpenPictureDialog1.Execute then
  begin (Gizmo.SelectedObj as TGLCustomSceneObject).Material.Texture.Image.LoadFromFile(OpenPictureDialog1.FileName);
    (Gizmo.SelectedObj as TGLCustomSceneObject).Material.Texture.Disabled:=false;
  end;
end;

procedure TFmain.Npdliu1Click(Sender: TObject);
begin
u_loadDatatoMesh.index:= pickobj.Index;
frm_loadmesh.showmodal;
end;

procedure TFmain.NpdliuMesh1Click(Sender: TObject);
begin
u_loadDatatoMesh.index:= pickobj.Index;
frm_loadmesh.showmodal;
end;

procedure TFmain.Npscenetfilegls1Click(Sender: TObject);
begin
if OpenDialog2.Execute then
begin
  Gizmo.Free;
//GLScene1.Objects.DeleteChildren;
GLScene1.LoadFromFile(OpenDialog2.FileName);
Gizmo := TGLGizmoEx.Create(Self);
Gizmo.LabelFont := WindowsBitmapFont;
  Gizmo.Viewer := scene;
  scene.SetFocus;
  Gizmo.RootGizmo := GLDummycubecenter;
  Gizmo.RootObjects := GLRootObjects;
  Gizmo.GizmoTmpRoot := RootTempObjects;
  Gizmo.ExcludeObjects := True;
  Gizmo.ExcludeObjectsList.Add('GLXYZGrid1');
  Gizmo.ExcludeObjectsList.Add('GLHUDText1');
end;
end;

procedure TFmain.NpTexture1Click(Sender: TObject);
begin
 if OpenPictureDialog1.Execute then
  begin (Gizmo.SelectedObj as TGLCustomSceneObject).Material.Texture.Image.LoadFromFile(OpenPictureDialog1.FileName);
    (Gizmo.SelectedObj as TGLCustomSceneObject).Material.Texture.Disabled:=false;
  end;
end;

procedure TFmain.PlaneClick(Sender: TObject);
var tmpname:string;
   i:Integer;
begin
i:=0 ;
  APlane := TGLPlane.Create(GLScene1.Objects);
  with APlane do
  begin
  if (  Gizmo.SelectedObj= nil)  or ( Gizmo.SelectedObj is TGLDirectOpenGL) or ( Gizmo.SelectedObj is TGLCamera) or ( Gizmo.SelectedObj is TGLLightSource)
      then

      Parent := GLScene1.Objects

    else
      Parent := Gizmo.SelectedObj;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname:= 'GLPlane'+inttostr(i);
    until (GLScene1.FindSceneObject(TmpName)=nil);
  end;
  APlane.Name:= tmpname;
   MakeTree;
end;

procedure TFmain.PopupshapePopup(Sender: TObject);
begin
  if pickobj <> nil then
  begin
    Popupshape.Items[0].Enabled := true;
    Popupshape.Items[1].Enabled := true;
    if (pickobj is TGLActor) or (pickobj is TGLMesh) or (pickobj is
      TGLFreeForm) then
      Popupshape.Items[2].Enabled:=true
    else Popupshape.Items[2].Enabled:=false;

  end
  else
  begin
    Popupshape.Items[0].Enabled := false;
    Popupshape.Items[1].Enabled := false;
  end;
  Popupshape.AutoPopup := false;
end;

procedure TFmain.pp_treePopup(Sender: TObject);
begin
if pickobj <> nil then
  begin
    pp_tree.Items[0].Enabled := true;
    pp_tree.Items[1].Enabled := true;
    if (pickobj is TGLActor) or (pickobj is TGLMesh) or (pickobj is
      TGLFreeForm) then
      pp_tree.Items[2].Enabled:=true
    else pp_tree.Items[2].Enabled:=false;

  end
  else
  begin
    pp_tree.Items[0].Enabled := false;
    pp_tree.Items[1].Enabled := false;
  end;
 // pp_tree.AutoPopup := false;
end;

procedure TFmain.PropertygridEditUpdate(Sender: TObject;
  AInspectorPanel: TInspectorPanel; AInspectorItem: TInspectorItem);
begin
  Gizmo.UpdateGizmo;
end;

procedure TFmain.Scene2Click(Sender: TObject);
begin
frm_set.show;
end;

procedure TFmain.SceneMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Mx := X;
  my := Y;

  if Shift = [ssleft] then
  begin
    Gizmo.viewerMouseDown(X, Y);
    LMDSimplePropInspector1.Objects.SetOne(Gizmo.SelectedObj);
  pickobj := Scene.Buffer.GetPickedObject(X, Y);
  if Gizmo.SelectedObj<>nil then
  edt_nameobj.Text:= Gizmo.SelectedObj.Name
  else  edt_nameobj.Text:='';

  end
  else
  begin
    pickobj := Scene.Buffer.GetPickedObject(X, Y);
    if pickobj <> nil then
      Popupshape.AutoPopup := true;

  end;
  MouseMoving := true;
  Scene.SetFocus;
  //pickobj := Scene.Buffer.GetPickedObject(X, Y);
  if pickobj<>nil then
if pickobj.ClassName=  'TGLDirectOpenGL'  then
begin
 pickobj:=nil;
end;

end;

procedure TFmain.SceneMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  Gizmo.viewerMouseMove(X, Y);
  if MouseMoving and (Shift = [ssRight]) then
  begin
    GLMaincamera.MoveAroundTarget(my - Y, Mx - X);
  end;
  if MouseMoving then
  begin
    Mx := X;
    my := Y;
  end;
end;

procedure TFmain.SceneMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  MouseMoving := false;
  Gizmo.viewerMouseUp(X, Y);
{  ShowMessage(pickobj.ClassName);
  if pickobj<>nil then   }
if (pickobj is TGLGizmoExUITorus) or (pickobj is TGLGizmoExUIFrustrum) then
begin
 pickobj:=nil;
end;
if pickobj<>nil then
if pickobj.ClassName=  'TGLDirectOpenGL'  then
begin
 pickobj:=nil;
end;
end;

procedure TFmain.SceneMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  GLMaincamera.AdjustDistanceToTarget(Power(1.1, WheelDelta / 120));
  Gizmo.UpdateGizmo;
end;

procedure TFmain.Skin1Click(Sender: TObject);
begin
SelectSkin(sSkinManager1)
end;

procedure TFmain.SpeedButton100Click(Sender: TObject);
begin
spb_run.Enabled:=true;
spb_pause.Enabled:=false;
spb_resume.Enabled:=false;
Run.Terminate;
end;

procedure TFmain.SpeedButton10Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  ACube := TGLCube.Create(GLScene1.Objects);
  with ACube do
  begin
    if (pickobj = nil) or (pickobj is TGLDirectOpenGL) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects

    else
      Parent := pickobj;
    // acube.Material.Texture.Disabled:=false;
    i := 0;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLCube' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
    ACube.Name := tmpname;
  end;
  MakeTree;
end;

procedure TFmain.SpeedButton11Click(Sender: TObject);
begin
AdvMemo1.Undo;
end;

procedure TFmain.SpeedButton15Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  i := 0;
  acylinder := TGLCylinder.Create(GLScene1.Objects);
  with acylinder do
  begin
    if (pickobj = nil) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects
    else
      Parent := pickobj;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLCylinder' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
  end;
  acylinder.Name := tmpname;
  MakeTree;
end;

procedure TFmain.SpeedButton17Click(Sender: TObject);
begin
GLMaincamera.TargetObject:= GLDummycubecenter;
GLMaincamera.Position.x:=0;
GLMaincamera.Position.y:=5;
GLMaincamera.Position.z:=-5;
end;

procedure TFmain.SpeedButton18Click(Sender: TObject);
var
  i: Integer;
  tmp: string;
begin
i:= AlertSave;
if i= IDCANCEL then
exit;
if ((i= IDYES) or (i= IDNO))  then
begin
  if i=IDYES then
  SpeedButton25Click(self);
  if OpenDialog1.Execute then
  begin
   tmp:= OpenDialog1.FileName;
for I :=  Length(tmp) downto 0 do
      if tmp[i]='\' then
      break;
    PrjName:=  Copy(tmp,i+1,length(tmp)-i-4) ;
    LocalTosave:= Copy(tmp,0, i-1);
   // showmessage(LocalTosave);
    local:= LocalTosave+'\';
   // ShowMessage(PrjName);  }
   LocalBackup:= local;
    open(PrjName);
      saved:=true;
  end;
end;
end;

procedure TFmain.spb_resumeClick(Sender: TObject);
begin
  Run.Suspended := false;
  spb_run.Enabled := false;
  spb_pause.Enabled := true;
  spb_resume.Enabled := false;
end;

procedure TFmain.spb_runClick(Sender: TObject);
begin
BackupBeforeRun;
SetCurrentDir(ExtractFilePath(Application.ExeName));
if run <> nil then   Run.Free;
 Run := TRun.Create(true);
  Run.Start;
end;

procedure TFmain.SpeedButton19Click(Sender: TObject);
var
  i: Integer;
begin
i:= AlertSave;
if i= IDCANCEL then
exit;
if (i= IDYES) or (i=IDNO) then
begin
if i=IDYES then

SpeedButton25Click(self);
  Dangmo := false;
  PrjDangmo := '';
  MemoSource.Lines.Clear;
  Gizmo.FREE;
  GLDummycubecenter.DeleteChildren;
   GLScene1.LoadFromFile(ExtractFilePath(Application.ExeName)+'blank.gls');
  Gizmo := TGLGizmoEx.Create(self);
  Gizmo.LabelFont := WindowsBitmapFont;
  Gizmo.Viewer := Scene;
  Scene.SetFocus;
  Gizmo.RootGizmo := GLDummycubecenter;
  Gizmo.RootObjects := GLRootObjects;
  Gizmo.GizmoTmpRoot := RootTempObjects;
  Gizmo.ExcludeObjects := true;
  Gizmo.ExcludeObjectsList.Add('GLXYZGrid1');
  Gizmo.ExcludeObjectsList.Add('GLHUDText1');
  MakeTree;
  Fmain.Caption:=' Lập trình tạo hình chuyển động 3DAnimation -'+ 'Untitle';
  Saved:=  false;

end;
end;

procedure TFmain.SpeedButton1Click(Sender: TObject);
var
  i: Integer;
Begin (Sender as TSpeedButton)
  .Down := false;
  case (Sender as TSpeedButton).Tag of
    0:
      Gizmo.OperationMode := gomSelect;
    1:
      Gizmo.OperationMode := gomMove;
    2:
      Gizmo.OperationMode := gomRotate;
    3:
      Gizmo.OperationMode := gomScale;
    4:
      Gizmo.OperationMode := gomNone;
    5:
      Gizmo.Undo;
    6:
      Gizmo.Redo;
    7:  begin
    if (Gizmo.SelectedObj= GLMaincamera) or (Gizmo.SelectedObj= GLmainlight)
   then   exit;
      Gizmo.RemoveSelectedObjects;
    end;
  end;
  // UpdateTreeView;

  // Disable buttons Camera Translate

 // SpeedButton14.Down := false;
  SpeedButton17.Down := false;
  MakeTree;
 //Gizmo.HistoryStepsCount := 0;
   {for I := 0 to RootTempObjects.Count - 1 do
     RootTempObjects.Remove(RootTempObjects.Children[I],FALSE);  }
  {  for i := 0 to RootTempObjects.Count - 1 do
    RootTempObjects.Remove(RootTempObjects.Children[i],false); }
  {  for i := 0 to GLDummycubecenter.Count - 1 do
    GLDummycubecenter.Remove(GLDummycubecenter.Children[i],false); }
//   GLDummycubecenter.DeleteChildren;
//RootTempObjects.DeleteChildren;
//Gizmo.GizmoTmpRoot.DeleteChildren;
  //Gizmo.CanChangeWithChildren:=false;
 //SceneMouseDown(self,tmousebutton.mbLeft,[ssLeft],0,0)
End;

procedure TFmain.spb_pauseClick(Sender: TObject);
begin
  spb_pause.Enabled := false;
  Run.Suspended := true;
  spb_resume.Enabled := true;
  spb_run.Enabled := true;

end;

procedure TFmain.SpeedButton21Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  i := 0;
  ADodecaheron := TGLDodecahedron.Create(GLScene1.Objects);
  with ADodecaheron do
  begin
    if (pickobj = nil) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects
    else
      Parent := pickobj;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLDodecaheron' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
  end;
  ADodecaheron.Name := tmpname;
  MakeTree;
end;

procedure TFmain.SpeedButton22Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  i := 0;
  AFrustrum := tglfrustrum.Create(GLScene1.Objects);
  with AFrustrum do
  begin
    if (pickobj = nil) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects
    else
      Parent := pickobj;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLFrustrum' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
  end;
  AFrustrum.Name := tmpname;
  MakeTree;
end;

procedure TFmain.SpeedButton23Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  i := 0;
  AIcosahedron := TGLIcosahedron.Create(GLScene1.Objects);
  with AIcosahedron do
  begin
    if (pickobj = nil) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects
    else
      Parent := pickobj;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLIcosahedron' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
  end;
  AIcosahedron.Name := tmpname;
  MakeTree;
end;

procedure TFmain.SpeedButton24Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  i := 0;
  AOctahedron := TGLOctahedron.Create(GLScene1.Objects);
  with AOctahedron do
  begin
    if (pickobj = nil) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then
      Parent := GLScene1.Objects
    else
      Parent := pickobj;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLOctahedron' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
  end;
  AOctahedron.Name := tmpname;
  MakeTree;
end;

procedure TFmain.SpeedButton25Click(Sender: TObject);
var
  i: Integer;
  tmp: string;
begin
  if not saved then
  begin
    if SaveDialog1.Execute then
    begin
      tmp:= SaveDialog1.FileName;
    //tach dia chi va ten du an
    for I :=  Length(tmp) downto 0 do
      if tmp[i]='\' then
      break;
     PrjName:=  Copy(tmp,i+1,length(tmp)-i) ;
    Local:= Copy(tmp,0, i);
    LocalBackup:= local;
      // -------------------------------------------
      save(PrjName);
         Saved := true;

    end;

  end
  else
  begin
    saves(Prj_name_backup, local);
  end;
end;

procedure TFmain.SpeedButton26Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  i := 0;
  ASuperellipsoid1 := TGLSuperellipsoid.Create(GLScene1.Objects);
  with ASuperellipsoid1 do
  begin
    if (pickobj = nil) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects
    else
      Parent := pickobj;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLSuperellipsoid1' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
    ASuperellipsoid1.Name := tmpname;
  end;
  MakeTree;
end;

procedure TFmain.SpeedButton27Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  i := 0;
  adisk := tgldisk.Create(GLScene1.Objects);
  with ADISK do
  begin
    if (pickobj = nil) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects
    else
      Parent := pickobj;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLdisk' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
  end;
  adisk.Name := tmpname;
  MakeTree;
end;

procedure TFmain.SpeedButton29Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  ATree := TGLTree.Create(GLScene1.Objects);
  with ATree do
  begin
    if (pickobj = nil) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects

    else
      Parent := pickobj;
    // acube.Material.Texture.Disabled:=false;
    i := 0;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLTree' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
    ATree.Name := tmpname;
  end;
  MakeTree;
end;

procedure TFmain.SpeedButton30Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  AXYZGrid := TGLXYZGrid.Create(GLScene1.Objects);
  with AXYZGrid do
  begin
    if (pickobj = nil) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects

    else
      Parent := pickobj;
    // acube.Material.Texture.Disabled:=false;
    i := 0;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLXYZGrid' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
    AXYZGrid.Name := tmpname;
  end;
  MakeTree;
end;

procedure TFmain.SpeedButton31Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  ATeaPot := TGLTeapot.Create(GLScene1.Objects);
  with ATeaPot do
  begin
    if (pickobj = nil) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects

    else
      Parent := pickobj;
    // acube.Material.Texture.Disabled:=false;
    i := 0;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLTeapot' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
    ATeaPot.Name := tmpname;
  end;
  MakeTree;
end;

procedure TFmain.SpeedButton32Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  AFlatText := TGLFlatText.Create(GLScene1.Objects);
  with AFlatText do
  begin
    if (pickobj = nil) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects

    else
      Parent := pickobj;
    // acube.Material.Texture.Disabled:=false;
    i := 0;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLFlatText' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
     AFlatText.Name := tmpname;
  end;
  MakeTree;
end;
procedure TFmain.SpeedButton33Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  ASpaceText := TGLSpaceText.Create(GLScene1.Objects);
  with aSpaceText do
  begin
    if (pickobj = nil) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then
      ASpaceText.Parent:= GLScene1.Objects

     // Parent := GLScene1.Objects

    else
      Parent := pickobj;
    // acube.Material.Texture.Disabled:=false;
    i := 0;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLSpaceText' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
    ASpaceText.Name := tmpname;
  end;
  MakeTree;
end;

procedure TFmain.SpeedButton34Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
 ATorus := TGLTorus.Create(GLScene1.Objects);
  with ATorus do
  begin
    if (pickobj = nil) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects

    else
      Parent := pickobj;
    // acube.Material.Texture.Disabled:=false;
    i := 0;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLTorus' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
    ATorus.Name := tmpname;
  end;
  MakeTree;
end;

procedure TFmain.SpeedButton35Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  ARevolutionSolid := TGLRevolutionSolid.Create(GLScene1.Objects);
  with ARevolutionSolid do
  begin
    if (pickobj = nil) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects

    else
      Parent := pickobj;
    // acube.Material.Texture.Disabled:=false;
    i := 0;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLRevolutionSolid' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
    ARevolutionSolid.Name := tmpname;
  end;
  MakeTree;
end;

procedure TFmain.SpeedButton36Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  APipe := TGLPipe.Create(GLScene1.Objects);
  with APipe do
  begin
    if (pickobj = nil) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects

    else
      Parent := pickobj;
    // acube.Material.Texture.Disabled:=false;
    i := 0;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLPipe' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
    APipe.Name := tmpname;
  end;
  MakeTree;
end;

procedure TFmain.SpeedButton37Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  AMultiPolygon := TGLMultiPolygon.Create(GLScene1.Objects);
  with AMultiPolygon do
  begin
    if (pickobj = nil) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects

    else
      Parent := pickobj;
    // acube.Material.Texture.Disabled:=false;
    i := 0;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLMultiPolygon' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
    AMultiPolygon.Name := tmpname;
  end;
  MakeTree;
end;

procedure TFmain.SpeedButton38Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  AWaterPlane := TGLWaterPlane.Create(GLScene1.Objects);
  with AWaterPlane do
  begin
    if (pickobj = nil) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects

    else
      Parent := pickobj;
    // acube.Material.Texture.Disabled:=false;
    i := 0;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLWaterPlane' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
    AWaterPlane.Name := tmpname;
  end;
  MakeTree;
end;
procedure TFmain.SpeedButton39Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  AExtrusionSolid := TGLExtrusionSolid.Create(GLScene1.Objects);
  with AExtrusionSolid do
  begin
    if (pickobj = nil) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects

    else
      Parent := pickobj;
    // acube.Material.Texture.Disabled:=false;
    i := 0;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLExtrusionSolid' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
    AExtrusionSolid.Name := tmpname;
  end;
  MakeTree;
end;

procedure TFmain.SpeedButton40Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  AArowLine := TGLArrowLine.Create(GLScene1.Objects);
  with AArowLine do
  begin
    if (pickobj = nil) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects

    else
      Parent := pickobj;
    // acube.Material.Texture.Disabled:=false;
    i := 0;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLArowLine' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
    AArowLine.Name := tmpname;
  end;
  MakeTree;
end;

procedure TFmain.SpeedButton41Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  AArowArc := TGLArrowArc.Create(GLScene1.Objects);
  with AArowArc do
  begin
    if (pickobj = nil) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects

    else
      Parent := pickobj;
    // acube.Material.Texture.Disabled:=false;
    i := 0;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLArowArc' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
    AArowArc.Name := tmpname;
  end;
  MakeTree;
end;

procedure TFmain.SpeedButton42Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  AAnnulus := TGLAnnulus.Create(GLScene1.Objects);
  with AAnnulus do
  begin
    if (pickobj = nil) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects

    else
      Parent := pickobj;
    // acube.Material.Texture.Disabled:=false;
    i := 0;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'Annulus' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
    AAnnulus.Name := tmpname;
  end;
  MakeTree;
end;

procedure TFmain.SpeedButton43Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  apolygon := TGLPolygon.Create(GLScene1.Objects);
  with apolygon do
  begin
    if (pickobj = nil) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects

    else
      Parent := pickobj;
    // acube.Material.Texture.Disabled:=false;
    i := 0;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLPolygon' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
    apolygon.Name := tmpname;

  end;
  MakeTree;
end;


procedure TFmain.SpeedButton44Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  AFreeForm := TGLFreeForm.Create(GLScene1.Objects);
  with AFreeForm do
  begin
    if (pickobj = nil) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects

    else
      Parent := pickobj;
    // acube.Material.Texture.Disabled:=false;
    i := 0;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLFreeForm' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);

    AFreeForm.Name := tmpname;
    AFreeForm.Scale.x:=0.04;
    AFreeForm.Scale.y:=0.04;
    AFreeForm.Scale.z:=0.04;
  end;
  MakeTree;
end;


procedure TFmain.SpeedButton45Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  AActor := TGLActor.Create(GLScene1.Objects);
  with AActor do
  begin
    if (pickobj = nil) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects

    else
      Parent := pickobj;
    // acube.Material.Texture.Disabled:=false;
    i := 0;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLActor' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
    AActor.Name := tmpname;
    AActor.Scale.X:=0.04;
    AActor.Scale.Y:=0.04;
    AActor.Scale.z:=0.04;
  end;
  MakeTree;
end;


procedure TFmain.SpeedButton47Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  adummycube := TGLDummyCube.Create(GLScene1.Objects);
  with adummycube do
  begin
    if (pickobj = nil) or (pickobj is TGLDirectOpenGL) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects

    else
      Parent := pickobj;
    // acube.Material.Texture.Disabled:=false;
    i := 0;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLDummyCube' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
    adummycube.Name := tmpname;
  end;
  MakeTree;
end;

procedure TFmain.SpeedButton48Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  Alight := TGLLightSource.Create(GLScene1.Objects);
  with Alight do
  begin
    if (pickobj = nil) or (pickobj is TGLDirectOpenGL) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects

    else
      Parent := pickobj;
    // acube.Material.Texture.Disabled:=false;
    i := 0;
   // Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLLight' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
   Alight.Name := tmpname;
  end;
  MakeTree;
end;

procedure TFmain.SpeedButton5Click(Sender: TObject);
begin
AdvMemo1.PasteFromClipBoard;
end;

procedure TFmain.SpeedButton6Click(Sender: TObject);
begin
AdvMemo1.Redo;
end;

procedure TFmain.SpeedButton7Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  i := 0;
  acapsule := TGLCapsule.Create(GLScene1.Objects);
  with acapsule do
  begin
    if (pickobj = nil) or (pickobj is TGLDirectOpenGL) or (pickobj is
      TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects
    else
      Parent := pickobj;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLCapsule' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
    acapsule.Name := tmpname;
  end;
  MakeTree;
end;

procedure TFmain.SpeedButton8Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  i := 0;
  Acone := TGLCone.Create(GLScene1.Objects);
  with Acone do
  begin
    if (pickobj = nil) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects
    else
      Parent := pickobj;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLCone' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
  end;
  Acone.Name := tmpname;
  MakeTree;
end;

procedure TFmain.SpeedButton9Click(Sender: TObject);
var
  tmpname: string;
  i: Integer;
begin
  i := 0;
  asphere := tglsphere.Create(GLScene1.Objects);
  with asphere do
  begin
    if (pickobj = nil) or (pickobj is TGLCamera) or (pickobj is TGLLightSource)
      then

      Parent := GLScene1.Objects
    else
      Parent := pickobj;
    Material.FrontProperties.Diffuse.RandomColor;
    repeat
      inc(i);
      tmpname := 'GLSphere' + IntToStr(i);
    until (GLScene1.FindSceneObject(tmpname) = nil);
    asphere.Name := tmpname;
  end;
  MakeTree;
end;

procedure TFmain.sp_restoClick(Sender: TObject);
begin
RestoreAfterRun;
end;

procedure TFmain.sSkinProvider1AfterAnimation(AnimType: TacAnimEvent);
begin

end;

{ Procedure TFmain.UpdateTreeView;
  //.: AddNodes :.
  function AddNodes(ANode: TTreeNode; AObject: TGLBaseSceneObject): TTreeNode;
  var
  I: Integer;
  CurrentNode: TTreeNode;
  begin
  Result := TreeView1.Items.AddChildObject(ANode, AObject.Name, AObject);
  CurrentNode := Result;
  for I := 0 to AObject.Count -1 do
  Result := AddNodes(CurrentNode, AObject[I]);
  end;

  var
  I: Integer;
  ObjectNode: TTreeNode;
  begin
  TreeView1.Items.Clear;
  // -- add two root nodes --
  //ObjectNode := TreeView1.Items.AddFirst(nil, 'RootTempObjects');
  // -- get the object's tree --
  TreeView1.Items.BeginUpdate();
  {with RootTempObjects do
  begin
  // -- objects (with children too) --
  if Assigned(RootTempObjects) then
  begin
  ObjectNode.Data := RootTempObjects;
  with GLScene1 do
  begin
  for I := 0 to Objects.Count -1 do
  ObjectNode.Expand(True);
  end;
  TreeView1.Items.EndUpdate();

  // -- add two root nodes --
  ObjectNode := TreeView1.Items.AddFirst(nil, 'World');
  // -- get the object's tree --
  TreeView1.Items.BeginUpdate();
  with GLRootObjects do
  begin
  // -- objects (with children too) --
  if Assigned(GLRootObjects) then
  begin
  ObjectNode.Data := GLRootObjects;
  with GLRootObjects do
  for I := 0 to Count -1 do
  AddNodes(ObjectNode, Children[I]);
  ObjectNode.Expand(True);
  end;
  end;
  TreeView1.Items.EndUpdate();
  end; }
procedure TFmain.Timer1Timer(Sender: TObject);
begin
  Scene.ResetPerformanceMonitor;

  // if GLScene1.IsUpdating then UpdateTreeView;
end;

procedure TFmain.tlmtrungtm1Click(Sender: TObject);
begin
if Gizmo.SelectedObj= NIL then
  EXIT;
 GLMaincamera.TargetObject:= Gizmo.SelectedObj;
end;

procedure TFmain.Tree_objClick(Sender: TObject);
begin
if Tree_obj.Selected.Text=''  then  exit;
if GLScene1.FindSceneObject(Tree_obj.Selected.Text)=nil then
  exit;

LMDSimplePropInspector1.Objects.Clear;
  LMDSimplePropInspector1.Objects.SetOne
    (GLScene1.FindSceneObject(Tree_obj.Selected.text));
 edt_nameobj.Text:= Tree_obj.Selected.Text;
  Gizmo.SelectedObj := GLScene1.FindSceneObject(Tree_obj.Selected.text);
  pickobj := GLScene1.FindSceneObject(Tree_obj.Selected.text);
end;

procedure TFmain.X1Click(Sender: TObject);
begin
Gizmo.SelectedObj := Gizmo.SelectedObj;
if (lowercase(Gizmo.SelectedObj.Name)='glmaincamera' ) or ( LowerCase(Gizmo.SelectedObj.Name)='glmainlight')
then
begin
Showmessage(' Không thể xóa đối tượng này');
exit;
end;

  Gizmo.RemoveSelectedObjects;
  // GLScene1.Objects.Remove(GLScene1.FindSceneObject(pickobj.Name),true);
end;

procedure TFmain.Xa1Click(Sender: TObject);
begin
if (lowercase(Gizmo.SelectedObj.Name)='glmaincamera' ) or ( LowerCase(Gizmo.SelectedObj.Name)='glmainlight')
then
begin
Showmessage(' Không thể xóa đối tượng này');
exit;
end;
  Gizmo.RemoveSelectedObjects;
MakeTree;
end;

end.