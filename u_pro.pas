unit u_pro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtDlgs, StdCtrls, Buttons, ExtCtrls,glscene;

type
  Tfrm_pro = class(TForm)
    GroupBox1: TGroupBox;
    Bevel1: TBevel;
    Image1: TImage;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_pro: Tfrm_pro;

implementation

uses UMain;

{$R *.dfm}

procedure Tfrm_pro.BitBtn1Click(Sender: TObject);
begin
(UMain.pickobj  as TGLCustomSceneObject).Material.Texture.Enabled:=false;
  (UMain.pickobj  as TGLCustomSceneObject).Material.Texture.Enabled:=true;
(UMain.pickobj  as TGLCustomSceneObject).Material.Texture.Disabled:=true;
(UMain.pickobj  as TGLCustomSceneObject).Material.Texture.Disabled:=false;
(umain.pickobj as TGLCustomSceneObject).Material.Texture.Image.LoadFromFile(OpenPictureDialog1.FileName);
close;

end;

procedure Tfrm_pro.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure Tfrm_pro.BitBtn3Click(Sender: TObject);
begin
OpenPictureDialog1.Filter:='Image Files|*.bmp|Png Image File|*.jpg';
if OpenPictureDialog1.Execute then
Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);

end;

end.
