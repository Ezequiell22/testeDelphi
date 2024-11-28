unit comercial.controller.business;

interface

uses
  comercial.controller.interfaces,
  comercial.model.business.interfaces,
  comercial.model.resource.interfaces,
  comercial.model.DAO.interfaces,
  comercial.model.business.ListEmpresas;

type
  TControllerBusiness = class(TInterfacedObject, iControllerBusiness)
  private
    FListEmpresas: iModelBusinessListEmpresas;
    FEmpresa: iModelBusinessEmpresa;
    FSearch: iModelBusinessSearch;
  public
    constructor create;
    destructor destroy; override;
    class function New: iControllerBusiness;
    function ListEmpresas: iModelBusinessListEmpresas;
    function Empresa: iModelBusinessEmpresa;
    function Search: iModelBusinessSearch;
  end;

implementation

uses
  comercial.model.business.Empresa, comercial.model.business.search;

{ TControllerBusiness }

constructor TControllerBusiness.create;
begin

end;

destructor TControllerBusiness.destroy;
begin

  inherited;
end;

function TControllerBusiness.Empresa: iModelBusinessEmpresa;
begin
  if not assigned(FEmpresa) then
    FEmpresa := TmodelBusinessEmpresa.New;
  result := FEmpresa;
end;

function TControllerBusiness.ListEmpresas: iModelBusinessListEmpresas;
begin
  if not assigned(FListEmpresas) then
    FListEmpresas := TmodelBusinessListEmpresas.New;
  result := FListEmpresas;
end;

class function TControllerBusiness.New: iControllerBusiness;
begin
  result := Self.create;
end;

function TControllerBusiness.search: iModelBusinessSearch;
begin
  if not assigned(FSearch) then
    FSearch := TModelBusinessSearch.New;
  result := FSearch;
end;

end.
