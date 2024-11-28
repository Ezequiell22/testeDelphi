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
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit_nucep: TEdit;
    lbl_cep: TLabel;
    Edit_iduf: TEdit;
    Edit_idcidade: TEdit;
    Button_busca_uf: TButton;
    Button_busca_cidade: TButton;
    Edit_nm_uf: TEdit;
    Edit_nm_cidade: TEdit;
    Edit_idEndereco: TEdit;
    Label3: TLabel;
    Edit_nmendereco: TEdit;
    Label4: TLabel;
    Edit_nuendereco: TEdit;
    Label5: TLabel;
    Button_salvar: TButton;
    procedure Button_busca_ufClick(Sender: TObject);
    procedure Button_busca_cidadeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pageEndereco: TpageEndereco;

implementation

uses comercial.view.search;

{$R *.dfm}

procedure TpageEndereco.Button_busca_cidadeClick(Sender: TObject);
begin
  pageSearch := TpageSearch.Create(self);
  try
    pageSearch.strId := 'IDCIDADE';
    pageSearch.strDesc := 'NMCIDADE';
    pageSearch.strTable := 'CADCIDADE';
    pageSearch.ShowModal;
    Edit_idcidade.text := pageSearch.codigo.ToString;
  finally
    FreeAndNil(pageSearch);
  end;
end;

procedure TpageEndereco.Button_busca_ufClick(Sender: TObject);
begin
  pageSearch := TpageSearch.Create(self);
  try
    pageSearch.strId := 'IDUF';
    pageSearch.strDesc := 'NMESTADO';
    pageSearch.strTable := 'CADUF';
    pageSearch.ShowModal;
    Edit_iduf.text := pageSearch.codigo.ToString;
  finally
    FreeAndNil(pageSearch);
  end;
end;

end.
