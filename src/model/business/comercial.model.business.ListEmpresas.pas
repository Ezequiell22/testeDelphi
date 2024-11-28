unit comercial.model.business.ListEmpresas;

interface

uses
  comercial.model.business.interfaces,
  Data.DB,
  comercial.model.resource.interfaces,
  comercial.model.resource.impl.queryFiredac,
  comercial.model.types.Db, comercial.model.DAO.interfaces,
  comercial.model.entity.cadEmpresa;

type
  TModelBusinessListEmpresas = class(TInterfacedObject, iModelBusinessListEmpresas)
  private
    FQuery: iQuery;
    Fnmempresa : string;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelBusinessListEmpresas;
    function SearchData: iModelBusinessListEmpresas;
    function nmempresa(aValue : string ) : iModelBusinessListEmpresas;
    function LinkDataSource(aDataSource: TDataSource)
      : iModelBusinessListEmpresas;

  end;

implementation

uses
  System.SysUtils,
  System.DateUtils,
  comercial.model.rtti.utils,
  comercial.model.DAO.CadEmpresa;

{ TModelBusinessListEmpresas }

constructor TModelBusinessListEmpresas.Create;
begin
  FQuery := TModelResourceQueryFiredac.New(tcFBTeste);
end;

destructor TModelBusinessListEmpresas.Destroy;
begin

  inherited;
end;


function TModelBusinessListEmpresas.LinkDataSource(
  aDataSource: TDataSource): iModelBusinessListEmpresas;
begin
  result := Self;
  aDataSource.DataSet := Fquery.DataSet;
end;

class function TModelBusinessListEmpresas.New: iModelBusinessListEmpresas;
begin
  result := self.Create;
end;

function TModelBusinessListEmpresas.nmempresa(
  aValue: string): iModelBusinessListEmpresas;
begin
  result := Self;
  Fnmempresa := aValue;
end;

function TModelBusinessListEmpresas.SearchData: iModelBusinessListEmpresas;
begin
  result := Self;

  FQuery
    .active(false)
    .sqlClear
    .sqlAdd('select ')
    .sqlAdd('a.idempresa,')
    .sqlAdd('a.nmempresa, ')
    .sqlAdd('a.nucnpj,')
    .sqlAdd('c.idendereco,')
    .sqlAdd('c.nmendereco,')
    .sqlAdd('c.nuendereco,')
    .sqlAdd('d.nmcidade, ')
    .sqlAdd('e.nmestado  ')
   .sqlAdd('from cadEmpresa A  ')
   .sqlAdd('left join cadenderecos c on ( a.idempresa = c.idempresa')
   .sqlAdd('and c.tpcadastro = ''E'' and c.stativo = ''S'') ')
   .sqlAdd('left join cadCidade d on (c.idcidade = d.idcidade)')
   .sqlAdd('left join cadUf e on (d.iduf = e.iduf)');

    if (Fnmempresa <> EmptyStr) then
    begin
      FQuery
        .sqlAdd('and Upper(a.nmempresa) like :nmempresa')
        .addParam('nmempresa', '%'+UpperCase(Fnmempresa)+'%');
    end;

    FQuery
    .open;

    Fnmempresa := EmptyStr;
end;

end.
