program Fazenda;

uses
  Vcl.Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {frmPrincipal},
  UnitAnimais in 'UnitAnimais.pas',
  UnitException in 'UnitException.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
