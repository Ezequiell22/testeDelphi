unit comercial.model.entity.cadEmpresa;

interface

uses
  comercial.model.DAO.interfaces,
  System.Generics.Collections;

type

  TModelEntityCadEmpresa = class
  private
    [weak]
    FParent: iModelDAOEntity<TModelEntityCadEmpresa>;
    FIDEMPRESA: integer;
    FNMEMPRESA: String;
    FNUCNPJ: String;
  public
    constructor Create(aParent: iModelDAOEntity<TModelEntityCadEmpresa>);
    destructor Destroy; override;
    function IDEMPRESA(aValue: integer): TModelEntityCadEmpresa; overload;
    function IDEMPRESA: integer; overload;
    function NMEMPRESA(aValue: string): TModelEntityCadEmpresa; overload;
    function NMEMPRESA: string; overload;
    function NUCNPJ(aValue: string): TModelEntityCadEmpresa; overload;
    function NUCNPJ: string; overload;
    function &End: iModelDAOEntity<TModelEntityCadEmpresa>;
  end;

implementation

uses
  System.SysUtils;

{ TModelEntityCadEmpresa }

constructor TModelEntityCadEmpresa.Create
  (aParent: iModelDAOEntity<TModelEntityCadEmpresa>);
begin
  FParent := aParent;
end;

destructor TModelEntityCadEmpresa.Destroy;
begin

  inherited;
end;

function TModelEntityCadEmpresa.&End: iModelDAOEntity<TModelEntityCadEmpresa>;
begin
  Result := FParent;
end;

function TModelEntityCadEmpresa.IDEMPRESA(aValue: integer)
  : TModelEntityCadEmpresa;
begin
  Result := Self;
  FIDEMPRESA := aValue;
end;

function TModelEntityCadEmpresa.IDEMPRESA: integer;
begin
  if (FIDEMPRESA) <= 0 then
    raise Exception.Create('id não pode ser vazio');

  Result := FIDEMPRESA;
end;

function TModelEntityCadEmpresa.NMEMPRESA(aValue: string)
  : TModelEntityCadEmpresa;
begin
  Result := Self;
  FNMEMPRESA := aValue;
end;

function TModelEntityCadEmpresa.NMEMPRESA: string;
begin
  if trim(FNMEMPRESA) = '' then
    raise Exception.Create('Nome não pode ser vazio');

  Result := FNMEMPRESA;
end;

function TModelEntityCadEmpresa.NUCNPJ: string;
begin
  Result := FNUCNPJ;
end;

function TModelEntityCadEmpresa.NUCNPJ(aValue: string): TModelEntityCadEmpresa;
begin
  Result := Self;
  FNUCNPJ := aValue;
end;

end.
