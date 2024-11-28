unit comercial.view.ListEnderecos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TpageListEnderecos = class(TForm)
    DBGrid1: TDBGrid;
    lbl_codigo: TLabel;
    lbl_empresa: TLabel;
    Button_seleciona: TButton;
    Button_adicionar: TButton;
    Button_Editar: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pageListEnderecos: TpageListEnderecos;

implementation

{$R *.dfm}

end.
