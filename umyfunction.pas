{*****************************************************************************}
{                                                                             }
{    Suport sloving math 1.0                                                  }
{    Date released : april 17, 2014                                           }
{    gmail: congtuanspm97                                                     }
{     Tel: 0917757091                                                         }
{    Copyright (c)  Hoang Cong Tuan                                           }
{                                                                             }
{*****************************************************************************}
unit umyfunction;

interface

FUNCTION calc(s: STRING; bienx: real; var mers: byte): double;
function delbrack(u: string): string;
function ismultiex(s: string): boolean;
function cfunc(s: string): boolean;
procedure delspc(var s: string);
Function refine(VAR o: STRING): boolean;
function isconst(u: string): boolean;
function cnum(u: string): boolean;
function daoham(s: string): string;
function numcomp(num: real): string;
FUNCTION calcrpn(rpns: STRING; bienx: real; var mer: byte): double;
PROCEDURE rpn(VAR no: STRING);
//function calcs(exps: string; bienx: real; var er: byte): real;

type
  fun = (mu, sins, coss, tans, logs, lns, abss, sqrts, sums, trus, nhans,
    diffs, mods, divs, fracs, ints, rounds, sinhs, coshs, tanhs, arcsins,
    arccoss, arctans, exps);

type
  ptr = ^node;

  node = record
    info: string;
    typ: fun;
    l, r: ptr;
  end;

implementation

uses  SysUtils;

const
  dontsup: array [1 .. 13] of string = ('MOD', 'DIV', 'SINH', 'COSH', 'TANH',
    'ARCSIN', 'ARCCOS', 'ARCTAN', 'FRAC', 'EXP', 'ABS', 'ROUND', 'INT');
  dualop: array [1 .. 7] of string = ('+', '-', '*', '/', '^', 'MOD', 'DIV');
  func:array[1..25] of string =('+','-','*','/','^','MOD','DIV','LN','SIN','$','COS','TAN','SINH','COSH','TANH','ARCSIN','ARCCOS','ARCTAN','FRAC','SQRT','LOG','EXP','ABS','ROUND','INT');
type
  bg = record
    info: string;
    typ: fun;
    ut: integer;
  end;

var
  mer: byte;
  infix: string;
  ans: real;
  OK: CHAR;

VAR
  xau: STRING;
  stack1: array [1 .. 100] of string;
  gd: byte;
  stack2: ARRAY [1 .. 100] OF double;
  r: string;

  { function ismultiex(s:string):boolean;
    var e:integer;
    v:real;
    begin
    while pos('(',s)<>0  do
    delete(s,pos('(',s),1);
    while pos(')',s)<>0 do
    delete(s,pos(')',s),1)  ;
    while pos(' ',s)<>0 do delete(s,pos(' ',s),1);
    val(s,v,e);
    if s='X' then
    ismultiex:=false
    else if e<>0 then ismultiex:=true
    else if v<0 then ismultiex:= true else ismultiex:=false;
    end; }
FUNCTION Priority(Ch: string): integer;
BEGIN
  if ch='$' then
  priority:=5 else
  if Ch = '^' then
    Priority := 4
  else if (Ch = '*') or (Ch = '/') then
    Priority := 2
  else if (Ch = '+') or (Ch = '-') then
    Priority := 1
  else if Ch = '(' then
    Priority := 0
  else
    Priority := 3;
END;

FUNCTION twopar(op: string): boolean;
var
  dem: integer;
begin
  twopar := false;
  for dem := 1 to 7 do
    if op = func[dem] then
    BEGIN
      twopar := true;
      EXIT;
    END;

end;

function isvar(va: string): boolean;
var
  co: integer;
begin
  result := false;
  for co := 1 to main.countvar do
    if va = main.varval[co].name then
      result := true;
end;

function getpar(namevar: string): real;
var
  i: integer;
begin
  for i := 1 to main.countvar do
    if namevar = main.varval[i].name then
      result := main.varval[i].value
end;

function dauchu(s: string): string;
var
  tmpstr, kq: string;
  i: integer;
begin
  tmpstr := s;
  rpn(tmpstr);
  refine(tmpstr);
  kq := '';
  while tmpstr[length(tmpstr)] = ' ' do
    delete(tmpstr, length(tmpstr), 1);
  for i := length(tmpstr) downto 1 do
    if tmpstr[i] <> ' ' then
      insert(tmpstr[i], kq, 1)
    else
      break;
  dauchu := kq;
end;

function ismultiex(s: string): boolean;
var
  e, i: integer;
  v: extended;
  TMP: STRING;
begin
  refine(s);
  TMP := dauchu(s);
  ismultiex := true;
  for i := 8 to 25 do
    if TMP = func[i] then
      ismultiex := false;
  if (TMP = '*') or (TMP = '/') then
    ismultiex := false;
  if TryStrToFloat(s, v) then
    ismultiex := false;
  if TMP = 'X' THEn
    ismultiex := false;
  if isvar(TMP) then
    ismultiex := false;

end;

function cfunc(s: string): boolean;
var
  i: byte;
