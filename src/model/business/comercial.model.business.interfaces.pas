unit comercial.model.business.interfaces;

interface

uses System.Generics.Collections,
  Data.DB,
  System.Classes,
  Vcl.CheckLst,
  Vcl.StdCtrls,
  Vcl.DBGrids,
  comercial.model.DAO.interfaces;

type

  iModelBusinessListEmpresas = interface
    ['{D3BF03B9-F4F6-49DF-8791-0965F3618F28}']
    function SearchData: iModelBusinessListEmpresas;
    function nmempresa(aValue: string): iModelBusinessListEmpresas;
    function LinkDataSource(aDataSource: TDataSource)
      : iModelBusinessListEmpresas;
  end;

  iModelBusinessEmpresa = interface
    ['{D3BF03B9-F4F6-49DF-8791-0965F3618F28}']
    function SearchData: iModelBusinessEmpresa;
    function nmempresa(aValue: string): iModelBusinessEmpresa;
    function NUCNPJ(aValue: string): iModelBusinessEmpresa;
    function idEmpresa(aValue: integer): iModelBusinessEmpresa;
    function LinkDataSourceEnderecos(aDataSource: TDataSource)
      : iModelBusinessEmpresa;
    function LinkDataSourceEmpresa(aDataSource: TDataSource)
      : iModelBusinessEmpresa;
    function newId: integer;
    function SaveData: iModelBusinessEmpresa;
  end;

implementation

end.
