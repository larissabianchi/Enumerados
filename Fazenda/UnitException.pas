unit UnitException;

interface

uses
  System.SysUtils;

type
  EAnimalNaoExiste = class(Exception);
  EImagemNaoCarregada = class(Exception);
  EMensagemNaoConcluida = class(Exception);

implementation

end.
