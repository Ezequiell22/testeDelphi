object pageListEnderecos: TpageListEnderecos
  Left = 0
  Top = 0
  Caption = 'Listagem de endere'#231'os'
  ClientHeight = 523
  ClientWidth = 1133
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lbl_codigo: TLabel
    Left = 6
    Top = 9
    Width = 87
    Height = 15
    Caption = 'C'#243'digo Empresa'
  end
  object lbl_empresa: TLabel
    Left = 174
    Top = 8
    Width = 81
    Height = 15
    Caption = 'Nome Empresa'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 56
    Width = 1133
    Height = 467
    Align = alBottom
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object Button_seleciona: TButton
    Left = 984
    Top = 23
    Width = 150
    Height = 25
    Caption = 'Selecionar Endere'#231'o'
    TabOrder = 1
  end
  object Button_adicionar: TButton
    Left = 903
    Top = 23
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 2
  end
  object Button_Editar: TButton
    Left = 822
    Top = 23
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 3
  end
end
