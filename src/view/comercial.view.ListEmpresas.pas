unit comercial.view.ListEmpresas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, comercial.controller.interfaces;

type
  TpageListEmpresas = class(TForm)
    DBGrid1: TDBGrid;
    Edit1_buscar: TEdit;
    Button_buscar: TButton;
    DataSource1: TDataSource;
    Button_novo: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button_buscarClick(Sender: TObject);
    procedure Button_novoClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    Fcontroller : iController;
  public
    { Public declarations }
  end;

var
  pageListEmpresas: TpageListEmpresas;

implementation

uses
  comercial.controller,
  comercial.view.Empresa;

{$R *.dfm}

procedure TpageListEmpresas.Button_buscarClick(Sender: TObject);
begin
  Fcontroller
    .business
      .ListEmpresas
        .nmempresa(Edit1_buscar.Text)
        .SearchData;

end;

procedure TpageListEmpresas.Button_novoClick(Sender: TObject);
begin
  pageEmpresa := TpageEmpresa.Create(self);
   try
    pageEmpresa.Caption := 'Nova Empresa';
    pageEmpresa.Edit_codigo.ReadOnly := false;
    pageEmpresa.ShowModal;
   finally
    pageEmpresa.Free;
   end;

   Button_buscarClick(Sender);
end;

procedure TpageListEmpresas.DBGrid1DblClick(Sender: TObject);
begin
  if DBGrid1.DataSource.DataSet.IsEmpty then
    exit;

  pageEmpresa := TpageEmpresa.Create(self);
   try
    pageEmpresa.Caption := 'Editar Empresa';
    pageEmpresa.Edit_codigo.ReadOnly := true;
    pageEmpresa.Edit_codigo.Text := DBGrid1.DataSource.DataSet
      .FieldByName('idEmpresa').AsString;
    pageEmpresa.ShowModal;
   finally
    pageEmpresa.Free;
   end;

   Button_buscarClick(Sender);
end;

procedure TpageListEmpresas.FormShow(Sender: TObject);
begin
  DBGrid1.ReadOnly := true;
  DBGrid1.Options := DBGrid1.Options - [dgediting];
  Fcontroller := TController.new;

  Fcontroller
  .business
    .ListEmpresas
      .LinkDataSource(dataSource1)
      .SearchData;
end;

end.