begin
  cfunc := false;
  for i := 1 to 25 do
    if s = func[i] then
    BEGIN
      cfunc := true;
      EXIT;
    END;
end;

procedure delspc(var s: string);
var
  i: byte;
begin
  repeat
    i := pos(' ', s);
    if i <> 0 then
      delete(s, i, 1);
  until i = 0;
end;

Function refine(VAR o: STRING): boolean;
VAR
  i, p: integer;
  m: string;
  re: boolean;
BEGIN
  re := true;
  refine := true;
  delspc(o);
  o:=UpperCase(o);
  if o = '' then
  begin
    refine := false;
    EXIT;
  end;
  for i := 1 to length(o) do
    if (o[i] = '-') and (not(o[i - 1] in ['0' .. '9', ')','X']) OR (I=1)) then
      o[i] := '$';

  o := uppercase(o);
  o := o + ' ';
  i := 0;
  FOR p := 1 TO length(o) DO
    CASE o[p] OF
      '(':
        i := i + 1;
      ')':
        i := i - 1;
    END;
  IF i < 0 THEN
    re := false
    // FOR p:=1 TO ABS(i) DO  insert('(',o,1)
  else IF i > 0 THEN
    FOR p := 1 TO ABS(i) DO
      insert(')', o, length(o));
  refine := re;
  if not re then
    EXIT;

  FOR p := length(o) downTO 1 DO
    IF (o[p] = '-') AND (o[p - 1] in ['(', '^']) THEN
      insert('0', o, p);
  i := 1;

  repeat
    if o[i] in ['(', ')'] then
    begin
      insert(' ', o, i);
      inc(i, 2);
      insert(' ', o, i);
    end
    else if cfunc(copy(o, i, 6)) then
    begin
      insert(' ', o, i);
      inc(i, 7);
      insert(' ', o, i);
    end
    else if cfunc(copy(o, i, 4)) then
    begin
      insert(' ', o, i);
      inc(i, 5);
      insert(' ', o, i);
    end
    else if cfunc(copy(o, i, 3)) then
    begin
      insert(' ', o, i);
      inc(i, 4);
      insert(' ', o, i);
    end

    else if cfunc(copy(o, i, 1)) then
    begin
      insert(' ', o, i);
      inc(i, 2);
      insert(' ', o, i);
    end;
    inc(i);
  until i = length(o);
  FOR p := length(o) - 1 DOWNTO 1 DO
    IF (o[p] = ' ') AND (o[p + 1] = ' ') THEN
      delete(o, p + 1, 1);
  while o[1] = ' ' do
    delete(o, 1, 1);
END;

function isconst(u: string): boolean;
begin
  if pos('X', u) = 0 then
    isconst := true
  ELSE
    isconst := false;

end;

function cnum(u: string): boolean;
var
  bp: extended;
begin
  cnum := TryStrToFloat(u, bp);

end;

function settype(s: string): fun;
begin
  if s = 'SIN' then
    result := sins
  else if s = 'COS' then
    result := coss
  else if s = 'TAN' then
    result := tans
  else if s = '+' then
    result := sums
  else if s = '-' then
    result := trus
  else if s = '*' then
    result := nhans
  else if s = '/' then
    result := diffs
  else if s = 'SINH' then
    result := sinhs
  else if s = 'COSH' then
    result := coshs
  else if s = 'TANH' then
    result := tanhs
  else if s = 'ARCSIN' then
    result := arcsins
  else if s = 'ARCCOS' then
    result := arccoss
  else if s = 'ARCTAN' then
    result := arctans
  ELSE if s = 'FRAC' then
    result := fracs
  else if s = 'INT' then
    result := ints
  ELSE if s = 'ABS' then
    result := abss
  else if s = 'MOD' then
    result := mods
  else if s = 'DIV' then
    result := divs
  else if s = 'SQRT' then
    result := sqrts
  else if s = 'LOG' then
    result := logs
  else if s = 'LN' then
    result := lns
  else if s = '^' then
    result := mu;

end;

function delbrack(u: string): string;
begin
  while pos('(', u) <> 0 do
    delete(u, pos('(', u), 1);
  while pos(')', u) <> 0 do
    delete(u, pos(')', u), 1);
  delbrack := u;

end;

FUNCTION isinteger(num: real): boolean;
begin
  if ABS(num - round(num)) <= 1E-15 then
    result := true
  else
    result := false;
end;

