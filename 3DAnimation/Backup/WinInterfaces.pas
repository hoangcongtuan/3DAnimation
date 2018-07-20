Unit WinInterface;
Interface
uses
  sysutils, Strings,CommCtrl,crt,windows;

const
  AppName = '3DAnimationProc';
  WM_RESUME=WM_USER+1;
  WM_PAUSE=WM_USER+2;
  WM_CONTINUE=WM_USER+3;
  WM_TEXTCOMMAND=WM_USER+4;
  TargetWindows='TFmain';
Var
        Pause:Boolean=false;
        Cont:boolean=true;
        Hedit,Hstatus:Hwnd;
        Close:boolean= False;
        ms:uint; var
  AMessage: Msg;
  hWindow: HWnd;
Type TShapeStyle=(STCone,STlight,stcylinder,stcube,stplane,stsphere,stcapsule,stanalus,sttext,stcamera) ;
Type TLightStyle=(CustomLsspot,CustomlsLsomni,CustomlsLsparallel);
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
  Adress:String[255];
  Disable:Boolean;
  Brightness:Single;
end;
Type TShape=record
  Name:string[255];
  Style: TShapeStyle;
  Expression:String[255];
  Position:Tposition;
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
  Procedure Translate(tx,ty,tz:real);
  Procedure Moveto(wx,wy,wz:real);

end;
  Function EditCreate(ParentWindow,Status:HWnd): HWnd;
  function WinCreate: HWnd;
  function WinRegister: Boolean;
  Function StatusCreate (parent:hwnd): HWnd;
Implementation
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



Function StatusCreate (parent:hwnd): HWnd;
Begin
  StatusCreate := CreateStatusWindow(WS_CHILD Or WS_VISIBLE,LPCSTR('Ready...'),parent,$7712);
End;

function WindowProc(Window: HWnd; AMessage: UINT; WParam : WPARAM;
                    LParam: LPARAM): LRESULT; stdcall; export;

  var
     dc : hdc;
     ps : paintstruct;
     r : rect;

begin
  WindowProc := 0;

  case AMessage of
    WM_CLose:
        Begin
         Close:=true;
        End;
    wm_Destroy:
      begin
         PostQuitMessage(0);
         Exit;
      end;
    WM_PAUSE:
        Begin
                Pause:=True;
        End;
    WM_RESUME:
        Begin
                Pause:=false;
        End;
    WM_CONTINUE:
        Begin
                Cont:=true;
        End;
  end;

 WindowProc := DefWindowProc(Window, AMessage, WParam, LParam);
end;

Function EditCreate(ParentWindow,Status:HWnd): HWnd;

Const
  CS_Start = WS_Child or WS_HScroll or WS_VScroll or ES_MultiLine or ES_Left;
  EdiTText: PChar = '';

Var
  HEdit: HWND;
  R: TRect;
  StatH: Word;

Begin
  GetClientRect(Status,@R);
  StatH := R.Bottom-R.Top;
  GetClientRect(ParentWindow,@R);
  HEdit := CreateWindow ('EDIT',EditText,CS_Start,0,0,
                       R.Right-R.Left,R.Bottom-R.top-StatH,ParentWindow,0,
                       System.MainInstance,Nil);
  If HEdit<>0 Then
    Begin
      ShowWindow(Hedit,cmdShow);
     UpdateWindow(HEdit);
    End;
  Result := HEdit;
End;


function WinRegister: Boolean;
var
  WindowClass: WndClass;
begin
  WindowClass.Style := cs_hRedraw or cs_vRedraw;
  WindowClass.lpfnWndProc := WndProc(@WindowProc);
  WindowClass.cbClsExtra := 0;
  WindowClass.cbWndExtra := 0;
  WindowClass.hInstance := system.MainInstance;
  WindowClass.hIcon := LoadIcon(0, idi_Application);
  WindowClass.hCursor := LoadCursor(0, idc_Arrow);
  WindowClass.hbrBackground := GetStockObject(WHITE_BRUSH);
  WindowClass.lpszMenuName := nil;
  WindowClass.lpszClassName := AppName;

  Result := RegisterClass(WindowClass) <> 0;
end;


function WinCreate: HWnd;
var
  hWindow: HWnd;
begin
  hWindow := CreateWindow(AppName, '3DAnimation',
              ws_OverlappedWindow, cw_UseDefault, cw_UseDefault,
              cw_UseDefault, cw_UseDefault, 0, 0, system.MainInstance, nil);

  if hWindow <> 0 then begin
   ShowWindow(hWindow, CmdShow);
   ShowWindow(hWindow, SW_SHOW);
    UpdateWindow(hWindow);
  end;

  Result := hWindow;
end;

Procedure Render(Timedelay:integer);
Var AMessage:Msg;
    Empty:String;
Begin
       Empty:='Runing';
       SendMessage(HEdit,EM_Replacesel,0,LongInt(Empty));
        Sleep(Timedelay);
        GetMessage(@AMessage,0,0,0);
  TranslateMessage(AMessage);
    //  DispatchMessage(AMessage);
        If pause Then
                Repeat
                        GetMessage(@AMessage,0,0,0);
                      TranslateMessage(AMessage);
                       // DispatchMessage(AMessage);
                Until Not Pause

End;
procedure SendCopyData(hTargetWnd: HWND; ACopyDataStruct:TCopyDataStruct);
begin
  if hTargetWnd<>0 then
    SendMessage(hTargetWnd, WM_COPYDATA, 123, Longint(@ACopyDataStruct))
  else
    MessageBox(0,'No Recipient found!',nil,mb_ok);
end;
Procedure Process;
Begin
messagebox(0,'Starting...',nil,mb_ok);
         writeln('adfe');
         render(10000);
        messagebox(0,'Finish',nil,mb_ok);
end;
Procedure Sendcommand(Command:Unicodestring);
Var
        HWinTarget:HWnd;
        MyCopyDataStruct: TCopyDataStruct;
Begin
        HWinTarget:=FindWindow(TargetWindows,TargetWindows);
        If Not IsWindow(HWinTarget) Then
                MessageBox(0,'Can not find Target Windows','Error',MB_ICONERROR Or MB_OK)
        Else
        Begin
                with MyCopyDataStruct do
                 begin
                        dwData:= 0; // may use a value do identify content of message
                        cbData:= (length(punicodechar(Command)))*sizeof(unicodestring('s'));
                        lpData:= punicodechar(Command);
                 end;
                // SendCopyData(hTargetWnd,MyCopyDataStruct);
                SendMessage(HWinTarget, WM_TEXTCOMMAND, 123, Longint(@MyCopyDataStruct))

        End;
End;
Begin
End.
