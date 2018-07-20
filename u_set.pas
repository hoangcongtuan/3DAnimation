unit u_set;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  Tfrm_set = class(TForm)
    GroupBox1: TGroupBox;
    cl_scene: TColorBox;
    BitBtn1: TBitBtn;
    ColorDialog1: TColorDialog;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_set: Tfrm_set;

implementation

uses UMain;

{$R *.dfm}

procedure Tfrm_set.BitBtn1Click(Sender: TObject);
begin
if ColorDialog1.Execute then
   cl_scene.Selected:= ColorDialog1.Color;
end;

procedure Tfrm_set.BitBtn2Click(Sender: TObject);
begin
Fmain.Scene.Buffer.BackgroundColor:= cl_scene.Selected;
close;
end;

procedure Tfrm_set.BitBtn3Click(Sender: TObject);
begin
Close;
end;

procedure Tfrm_set.FormShow(Sender: TObject);
begin
cl_scene.Selected:= fmain.Scene.Buffer.BackgroundColor;
end;

end.
