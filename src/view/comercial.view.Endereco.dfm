object pageEndereco: TpageEndereco
  Left = 0
  Top = 0
  Caption = 'Endere'#231'o'
  ClientHeight = 322
  ClientWidth = 684
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
  object GroupBox1: TGroupBox
    Left = 0
    Top = 56
    Width = 684
    Height = 266
    Align = alBottom
    Caption = 'Dados'
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 72
      Width = 14
      Height = 15
      Caption = 'UF'
    end
    object Label2: TLabel
      Left = 24
      Top = 128
      Width = 37
      Height = 15
      Caption = 'Cidade'
    end
    object lbl_cep: TLabel
      Left = 24
      Top = 181
      Width = 21
      Height = 15
      Caption = 'CEP'
    end
    object Label3: TLabel
      Left = 24
      Top = 24
      Width = 91
      Height = 15
      Caption = 'C'#243'digo Endere'#231'o'
    end
    object Label4: TLabel
      Left = 151
      Top = 24
      Width = 20
      Height = 15
      Caption = 'Rua'
    end
    object Label5: TLabel
      Left = 471
      Top = 24
      Width = 44
      Height = 15
      Caption = 'Numero'
    end
    object Edit_nucep: TEdit
      Left = 24
      Top = 200
      Width = 121
      Height = 23
      TabOrder = 0
    end
    object Edit_iduf: TEdit
      Left = 24
      Top = 99
      Width = 121
      Height = 23
      TabOrder = 1
    end
    object Edit_idcidade: TEdit
      Left = 24
      Top = 149
      Width = 121
      Height = 23
      TabOrder = 2
    end
    object Button_busca_uf: TButton
      Left = 151
      Top = 98
      Width = 25
      Height = 25
      Caption = '...'
      TabOrder = 3
      OnClick = Button_busca_ufClick
    end
    object Button_busca_cidade: TButton
      Left = 151
      Top = 148
      Width = 25
      Height = 25
      Caption = '...'
      TabOrder = 4
      OnClick = Button_busca_cidadeClick
    end
    object Edit_nm_uf: TEdit
      Left = 182
      Top = 99
      Width = 459
      Height = 23
      TabOrder = 5
    end
    object Edit_nm_cidade: TEdit
      Left = 182
      Top = 149
      Width = 459
      Height = 23
      TabOrder = 6
    end
    object Edit_idEndereco: TEdit
      Left = 24
      Top = 43
      Width = 121
      Height = 23
      NumbersOnly = True
      TabOrder = 7
    end
    object Edit_nmendereco: TEdit
      Left = 151
      Top = 43
      Width = 314
      Height = 23
      NumbersOnly = True
      TabOrder = 8
    end
    object Edit_nuendereco: TEdit
      Left = 471
      Top = 43
      Width = 170
      Height = 23
      NumbersOnly = True
      TabOrder = 9
    end
    object Button_salvar: TButton
      Left = 566
      Top = 199
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 10
    end
  end
end
