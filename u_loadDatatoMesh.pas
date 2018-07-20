unit u_loadDatatoMesh;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,GLFileMD2,glfile3ds, Buttons, ExtCtrls,GLScene,GLMesh,glvectorfileObjects;

type
  Tfrm_loadMesh = class(TForm)
    edt_Name: TLabeledEdit;
    edt_skin: TLabeledEdit;
    edt_md2: TLabeledEdit;
    EDT_ani: TLabeledEdit;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    OpenDialog1: TOpenDialog;
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_loadMesh: Tfrm_loadMesh;
  index: integer;

implementation

uses UMain;

{$R *.dfm}

procedure Tfrm_loadMesh.BitBtn2Click(Sender: TObject);
begin
OpenDialog1.Filter:='';
if OpenDialog1.Execute  then
begin
  (pickobj as TGLActor).Animations.LoadFromFile(OpenDialog1.FileName);
end;
end;

procedure Tfrm_loadMesh.BitBtn4Click(Sender: TObject);
begin
OpenDialog1.Filter:='';
if OpenDialog1.Execute  then
begin
  (pickobj as TGLActor).Material.Texture.Image.LoadFromFile(OpenDialog1.FileName);
  (pickobj as TGLActor).Material.Texture.Disabled:=false;
end;
end;

procedure Tfrm_loadMesh.BitBtn5Click(Sender: TObject);
begin
if pickobj is TGLActor then

openDialog1.Filter := 'MD2 files only|*.MD2'
else if pickobj is TGLFreeForm then
OpenDialog1.Filter:= '3DS files only|*.3DS';
if OpenDialog1.Execute  then
begin
   if pickobj is TGLActor then

  (pickobj as TGLActor).LoadFromFile(OpenDialog1.FileName)
  else if pickobj is TGLFreeForm  then
  (pickobj as TGLFreeForm).LoadFromFile(OpenDialog1.FileName);

end;

end;

procedure Tfrm_loadMesh.FormShow(Sender: TObject);
begin
   edt_Name.Text:= UMain.pickobj.Name;
   if pickobj is TGLFreeForm then
   begin
     edt_skin.Enabled:=false;
     EDT_ani.Enabled:=false;
     BitBtn2.Enabled:=false;
     BitBtn4.Enabled:=false;
   end
else begin
         edt_skin.Enabled:=true;
     EDT_ani.Enabled:=true;
     BitBtn2.Enabled:=true;
     BitBtn4.Enabled:=true;
   end

end;

end.
