unit LibRun;
Interface
uses
  sysutils,crt;
Const MaxShape=1024;
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
  Procedure TranslateRender(tx,ty,tz:real;Time:integer);
end;
Var Shape:Array[0..MaxShape] of TShape;
    input:File of Tshape;
    count,countbackup,k:integer;
    shapebackup:array[0..maxshape] of TShape;
    Anifile:text;
    ResFile:text;
Procedure Render(timedelay:integer);
Function getindex(spname:string):integer;
Procedure Tshape.translateRender(tx,ty,tz:real;Time:integer);
Procedure tshape.translate(tx,ty,tz:real);
Function getindex(spname:string):integer;
Procedure Tshape.Moveto(wx,wy,wz:real);
Implementation
 Procedure Render(timedelay:integer);forward;
Function getindex(spname:string):integer;forward;
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
  Render(1);
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
Procedure sendcommand(cmd:string);
Begin
 Writeln(Anifile,cmd);
End;
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


Procedure Render(Timedelay:integer);
var i:integer;
Begin
 sendcommand('sleep='+inttostr(Timedelay));
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
  for i:=0 to count do
     shapebackup[i]:=shape[i];
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