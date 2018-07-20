var i:Integer;
begin
addshape('cube',stcube);
render(200);
shape[count-1].movetorender(2,5,5,1000);
shape[count-1].movetorender(-2,5,5,1000);
for i:=0 to 360 do
 begin
  shape[count-1].rollangle:=i;
  render(10);
 end;
end;
