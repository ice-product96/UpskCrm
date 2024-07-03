object frmEditDelivery: TfrmEditDelivery
  Left = 0
  Top = 0
  ClientHeight = 193
  ClientWidth = 459
  Caption = #1044#1086#1089#1090#1072#1074#1082#1072
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  TextHeight = 15
  object cmbDriver: TUniComboBox
    Left = 8
    Top = 72
    Width = 201
    Hint = ''
    Text = ''
    TabOrder = 0
    IconItems = <>
  end
  object cmbAuto: TUniComboBox
    Left = 248
    Top = 72
    Width = 201
    Hint = ''
    Text = ''
    TabOrder = 1
    IconItems = <>
  end
  object edtPrice: TUniNumberEdit
    Left = 8
    Top = 120
    Width = 201
    Hint = ''
    TabOrder = 2
    DecimalSeparator = ','
    OnChange = edtPriceChange
  end
  object dtDelivery: TUniDateTimePicker
    Left = 8
    Top = 27
    Width = 153
    Hint = ''
    DateTime = 45111.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 3
  end
  object lbl1: TUniLabel
    Left = 8
    Top = 8
    Width = 25
    Height = 13
    Hint = ''
    Caption = #1044#1072#1090#1072
    TabOrder = 4
  end
  object lbl2: TUniLabel
    Left = 8
    Top = 55
    Width = 49
    Height = 13
    Hint = ''
    Caption = #1042#1086#1076#1080#1090#1077#1083#1100
    TabOrder = 5
  end
  object lbl3: TUniLabel
    Left = 8
    Top = 101
    Width = 57
    Height = 13
    Hint = ''
    Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
    TabOrder = 6
  end
  object lbl4: TUniLabel
    Left = 248
    Top = 53
    Width = 25
    Height = 13
    Hint = ''
    Caption = #1040#1074#1090#1086
    TabOrder = 7
  end
  object cmbType: TUniComboBox
    Left = 248
    Top = 120
    Width = 201
    Hint = ''
    Text = ''
    TabOrder = 8
    IconItems = <>
  end
  object lbl5: TUniLabel
    Left = 248
    Top = 100
    Width = 20
    Height = 13
    Hint = ''
    Caption = #1058#1080#1087
    TabOrder = 9
  end
  object btnAccept: TUniButton
    Left = 376
    Top = 160
    Width = 75
    Height = 25
    Hint = ''
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 10
    OnClick = btnAcceptClick
  end
  object edtAdress: TUniEdit
    Left = 8
    Top = 163
    Width = 329
    Hint = ''
    Text = ''
    TabOrder = 11
  end
  object lbl6: TUniLabel
    Left = 8
    Top = 148
    Width = 78
    Height = 13
    Hint = ''
    Caption = #1040#1076#1088#1077#1089' '#1086#1073#1098#1077#1082#1090#1072
    TabOrder = 12
  end
end
