unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, UnitAnimais, System.Actions,
  Vcl.ActnList, Vcl.ActnMan, UnitException;

type
  TfrmPrincipal = class(TForm)
    cbxAnimais: TComboBox;
    btnEnviar: TBitBtn;
    imgAnimal: TImage;
    Label1: TLabel;
    ActionList1: TActionList;
    AcSair: TAction;
    ImageList: TImageList;
    procedure btnEnviarClick(Sender: TObject);
    procedure AcSairExecute(Sender: TObject);
    procedure cbxAnimaisChange(Sender: TObject);
  private
    { Private declarations }
    FAnimais : TAnimais;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  Vcl.Dialogs;

{$R *.dfm}

procedure TfrmPrincipal.AcSairExecute(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmPrincipal.btnEnviarClick(Sender: TObject);
begin
  try
    FAnimais.FromString(Trim(cbxAnimais.Text));
    ShowMessage(FAnimais.ToString);

    ImageList.GetBitmap(FAnimais.ToImage, imgAnimal.Picture.Bitmap);
  except
    on E: EAnimalNaoExiste do
      ShowMessage('Ah n�o! Esse animal n�o foi encontrado...');

    on E: EImagemNaoCarregada do
      ShowMessage('Desculpe, esse animal est� t�mido hoje...');

    on E: EMensagemNaoConcluida do
      ShowMessage('Ops, n�o vi qual animal voc� escolheu...');
  end;
  imgAnimal.Invalidate;
end;

procedure TfrmPrincipal.cbxAnimaisChange(Sender: TObject);
begin
  imgAnimal.Picture := nil;
end;

end.
