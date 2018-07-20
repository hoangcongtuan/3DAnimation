var i,j,k:integer;
begin
 for I:=0 to 7200 do
  begin
   shape[indexof('Dummy')].turnangle:=i/10;
   shape[indexof('trai_dat')].turnangle:=i/2;
   render(1);
  end;
 end;
