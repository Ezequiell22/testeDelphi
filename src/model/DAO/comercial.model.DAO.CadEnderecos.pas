unit comercial.model.DAO.CadEnderecos;

interface

uses
  comercial.model.DAO.interfaces,
  comercial.model.entity.CadEnderecos,
  Data.DB,
  comercial.model.resource.interfaces,
  comercial.model.resource.impl.queryFiredac,
  system.Generics.Collections,
  comercial.model.types.Db;

type
  TModelDAOCadEnderecos = class(TinterfacedObject, iModelDAOEntity<TModelEntityCadEnderecos>)
  private
    Fquery: iQuery;
    FDataSource: TDataSource;
    FEntity: TModelEntityCadEnderecos;
  public
    constructor create;
    destructor destroy; override;
    class function New: iModelDAOEntity<TModelEntityCadEnderecos>;
    function Delete: iModelDAOEntity<TModelEntityCadEnderecos>;
    function DataSet(AValue: TDataSource): iModelDAOEntity<TModelEntityCadEnderecos>;
    function Get: iModelDAOEntity<TModelEntityCadEnderecos>;overload;
    function Insert: iModelDAOEntity<TModelEntityCadEnderecos>;
    function This: TModelEntityCadEnderecos;
    function Update: iModelDAOEntity<TModelEntityCadEnderecos>;
    function GetbyId(AValue: integer): iModelDAOEntity<TModelEntityCadEnderecos>;
    function GetDataSet : TDataSet;
    function Get( AFieldsWhere: TDictionary<string, Variant> ) :
    iModelDAOEntity<TModelEntityCadEnderecos>; overload;
  end;

implementation

uses
 System.SysUtils;

{ TModelDAOCadEnderecos }

constructor TModelDAOCadEnderecos.create;
begin
  FEntity := TModelEntityCadEnderecos.create(Self);
  Fquery := TModelResourceQueryFiredac.New(tcFBTeste);
end;

function TModelDAOCadEnderecos.DataSet(AValue: TDataSource): iModelDAOEntity<TModelEntityCadEnderecos>;
begin
  result := Self;
  FDataSource := AValue;
  FDataSource.DataSet := Fquery.DataSet;
end;

function TModelDAOCadEnderecos.Delete: iModelDAOEntity<TModelEntityCadEnderecos>;
begin
  result := Self;
  try
    Fquery
    .active(false)
    .sqlClear
    .sqlAdd('delete from CadEnderecos ')
    .sqlAdd(' where IDENDERECO = :IDENDERECO')
    .addParam('IDENDERECO', FEntity.IDENDERECO)
    .execSql
  except
    on E: Exception do
      raise Exception.create(E.message);

  end;
end;

destructor TModelDAOCadEnderecos.destroy;
begin
  FEntity.Free;
  inherited;
end;

function TModelDAOCadEnderecos.Get: iModelDAOEntity<TModelEntityCadEnderecos>;
begin
  result := Self;
  try
    Fquery
    .active(false)
    .sqlClear
    .sqlAdd('select * ')
    .sqlAdd('from CadEnderecos')
    .Open
  except
    on E: Exception do
      raise Exception.create(E.message);

  end;
end;

function TModelDAOCadEnderecos.Get(
  AFieldsWhere: TDictionary<string, Variant>): iModelDAOEntity<TModelEntityCadEnderecos>;
begin

end;

function TModelDAOCadEnderecos.GetbyId(AValue: integer): iModelDAOEntity<TModelEntityCadEnderecos>;
begin
  result := Self;
  try
    Fquery
    .active(false)
    .sqlClear
    .sqlAdd('select * ')
    .sqlAdd('from CadEnderecos')
    .sqlAdd('where IDENDERECO = :IDENDERECO ')
    .addParam('IDENDERECO', AValue)
    .Open;
  except
    on E: Exception do
      raise Exception.create(E.message);

  end;
end;

function TModelDAOCadEnderecos.GetDataSet: TDataSet;
begin
   result := Fquery.DataSet;
end;

function TModelDAOCadEnderecos.Insert: iModelDAOEntity<TModelEntityCadEnderecos>;
begin
  result := Self;
  try
    Fquery.active(false)
    .sqlClear
    .sqlAdd('insert into CadEnderecos')
    .sqlAdd('(IDENDERECO, IDTITULAR, IDEMPRESA, ')
    .sqlAdd('   NMENDERECO, NUENDERECO )')
    .sqlAdd('values ( :IDENDERECO, :IDTITULAR, :IDEMPRESA, ')
    .sqlAdd('   :NMENDERECO, :NUENDERECO )')
      .addParam('IDENDERECO', FEntity.IDENDERECO)
      .addParam('IDTITULAR', FEntity.IDTITULAR)
      .addParam('IDEMPRESA', FEntity.IDEMPRESA)
      .addParam('NMENDERECO', FEntity.NMENDERECO)
      .addParam('NUENDERECO', FEntity.NUENDERECO)
      .execSql

  except
    on E: Exception do
      raise Exception.create(E.message);

  end;
end;

class function TModelDAOCadEnderecos.New: iModelDAOEntity<TModelEntityCadEnderecos>;
begin
  result := Self.create;
end;

function TModelDAOCadEnderecos.This: TModelEntityCadEnderecos;
begin
  result := FEntity;
end;

function TModelDAOCadEnderecos.Update: iModelDAOEntity<TModelEntityCadEnderecos>;
begin
  result := Self;
  try

    Fquery.active(false)
    .sqlClear
    .sqlAdd('update CadEnderecos ')
    .sqlAdd('set IDTITULAR = :IDTITULAR, ')
    .sqlAdd('IDEMPRESA = :IDEMPRESA, ')
    .sqlAdd('NMENDERECO = :NMENDERECO, ')
    .sqlAdd('NUENDERECO = :NUENDERECO ')
    .sqlAdd(' where IDENDERECO = :IDENDERECO')
    .addParam('IDENDERECO', FEntity.IDENDERECO)
    .addParam('IDTITULAR', FEntity.IDTITULAR)
    .addParam('IDEMPRESA', FEntity.IDEMPRESA)
    .addParam('NMENDERECO', FEntity.NMENDERECO)
    .addParam('NUENDERECO', FEntity.NUENDERECO)
    .execSql

  except
    on E: Exception do
      raise Exception.create('Erro ao atualizar '+E.message);

  end;
end;

end.
