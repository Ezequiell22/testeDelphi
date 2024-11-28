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
    Edit_idEmpresa: TEdit;
    Label1: TLabel;
    Edit_nome: TEdit;
    Label2: TLabel;
    Edit_cnpj: TEdit;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    DataSource_enderecos: TDataSource;
    DataSource_empresa: TDataSource;
    Button_seleciona: TButton;
    Button_adicionar: TButton;
    Button_Editar: TButton;
    procedure FormShow(Sender: TObject);
    procedure Edit_idEmpresaExit(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button_selecionaClick(Sender: TObject);
    procedure Button_adicionarClick(Sender: TObject);
    procedure Button_EditarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Fcontroller : iController;
    procedure SalvarDados;
  public
    { Public declarations }
    procedure BuscaDados;
    procedure SelecionarEndereco;
  end;

var
  pageEmpresa: TpageEmpresa;

implementation

uses
  comercial.controller,
  comercial.view.Endereco;

{$R *.dfm}

procedure TpageEmpresa.BuscaDados;
begin

  Fcontroller
    .business
      .Empresa
        .idEmpresa(strTointDef(Edit_idEmpresa.Text,0))
        .LinkDataSourceEnderecos(DataSource_enderecos)
        .LinkDataSourceEmpresa(DataSource_empresa)
        .SearchData;

  Edit_nome.Text := DataSource_empresa
   .DataSet.FieldByName('nmempresa').AsString;

  Edit_cnpj.Text := DataSource_empresa
   .DataSet.FieldByName('nucnpj').AsString;
end;

procedure TpageEmpresa.Button_adicionarClick(Sender: TObject);
begin
  if strTointDef(Edit_idEmpresa.Text,0) <= 0 then
    exit;

  SalvarDados;

  pageEndereco := TpageEndereco.Create(self);
  try
   pageEndereco.Caption := 'Novo Endereço';
   pageEndereco.lbl_codigo.Caption := 'Código '+
   Edit_idEmpresa.Text;
   pageEndereco.lbl_empresa.Caption :=
   Edit_nome.Text;
   pageEndereco.IdEmpresa := strTointDef(Edit_idEmpresa.Text,0);
   pageEndereco.ShowModal;
  finally
    pageEndereco.Free;
  end;

  BuscaDados;
end;

procedure TpageEmpresa.Button_EditarClick(Sender: TObject);
begin
  if strTointDef(Edit_idEmpresa.Text,0) <= 0 then
    exit;

  SalvarDados;

  if DataSource_enderecos.DataSet.IsEmpty then
    exit;

  pageEndereco := TpageEndereco.Create(self);
  try
   pageEndereco.Caption := 'Editar Endereço';
   pageEndereco.Edit_idEndereco.ReadOnly := True;
   pageEndereco.Edit_idEndereco.Text :=
    DataSource_enderecos.DataSet.FieldByName('idEndereco').AsString;
   pageEndereco.lbl_codigo.Caption := 'Código '+
   Edit_idEmpresa.Text;
   pageEndereco.lbl_empresa.Caption :=
   Edit_nome.Text;

   pageEndereco.IdEmpresa := strTointDef(Edit_idEmpresa.Text,0);
   pageEndereco.ShowModal;
  finally
    pageEndereco.Free;
  end;

  BuscaDados;
end;

procedure TpageEmpresa.Button_selecionaClick(Sender: TObject);
begin
  SalvarDados;
  SelecionarEndereco;
end;

procedure TpageEmpresa.DBGrid1DblClick(Sender: TObject);
begin
   SelecionarEndereco
end;

procedure TpageEmpresa.Edit_idEmpresaExit(Sender: TObject);
begin
  if strTointDef(Edit_idEmpresa.Text, 0) = 0 then
  begin
    Edit_idEmpresa.Text :=
      Fcontroller
      .business
        .Empresa
        .newId.ToString;
  end;

  BuscaDados;
end;


procedure TpageEmpresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   SalvarDados
end;

procedure TpageEmpresa.FormShow(Sender: TObject);
begin
  DBGrid1.ReadOnly := True;
  DBGrid1.Options := DBGrid1.Options - [dgediting];

  Fcontroller := TController.new;
  pageEmpresa.Edit_idEmpresaExit(Sender);
end;

procedure TpageEmpresa.SalvarDados;
begin
  Fcontroller
    .business
      .Empresa
        .idEmpresa(StrToIntDef(Edit_idEmpresa.Text,0))
        .nmempresa(Edit_nome.Text)
        .NUCNPJ(Edit_cnpj.Text)
        .SaveData;

end;

procedure TpageEmpresa.SelecionarEndereco;
begin
  if DataSource_enderecos.DataSet.IsEmpty then
    exit;

  Fcontroller
    .business
      .Empresa
        .idEmpresa(strTointDef(Edit_idEmpresa.Text, 0))
        .idEndereco(DataSource_enderecos.DataSet
        .FieldByName('idEndereco').AsInteger)
        .ColocaEnderecoAtivo
        .SearchData;

  ShowMessage('Endereço ativado com sucesso!')
end;

end.
