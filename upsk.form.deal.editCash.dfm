object frmEditCash: TfrmEditCash
  Left = 0
  Top = 0
  ClientHeight = 446
  ClientWidth = 288
  Caption = #1044#1077#1085#1100#1075#1080
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  TextHeight = 15
  object edtAmount: TUniNumberEdit
    Left = 8
    Top = 241
    Width = 145
    Hint = ''
    TabOrder = 0
    ReadOnly = True
    DecimalSeparator = ','
  end
  object lbl1: TUniLabel
    Left = 8
    Top = 222
    Width = 72
    Height = 13
    Hint = ''
    Caption = #1054#1073#1097#1072#1103' '#1089#1091#1084#1084#1072
    TabOrder = 1
  end
  object btnAccept: TUniButton
    Left = 205
    Top = 406
    Width = 75
    Height = 25
    Hint = ''
    Caption = #1042#1085#1077#1089#1090#1080
    TabOrder = 2
    OnClick = btnAcceptClick
  end
  object mmoComment: TUniMemo
    Left = 8
    Top = 351
    Width = 272
    Height = 42
    Hint = ''
    TabOrder = 3
  end
  object lbl3: TUniLabel
    Left = 8
    Top = 332
    Width = 74
    Height = 13
    Hint = ''
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
    TabOrder = 4
  end
  object dtOper: TUniDateTimePicker
    Left = 8
    Top = 296
    Width = 120
    Hint = ''
    DateTime = 45121.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 5
  end
  object lbl4: TUniLabel
    Left = 8
    Top = 277
    Width = 25
    Height = 13
    Hint = ''
    Caption = #1044#1072#1090#1072
    TabOrder = 6
  end
  object lbl5: TUniLabel
    Left = 8
    Top = 20
    Width = 39
    Height = 13
    Hint = ''
    Caption = #1040#1088#1077#1085#1076#1072
    TabOrder = 7
  end
  object lbl6: TUniLabel
    Left = 8
    Top = 71
    Width = 30
    Height = 13
    Hint = ''
    Caption = #1047#1072#1083#1086#1075
    TabOrder = 8
  end
  object lbl7: TUniLabel
    Left = 8
    Top = 130
    Width = 49
    Height = 13
    Hint = ''
    Caption = #1044#1086#1089#1090#1072#1074#1082#1072
    TabOrder = 9
  end
  object lbl8: TUniLabel
    Left = 8
    Top = 175
    Width = 32
    Height = 13
    Hint = ''
    Caption = #1042#1099#1074#1086#1079
    TabOrder = 10
  end
  object edtRental: TUniNumberEdit
    Left = 8
    Top = 47
    Width = 153
    Hint = ''
    TabOrder = 11
    DecimalSeparator = ','
    OnChange = edtRentalChange
  end
  object edtPledge: TUniNumberEdit
    Left = 8
    Top = 98
    Width = 153
    Hint = ''
    TabOrder = 12
    DecimalSeparator = ','
    OnChange = edtRentalChange
  end
  object edtDelivery: TUniNumberEdit
    Left = 8
    Top = 149
    Width = 153
    Hint = ''
    TabOrder = 13
    DecimalSeparator = ','
    OnChange = edtRentalChange
  end
  object edtDeliveryOut: TUniNumberEdit
    Left = 8
    Top = 194
    Width = 153
    Hint = ''
    TabOrder = 14
    DecimalSeparator = ','
    OnChange = edtRentalChange
  end
  object lblRenatal: TUniLabel
    Left = 167
    Top = 47
    Width = 36
    Height = 13
    Cursor = crHandPoint
    Hint = ''
    Caption = '000000'
    TabOrder = 15
    OnClick = lblRenatalClick
  end
  object lblPledge: TUniLabel
    Left = 167
    Top = 98
    Width = 36
    Height = 13
    Cursor = crHandPoint
    Hint = ''
    Caption = '000000'
    TabOrder = 16
    OnClick = lblPledgeClick
  end
  object lblDelivery: TUniLabel
    Left = 167
    Top = 149
    Width = 36
    Height = 13
    Cursor = crHandPoint
    Hint = ''
    Caption = '000000'
    TabOrder = 17
    OnClick = lblDeliveryClick
  end
  object lblDeliveryOut: TUniLabel
    Left = 167
    Top = 194
    Width = 36
    Height = 13
    Cursor = crHandPoint
    Hint = ''
    Caption = '000000'
    TabOrder = 18
    OnClick = lblDeliveryOutClick
  end
end
