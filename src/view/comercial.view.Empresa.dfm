object pageEmpresa: TpageEmpresa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Empresa'
  ClientHeight = 388
  ClientWidth = 899
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 19
    Width = 39
    Height = 15
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 152
    Top = 19
    Width = 33
    Height = 15
    Caption = 'Nome'
  end
  object Label3: TLabel
    Left = 16
    Top = 67
    Width = 27
    Height = 15
    Caption = 'CNPJ'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 128
    Width = 857
    Height = 186
    Caption = 'Endere'#231'os'
    TabOrder = 0
    object Button_alterar: TButton
      Left = 703
      Top = 19
      Width = 137
      Height = 25
      Caption = 'Alterar Endere'#231'o'
      TabOrder = 0
    end
    object DBGrid1: TDBGrid
      Left = 3
      Top = 63
      Width = 854
      Height = 120
      DataSource = DataSource_enderecos
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object Edit_codigo: TEdit
    Left = 16
    Top = 40
    Width = 121
    Height = 23
    NumbersOnly = True
    TabOrder = 1
    OnExit = Edit_codigoExit
  end
  object Edit_nome: TEdit
    Left = 152
    Top = 40
    Width = 721
    Height = 23
    TabOrder = 2
  end
  object Edit_cnpj: TEdit
    Left = 16
    Top = 88
    Width = 289
    Height = 23
    NumbersOnly = True
    TabOrder = 3
  end
  object Button_salvar: TButton
    Left = 790
    Top = 337
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 4
    OnClick = Button_salvarClick
  end
  object DataSource_enderecos: TDataSource
    Left = 72
    Top = 248
  end
  object DataSource_empresa: TDataSource
    Left = 472
    Top = 88
  end
end
