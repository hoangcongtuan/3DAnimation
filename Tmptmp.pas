var i:integer;
begin
 for i:=1 to 10 do
  begin
   addshape('cube'+inttostr(i),stcube);
   render(1);
   shape[count-1].position.x:=i;
   //shape[count].color:=i*30;
   render(1);
  end;
 end;