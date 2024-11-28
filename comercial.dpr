program comercial;

uses
  Vcl.Forms,
  comercial.view.index in 'src\view\comercial.view.index.pas' {frmIndex},
  comercial.controller.business in 'src\controller\comercial.controller.business.pas',
  comercial.controller.entity in 'src\controller\comercial.controller.entity.pas',
  comercial.controller.interfaces in 'src\controller\comercial.controller.interfaces.pas',
  comercial.controller in 'src\controller\comercial.controller.pas',
  comercial.model.behaviors.LogException in 'src\model\behaviors\comercial.model.behaviors.LogException.pas',
  comercial.model.business.interfaces in 'src\model\business\comercial.model.business.interfaces.pas',
  comercial.model.business.ListEmpresas in 'src\model\business\comercial.model.business.ListEmpresas.pas',
  comercial.model.entity.cadFuncionarios in 'src\model\entity\comercial.model.entity.cadFuncionarios.pas',
  comercial.model.DAO.interfaces in 'src\model\DAO\comercial.model.DAO.interfaces.pas',
  comercial.model.DAO.cadFuncionarios in 'src\model\DAO\comercial.model.DAO.cadFuncionarios.pas',
  comercial.model.resource.interfaces in 'src\model\resource\comercial.model.resource.interfaces.pas',
  comercial.model.resource.impl.conexaofiredac in 'src\model\resource\impl\comercial.model.resource.impl.conexaofiredac.pas',
  comercial.model.resource.impl.factory in 'src\model\resource\impl\comercial.model.resource.impl.factory.pas',
  comercial.model.resource.impl.queryFiredac in 'src\model\resource\impl\comercial.model.resource.impl.queryFiredac.pas',
  comercial.model.rtti.utils in 'src\model\rtti\comercial.model.rtti.utils.pas',
  comercial.model.types.Db in 'src\model\types\comercial.model.types.Db.pas',
  comercial.view.ListEmpresas in 'src\view\comercial.view.ListEmpresas.pas' {pageListEmpresas},
  comercial.model.entity.cadEmpresa in 'src\model\entity\comercial.model.entity.cadEmpresa.pas',
  comercial.model.DAO.CadEmpresa in 'src\model\DAO\comercial.model.DAO.CadEmpresa.pas',
  comercial.model.entity.cadTitular in 'src\model\entity\comercial.model.entity.cadTitular.pas',
  comercial.model.entity.cadUF in 'src\model\entity\comercial.model.entity.cadUF.pas',
  comercial.model.entity.cadCidade in 'src\model\entity\comercial.model.entity.cadCidade.pas',
  comercial.model.entity.cadEnderecos in 'src\model\entity\comercial.model.entity.cadEnderecos.pas',
  comercial.model.DAO.CadUF in 'src\model\DAO\comercial.model.DAO.CadUF.pas',
  comercial.model.DAO.CadEnderecos in 'src\model\DAO\comercial.model.DAO.CadEnderecos.pas',
  comercial.model.DAO.CadCidade in 'src\model\DAO\comercial.model.DAO.CadCidade.pas',
  comercial.model.DAO.CadTitular in 'src\model\DAO\comercial.model.DAO.CadTitular.pas',
  comercial.view.Empresa in 'src\view\comercial.view.Empresa.pas' {pageEmpresa},
  comercial.view.Endereco in 'src\view\comercial.view.Endereco.pas' {pageEndereco},
  comercial.model.business.Empresa in 'src\model\business\comercial.model.business.Empresa.pas',
  comercial.view.search in 'src\view\comercial.view.search.pas' {pageSearch},
  comercial.model.business.search in 'src\model\business\comercial.model.business.search.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmIndex, frmIndex);
  Application.CreateForm(TpageEndereco, pageEndereco);
  Application.CreateForm(TpageSearch, pageSearch);
  Application.Run;
end.
