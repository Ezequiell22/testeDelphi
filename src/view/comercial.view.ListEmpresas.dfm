object pageListEmpresas: TpageListEmpresas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Listagem de empresas'
  ClientHeight = 626
  ClientWidth = 1018
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 0
    Top = 47
    Width = 1018
    Height = 579
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object Edit1_buscar: TEdit
    Left = 768
    Top = 17
    Width = 161
    Height = 23
    TabOrder = 1
  end
  object Button_buscar: TButton
    Left = 935
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 2
    OnClick = Button_buscarClick
  end
  object Button_novo: TButton
    Left = 0
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Nova'
    TabOrder = 3
    OnClick = Button_novoClick
  end
  object Button_deletar: TButton
    Left = 81
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Deletar'
    TabOrder = 4
    OnClick = Button_deletarClick
  end
  object DataSource1: TDataSource
    Left = 520
    Top = 288
  end
end
