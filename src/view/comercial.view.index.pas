unit comercial.view.index;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.WinXCtrls,
  Vcl.Menus,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  comercial.controller.interfaces;

type
  TfrmIndex = class(Tform)
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    Empresas1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Empresas1Click(Sender: TObject);
  private
    Fcontroller: iController;
    CloseForm: Word;
    MutexHandle: THandle;
    procedure AppMessage(var Msg: TMsg; var Handled: Boolean);
  public
  end;

var
  frmIndex: TfrmIndex;

implementation

{$R *.dfm}

uses
  System.UITypes, comercial.controller, comercial.view.ListEmpresas;

procedure TfrmIndex.AppMessage(var Msg: TMsg; var Handled: Boolean);
begin

  if (Msg.message = WM_KEYDOWN) or (Msg.message = WM_COMMAND) or
    (Msg.message = WM_MOUSEMOVE) then
  begin
    CloseForm := 0;
    Handled := FALSE;
  end;

  if (Msg.message = WM_KEYDOWN) and (GetKeyState(VK_CONTROL) < 0) and
    (Msg.wParam = VK_DELETE) then
  begin
    Handled := True;
  end;

end;

procedure TfrmIndex.Empresas1Click(Sender: TObject);
begin
  inherited;
  pageListEmpresas := TpageListEmpresas.Create(self);
  try
    pageListEmpresas.ShowModal;
  finally
    pageListEmpresas.Free;
  end;
end;

procedure TfrmIndex.FormCreate(Sender: TObject);
var
  numberVersion, dateVersion: string;
begin
  try
    MutexHandle := CreateMutex(nil, True, 'AppDelphiComercial');
    if (MutexHandle = 0) or (GetLastError = ERROR_ALREADY_EXISTS) then
      raise Exception.Create('O aplicativo já está em execução.');

    SystemParametersInfo(SPI_SETBEEP, 0, nil, SPIF_SENDWININICHANGE);

    numberVersion := '1';
    dateVersion := '28/11/2024';

    self.Caption := 'Módulo Comercial | Versão liberada ' + numberVersion +
      '  | Data ' + dateVersion;
  except
    on e: Exception do
      showMessage(e.message)
  end;
end;

procedure TfrmIndex.FormDestroy(Sender: TObject);
begin
  inherited;
  if MutexHandle <> 0 then
    CloseHandle(MutexHandle);
end;

procedure TfrmIndex.FormShow(Sender: TObject);
begin
  inherited;
  CloseForm := 0;
  application.OnMessage := AppMessage;

  StatusBar1.Panels[0].Width := 200;
  StatusBar1.Panels[1].Width := 200;

  Fcontroller := TController.new;

  var
  dataSet :=
    Fcontroller
    .entity
    .cadFuncionarios
    .GetbyId(3)
    .GetDataSet;

  StatusBar1.Panels[0].Text :=
  dataSet.FieldByName('NMFUNCIONARIO').AsString;
  StatusBar1.Panels[1].Text :=
  dataSet.FieldByName('TXEMAIL').AsString;

end;

end.
