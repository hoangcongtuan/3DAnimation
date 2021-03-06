program Animation;

uses
  Forms,
  UMain in 'UMain.pas' {Fmain},
  umessage in 'umessage.pas' {fmsg},
  u_loadDatatoMesh in 'u_loadDatatoMesh.pas' {frm_loadMesh},
  u_pro in 'u_pro.pas' {frm_pro},
  u_info in 'u_info.pas' {frm_info},
  u_set in 'u_set.pas' {frm_set};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFmain, Fmain);
  Application.CreateForm(Tfmsg, fmsg);
  Application.CreateForm(Tfrm_loadMesh, frm_loadMesh);
  Application.CreateForm(Tfrm_pro, frm_pro);
  Application.CreateForm(Tfrm_info, frm_info);
  Application.CreateForm(Tfrm_set, frm_set);
  Application.Run;
end.
