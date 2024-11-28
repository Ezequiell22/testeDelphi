unit comercial.model.business.Empresa;

interface

uses
  comercial.model.business.interfaces,
  Data.DB,
  comercial.model.resource.interfaces,
  comercial.model.resource.impl.queryFiredac,
  comercial.model.types.Db,
  comercial.model.DAO.interfaces,
  comercial.model.entity.cadEmpresa,
  comercial.model.entity.cadEnderecos;

type
  TModelBusinessEmpresa = class(TInterfacedObject, iModelBusinessEmpresa)
  private
    FQueryAux: iQuery;
    Fnmempresa : string;
    FidEmpresa : integer;
    FNUCNPJ : string;
    FIDEndereco : integer;
    FcadEmpresa: iModelDAOEntity<TModelEntityCadEmpresa>;
    FcadEnderecos: iModelDAOEntity<TModelEntityCadEnderecos>;
    function isNew : boolean;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelBusinessEmpresa;
    function SearchData: iModelBusinessEmpresa;
    function nmempresa(aValue : string ) : iModelBusinessEmpresa;
    function NUCNPJ(aValue : string ) : iModelBusinessEmpresa;
    function idEmpresa(aValue : integer ) : iModelBusinessEmpresa;
    function idEndereco(aValue : integer ) : iModelBusinessEmpresa;
    function LinkDataSourceEnderecos(aDataSource: TDataSource)
      : iModelBusinessEmpresa;
    function LinkDataSourceEmpresa(aDataSource: TDataSource)
      : iModelBusinessEmpresa;
    function newId : integer;
    function SaveData : iModelBusinessEmpresa;
    function ColocaEnderecoAtivo : iModelBusinessEmpresa;
    function Deletar : iModelBusinessEmpresa;
  end;

implementation

uses
  comercial.model.DAO.CadEmpresa,
  comercial.model.DAO.CadEnderecos,
  Generics.Collections, System.SysUtils;

{ TModelBusinessEmpresa }

function TModelBusinessEmpresa.Deletar: iModelBusinessEmpresa;
begin
  result := Self;

  FcadEmpresa
    .This
      .IDEMPRESA(FidEmpresa)
      .&End
    .Delete;

    {coloca todos os endereços da empresa como excluidos}
   FQueryAux
    .active(false)
    .sqlClear
    .sqlAdd('update CadEnderecos ')
    .sqlAdd(' set STEXCLUIDO = ''S'',')
    .sqlAdd('DTEXCLUIDO = :DTEXCLUIDO')
    .sqlAdd(' where idEmpresa = :idEmpresa')
    .addParam('idEmpresa', FidEmpresa)
    .addParam('DTEXCLUIDO', NOW)
    .execSql;

  FidEmpresa := 0;
end;

function TModelBusinessEmpresa.ColocaEnderecoAtivo: iModelBusinessEmpresa;
begin
  result := Self;
  {primeiro inativa todos os endereços da empresa}
  FQueryAux
    .active(false)
    .sqlClear
    .sqlAdd('update cadEnderecos')
    .sqlAdd('set STATIVO = ''N''')
    .sqlAdd('where idEmpresa = :idEmpresa')
    .addParam('idEmpresa', FidEmpresa)
    .execSql;

  { agora ativa apenas o endereço solicitado}
  FQueryAux
    .active(false)
    .sqlClear
    .sqlAdd('update cadEnderecos')
    .sqlAdd('set STATIVO = ''S''')
    .sqlAdd('where idEmpresa = :idEmpresa')
    .sqlAdd('and idendereco = :idendereco')
    .addParam('idEmpresa', FidEmpresa)
    .addParam('idendereco', Fidendereco)
    .execSql;
end;

constructor TModelBusinessEmpresa.Create;
begin
  FQueryAux := TModelResourceQueryFiredac.New(tcFBTeste);
  FcadEmpresa := TmodelDaoCadEmpresa.New;
  FcadEnderecos := TModelDaoCadEnderecos.new;
end;

destructor TModelBusinessEmpresa.Destroy;
begin

  inherited;
end;

function TModelBusinessEmpresa.idEmpresa(
  aValue: integer): iModelBusinessEmpresa;
begin
  result := Self;
  FidEmpresa := aValue;
end;

function TModelBusinessEmpresa.idEndereco(
  aValue: integer): iModelBusinessEmpresa;
begin
  result := Self;
  FIDEndereco := aValue;
end;

function TModelBusinessEmpresa.isNew: boolean;
begin
    FQueryAux
      .active(false)
      .sqlClear
      .sqlAdd('select * from cadEmpresa')
      .sqlAdd('where idEmpresa = :idEmpresa')
      .addParam('idEmpresa', FidEmpresa)
      .open;

    result := FQueryAux.DataSet.IsEmpty;
end;

function TModelBusinessEmpresa.LinkDataSourceEmpresa(
  aDataSource: TDataSource): iModelBusinessEmpresa;
begin
  result := Self;
  aDataSource.DataSet := FcadEmpresa.GetDataSet;
end;

function TModelBusinessEmpresa.LinkDataSourceEnderecos(
  aDataSource: TDataSource): iModelBusinessEmpresa;
begin
  result := Self;
  aDataSource.DataSet := FcadEnderecos.GetDataSet;
end;

class function TModelBusinessEmpresa.New: iModelBusinessEmpresa;
begin
  result := Self.Create;
end;

function TModelBusinessEmpresa.newId: integer;
begin
  FQueryAux
    .active(false)
    .sqlClear
      .sqlAdd('select (max(nullif(idEmpresa, 0 )) + 1) idE ')
      .sqlAdd('from cadEmpresa')
      .open;

  result := FQueryAux.DataSet.FieldByName('idE').AsInteger;
end;

function TModelBusinessEmpresa.nmempresa(aValue: string): iModelBusinessEmpresa;
begin
   result := Self;
   Fnmempresa := aValue;
end;

function TModelBusinessEmpresa.NUCNPJ(aValue: string): iModelBusinessEmpresa;
begin
  result := Self;
  FNUCNPJ := aValue;
end;

function TModelBusinessEmpresa.SaveData: iModelBusinessEmpresa;
begin

  if isNew then
  begin
    FcadEmpresa
    .This
      .IDEMPRESA(newId)
      .NMEMPRESA(Fnmempresa)
      .NUCNPJ(FNUCNPJ)
      .&end
      .Insert;
  end
  else
  begin
    FcadEmpresa
    .This
      .IDEMPRESA(FidEmpresa)
      .NMEMPRESA(Fnmempresa)
      .NUCNPJ(FNUCNPJ)
      .&end
      .Update;
  end;

end;

function TModelBusinessEmpresa.SearchData: iModelBusinessEmpresa;
var params: Tdictionary<string, variant>;
begin
  result := Self;
  params := Tdictionary<string, variant>.Create;

  try
    FcadEmpresa
      .GetbyId(FidEmpresa);

    params.Add('idEmpresa', FidEmpresa);
    FcadEnderecos
      .Get(params);
  finally
    params.Free;
  end;

end;

end.
