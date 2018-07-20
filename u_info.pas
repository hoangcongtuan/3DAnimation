unit u_info;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, acPNG;

type
  Tfrm_info = class(TForm)
    Image1: TImage;
    Memo1: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_info: Tfrm_info;

implementation

{$R *.dfm}

end.
