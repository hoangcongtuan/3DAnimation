{$MODE DELPHI}
program Animation;
uses
  sysutils, Strings,CommCtrl,crt,windows,wininterface;
Const MaxShape=1024;
Var Shape:Array[0..MaxShape] of TShape;
    CountShape:Integer;
    input:File of Tshape;
    count,countbackup:integer;
    shapebackup:array[0..maxshape] of TShape;
Procedure Render(timedelay:integer);forward;
Function getindex(spname:string):integer;forward;
Procedure Process;
//code here
var j,f:Integer;
begin
for f:=2 to count do
for j:=0 to 360 do
with shape[f] do
begin
rollangle:=j;
render(1);
end;
end;

Function getindex(spname:string):integer;
var spindex:integer;
begin
 for spindex:=0 to count do
  begin
   if lowercase(shape[spindex].name)=lowercase(spname) then
    begin
     result:=spindex;
     exit;
    end;
  end;
end;

Procedure backupdata;
var i:integer;
begin
 for i:=0 to count do
  shapebackup[i]:=shape[i];
  countbackup:=count;
end;
Procedure Sendcommand(Command:Unicodestring);
Var
        HWinTarget:HWnd;
        MyCopyDataStruct: TCopyDataStruct;
Begin
        HWinTarget:=FindWindow('TFmain',NIL);
        If Not IsWindow(HWinTarget) Then begin
                MessageBox(0,'Can not find Target Windows','Error',MB_ICONERROR Or MB_OK);
                 Halt(AMessage.wParam);
                end
        Else
        Begin
                with MyCopyDataStruct do
                 begin
                        dwData:= 0;
                        cbData:= (length(punicodechar(Command)))*sizeof(unicodestring('s'));
                        lpData:= punicodechar(Command);
                 end;
                SendMessage(HWinTarget, WM_COPYDATA, 123, Longint(@MyCopyDataStruct))
        End;
End;
procedure SendCopyData(hTargetWnd: HWND; ACopyDataStruct:TCopyDataStruct);
begin
  if hTargetWnd<>0 then
    SendMessage(hTargetWnd, WM_COPYDATA, 123, Longint(@ACopyDataStruct))
  else begin
    MessageBox(0,'No Recipient found!',nil,mb_ok);
    halt(0);
    end;
end;
Procedure Render(Timedelay:integer);
var i:integer;
Var AMessage:Msg;
    Empty:String;