FUNCTION calcrpn(rpns: STRING; bienx: real; var mer: byte): double;
VAR
  p, last: byte;
  t: STRING { [20] } ;
  procedure naploi(maloi: byte);
  begin
    if mer = 0 then
      mer := maloi;
  end;
  PROCEDURE stack2init;
  BEGIN
    last := 0;
  END;
  PROCEDURE push2(v: double);
  BEGIN
    inc(last);
    stack2[last] := v;
  END;
  FUNCTION pop2: double;
  BEGIN
    if last = 0 then
    begin
      naploi(6);
      pop2 := 0;
    end
    else
    begin
      pop2 := stack2[last];
      dec(last);
    end;
  end;
  PROCEDURE process2(h: STRING);
  VAR
    x, y: double;
  BEGIN
    IF NOT(cfunc(h) or (h = '(') or (h = ')')) THEN
    BEGIN
      if h = 'X' then
      begin
        x := bienx;
        push2(x);
      end
      else if isvar(h) then
      begin
        x := getpar(h);
        push2(x);
      end
      else if h = 'PI' then
      begin
        x := pi;
        push2(x);
      end
      {else
      begin
        if h = '$' then
        begin
          //delete(h, 1, 1);
          if TryStrToFloat(h, x) then
            x:=
          else
            naploi(14);
        end }
        else if TryStrToFloat(h, x) then
          push2(x)
        else
          naploi(14);
    END
    ELSE
    BEGIN
      y := pop2;
      if twopar(h) then
        x := pop2;

      if h = '^' then
      begin
        if (x = 0) AND (y = 0) THEN
          naploi(2)
        ELSE IF x > 0 THEN
          x := exp(y * ln(x))
        ELSE IF (x < 0) AND (int(y) - y <> 0) THEN
          naploi(2)
        ELSE IF (x = 0) AND (y <> 0) THEN
          x := 0
        ELSE IF (x < 0) AND (round(y) - y = 0) AND odd(round(y)) THEN
          x := -exp((y * ln(ABS(x))))
        ELSE
        BEGIN
          x := exp(y * ln(ABS(x)))
        END
      end
      else if h = '+' then
        x := x + y
      else if h = '-' then
        x := x - y
      else if h = '*' then
        x := x * y
      else if h = '/' then
        IF y = 0 THEN
          naploi(1)
        ELSE
          x := x / y
        else if h = 'SIN' then
        begin
          // push2(x);
          if y = pi then
            x := 0
          else
            x := sin(y);
        end
        else if h='$' then
             begin
               x:=-y;
             end
        ELSE if h = 'INT' then
        begin
          // push2(x);
          x := int(y);

        end
        else if h = 'LN' then
        begin
          // push2(x);
          if y <= 0 then
            naploi(2)
          else
            x := ln(y);
        end
        else if h = 'ROUND' then
        begin
          // push2(x);
          x := round(y);
        end
        else if h = 'MOD' then
        begin
          if NOT(isinteger(x) and isinteger(y)) then
            naploi(17)
          ELSE
            x := round(x) MOD round(y);

        end
        ELSE if h = 'DIV' then
        begin
          if NOT(isinteger(x) and isinteger(y)) then
            naploi(17)
          ELSE
            x := round(x) DIV round(y);
        end
        else if h = 'LOG' then
        begin
          // push2(x);
          if y <= 0 then
            naploi(2)
          else
            x := ln(y) / ln(10);
        end
        else if h = 'COS' then
        begin
          // push2(x);
          x := COS(y)
        end
        else if h = 'TAN' then
        begin
          if COS(y) = 0 then
          begin
            // push2(x);
            x := 1;
            naploi(1);
          end
          else
          begin
            // push2(x);
            x := (sin(y)) / (COS(y)); ;
          end;
        end
        else if h = 'SQRT' then
        begin
          // push2(x);
          IF y < 0 then
            naploi(3)
          else
            x := sqrt(y);
        end
        else if h = 'ABS' then
        begin
          // push2(x);
          x := ABS(y);
          // showmessage('da tim thay tri tuyet doi');
        end
        else if h = 'ARCTAN' then
        BEGIN
          // push2(x);
          x := arctan(y);
        END
        else if h = 'EXP' then
        BEGIN
          // push2(x);
          x := (exp(y) + exp(y)) / 2;
        END
        else if h = 'SINH' then
        BEGIN
          // push2(x);
          x := (exp(x) - exp(-x)) / 2;
        END
        ELSE if h = 'FRAC' then
        BEGIN
          // push2(x);
          x := FRAC(y);
        END
        ELSE if h = 'TANH' then
        BEGIN
          // push2(x);
          x := (exp(y) - exp(-y)) / (exp(y) + exp(-y));
        END
        ELSE if h = 'ARCSIN' then
        BEGIN
          // push2(x);
          if ABS(y) > 1 then
            naploi(4)
          else
          begin
            if ABS(y) < 1 then
              x := arctan(y / sqrt(1 - sqr(y)))
            else if y = 1 then
              x := pi / 2
            else if y = -1 then
              x := -pi / 2
            else
              x := 0;
          END
        END
        else if h = 'ARCCOS' then
        BEGIN
          // push2(x);
          if ABS(y) > 1 then
            naploi(5)
          else
          begin
            if y > 0 then
              if y <= 1 then
                x := arctan(sqrt(1 - sqr(y)) / y)
              else
                x := 0
              else if y < 0 then
                if y >= -1 then
                  x := arctan(sqrt(1 - sqr(y)) / y) + pi
                else
                  x := 0
                else
                  y := pi / 2;
          END
        END
        else if h = 'COSH' then
        BEGIN
          // push2(x);
          x := (exp(y) + exp(-y)) / 2;
        END
        ELSE if h = 'SINH' then
        Begin
          // push2(x);
          x := (exp(y) - exp(-y)) / 2;
        End;
      push2(x);
    END;
  end;

