unit comercial.view.Empresa;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  comercial.controller.interfaces;

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
    DBGrid1: TDBGrid;
    DataSource_enderecos: TDataSource;
    DataSource_empresa: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure Edit_codigoExit(Sender: TObject);
    procedure Button_salvarClick(Sender: TObject);
  private
    { Private declarations }
    Fcontroller : iController;
  public
    { Public declarations }
    procedure BuscaDados;
  end;

var
  pageEmpresa: TpageEmpresa;

implementation

uses
  comercial.controller;

{$R *.dfm}

procedure TpageEmpresa.BuscaDados;
begin

  Fcontroller
    .business
      .Empresa
        .idEmpresa(strTointDef(Edit_codigo.Text,0))
        .LinkDataSourceEnderecos(DataSource_enderecos)
        .LinkDataSourceEmpresa(DataSource_empresa)
        .SearchData;

  Edit_nome.Text := DataSource_empresa
   .DataSet.FieldByName('nmempresa').AsString;

  Edit_cnpj.Text := DataSource_empresa
   .DataSet.FieldByName('nucnpj').AsString;
end;

procedure TpageEmpresa.Button_salvarClick(Sender: TObject);
begin

  Fcontroller
    .business
      .Empresa
        .idEmpresa(StrToIntDef(Edit_codigo.Text,0))
        .nmempresa(Edit_nome.Text)
        .NUCNPJ(Edit_cnpj.Text)
        .SaveData;

  showMessage('Dados salvos com sucesso!');
  self.Close;

end;

procedure TpageEmpresa.Edit_codigoExit(Sender: TObject);
begin
  BuscaDados;
end;

procedure TpageEmpresa.FormShow(Sender: TObject);
begin
  DBGrid1.ReadOnly := True;
  DBGrid1.Options := DBGrid1.Options - [dgediting];

  Fcontroller := TController.new;
  pageEmpresa.Edit_codigoExit(Sender);
end;

end.
