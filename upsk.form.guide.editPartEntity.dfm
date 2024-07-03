object frmEditEntity: TfrmEditEntity
  Left = 0
  Top = 0
  ClientHeight = 610
  ClientWidth = 659
  Caption = #1070#1088'. '#1051#1080#1094#1086
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  TextHeight = 15
  object btnAddPhoneEn: TUniButton
    Left = 604
    Top = 390
    Width = 38
    Height = 25
    Hint = ''
    Caption = '+'
    TabOrder = 0
    OnClick = btnAddPhoneEnClick
  end
  object cmbBasesContract: TUniComboBox
    Left = 323
    Top = 79
    Width = 275
    Hint = ''
    Text = ''
    TabOrder = 1
    IconItems = <>
  end
  object cmbInFace: TUniComboBox
    Left = 323
    Top = 28
    Width = 275
    Hint = ''
    Text = ''
    TabOrder = 2
    IconItems = <>
  end
  object edtAdress: TUniEdit
    Left = 19
    Top = 175
    Width = 286
    Hint = ''
    Text = ''
    TabOrder = 3
  end
  object edtAdressMail: TUniEdit
    Left = 19
    Top = 223
    Width = 426
    Hint = ''
    Text = ''
    TabOrder = 4
  end
  object edtContractNumber: TUniEdit
    Left = 19
    Top = 278
    Width = 158
    Hint = ''
    Text = ''
    TabOrder = 5
  end
  object edtEmail: TUniEdit
    Left = 288
    Top = 334
    Width = 245
    Hint = ''
    Text = ''
    TabOrder = 6
  end
  object edtFioManager: TUniEdit
    Left = 19
    Top = 79
    Width = 286
    Hint = ''
    Text = ''
    TabOrder = 7
  end
  object edtInn: TUniEdit
    Left = 199
    Top = 278
    Width = 158
    Hint = ''
    Text = ''
    TabOrder = 8
  end
  object edtKpp: TUniEdit
    Left = 375
    Top = 278
    Width = 158
    Hint = ''
    Text = ''
    TabOrder = 9
  end
  object edtOgrn: TUniEdit
    Left = 19
    Top = 334
    Width = 254
    Hint = ''
    Text = ''
    TabOrder = 10
  end
  object edtPartnerName: TUniEdit
    Left = 19
    Top = 28
    Width = 286
    Hint = ''
    Text = ''
    TabOrder = 11
  end
  object edtPhoneEn: TUniEdit
    Left = 450
    Top = 393
    Width = 148
    Hint = ''
    Text = ''
    TabOrder = 12
  end
  object gbPartnerBank: TUniGroupBox
    Left = 19
    Top = 377
    Width = 262
    Height = 225
    Hint = ''
    Caption = #1041#1072#1085#1089#1082#1086#1074#1089#1082#1080#1077' '#1088#1077#1082#1074#1080#1079#1080#1090#1099
    TabOrder = 13
    object edtBankName: TUniEdit
      Left = 11
      Top = 43
      Width = 222
      Hint = ''
      Text = ''
      TabOrder = 1
    end
    object lbl12114: TUniLabel
      Left = 12
      Top = 24
      Width = 116
      Height = 13
      Hint = ''
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1073#1072#1085#1082#1072
      TabOrder = 2
    end
    object edtPaymentAcc: TUniEdit
      Left = 12
      Top = 91
      Width = 222
      Hint = ''
      Text = ''
      TabOrder = 3
    end
    object lbl121141: TUniLabel
      Left = 13
      Top = 72
      Width = 33
      Height = 13
      Hint = ''
      Caption = #1056'/'#1089#1095#1077#1090
      TabOrder = 4
    end
    object edtCorrAcc: TUniEdit
      Left = 13
      Top = 146
      Width = 222
      Hint = ''
      Text = ''
      TabOrder = 5
    end
    object lbl1211411: TUniLabel
      Left = 13
      Top = 119
      Width = 47
      Height = 13
      Hint = ''
      Caption = #1050#1086#1088'/'#1089#1095#1077#1090
      TabOrder = 6
    end
    object edtBik: TUniEdit
      Left = 12
      Top = 193
      Width = 222
      Hint = ''
      Text = ''
      TabOrder = 7
    end
    object lbl12114111: TUniLabel
      Left = 13
      Top = 174
      Width = 20
      Height = 13
      Hint = ''
      Caption = #1041#1048#1050
      TabOrder = 8
    end
  end
  object lbl12: TUniLabel
    Left = 19
    Top = 9
    Width = 72
    Height = 13
    Hint = ''
    Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
    TabOrder = 14
  end
  object lbl121: TUniLabel
    Left = 19
    Top = 60
    Width = 264
    Height = 13
    Hint = ''
    Caption = #1060'.'#1048'.'#1054'. '#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1103'/'#1087#1086#1076#1087#1080#1089#1072#1085#1090#1072'('#1048#1084#1077#1085#1080#1090#1077#1083#1100#1085#1099#1081')'
    TabOrder = 15
  end
  object lbl1211: TUniLabel
    Left = 19
    Top = 259
    Width = 146
    Height = 13
    Hint = ''
    Caption = #1057#1074#1080#1076#1077#1090#1077#1083#1100#1089#1090#1074#1086'('#1044#1086#1075#1086#1074#1086#1088' '#8470')'
    TabOrder = 16
  end
  object lbl12111: TUniLabel
    Left = 19
    Top = 156
    Width = 125
    Height = 13
    Hint = ''
    Caption = #1070#1088' '#1072#1076#1088#1077#1089' '#1086#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
    TabOrder = 17
  end
  object lbl12112: TUniLabel
    Left = 19
    Top = 204
    Width = 88
    Height = 13
    Hint = ''
    Caption = #1055#1086#1095#1090#1086#1074#1099#1081' '#1072#1076#1088#1077#1089
    TabOrder = 18
  end
  object lbl12113: TUniLabel
    Left = 199
    Top = 259
    Width = 24
    Height = 13
    Hint = ''
    Caption = #1048#1053#1053
    TabOrder = 19
  end
  object lbl121131: TUniLabel
    Left = 375
    Top = 259
    Width = 22
    Height = 13
    Hint = ''
    Caption = #1050#1055#1055
    TabOrder = 20
  end
  object lbl121132: TUniLabel
    Left = 19
    Top = 315
    Width = 28
    Height = 13
    Hint = ''
    Caption = #1054#1043#1056#1053
    TabOrder = 21
  end
  object lbl1211321: TUniLabel
    Left = 288
    Top = 315
    Width = 105
    Height = 13
    Hint = ''
    Caption = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1072#1103' '#1087#1086#1095#1090#1072
    TabOrder = 22
  end
  object lbl13: TUniLabel
    Left = 323
    Top = 9
    Width = 35
    Height = 13
    Hint = ''
    Caption = #1042' '#1083#1080#1094#1077
    TabOrder = 23
  end
  object lbl131: TUniLabel
    Left = 323
    Top = 60
    Width = 152
    Height = 13
    Hint = ''
    Caption = #1044#1077#1081#1089#1090#1074#1091#1102#1097#1080#1081' '#1085#1072' '#1086#1089#1085#1086#1074#1072#1085#1080#1080
    TabOrder = 24
  end
  object lblPhone: TUniLabel
    Left = 450
    Top = 374
    Width = 92
    Height = 13
    Hint = ''
    Caption = #1053#1086#1084#1077#1088' '#1058#1077#1083#1077#1092#1086#1085#1072
    TabOrder = 25
  end
  object lbPhoneEn: TUniListBox
    Left = 307
    Top = 421
    Width = 335
    Height = 124
    Hint = ''
    TabOrder = 26
  end
  object edtName: TUniEdit
    Left = 307
    Top = 393
    Width = 137
    Hint = ''
    Text = ''
    TabOrder = 27
  end
  object lblName: TUniLabel
    Left = 307
    Top = 374
    Width = 22
    Height = 13
    Hint = ''
    Caption = #1048#1084#1103
    TabOrder = 28
  end
  object btnAccept: TUniButton
    Left = 442
    Top = 562
    Width = 97
    Height = 40
    Hint = ''
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 29
    OnClick = btnAcceptClick
  end
  object btnCancel: TUniButton
    Left = 545
    Top = 562
    Width = 97
    Height = 40
    Hint = ''
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 30
  end
  object edtAttorney: TUniEdit
    Left = 323
    Top = 175
    Width = 275
    Hint = ''
    Text = ''
    TabOrder = 31
  end
  object UniLabel1: TUniLabel
    Left = 323
    Top = 156
    Width = 99
    Height = 13
    Hint = ''
    Caption = #1044#1086#1074#1077#1088#1088#1077#1085#1085#1086#1089#1090#1100' '#8470
    TabOrder = 32
  end
  object chkNds: TUniCheckBox
    Left = 307
    Top = 570
    Width = 97
    Height = 17
    Hint = ''
    Caption = #1057' '#1053#1044#1057
    TabOrder = 33
  end
  object edtFioR: TUniEdit
    Left = 19
    Top = 127
    Width = 286
    Hint = ''
    Text = ''
    TabOrder = 34
  end
  object lbl1212: TUniLabel
    Left = 19
    Top = 108
    Width = 254
    Height = 13
    Hint = ''
    Caption = #1060'.'#1048'.'#1054'. '#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1103'/'#1087#1086#1076#1087#1080#1089#1072#1085#1090#1072'('#1056#1086#1076#1080#1090#1077#1083#1100#1085#1099#1081')'
    TabOrder = 35
  end
  object edtFioIO: TUniEdit
    Left = 323
    Top = 127
    Width = 286
    Hint = ''
    Text = ''
    TabOrder = 36
  end
  object lbl12121: TUniLabel
    Left = 323
    Top = 108
    Width = 253
    Height = 13
    Hint = ''
    Caption = #1060'.'#1048'.'#1054'. '#1088#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1103'/'#1087#1086#1076#1087#1080#1089#1072#1085#1090#1072'('#1060#1072#1084#1080#1083#1080#1103' '#1048' '#1054')'
    TabOrder = 37
  end
end
