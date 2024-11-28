unit comercial.model.entity.cadEnderecos;

interface

uses
  comercial.model.DAO.interfaces,
  System.Generics.Collections;

type

  TModelEntityCadEnderecos = class
  private
    [weak]
    FParent: iModelDAOEntity<TModelEntityCadEnderecos>;
    FIDENDERECO: integer;
    FIDTITULAR: integer;
    FIDEMPRESA: integer;
    FNMENDERECO: string;
    FNUENDERECO: string;
  public
    constructor Create(aParent: iModelDAOEntity<TModelEntityCadEnderecos>);
    destructor Destroy; override;
    function IDENDERECO(aValue: integer): TModelEntityCadEnderecos; overload;
    function IDENDERECO: integer; overload;
    function IDTITULAR(aValue: integer): TModelEntityCadEnderecos; overload;
    function IDTITULAR: integer; overload;
    function IDEMPRESA(aValue: integer): TModelEntityCadEnderecos; overload;
    function IDEMPRESA: integer; overload;
    function NMENDERECO(aValue: string): TModelEntityCadEnderecos; overload;
    function NMENDERECO: string; overload;
    function NUENDERECO(aValue: string): TModelEntityCadEnderecos; overload;
    function NUENDERECO: string; overload;
    function &End: iModelDAOEntity<TModelEntityCadEnderecos>;
  end;

implementation

uses
  System.SysUtils;

{ TModelEntityCadEnderecos }

constructor TModelEntityCadEnderecos.Create
  (aParent: iModelDAOEntity<TModelEntityCadEnderecos>);
begin
  FParent := aParent;
end;

destructor TModelEntityCadEnderecos.Destroy;
begin

  inherited;
end;

function TModelEntityCadEnderecos.&End
  : iModelDAOEntity<TModelEntityCadEnderecos>;
begin
  Result := FParent;
end;

function TModelEntityCadEnderecos.IDENDERECO(aValue: integer)
  : TModelEntityCadEnderecos;
begin
  Result := Self;
  FIDENDERECO := aValue;
end;

function TModelEntityCadEnderecos.IDENDERECO: integer;
begin
  if (FIDENDERECO) <= 0 then
    raise Exception.Create('IDENDERECO não pode ser vazio');

  Result := FIDENDERECO;
end;

function TModelEntityCadEnderecos.IDTITULAR(aValue: integer)
  : TModelEntityCadEnderecos;
begin
  Result := Self;
  FIDTITULAR := aValue;
end;

function TModelEntityCadEnderecos.IDTITULAR: integer;
begin
  if (FIDTITULAR) <= 0 then
    raise Exception.Create('IDTITULAR não pode ser vazio');

  Result := FIDTITULAR;
end;

function TModelEntityCadEnderecos.IDEMPRESA(aValue: integer)
  : TModelEntityCadEnderecos;
begin
  Result := Self;
  FIDEMPRESA := aValue;
end;

function TModelEntityCadEnderecos.IDEMPRESA: integer;
begin
  if (FIDEMPRESA) <= 0 then
    raise Exception.Create('IDEMPRESA não pode ser vazio');

  Result := FIDEMPRESA;
end;

function TModelEntityCadEnderecos.NMENDERECO(aValue: string)
  : TModelEntityCadEnderecos;
begin
  Result := Self;
  FNMENDERECO := aValue;
end;

function TModelEntityCadEnderecos.NMENDERECO: string;
begin
  if trim(FNMENDERECO) = '' then
    raise Exception.Create('NMENDERECO não pode ser vazio');

  Result := FNMENDERECO;
end;

function TModelEntityCadEnderecos.NUENDERECO(aValue: string)
  : TModelEntityCadEnderecos;
begin
  Result := Self;
  FNUENDERECO := aValue;
end;

function TModelEntityCadEnderecos.NUENDERECO: string;
begin
  if trim(FNUENDERECO) = '' then
    raise Exception.Create('NUENDERECO não pode ser vazio');

  Result := FNUENDERECO;
end;

end.
