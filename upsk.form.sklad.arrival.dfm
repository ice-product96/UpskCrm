object frmArrival: TfrmArrival
  Left = 0
  Top = 0
  ClientHeight = 381
  ClientWidth = 390
  Caption = #1055#1088#1080#1093#1086#1076
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  TextHeight = 15
  object cmbPosition: TUniComboBox
    Left = 8
    Top = 24
    Width = 281
    Hint = ''
    Text = ''
    TabOrder = 0
    IconItems = <>
    OnSelect = cmbPositionSelect
  end
  object lbl1: TUniLabel
    Left = 8
    Top = 8
    Width = 77
    Height = 13
    Hint = ''
    Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072
    TabOrder = 8
  end
  object btnOpenPos: TUniButton
    Left = 295
    Top = 21
    Width = 33
    Height = 25
    Hint = ''
    Caption = '...'
    ParentFont = False
    Font.Height = -13
    TabOrder = 9
    OnClick = btnOpenPosClick
  end
  object btnAddPos: TUniButton
    Left = 334
    Top = 21
    Width = 33
    Height = 25
    Hint = ''
    Caption = '+'
    ParentFont = False
    Font.Height = -13
    TabOrder = 10
    OnClick = btnAddPosClick
  end
  object cmbItemsArrival: TUniComboBox
    Left = 8
    Top = 121
    Width = 281
    Hint = ''
    Text = ''
    TabOrder = 3
    IconItems = <>
  end
  object lbl11: TUniLabel
    Left = 8
    Top = 104
    Width = 83
    Height = 13
    Hint = ''
    Caption = #1057#1090#1072#1090#1100#1103' '#1087#1088#1080#1093#1086#1076#1072
    TabOrder = 11
  end
  object edtDocNumber: TUniEdit
    Left = 8
    Top = 168
    Width = 145
    Hint = ''
    Text = ''
    TabOrder = 4
  end
  object lbl12: TUniLabel
    Left = 8
    Top = 149
    Width = 91
    Height = 13
    Hint = ''
    Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1085#1086#1084#1077#1088
    TabOrder = 12
  end
  object edtCount: TUniNumberEdit
    Left = 8
    Top = 68
    Width = 121
    Hint = ''
    TabOrder = 1
    DecimalSeparator = ','
  end
  object lbl13: TUniLabel
    Left = 8
    Top = 52
    Width = 36
    Height = 13
    Hint = ''
    Caption = #1050#1086#1083'-'#1074#1086
    TabOrder = 13
  end
  object edtUnit: TUniEdit
    Left = 135
    Top = 68
    Width = 91
    Hint = ''
    Text = ''
    TabOrder = 2
    ReadOnly = True
  end
  object lbl121: TUniLabel
    Left = 135
    Top = 49
    Width = 41
    Height = 13
    Hint = ''
    Caption = #1045#1076'. '#1080#1079#1084'.'
    TabOrder = 14
  end
  object dtDoc: TUniDateTimePicker
    Left = 169
    Top = 168
    Width = 120
    Hint = ''
    DateTime = 45029.000000000000000000
    DateFormat = 'dd.MM.yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 5
  end
  object lbl14: TUniLabel
    Left = 169
    Top = 149
    Width = 25
    Height = 13
    Hint = ''
    Caption = #1044#1072#1090#1072
    TabOrder = 15
  end
  object mmoComment: TUniMemo
    Left = 8
    Top = 216
    Width = 359
    Height = 113
    Hint = ''
    TabOrder = 6
  end
  object lbl15: TUniLabel
    Left = 8
    Top = 197
    Width = 74
    Height = 13
    Hint = ''
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
    TabOrder = 16
  end
  object btnAccept: TUniButton
    Left = 198
    Top = 344
    Width = 75
    Height = 25
    Hint = ''
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 7
    OnClick = btnAcceptClick
  end
  object btnCancel: TUniButton
    Left = 292
    Top = 344
    Width = 75
    Height = 25
    Hint = ''
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 17
    OnClick = btnCancelClick
  end
end