BEGIN
  // refine(rpns);
  stack2init;
  t := '';
  FOR p := 1 TO length(rpns) DO
    IF rpns[p] <> ' ' THEN
      t := t + rpns[p]
    ELSE
    BEGIN
      process2(t);
      t := '';
    END;
  calcrpn := pop2;
END;

PROCEDURE rpn(VAR no: STRING);
VAR
  p, last: byte;
  PROCEDURE StackInit;
  BEGIN
    last := 0;
  END;
  PROCEDURE Push1(v: string);
  BEGIN
    inc(last);
    stack1[last] := v;
  END;
  FUNCTION Pop1: string;
  BEGIN
    Pop1 := stack1[last];
    dec(last);
  end;
  FUNCTION Get: string;
  BEGIN
    Get := stack1[last];
  END;
  FUNCTION Priority(Ch: string): integer;
  BEGIN
  if ch='$' then
  priority:=5 else
    if Ch = '^' then
      Priority := 4
    else if (Ch = '*') or (Ch = '/') then
      Priority := 2
    else if (Ch = '+') or (Ch = '-') then
      Priority := 1
    else if Ch = '(' then
      Priority := 0
    else
      Priority := 3;
  END;
  PROCEDURE Process(t: STRING);
  VAR
    c, x: string;
  BEGIN
    c := t;
    IF NOT((cfunc(c)) or (c = '(') or (c = ')')) THEN
      xau := xau + c + ' '
    ELSE

      if c = '(' then
      Push1(c)
    else if c = ')' then
      REPEAT
        x := Pop1;
        IF x <> '(' THEN
          xau := xau + x + ' ';
      UNTIL x = '(' else if cfunc(c) then
      BEGIN
        WHILE (last <> 0) AND (Priority(c) <= Priority(Get)) DO
          xau := xau + Pop1 + ' ';
        Push1(c);
      END;
  END;

BEGIN
  xau := '';
  r := '';
  // refine(no);
  StackInit;
  FOR p := 1 TO length(no) DO
    IF no[p] <> ' ' THEN
      r := r + no[p]
    ELSE
    BEGIN
      Process(r);
      r := '';
    END;
  WHILE last <> 0 DO
    xau := xau + Pop1 + ' ';
  no := xau;
END;

FUNCTION calc(s: STRING; bienx: real; var mers: byte): double;
BEGIN
  mers := 0;
  refine(s);
  rpn(s);
  calc := calcrpn(s, bienx, mers);
END;

FUNCTION support(s: string): boolean;
var
  i: integer;
begin
  support := true;
  for i := 1 to 13 do
    if pos(dontsup[i], s) <> 0 then
      support := false;

end;

