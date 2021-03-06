{$MODE DELPHI}
program Animation;
uses
  sysutils,crt;
Const MaxShape=1024;
Type
TShapeStyle = (STCone, stcylinder, stcube, stplane, stsphere,
    stcapsule,stdisk,stannulus,starowArc,starowline,
    stpolygon,stmultipolygon,strevolutonsolid,sttorus,stflatext,stxyzgrid,
    stspacetext,stteapot,sttree,stwaterplane,stactor,stfreeform,
    stdodecahedron,sticosaheron,stoctaheron,stfrustrum,stlight,stcamera);

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
Type Tnode=record
    x,y,z:real;
end;
Type TNodes=record
   nodes: array [1..100] of Tnode;
   Count: integer;
procedure Addnode(x,y,z:real);
end;

Type TShape=record
  Name:string[255];
  Style: TShapeStyle;
  Expression:String[255];
  Position:Tposition;
  Nodes: Tnodes;
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
  Procedure MoveToRender(wx,wy,wz:real;time:integer);
end;
Var Shape:Array[0..MaxShape] of TShape;
    input:File of Tshape;
    count,countbackup,k:integer;
    shapebackup:array[0..maxshape] of TShape;
    Anifile:text;



Procedure Render(timedelay:integer);forward;
Function getindex(spname:string):integer;forward;
Procedure AddShape(NameSP:String;Style:TShapeStyle);
Begin
inc(count);
Shape[count].name:=NameSP;
Shape[count].style:= style;
shape[count].nodes.count:=0;
with shape[count] do
 begin
  position.x:=0;
  position.y:=0;
  position.z:=0;
  scale.x:=0;
  scale.y:=0;
  scale.z:=0;
  rollangle:=0;
  pitchangle:=0;
  turnangle:=0;
 end;
end;
procedure TNodes.Addnode(x: Real; y: Real; z: Real);
begin
  self.Count:=self.Count+1;
  nodes[Count-1].x:=x;
  nodes[Count-1].y:=y;
  nodes[Count-1].z:=z;
end;

Procedure Tshape.moveToRender(wx,wy,wz:real;time:integer);
begin
 self.translateRender(wx-self.position.x,wy-self.position.y,wz-self.position.z,time);
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
Procedure Process;
//code here

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
var i,j:integer;
Begin
 sendcommand('sleep='+inttostr(Timedelay));
 If count>countBackup then
  begin
   For i:= countBackup+1 To count do
    begin
     Sendcommand('add='+Shape[i].name+'_'+inttostr(ord(Shape[i].style)));
    end;
  end;
 for i:=0 to count do
  with shape[i] do
   begin
    if shape[i].nodes.count<> shapebackup[i].nodes.count then
     begin
      sendcommand(shape[i].name+'.nodes.count='+inttostr(shape[i].nodes.count));
      for j:=shapebackup[i].nodes.count to shape[i].nodes.count-1 do
       begin
           sendcommand(shape[i].name+'.nodes.nodes['+inttostr(j)+'].x=' +floattostr(shape[i].nodes.nodes[j].x));
           sendcommand(shape[i].name+'.nodes.nodes['+inttostr(j)+'].y=' +floattostr(shape[i].nodes.nodes[j].y));
           sendcommand(shape[i].name+'.nodes.nodes['+inttostr(j)+'].z=' +floattostr(shape[i].nodes.nodes[j].z));
       end;
     end;
     for j:=0 to shape[i].nodes.count-1 do
      begin
       if shape[i].nodes.nodes[j].x<> shapeBackup[i].nodes.nodes[j].x then
       sendcommand(shape[i].name+'.nodes.nodes['+inttostr(j)+'].x='+floattostr(shape[i].nodes.nodes[j].x))
       else   if shape[i].nodes.nodes[j].y<> shapeBackup[i].nodes.nodes[j].y then
       sendcommand(shape[i].name+'.nodes.nodes['+inttostr(j)+'].y='+floattostr(shape[i].nodes.nodes[j].y))
       else   if shape[i].nodes.nodes[j].z<> shapeBackup[i].nodes.nodes[j].z then
       sendcommand(shape[i].name+'.nodes.nodes['+inttostr(j)+'].z='+floattostr(shape[i].nodes.nodes[j].z));
      end;
     if shape[i].position.x<>shapebackup[i].position.x then
      sendcommand(lowercase(shape[i].name)+'.position.x'+'='+floattostr(shape[i].position.x));
     if position.y<>shapebackup[i].position.y then
      sendcommand(lowercase(shape[i].name)+'.position.y'+'='+floattostr(shape[i].position.y));
     if position.z<>shapebackup[i].position.z then
      sendcommand(lowercase(shape[i].name)+'.position.z'+'='+floattostr(shape[i].position.z)) ;
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
     countbackup:=count;
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
begin
  clrscr;
  writeln('Loading...');
  loaddata;
 writeln('backupting...');
  backupdata;
 assign(Anifile,ExtractFilePath(Paramstr(0))+'\ani.txt' ;
 rewrite(anifile);
         process;
 Close(Anifile);
    writeln('finish');
End.
