object pageEmpresa: TpageEmpresa
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Empresa'
  ClientHeight = 610
  ClientWidth = 889
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
  object lblEstado: TLabel
    Left = 24
    Top = 537
    Width = 35
    Height = 15
    Caption = 'Estado'
  end
  object Label7: TLabel
    Left = 320
    Top = 537
    Width = 37
    Height = 15
    Caption = 'Cidade'
  end
  object Label6: TLabel
    Left = 727
    Top = 481
    Width = 44
    Height = 15
    Caption = 'Numero'
  end
  object Label4: TLabel
    Left = 160
    Top = 481
    Width = 20
    Height = 15
    Caption = 'Rua'
  end
  object Label5: TLabel
    Left = 24
    Top = 481
    Width = 39
    Height = 15
    Caption = 'C'#243'digo'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 128
    Width = 857
    Height = 186
    Caption = 'Endere'#231'os'
    TabOrder = 0
    object Button_alterar: TButton
      Left = 719
      Top = 3
      Width = 137
      Height = 25
      Caption = 'Alterar Endere'#231'o'
      TabOrder = 0
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 32
      Width = 793
      Height = 120
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
    Left = 806
    Top = 329
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 4
  end
  object Edit1: TEdit
    Left = 24
    Top = 558
    Width = 290
    Height = 23
    ReadOnly = True
    TabOrder = 5
  end
  object Edit2: TEdit
    Left = 320
    Top = 558
    Width = 290
    Height = 23
    ReadOnly = True
    TabOrder = 6
  end
  object Edit_nuendereco: TEdit
    Left = 727
    Top = 502
    Width = 121
    Height = 23
    ReadOnly = True
    TabOrder = 7
  end
  object Edit_nmendereco: TEdit
    Left = 160
    Top = 502
    Width = 561
    Height = 23
    ReadOnly = True
    TabOrder = 8
  end
  object Edit_codigo_endereco: TEdit
    Left = 24
    Top = 502
    Width = 121
    Height = 23
    NumbersOnly = True
    ReadOnly = True
    TabOrder = 9
  end
end
