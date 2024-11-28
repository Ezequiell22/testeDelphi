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

implementation

end.
