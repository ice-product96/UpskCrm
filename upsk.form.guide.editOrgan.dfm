object frmEditOrgan: TfrmEditOrgan
  Left = 0
  Top = 0
  ClientHeight = 501
  ClientWidth = 379
  Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  TextHeight = 15
  object edtName: TUniEdit
    Left = 8
    Top = 27
    Width = 361
    Hint = ''
    Text = ''
    TabOrder = 0
  end
  object lbl1: TUniLabel
    Left = 8
    Top = 8
    Width = 81
    Height = 13
    Hint = ''
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    TabOrder = 1
  end
  object btnCancel: TUniButton
    Left = 294
    Top = 458
    Width = 75
    Height = 25
    Hint = ''
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 2
  end
  object btnAccept: TUniButton
    Left = 200
    Top = 458
    Width = 75
    Height = 25
    Hint = ''
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 3
    OnClick = btnAcceptClick
  end
  object lblNds: TUniLabel
    Left = 214
    Top = 248
    Width = 38
    Height = 13
    Hint = ''
    Caption = #1053#1044#1057'(%)'
    TabOrder = 4
  end
  object edtNds: TUniNumberEdit
    Left = 214
    Top = 267
    Width = 97
    Hint = ''
    TabOrder = 5
    DecimalSeparator = ','
  end
  object edtInFace: TUniEdit
    Left = 8
    Top = 75
    Width = 361
    Hint = ''
    Text = ''
    TabOrder = 6
  end
  object lbl11: TUniLabel
    Left = 8
    Top = 56
    Width = 35
    Height = 13
    Hint = ''
    Caption = #1042' '#1083#1080#1094#1077
    TabOrder = 7
  end
  object edtFioManager: TUniEdit
    Left = 8
    Top = 123
    Width = 361
    Hint = ''
    Text = ''
    TabOrder = 8
  end
  object lbl111: TUniLabel
    Left = 8
    Top = 103
    Width = 53
    Height = 13
    Hint = ''
    Caption = #1044#1080#1088#1077#1082#1090#1086#1088
    TabOrder = 9
  end
  object edten_adress: TUniEdit
    Left = 8
    Top = 171
    Width = 361
    Hint = ''
    Text = ''
    TabOrder = 10
  end
  object lbl1111: TUniLabel
    Left = 8
    Top = 151
    Width = 54
    Height = 13
    Hint = ''
    Caption = #1070#1088'. '#1072#1076#1088#1077#1089
    TabOrder = 11
  end
  object edtInn: TUniEdit
    Left = 8
    Top = 267
    Width = 97
    Hint = ''
    Text = ''
    TabOrder = 12
  end
  object lbl11111: TUniLabel
    Left = 8
    Top = 247
    Width = 24
    Height = 13
    Hint = ''
    Caption = #1048#1053#1053
    TabOrder = 13
  end
  object edtKPP: TUniEdit
    Left = 111
    Top = 266
    Width = 97
    Hint = ''
    Text = ''
    TabOrder = 14
  end
  object lbl111111: TUniLabel
    Left = 111
    Top = 247
    Width = 22
    Height = 13
    Hint = ''
    Caption = #1050#1055#1055
    TabOrder = 15
  end
  object edtOgrn: TUniEdit
    Left = 8
    Top = 315
    Width = 361
    Hint = ''
    Text = ''
    TabOrder = 16
  end
  object lbl1111111: TUniLabel
    Left = 8
    Top = 295
    Width = 28
    Height = 13
    Hint = ''
    Caption = #1054#1043#1056#1053
    TabOrder = 17
  end
  object edtMailAdress: TUniEdit
    Left = 8
    Top = 219
    Width = 361
    Hint = ''
    Text = ''
    TabOrder = 18
  end
  object lbl11112: TUniLabel
    Left = 8
    Top = 199
    Width = 88
    Height = 13
    Hint = ''
    Caption = #1055#1086#1095#1090#1086#1074#1099#1081' '#1072#1076#1088#1077#1089
    TabOrder = 19
  end
  object edtBankName: TUniEdit
    Left = 8
    Top = 371
    Width = 153
    Hint = ''
    Text = ''
    TabOrder = 20
  end
  object lbl111112: TUniLabel
    Left = 8
    Top = 351
    Width = 116
    Height = 13
    Hint = ''
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1073#1072#1085#1082#1072
    TabOrder = 21
  end
  object edtBankBik: TUniEdit
    Left = 216
    Top = 371
    Width = 153
    Hint = ''
    Text = ''
    TabOrder = 22
  end
  object lbl1111112: TUniLabel
    Left = 216
    Top = 351
    Width = 55
    Height = 13
    Hint = ''
    Caption = #1041#1048#1050' '#1073#1072#1085#1082#1072
    TabOrder = 23
  end
  object edtRorder: TUniEdit
    Left = 8
    Top = 419
    Width = 153
    Hint = ''
    Text = ''
    TabOrder = 24
  end
  object lbl1111121: TUniLabel
    Left = 8
    Top = 399
    Width = 68
    Height = 13
    Hint = ''
    Caption = #1053#1086#1084#1077#1088' '#1089#1095#1077#1090#1072
    TabOrder = 25
  end
  object edtKordder: TUniEdit
    Left = 216
    Top = 419
    Width = 153
    Hint = ''
    Text = ''
    TabOrder = 26
  end
  object lbl11111121: TUniLabel
    Left = 216
    Top = 399
    Width = 94
    Height = 13
    Hint = ''
    Caption = #1053#1086#1084#1077#1088' '#1082#1086#1088'. '#1089#1095#1077#1090#1072
    TabOrder = 27
  end
  object edtEmail: TUniEdit
    Left = 8
    Top = 471
    Width = 153
    Hint = ''
    Text = ''
    TabOrder = 28
  end
  object lbl11111211: TUniLabel
    Left = 8
    Top = 451
    Width = 33
    Height = 13
    Hint = ''
    Caption = #1055#1086#1095#1090#1072
    TabOrder = 29
  end
end
