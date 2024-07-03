object frmEditDiscount: TfrmEditDiscount
  Left = 0
  Top = 0
  ClientHeight = 188
  ClientWidth = 274
  Caption = #1057#1082#1080#1076#1082#1080'/'#1053#1072#1076#1073#1072#1074#1082#1080
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  TextHeight = 15
  object edtName: TUniEdit
    Left = 8
    Top = 24
    Width = 257
    Hint = ''
    Text = ''
    TabOrder = 0
  end
  object lbl1: TUniLabel
    Left = 8
    Top = 5
    Width = 75
    Height = 13
    Hint = ''
    Caption = #1053#1072#1080#1084#1085#1086#1074#1072#1085#1080#1077
    TabOrder = 1
  end
  object edtPriceSquare: TUniNumberEdit
    Left = 8
    Top = 71
    Width = 121
    Hint = ''
    TabOrder = 2
    DecimalSeparator = ','
  end
  object lbl2: TUniLabel
    Left = 8
    Top = 52
    Width = 70
    Height = 13
    Hint = ''
    Caption = #1062#1077#1085#1072' '#1079#1072' '#1082#1074'.'#1084'.'
    TabOrder = 3
  end
  object edtPriceRentalPeriod: TUniNumberEdit
    Left = 144
    Top = 71
    Width = 121
    Hint = ''
    TabOrder = 4
    DecimalSeparator = ','
  end
  object lbl21: TUniLabel
    Left = 144
    Top = 52
    Width = 70
    Height = 13
    Hint = ''
    Caption = #1040#1088#1077#1085#1076#1072' '#1089#1091#1090#1082#1080
    TabOrder = 5
  end
  object edtPriceCollateral: TUniNumberEdit
    Left = 8
    Top = 119
    Width = 121
    Hint = ''
    TabOrder = 6
    DecimalSeparator = ','
  end
  object lbl22: TUniLabel
    Left = 8
    Top = 100
    Width = 30
    Height = 13
    Hint = ''
    Caption = #1047#1072#1083#1086#1075
    TabOrder = 7
  end
  object edtPriceFlooring: TUniNumberEdit
    Left = 144
    Top = 119
    Width = 121
    Hint = ''
    TabOrder = 8
    DecimalSeparator = ','
  end
  object lbl23: TUniLabel
    Left = 144
    Top = 100
    Width = 37
    Height = 13
    Hint = ''
    Caption = #1053#1072#1089#1090#1080#1083
    TabOrder = 9
  end
  object btnCancel: TUniButton
    Left = 191
    Top = 155
    Width = 75
    Height = 25
    Hint = ''
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 10
  end
  object btnAccept: TUniButton
    Left = 97
    Top = 153
    Width = 75
    Height = 25
    Hint = ''
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 11
    OnClick = btnAcceptClick
  end
end
