unit umessage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  Tfmsg = class(TForm)
    mm_msg: TMemo;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmsg: Tfmsg;

implementation
uses umain;

{$R *.dfm}

procedure Tfmsg.SpeedButton1Click(Sender: TObject);
begin
umain.Cancel:=true;
end;

end.
