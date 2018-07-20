var I:integer;
begin
 addshape('cube',stcube);
 render(10);
 for i:= 0 to 300 do
  begin
   shape[indexof('cube')].width:=i/100;
   render(5);
  end;
 end;
