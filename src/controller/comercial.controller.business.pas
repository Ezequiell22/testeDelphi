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
  public
    constructor create;
    destructor destroy; override;
    class function New: iControllerBusiness;
    function ListEmpresas: iModelBusinessListEmpresas;
    function Empresa: iModelBusinessEmpresa;
  end;

implementation

uses
  comercial.model.business.Empresa;

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

end.
