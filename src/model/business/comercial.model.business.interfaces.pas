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
    function ColocaEnderecoAtivo: iModelBusinessEmpresa;
    function idEndereco(aValue: integer): iModelBusinessEmpresa;
    function Deletar: iModelBusinessEmpresa;
  end;

  iModelBusinessEndereco = interface
    ['{EF55EAB6-7CB3-4109-AA41-92515169DA07}']
    function SearchData : iModelBusinessEndereco;
    function idEmpresa(aValue : integer) : iModelBusinessEndereco;
    function idTitular(aValue : integer) : iModelBusinessEndereco;
    function idEndereco(aValue : integer) : iModelBusinessEndereco;
    function idUf(aValue : string) : iModelBusinessEndereco;
    function idCidade(aValue : string) : iModelBusinessEndereco;
    function nmEndereco(aValue : string) : iModelBusinessEndereco;
    function nuEndereco(aValue : string) : iModelBusinessEndereco;
    function nuCep(aValue : string) : iModelBusinessEndereco;
    function LinkDataSource(aDataSource : TDataSource)
      : iModelBusinessEndereco;
    function AbasteceComboBoxUFs(aComboBox: TComboBox): iModelBusinessEndereco;
    function AbasteceComboBoxCidades(aComboBox: TComboBox)
      : iModelBusinessEndereco;
    function saveData : iModelBusinessEndereco;
  end;

implementation

end.
