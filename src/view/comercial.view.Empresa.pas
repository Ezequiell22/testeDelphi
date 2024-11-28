unit comercial.view.Empresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TpageEmpresa = class(TForm)
    GroupBox1: TGroupBox;
    Edit_codigo: TEdit;
    Label1: TLabel;
    Edit_nome: TEdit;
    Label2: TLabel;
    Edit_cnpj: TEdit;
    Label3: TLabel;
    Button_alterar: TButton;
    Button_salvar: TButton;
    Edit1: TEdit;
    lblEstado: TLabel;
    Edit2: TEdit;
    Label7: TLabel;
    Edit_nuendereco: TEdit;
    Label6: TLabel;
    Edit_nmendereco: TEdit;
    Label4: TLabel;
    Edit_codigo_endereco: TEdit;
    Label5: TLabel;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pageEmpresa: TpageEmpresa;

implementation

{$R *.dfm}

procedure TpageEmpresa.FormShow(Sender: TObject);
begin
  DBGrid1.ReadOnly := True;
  DBGrid1.Options := DBGrid1.Options - [dgediting]
end;

end.
