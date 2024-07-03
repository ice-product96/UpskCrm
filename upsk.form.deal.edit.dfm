object frmEditDeal: TfrmEditDeal
  Left = 0
  Top = 0
  ClientHeight = 583
  ClientWidth = 464
  Caption = ''
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  TextHeight = 15
  object lbl1: TUniLabel
    Left = 8
    Top = 32
    Width = 25
    Height = 13
    Hint = ''
    Caption = #1044#1072#1090#1072
    TabOrder = 0
  end
  object dtDateDeal: TUniDateTimePicker
    Left = 8
    Top = 51
    Width = 120
    Hint = ''
    DateTime = 45082.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 1
  end
  object lbl2: TUniLabel
    Left = 144
    Top = 32
    Width = 47
    Height = 13
    Hint = ''
    Caption = #1044#1086#1075#1086#1074#1086#1088
    TabOrder = 2
  end
  object lbl3: TUniLabel
    Left = 8
    Top = 136
    Width = 82
    Height = 13
    Hint = ''
    Caption = #1057#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1103
    TabOrder = 3
  end
  object edtContract: TUniEdit
    Left = 144
    Top = 51
    Width = 154
    Hint = ''
    Text = ''
    TabOrder = 4
    ReadOnly = True
  end
  object edtSpec: TUniEdit
    Left = 8
    Top = 155
    Width = 193
    Hint = ''
    Text = ''
    TabOrder = 5
    ReadOnly = True
  end
  object lbl31: TUniLabel
    Left = 8
    Top = 88
    Width = 78
    Height = 13
    Hint = ''
    Caption = #1040#1076#1088#1077#1089' '#1086#1073#1098#1077#1082#1090#1072
    TabOrder = 6
  end
  object edtAdress: TUniEdit
    Left = 8
    Top = 107
    Width = 210
    Hint = ''
    Text = ''
    TabOrder = 7
    OnChange = edtAdressChange
  end
  object lbl32: TUniLabel
    Left = 304
    Top = 32
    Width = 101
    Height = 13
    Hint = ''
    Caption = #1058#1080#1087' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
    TabOrder = 8
  end
  object edtReqCalcType: TUniEdit
    Left = 304
    Top = 51
    Width = 121
    Hint = ''
    Text = ''
    TabOrder = 9
    ReadOnly = True
  end
  object dtRentalStart: TUniDateTimePicker
    Left = 8
    Top = 251
    Width = 120
    Hint = ''
    DateTime = 45082.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 10
    OnChange = dtRentalStartChange
  end
  object lbl11: TUniLabel
    Left = 8
    Top = 232
    Width = 83
    Height = 13
    Hint = ''
    Caption = #1053#1072#1095#1072#1083#1086' '#1072#1088#1077#1085#1076#1099
    TabOrder = 11
  end
  object dtRentalStop: TUniDateTimePicker
    Left = 144
    Top = 251
    Width = 120
    Hint = ''
    DateTime = 45082.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 12
    OnChange = dtRentalStopChange
  end
  object lbl12: TUniLabel
    Left = 144
    Top = 232
    Width = 105
    Height = 13
    Hint = ''
    Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1072#1088#1077#1085#1076#1099
    TabOrder = 13
  end
  object gbChk: TUniGroupBox
    Left = 8
    Top = 326
    Width = 320
    Height = 153
    Hint = ''
    Caption = #1044#1072#1085#1085#1099#1077
    TabOrder = 14
    object chkPay: TUniCheckBox
      Left = 16
      Top = 16
      Width = 145
      Height = 17
      Hint = ''
      Caption = #1054#1087#1083#1072#1090#1072
      TabOrder = 1
    end
    object chkCopyContract: TUniCheckBox
      Left = 16
      Top = 39
      Width = 145
      Height = 17
      Hint = ''
      Caption = #1057#1082#1072#1085' '#1076#1086#1075#1086#1074#1086#1088#1072
      TabOrder = 2
    end
    object chkOrigContract: TUniCheckBox
      Left = 16
      Top = 62
      Width = 145
      Height = 17
      Hint = ''
      Caption = #1054#1088#1080#1075#1080#1085#1072#1083' '#1076#1086#1075#1086#1074#1086#1088#1072
      TabOrder = 3
    end
    object chkDevice: TUniCheckBox
      Left = 16
      Top = 85
      Width = 249
      Height = 17
      Hint = ''
      Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077' '#1089#1076#1072#1085#1086
      TabOrder = 4
    end
    object chkUpd: TUniCheckBox
      Left = 16
      Top = 108
      Width = 145
      Height = 17
      Hint = ''
      Caption = #1059#1087#1076'/'#1040#1082#1090#1099' '#1089#1082#1072#1085
      TabOrder = 5
    end
    object chkOrigUpd: TUniCheckBox
      Left = 175
      Top = 16
      Width = 145
      Height = 17
      Hint = ''
      Caption = #1059#1087#1076'/'#1040#1082#1090#1099' '#1086#1088#1080#1075#1080#1085#1072#1083
      TabOrder = 6
    end
    object chkPayDeposit: TUniCheckBox
      Left = 175
      Top = 39
      Width = 145
      Height = 17
      Hint = ''
      Caption = #1047#1072#1083#1086#1075' '#1074#1099#1076#1072#1085
      TabOrder = 7
    end
  end
  object btnSaveDeal: TUniButton
    Left = 367
    Top = 550
    Width = 89
    Height = 25
    Hint = ''
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 15
    OnClick = btnSaveDealClick
  end
  object btnMenu: TUniButton
    Left = 423
    Top = 1
    Width = 33
    Height = 25
    Hint = ''
    Caption = '...'
    TabOrder = 16
    OnClick = btnMenuClick
  end
  object edtAkt: TUniEdit
    Left = 207
    Top = 155
    Width = 121
    Hint = ''
    Text = ''
    TabOrder = 17
    ReadOnly = True
  end
  object lbl33: TUniLabel
    Left = 207
    Top = 136
    Width = 18
    Height = 13
    Hint = ''
    Caption = #1040#1082#1090
    TabOrder = 18
  end
  object edtAktBack: TUniEdit
    Left = 8
    Top = 204
    Width = 121
    Hint = ''
    Text = ''
    TabOrder = 19
    ReadOnly = True
  end
  object lbl331: TUniLabel
    Left = 8
    Top = 185
    Width = 72
    Height = 13
    Hint = ''
    Caption = #1040#1082#1090'('#1042#1086#1079#1074#1088#1072#1090#1072')'
    TabOrder = 20
  end
  object btnGetDoc: TUniButton
    Left = 103
    Top = 1
    Width = 88
    Height = 25
    Hint = ''
    Caption = #1055#1077#1095#1072#1090#1100' '#1076#1086#1082'.'
    TabOrder = 21
    OnClick = btnGetDocClick
  end
  object btnDocumets: TUniButton
    Left = 8
    Top = 1
    Width = 75
    Height = 25
    Hint = ''
    Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
    TabOrder = 22
    OnClick = btnDocumetsClick
  end
  object gbSklad: TUniGroupBox
    Left = 8
    Top = 488
    Width = 233
    Height = 65
    Hint = ''
    Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
    TabOrder = 23
    object btnArrivalPos: TUniButton
      Left = 129
      Top = 24
      Width = 88
      Height = 25
      Hint = ''
      Caption = #1042#1086#1079#1074#1088#1072#1090
      TabOrder = 1
      OnClick = btnArrivalPosClick
    end
    object btnExpensePos: TUniButton
      Left = 3
      Top = 24
      Width = 89
      Height = 25
      Hint = ''
      Caption = #1054#1090#1075#1088#1091#1079#1082#1072
      TabOrder = 2
      OnClick = btnExpensePosClick
    end
  end
  object lblAmount: TUniLabel
    Left = 334
    Top = 388
    Width = 112
    Height = 13
    Hint = ''
    Caption = #1057#1091#1084#1084#1072'  '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1081':'
    TabOrder = 24
  end
  object lblAmountIn: TUniLabel
    Left = 334
    Top = 407
    Width = 31
    Height = 13
    Hint = ''
    Caption = '0 '#1088#1091#1073'.'
    TabOrder = 25
  end
  object btnArrival: TUniButton
    Left = 8
    Top = 279
    Width = 121
    Height = 25
    Hint = ''
    Caption = #1042#1085#1077#1089#1090#1080' '#1086#1087#1083#1072#1090#1091
    TabOrder = 26
    OnClick = btnArrivalClick
  end
  object btnExpense: TUniButton
    Left = 144
    Top = 279
    Width = 120
    Height = 25
    Hint = ''
    Caption = #1042#1086#1079#1074#1088#1072#1090' '#1079#1072#1083#1086#1075#1072
    TabOrder = 27
  end
  object lblAmount1: TUniLabel
    Left = 334
    Top = 342
    Width = 76
    Height = 13
    Hint = ''
    Caption = #1057#1091#1084#1084#1072' '#1089#1076#1077#1083#1082#1080':'
    TabOrder = 28
  end
  object lblAmountDeal: TUniLabel
    Left = 334
    Top = 361
    Width = 31
    Height = 13
    Hint = ''
    Caption = '0 '#1088#1091#1073'.'
    TabOrder = 29
  end
  object lbld2: TUniLabel
    Left = 334
    Top = 426
    Width = 85
    Height = 13
    Hint = ''
    Caption = #1086#1087#1083#1072#1095#1077#1085#1086' '#1076#1085#1077#1081':'
    TabOrder = 30
  end
  object lblPayDay: TUniLabel
    Left = 334
    Top = 445
    Width = 30
    Height = 13
    Hint = ''
    Caption = '0 '#1080#1079' 0'
    TabOrder = 31
  end
  object btnEndDeal: TUniButton
    Left = 336
    Top = 512
    Width = 120
    Height = 25
    Hint = ''
    Caption = #1047#1072#1074#1077#1088#1096#1080#1090#1100' '#1072#1088#1077#1085#1076#1091
    TabOrder = 32
    OnClick = btnEndDealClick
  end
  object popMenu: TUniPopupMenu
    Alignment = paRight
    Left = 344
    Top = 88
    object unmntmN5: TUniMenuItem
      Caption = '________'#1057#1095#1077#1090'______'
      Enabled = False
    end
    object unmntmN23: TUniMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100
      OnClick = unmntmN23Click
    end
    object N1: TUniMenuItem
      Caption = '________'#1044#1086#1075#1086#1074#1086#1088'___________'
      Enabled = False
    end
    object unmntmN22: TUniMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100
      OnClick = unmntmN22Click
    end
    object unmntmN3: TUniMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
      OnClick = unmntmN3Click
    end
    object unmntmN1: TUniMenuItem
      Caption = '________'#1057#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1103'______'
      Enabled = False
    end
    object unmntmN2: TUniMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '
      OnClick = unmntmN2Click
    end
    object unmntmN4: TUniMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
      OnClick = unmntmN4Click
    end
    object unmntmN6: TUniMenuItem
      Caption = '________'#1040#1082#1090'_______________'
      Enabled = False
    end
    object unmntmN7: TUniMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100
      Visible = False
      OnClick = unmntmN7Click
    end
    object unmntmN8: TUniMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Visible = False
    end
    object unmntmN9: TUniMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
      OnClick = unmntmN9Click
    end
    object unmntmN10: TUniMenuItem
      Caption = '________'#1040#1082#1090' ('#1042#1086#1079#1074#1088#1072#1090#1072')______'
      Enabled = False
    end
    object unmntmN11: TUniMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100
      Visible = False
      OnClick = unmntmN11Click
    end
    object unmntmN12: TUniMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Visible = False
    end
    object unmntmN13: TUniMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
      OnClick = unmntmN13Click
    end
    object unmntmN14: TUniMenuItem
      Caption = '________'#1056#1072#1089#1093#1086#1076'.______'
      Enabled = False
      Visible = False
    end
    object unmntmN15: TUniMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100
      Visible = False
      OnClick = unmntmN15Click
    end
    object unmntmN16: TUniMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Visible = False
    end
    object unmntmN17: TUniMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
      Visible = False
    end
    object unmntmN18: TUniMenuItem
      Caption = '________'#1055#1088#1080#1093#1086#1076'.______'
      Enabled = False
      Visible = False
    end
    object unmntmN19: TUniMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100
      Visible = False
      OnClick = unmntmN19Click
    end
    object unmntmN20: TUniMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      Visible = False
    end
    object unmntmN21: TUniMenuItem
      Caption = #1055#1077#1095#1072#1090#1100
      Visible = False
    end
  end
end