function daoham(s: string): string;
var
  stack: array [1 .. 10] of string;
  j: byte;
  t: string;
  xau: STRING;
  stack1: array [1 .. 20] of string;
  r, a, b, dau, kq, xa, xb, pt1, pt2: string;
  function covert(a: string): string;
  begin
    delspc(a);
    if a[1] = '-' then
      covert := '( ' + a + ' )'
    else if not istt1ngoi(a) then
      covert := '( ' + a + ' )'
    else
      covert := a;

  end;
  function cfunc(s: string): boolean;
  var
    i: byte;
  begin
    cfunc := false;
    for i := 1 to 25 do
      if s = func[i] then
        cfunc := true;
  end;
  procedure delspc(var s: string);
  var
    i: byte;
  begin
    repeat
      i := pos(' ', s);
      if i <> 0 then
        delete(s, i, 1);
    until i = 0;
  end;
  PROCEDURE refine(VAR o: STRING);
  VAR
    i, p: byte;
  BEGIN
    o := uppercase(o);
    o := o + ' ';
    i := 0;
    FOR p := 1 TO length(o) DO
      CASE o[p] OF
        '(':
          i := i + 1;
        ')':
          i := i - 1;
      END;
    IF i < 0 THEN
      FOR p := 1 TO ABS(i) DO
        insert('(', o, 1);
    IF i > 0 THEN
      FOR p := 1 TO ABS(i) DO
        insert(')', o, length(o));

    FOR p := 1 TO length(o) DO
      IF (o[p] = '-') AND (o[p - 1] in ['(', '^']) THEN
        insert('0', o, p);
    i := 1;
    repeat
      if o[i] in ['(', ')'] then
      begin
        insert(' ', o, i);
        i := i + 2;
        insert(' ', o, i);
      end
      else if cfunc(copy(o, i, 6)) then
      begin
        insert(' ', o, i);
        i := i + 7;
        insert(' ', o, i);
      end
      else if cfunc(copy(o, i, 4)) then
      begin
        insert(' ', o, i);
        i := i + 5;
        insert(' ', o, i);
      end
      else if cfunc(copy(o, i, 3)) then
      begin
        insert(' ', o, i);
        i := i + 4;
        insert(' ', o, i);
      end

      else if cfunc(copy(o, i, 1)) then
      begin
        insert(' ', o, i);
        i := i + 2;
        insert(' ', o, i);
      end;

      inc(i);
    until i = length(o);

    FOR p := length(o) - 1 DOWNTO 1 DO
      IF (o[p] = ' ') AND (o[p + 1] = ' ') THEN
        delete(o, p + 1, 1);
    while o[1] = ' ' do
      delete(o, 1, 1);
  END;
  PROCEDURE rpn(VAR no: STRING);
  VAR
    p, last: byte;
    PROCEDURE StackInit;
    BEGIN
      last := 0;
    END;
    PROCEDURE Push1(v: string);
    BEGIN
      inc(last);
      stack1[last] := v;
    END;
    FUNCTION Pop1: string;
    BEGIN
      Pop1 := stack1[last];
      dec(last);
    END;
    FUNCTION Get: string;
    BEGIN
      Get := stack1[last];
    END;
    FUNCTION Priority(Ch: string): integer;
    BEGIN
      if ch='$' then
      priority:=5 else
      if Ch = '^' then
        Priority := 4
      else if (Ch = '*') or (Ch = '/') then
        Priority := 2
      else if (Ch = '+') or (Ch = '-') then
        Priority := 1
      else if Ch = '(' then
        Priority := 0
      else
        Priority := 3;
    END;
    PROCEDURE Process(t: STRING);
    VAR
      c, x: string[100];
    BEGIN
      c := t;
      IF NOT((cfunc(c)) or (c = '(') or (c = ')')) THEN
        xau := xau + c + ' '
      ELSE

        if c = '(' then
        Push1(c)
      else if c = ')' then
        REPEAT
          x := Pop1;
          IF x <> '(' THEN
            xau := xau + x + ' ';
        UNTIL x = '(' else if cfunc(c) then
        BEGIN
          WHILE (last <> 0) AND (Priority(c) <= Priority(Get)) DO
            xau := xau + Pop1 + ' ';
          Push1(c);
        END;
    END;

  BEGIN
    xau := '';
    r := '';
    StackInit;
    FOR p := 1 TO length(no) DO
      IF no[p] <> ' ' THEN
        r := r + no[p]
      else if r = '' then
        r := ''
      ELSE
      BEGIN
        Process(r);
        r := '';
      END;
    WHILE last <> 0 DO
      xau := xau + Pop1 + ' ';
    no := xau;
  end;
  procedure split(a: string);
  var
    last: integer;
    x, y: string[100];
    i: byte;
    procedure push3(v: string);
    begin
      inc(last);
      stack[last] := v;

    end;
    function pop3: string;
    begin
      pop3 := stack[last];
      dec(last);
    end;
    procedure StackInit;
    begin
      last := 0;
    end;
    procedure Process(t: string);
    begin
      if not(cfunc(t) or (t = '(') or (t = ')')) then
        push3(t)
      else
      begin
        y := pop3;
        x := pop3;
        if t = '+' then

          x := x + ' + ' + y

        else if t = '-' then
        begin
          x := x + ' - ' + covert(y);

        end
        else if t = '*' then
        begin
          x := covert(x) + ' * ' + covert(y);
        end

        else if t = '/' then
        begin
          if x = y then
            x := '1'
          else
            x := covert(x) + ' / ' + covert(y);
        end

        else if t = '^' then
        begin

         { if not(ismultiex(x) and ismultiex(y)) then
            x := x + ' ^ ' + y
          else if not(ismultiex(x)) and ismultiex(y) then
            x := x + ' ^ ( ' + y + ' )'
          else if ismultiex(x) and not ismultiex(y) then
            x := '( ' + x + ' ) ^ ' + y
          else
            x := '( ' + x + ' ) ^ ( ' + y + ' )' }
            x:=covert(x)+' ^ '+covert(y);

        end
        else if t = 'SIN' then
        begin
          push3(x);
          x := 'SIN ( ' + y + ')';
        end
        else if t = 'SQRT' then
        begin
          push3(x);
          x := 'SQRT(' + y + ')';

        end
        else if t = 'COS' then
        begin
          push3(x);
          x := 'COS ( ' + y + ')';
        end
        else if t = 'TAN' then
        begin
          push3(x);
          x := 'TAN ( ' + y + ')';
        end
        else if t = 'ABS' then
        begin
          push3(x);
          x := 'ABS ( ' + y + ')';
        end
        else if t = 'SQRT' then
        begin
          push3(x);
          x := 'SQRT ( ' + y + ')';
        end
         else if t = 'LOG' then
        begin
          push3(x);
          x := 'LOG ( ' + y + ')';
        end
         else if t = 'LN' then
        begin
          push3(x);
          x := 'LN ( ' + y + ')';
        end;
        push3(x);
      END;
    end;

  begin
    StackInit;
    for i := 1 to length(a) do
      if a[i] <> ' ' then
        t := t + a[i]
      else
      begin
        Process(t);
        t := '';

      end;
  end;

