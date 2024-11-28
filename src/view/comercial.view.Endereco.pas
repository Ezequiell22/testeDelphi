unit comercial.view.Endereco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TpageEndereco = class(TForm)
    lbl_codigo: TLabel;
    lbl_empresa: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pageEndereco: TpageEndereco;

implementation

{$R *.dfm}

end.
