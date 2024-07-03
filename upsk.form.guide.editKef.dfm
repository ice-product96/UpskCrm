object frmEditKef: TfrmEditKef
  Left = 0
  Top = 0
  ClientHeight = 253
  ClientWidth = 265
  Caption = #1050#1101#1092'.'
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  TextHeight = 15
  object btnAccept: TUniButton
    Left = 62
    Top = 202
    Width = 90
    Height = 35
    Hint = ''
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 0
    Default = True
    OnClick = btnAcceptClick
  end
  object btnCancel: TUniButton
    Left = 167
    Top = 202
    Width = 90
    Height = 35
    Hint = ''
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 1
    Default = True
    OnClick = btnCancelClick
  end
  object edtCount: TUniNumberEdit
    Left = 91
    Top = 64
    Width = 61
    Hint = ''
    TabOrder = 2
    DecimalSeparator = ','
  end
  object edtDay: TUniNumberEdit
    Left = 91
    Top = 120
    Width = 61
    Hint = ''
    TabOrder = 3
    DecimalSeparator = ','
  end
  object cmbPackage: TUniComboBox
    Left = 8
    Top = 20
    Width = 249
    Hint = ''
    Text = ''
    TabOrder = 4
    IconItems = <>
  end
  object lbl1: TUniLabel
    Left = 8
    Top = 1
    Width = 81
    Height = 13
    Hint = ''
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    TabOrder = 5
  end
  object lbl2: TUniLabel
    Left = 91
    Top = 45
    Width = 53
    Height = 13
    Hint = ''
    Caption = #1050#1086#1083'-'#1074#1086' '#1084'2'
    TabOrder = 6
  end
  object lbl3: TUniLabel
    Left = 91
    Top = 101
    Width = 28
    Height = 13
    Hint = ''
    Caption = #1044#1085#1077#1081
    TabOrder = 7
  end
  object cmbOperDay: TUniComboBox
    Left = 8
    Top = 120
    Width = 77
    Hint = ''
    Style = csDropDownList
    Text = ''
    Items.Strings = (
      '>'
      '<'
      '='
      '>='
      '<=')
    TabOrder = 8
    IconItems = <>
  end
  object lbl4: TUniLabel
    Left = 8
    Top = 101
    Width = 25
    Height = 13
    Hint = ''
    Caption = #1047#1085#1072#1082
    TabOrder = 9
  end
  object cmbOperCount: TUniComboBox
    Left = 8
    Top = 64
    Width = 77
    Hint = ''
    Style = csDropDownList
    Text = ''
    Items.Strings = (
      '>'
      '<'
      '='
      '>='
      '<=')
    TabOrder = 10
    IconItems = <>
  end
  object lbl41: TUniLabel
    Left = 8
    Top = 45
    Width = 25
    Height = 13
    Hint = ''
    Caption = #1047#1085#1072#1082
    TabOrder = 11
  end
  object edtValue: TUniNumberEdit
    Left = 8
    Top = 166
    Width = 89
    Hint = ''
    TabOrder = 12
    DecimalSeparator = ','
  end
  object lbl21: TUniLabel
    Left = 8
    Top = 147
    Width = 57
    Height = 13
    Hint = ''
    Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
    TabOrder = 13
  end
end
