object frmEditPart: TfrmEditPart
  Left = 0
  Top = 0
  ClientHeight = 382
  ClientWidth = 697
  Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  TextHeight = 15
  object btnAddPhone: TUniButton
    Left = 651
    Top = 166
    Width = 38
    Height = 25
    Hint = ''
    Caption = '+'
    TabOrder = 0
    OnClick = btnAddPhoneClick
  end
  object dtBirthday: TUniDateTimePicker
    Left = 323
    Top = 28
    Width = 120
    Hint = ''
    DateTime = 44979.000000000000000000
    DateFormat = 'dd.MM.yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 1
  end
  object edtFio: TUniEdit
    Left = 19
    Top = 28
    Width = 286
    Hint = ''
    Text = ''
    TabOrder = 2
  end
  object edtPhone: TUniEdit
    Left = 508
    Top = 169
    Width = 137
    Hint = ''
    Text = ''
    TabOrder = 3
  end
  object edtPLaceBirth: TUniEdit
    Left = 459
    Top = 28
    Width = 166
    Hint = ''
    Text = ''
    TabOrder = 4
  end
  object gbPassport: TUniGroupBox
    Left = 19
    Top = 169
    Width = 326
    Height = 177
    Hint = ''
    Caption = #1055#1072#1089#1087#1086#1088#1090
    TabOrder = 5
    object edtPassNum: TUniEdit
      Left = 138
      Top = 44
      Width = 166
      Hint = ''
      Text = ''
      TabOrder = 1
    end
    object edtPassSer: TUniEdit
      Left = 11
      Top = 44
      Width = 102
      Hint = ''
      Text = ''
      TabOrder = 2
    end
    object lbl111: TUniLabel
      Left = 11
      Top = 25
      Width = 33
      Height = 13
      Hint = ''
      Caption = 'C'#1077#1088#1080#1103
      TabOrder = 3
    end
    object lbl112: TUniLabel
      Left = 138
      Top = 25
      Width = 36
      Height = 13
      Hint = ''
      Caption = #1053#1086#1084#1077#1088
      TabOrder = 4
    end
    object edtIssued: TUniEdit
      Left = 11
      Top = 92
      Width = 290
      Hint = ''
      Text = ''
      TabOrder = 5
    end
    object UniLabel1: TUniLabel
      Left = 11
      Top = 72
      Width = 56
      Height = 13
      Hint = ''
      Caption = #1050#1077#1084' '#1074#1099#1076#1072#1085
      TabOrder = 6
    end
    object edtAdressReg: TUniEdit
      Left = 14
      Top = 139
      Width = 290
      Hint = ''
      Text = ''
      TabOrder = 7
    end
    object UniLabel2: TUniLabel
      Left = 11
      Top = 120
      Width = 103
      Height = 13
      Hint = ''
      Caption = #1040#1076#1088#1077#1089' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
      TabOrder = 8
    end
  end
  object lbl1: TUniLabel
    Left = 19
    Top = 9
    Width = 117
    Height = 13
    Hint = ''
    Caption = #1060'.'#1048'.'#1054'('#1048#1084#1077#1085#1080#1090#1077#1083#1100#1085#1099#1081')'
    TabOrder = 6
  end
  object lbl11: TUniLabel
    Left = 459
    Top = 9
    Width = 91
    Height = 13
    Hint = ''
    Caption = #1052#1077#1089#1090#1086' '#1088#1086#1078#1076#1077#1085#1080#1103
    TabOrder = 7
  end
  object lbl2: TUniLabel
    Left = 323
    Top = 9
    Width = 83
    Height = 13
    Hint = ''
    Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103
    TabOrder = 8
  end
  object lbPhone: TUniListBox
    Left = 360
    Top = 197
    Width = 329
    Height = 124
    Hint = ''
    TabOrder = 9
  end
  object UniLabel3: TUniLabel
    Left = 508
    Top = 150
    Width = 92
    Height = 13
    Hint = ''
    Caption = #1053#1086#1084#1077#1088' '#1058#1077#1083#1077#1092#1086#1085#1072
    TabOrder = 10
  end
  object btnAccept: TUniButton
    Left = 480
    Top = 327
    Width = 97
    Height = 40
    Hint = ''
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 11
    OnClick = btnAcceptClick
  end
  object btnCancel: TUniButton
    Left = 592
    Top = 327
    Width = 97
    Height = 40
    Hint = ''
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 12
    OnClick = btnCancelClick
  end
  object edtName: TUniEdit
    Left = 360
    Top = 169
    Width = 142
    Hint = ''
    Text = ''
    TabOrder = 13
  end
  object lbl3: TUniLabel
    Left = 360
    Top = 150
    Width = 22
    Height = 13
    Hint = ''
    Caption = #1048#1084#1103
    TabOrder = 14
  end
  object edtInFace: TUniEdit
    Left = 19
    Top = 125
    Width = 286
    Hint = ''
    Text = ''
    TabOrder = 15
  end
  object lbl12: TUniLabel
    Left = 19
    Top = 106
    Width = 36
    Height = 13
    Hint = ''
    Caption = #1042' '#1051#1080#1094#1077
    TabOrder = 16
  end
  object edtFioR: TUniEdit
    Left = 19
    Top = 75
    Width = 286
    Hint = ''
    Text = ''
    TabOrder = 17
  end
  object lbl13: TUniLabel
    Left = 19
    Top = 56
    Width = 107
    Height = 13
    Hint = ''
    Caption = #1060'.'#1048'.'#1054'('#1056#1086#1076#1080#1090#1077#1083#1100#1085#1099#1081')'
    TabOrder = 18
  end
  object edtFioIO: TUniEdit
    Left = 323
    Top = 75
    Width = 286
    Hint = ''
    Text = ''
    TabOrder = 19
  end
  object lbl131: TUniLabel
    Left = 323
    Top = 56
    Width = 103
    Height = 13
    Hint = ''
    Caption = #1060'.'#1048'.'#1054'('#1060#1072#1084#1080#1083#1080#1103' '#1048#1054')'
    TabOrder = 20
  end
end