BEGIn
refine(s);
  calc(s, 1, er);
  if (er = 14) or (er = 6) then
  begin
    daoham := 'Biểu thức không đúng';
    EXIT;
  end;
  if not support(s) then
  begin
    daoham := 'Không hỗ trợ';
    EXIT;
  end;

  delspc(s);
  if pos('X', s) = 0 then
    daoham := '0'
  else if s = 'X' then
    daoham := '1'
  else
  begin
    refine(s);
    rpn(s);
    dau := '';
    j := length(s) - 1;
    repeat
      insert(s[j], dau, 1);
      dec(j);
    until s[j] = ' ';
    delete(s, length(s) - (length(dau) + 1), length(dau) + 1);
    split(s);
    if dau[1] in ['+', '-', '*', '/', '^'] then
    begin
      b := stack[2];
      a := stack[1];
      xa := daoham(a);
      xb := daoham(b);
    end
    else
    begin
      a := stack[1];
      xa := daoham(a);
    end;
    if dau = '+' then
    begin
      if cnum(xa) and cnum(xb) then
      begin
        kq := floattostr(strtofloat(delbrack(xa)) + strtofloat(delbrack(xb)));
        if strtofloat(kq) < 0 then
          kq := '( ' + kq + ' )';
      end
      else if xa = '0' then
        kq := xb
      ELSE if xb = '0' then
      begin
        kq := xa;
        // if strtofloat(kq)<0 then
        // kq:='( '+kq+' )'
      end
      else if xa = xb then
        kq := '2 * ' + covert(xa)
      else
        kq := xa + ' + ' + xb
    end
    else if dau = '-' then
    begin
      if cnum(xa) and cnum(xb) then
      begin
        kq := floattostr(strtofloat(delbrack(xa)) - strtofloat(delbrack(xb)));
        if strtofloat(kq) < 0 then
          kq := '( ' + kq + ' )'
      end
      else if xa = '0' then
        kq := '( - ' + covert(xb) + ' )'
      else if xb = '0' then
        kq := xa
      else if xa = xb then
        kq := '0'
      else
        kq := xa + ' - ' + covert(xb);

    end
    // nếu là dấu nhân
    else if dau = '*' then
    begin
      if (xa = '0') then
        pt1 := '0'
      else if xa = '1' then
        pt1 := b
      else if xa = '-1' then
        pt1 := '( - ' + covert(b) + ' )'
      else
        pt1 := covert(xa) + ' * ' + covert(b);
      if (xb = '0') then
        pt2 := '0'
      else if xb = '1' then
        pt2 := a
      else if xb = '-1' then
        pt2 := '( - ' + covert(a)
      else
        pt2 := covert(xb) + ' * ' + covert(a);
      if pt1 = pt2 then
        kq := '2 * ' + covert(pt1)
      else if pt1 = '0' then
        kq := pt2
      else if pt2 = '0' then
        kq := pt1
      else
        kq := covert(pt1) + ' + ' + covert(pt2);
    end
    // nếu là dấu chia
    else if dau = '/' then
    begin
      if a = b then
        kq := '0'
      else
      begin
        if (xa = '0') then
          pt1 := '0'
        else if xa = '1' then
          pt1 := b
        else if xa = '-1' then
          pt1 := '( - ' + covert(b) + ' )'
        else
          pt1 := covert(xa) + ' * ' + covert(b);
        if (xb = '0') then
          pt2 := '0'
        else if xb = '1' then
          pt2 := a
        else if xb = '-1' then
          pt2 := '( - ' + covert(a)
        else
          pt2 := covert(xb) + ' * ' + covert(a);
        if pt1 = pt2 then
          kq := '0'
        else if pt1 = '0' then
          kq := '( - ' + covert(pt2) + ' )' + ' / ( ' + covert(b) + ' ^ 2 )'
        else if pt2 = '0' then
          kq := covert(pt1) + ' / (' + covert(b) + ' ^ 2 )'
        else
          kq := '( ' + covert(pt1) + ' - ' + covert(pt2) + ' ) / (' + covert(b)
            + ' ^ 2 )';
      end;
    end
    // Nếu là mũelse if dau='LN then
    else if dau = '^' then
    begin
      if (pos('X', a) <> 0) AND (pos('X', b) <> 0) then
        kq := '0'
      ELSE if cnum(a) and not cnum(b) then
      begin
        if (strtofloat(a) <= 0) then
          kq := '0'
        else

          kq := a + ' ^ ' + covert(b) + ' * LN ( ' + a + ')'
      end

      else
      begin
        if xa = '1' then
        begin
          if b = '1' then
            kq := b
          else if b = '2' then
            kq := b + ' * ' + covert(a)
          else
            kq := b + ' * ' + covert(a) + ' ^ ' + floattostr(strtofloat(b) - 1)
        end

        else
          // writeln(' xa la ',xa);
          kq := covert(xa) + ' * ' + b + ' * ' + covert(a) + ' ^ ' + floattostr
            (strtofloat(b) - 1)

      end;
    end

    else if dau = 'SIN' then
    begin
      if xa = '0' then
        kq := '0'
      else if xa = '1' then
        kq := 'COS ( ' + a + ' )'
      else if (xa = '-1') then
        kq := '( - COS ( ' + a + ' )'
      ELSE

        kq := covert(xa) + ' * COS ( ' + a + ' )'
    end
    else if dau = 'COS' then
    BEGIN
      if xa = '0' then
        kq := '0'
      else if xa = '1' then
        kq := '( - SIN ( ' + a + ' ) )'
      else if (xa = '-1') then
        kq := '( SIN ( ' + a + ' ) )'
      ELSE

        kq := covert(xa) + ' * ( - SIN ( ' + a + ' ) )'
    END
    else if dau = 'TAN' then
    begin
      // if xa='1' then  KQ:=covert(xa)+' / ( COS ( '+A+' ) ) ^ 2'

      kq := covert(xa) + ' / ( COS ( ' + a + ' ) ) ^ 2'
    end
    ELSE if dau = 'SQRT' then
    begin
      if ismultiex(xa) then
        kq := covert(xa) + '/ ( ' +'2*SQRT(' + a + ') )'
      ELSE
        kq := xa + '/ ( ' +'2*sqrt' + covert(a)+' )';

    end
    else if dau = 'LOG' then
      kq := covert(xa) + ' / ( ' + a + ' * LN ( 10 ) )'
    ELSE if dau = 'LN' then
      kq := covert(xa) + '/(' + a + ')';
    daoham := kq;
  end;