Begin
        Sleep(Timedelay);
        GetMessage(@AMessage,0,0,0);
        TranslateMessage(AMessage);
        //DispatchMessage(AMessage);
        If pause Then
        Repeat
         GetMessage(@AMessage,0,0,0);
         TranslateMessage(AMessage);
         //DispatchMessage(AMessage);
        Until Not Pause ;
        for i:=0 to count do
         with shape[i] do
          begin
           if shape[i].position.x<>shapebackup[i].position.x
            then sendcommand(lowercase(shape[i].name)+'.position.x'+'='+floattostr(shape[i].position.x));
           if position.y<>shapebackup[i].position.y
            then  sendcommand(lowercase(shape[i].name)+'.position.y'+'='+floattostr(shape[i].position.y));
             if position.z<>shapebackup[i].position.z
            then  sendcommand(lowercase(shape[i].name)+'.position.z'+'='+floattostr(shape[i].position.z)) ;
            if direction.x<>shapebackup[i].direction.x
            then sendcommand(lowercase(shape[i].name)+'.direction.x'+'='+floattostr(shape[i].direction.x))  ;
             if direction.y<>shapebackup[i].direction.y
            then sendcommand(lowercase(shape[i].name)+'.direction.y'+'='+floattostr(shape[i].direction.y));
            if direction.z<>shapebackup[i].direction.z
            then sendcommand(lowercase(shape[i].name)+'.direction.z'+'='+floattostr(shape[i].direction.z));
            //scale
            if scale.x<>shapebackup[i].scale.x then
            sendcommand(lowercase(shape[i].name)+'.scale.x'+'='+floattostr(shape[i].scale.x));
            if scale.x<>shapebackup[i].scale.y then
            sendcommand(lowercase(shape[i].name)+'.scale.y'+'='+floattostr(shape[i].scale.y));
              if scale.y<>shapebackup[i].scale.x then
            sendcommand(lowercase(shape[i].name)+'.scale.z'+'='+floattostr(shape[i].scale.z));
            //Rotate angle
            If turnangle<>shapebackup[i].turnangle then
            sendcommand(lowercase(shape[i].name)+'.turnangle'+'=' +floattostr(shape[i].turnangle));
            If rollangle<>shapebackup[i].rollangle then
            sendcommand(lowercase(shape[i].name)+'.rollangle'+'=' +floattostr(shape[i].rollangle));
            If turnangle<>shapebackup[i].turnangle then
            sendcommand(lowercase(shape[i].name)+'.turnangle'+'=' +floattostr(shape[i].turnangle));
            If pitchangle<>shapebackup[i].pitchangle then
            sendcommand(lowercase(shape[i].name)+'.pitchangle'+'=' +floattostr(shape[i].pitchangle));
            if visible<>shapebackup[i].visible then
            sendcommand(lowercase(shape[i].name)+'.pitchangle'+'=' + lowercase(booltostr(visible)));
            if texture.disable<>shapebackup[i].texture.disable then
            sendcommand(lowercase(shape[i].name)+'.texture.disable'+'='+lowercase(booltostr(texture.disable)));
            if texture.adress<>shapebackup[i].texture.Adress then
            sendcommand(lowercase(shape[i].name)+'.texture.adres'+'=' +lowercase(texture.adress));
            if texture.brightness<>shapebackup[i].texture.brightness then
            sendcommand(lowercase(shape[i].name)+'.texture.brightness'+'='+floattostr(texture.brightness));
            if radius<>shapebackup[i].radius then
            sendcommand(lowercase(shape[i].name)+'.radius'+'='+floattostr(radius));
            if showaxes <>shapebackup[i].showaxes then
            sendcommand(lowercase(shape[i].name)+'.showaxes'+'=' +lowercase(booltostr(showaxes)));
            if shining<>shapebackup[i].shining then
            sendcommand(lowercase(shape[i].name)+'.shining'+'=' +lowercase(booltostr(shining)));
            if topradius<>shapebackup[i].topradius then
            sendcommand(lowercase(shape[i].name)+'.topradius'+'='+floattostr(topradius));
            if bottomradius<>shapebackup[i].bottomradius then
            sendcommand(lowercase(shape[i].name)+'.bottomradius'+'='+floattostr(bottomradius));
            if slice<>shapebackup[i].slice then
            sendcommand(lowercase(shape[i].name)+'.slice'+'='+floattostr(slice));
     end;
end;
procedure loaddata;
Begin
         count:=-1;
         Assign(input,'c:\input.txt');
         reset(input);
         While not eof(input) do
                Begin
                        inc(count);
                        Read(input,shape[count]);
                End;
         Closefile(input);
End;
// Than chuong trinh
var
  AMessage: Msg;
  hWindow: HWnd;
begin
  clrscr;
  writeln('Loading...');
  loaddata;
 writeln('backupting...');
  backupdata;
  If Not WinRegister Then
    Begin
      MessageBox (0,'Register failed',Nil, mb_Ok);
    End
  Else
    Begin
      hWindow := WinCreate;
      If longint(hWindow)=0 Then
        Begin
          MessageBox (0,'WinCreate failed',Nil,MB_OK);
        End
      Else
        Begin
        //  HStatus := statuscreate(hwindow);
        //  HEdit := EditCreate(HWindow,HStatus);
          process;
          Halt(AMessage.wParam);
        End;
    End;
    writeln('finish');
    readln;
End.