END;

function numcomp(num: real): string;
var
  s, kq: string;
  vt, i: integer;
  numex: integer;
begin
  if (num > 9E-15) and (num < 1E-5) then
  begin
    s := floattostr(num);
    vt := pos('E', s);
    numex := strtoint(copy(s, vt + 1, length(s) - vt));
    kq := '0.';
    delete(s, pos('.', s), 1);
    if strtoint(copy(s, 1, 1)) = 0 then
      numex := ABS(numex) - 2;

    for i := 1 to ABS(numex) - 1 do
    begin
      insert('0', kq, 3);
    end;
    kq := kq + s;
    kq := copy(kq, 1, 15);
    if pos('E', kq) <> 0 then
      delete(kq, pos('E', kq), length(kq) - pos('E', kq) + 1);
    numcomp := kq;

  end
  else
    result := floattostr(num);
end;

procedure naploi(maloi: byte);
begin
  if er = 0 then
    er := maloi;
end;

// ----------------------------------------------------
{function maketree(expression: string): ptr;
const
  maxbg = 256;
var
  a: array [1 .. maxbg] of bg;
  sbg: integer;
  Tree: ptr;
  // ready:boolean;
  procedure Bt_to_bg;
  Var
    i, j, k, uutien: integer;
    t: string;
  begin
    s := expression;
    uutien := 0;
    sbg := 0;
    refine(s);
    t := '';
    while s[1] = ' ' do
      delete(s, 1, 1);
    for i := 1 to length(s) do
    begin
      if s[i] = ' ' then
      begin
        inc(sbg);
        a[sbg].info := t;
        if cnum(t) then
          a[sbg].ut := 10000
        else
          a[sbg].ut := (Priority(t) + uutien);
        t := '';

      end
      else
        t := t + s[i];
      // a[sbg].info:=s[i];
      case s[i - 1] of
        '(':
          begin
            inc(uutien, 2);
            dec(sbg);
            t := '';
          end;
        ')':
          begin
            t := '';
            dec(uutien, 2);
            dec(sbg);
          end;
      end;
    end;
  end;
// ----------------------------------------------------------------
  function Right_min_bg(d, c: integer): integer;

  var
    i, j, k: integer;
  begin
    k := 10000;
    j := c;
    for i := c downto d do
    begin
      if a[i].ut < k THEN
      begin
        k := a[i].ut;
        j := i;
      end;
    end;
    Right_min_bg := j;
  end;
// ----------------------------------------------------------------
  function Bg_to_Tree(d, c: integer): ptr;
  var
    i, j, k: integer;
    p: ptr;
  begin
    new(p);
    i := Right_min_bg(d, c);
    with p^ do
    begin
      { if a[i].info[1] in ['+','-','*','/'] then
        begin
        info:=a[i].info;
        l:=Bg_to_Tree(d,i-1);
        r:=Bg_to_Tree(i+1,c);
        end
        else }
      {if cfunc(a[i].info) then
      begin
        if twopar(a[i].info) then
          l := Bg_to_Tree(d, i - 1);
        info := a[i].info;
        r := Bg_to_Tree(i + 1, c);
        typ := settype(a[i].info);
      end
      else
      begin
        info := a[d].info;
        l := nil;
        r := nil;
      end;
    end;
    Bg_to_Tree := p;
  end;
// ----------------------------------------------------------------

// ----------------------------------------------------------------

begin
  Bt_to_bg;
  maketree := Bg_to_Tree(1, sbg);
end;

function calctree(t: ptr; bienx: real; var er: byte): real;
var
  h: string;
  x, y: real;
  { Duyệt cây theo thứ tự trước để tính giá trị của biểu thức theo kiểu tiền tố }
  {val: real;
begin
  with t^ do
  begin
    h := info;
    if cnum(h) then
      x := strtofloat(h)
    else if h = 'X' then
    begin
      x := bienx;
    end
    else if h = 'PI' then
      x := pi
    else
    begin
      if h[1] = '$' then
      begin
        delete(h, 1, 1);
        x := strtofloat(h);
        x := 0 - x

      end
      ELSE
      BEGIN
        y := calctree(r, bienx, er);
        if twopar(h) then
          x := calctree(l, bienx, er);
        if h = '^' then
        begin
          if (x = 0) AND (y = 0) THEN
            naploi(2)
          ELSE IF y > 0 THEN
            x := exp(y * ln(x))
          ELSE IF (x < 0) AND (int(y) - y <> 0) THEN
            naploi(2)
          ELSE IF (x = 0) AND (y <> 0) THEN
            x := 0
          ELSE IF (x < 0) AND (round(y) - y = 0) AND odd(round(y)) THEN
            x := -exp((y * ln(ABS(x))))
          ELSE
          BEGIN
            x := exp(y * ln(ABS(x)))
          END
        end
        else if h = '+' then
          x := x + y
        else if h = '-' then
          x := x - y
        else if h = '*' then
          x := x * y
        else if h = '/' then
        begin
          IF y = 0 THEN
            naploi(1)
          ELSE
            x := x / y
        end
        else if h = 'SIN' then
        begin
          // push2(x);
          if y = pi then
            x := 0
          else
            x := sin(y);
        end
        ELSE if h = 'INT' then
        begin
          // push2(x);
          x := int(y);

        end
        else if h = 'LN' then
        begin
          // push2(x);
          if y <= 0 then
            naploi(2)
          else
            x := ln(y);
        end
        else if h = 'ROUND' then
        begin
          // push2(x);
          x := round(y);
        end
        else if h = 'MOD' then
        begin
          if NOT(isinteger(x) and isinteger(y)) then
            naploi(17)
          ELSE
            x := round(x) MOD round(y);

        end
        ELSE if h = 'DIV' then
        begin
          if NOT(isinteger(x) and isinteger(y)) then
            naploi(17)
          ELSE
            x := round(x) DIV round(y);
        end
        else if h = 'LOG' then
        begin
          // push2(x);
          if y <= 0 then
            naploi(2)
          else
            x := ln(y) / ln(10);
        end
        else if h = 'COS' then
        begin
          // push2(x);
          x := COS(y)
        end
        else if h = 'TAN' then
        begin
          if COS(y) = 0 then
          begin
            // push2(x);
            x := 1;
            naploi(1);
          end
          else
          begin
            // push2(x);
            x := (sin(y)) / (COS(y)); ;
          end;
        end
        else if h = 'SQRT' then
        begin
          // push2(x);
          IF y < 0 then
            naploi(3)
          else
            x := sqrt(y);
        end
        else if h = 'ABS' then
        begin
          // push2(x);
          x := ABS(y);
          // showmessage('da tim thay tri tuyet doi');
        end
        else if h = 'ARCTAN' then
        BEGIN
          // push2(x);
          x := arctan(y);
        END
        else if h = 'EXP' then
        BEGIN
          // push2(x);
          x := (exp(y) + exp(y)) / 2;
        END
        else if h = 'SINH' then
        BEGIN
          // push2(x);
          x := (exp(x) - exp(-x)) / 2;
        END
        ELSE if h = 'FRAC' then
        BEGIN
          // push2(x);
          x := FRAC(y);
        END
        ELSE if h = 'TANH' then
        BEGIN
          // push2(x);
          x := (exp(y) - exp(-y)) / (exp(y) + exp(-y));
        END
        ELSE if h = 'ARCSIN' then
        BEGIN
          // push2(x);
          if ABS(y) > 1 then
            naploi(4)
          else
          begin
            if ABS(y) < 1 then
              x := arctan(y / sqrt(1 - sqr(y)))
            else if y = 1 then
              x := pi / 2
            else if y = -1 then
              x := -pi / 2
            else
              x := 0;
          END
        END
        else if h = 'ARCCOS' then
        BEGIN
          // push2(x);
          if ABS(y) > 1 then
            naploi(5)
          else
          begin
            if y > 0 then
              if y <= 1 then
                x := arctan(sqrt(1 - sqr(y)) / y)
              else
                x := 0
              else if y < 0 then
                if y >= -1 then
                  x := arctan(sqrt(1 - sqr(y)) / y) + pi
                else
                  x := 0
                else
                  y := pi / 2;
          END
        END
        else if h = 'COSH' then
        BEGIN
          // push2(x);
          x := (exp(y) + exp(-y)) / 2;
        END
        ELSE if h = 'SINH' then
        Begin
          // push2(x);
          x := (exp(y) - exp(-y)) / 2;
        End;

      END;
    end;
    val := x;

    calctree := val;
  end;
end;

function calcs(exps: string; bienx: real; var er: byte): real;
var
  temp: ptr;
begin
  temp := maketree(exps);
  result := calctree(temp, bienx, er);
end;}

end.
