object frmEditUser: TfrmEditUser
  Left = 0
  Top = 0
  ClientHeight = 270
  ClientWidth = 282
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  TextHeight = 15
  object edtFIO: TUniEdit
    Left = 8
    Top = 88
    Width = 257
    Hint = ''
    Text = ''
    TabOrder = 0
  end
  object lbl1: TUniLabel
    Left = 8
    Top = 69
    Width = 33
    Height = 13
    Hint = ''
    Caption = #1060'.'#1048'.'#1054'.'
    TabOrder = 1
  end
  object edtLogin: TUniEdit
    Left = 8
    Top = 40
    Width = 121
    Hint = ''
    Text = ''
    TabOrder = 2
  end
  object lbl11: TUniLabel
    Left = 8
    Top = 21
    Width = 33
    Height = 13
    Hint = ''
    Caption = #1051#1086#1075#1080#1085
    TabOrder = 3
  end
  object edtPass: TUniEdit
    Left = 144
    Top = 40
    Width = 121
    Hint = ''
    Text = ''
    TabOrder = 4
  end
  object lbl111: TUniLabel
    Left = 144
    Top = 21
    Width = 40
    Height = 13
    Hint = ''
    Caption = #1055#1072#1088#1086#1083#1100
    TabOrder = 5
  end
  object edtPost: TUniEdit
    Left = 8
    Top = 136
    Width = 257
    Hint = ''
    Text = ''
    TabOrder = 6
  end
  object lbl12: TUniLabel
    Left = 8
    Top = 117
    Width = 60
    Height = 13
    Hint = ''
    Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
    TabOrder = 7
  end
  object cmbPriority: TUniComboBox
    Left = 8
    Top = 184
    Width = 257
    Hint = ''
    Style = csDropDownList
    Text = ''
    TabOrder = 8
    IconItems = <>
  end
  object lbl13: TUniLabel
    Left = 8
    Top = 165
    Width = 37
    Height = 13
    Hint = ''
    Caption = #1044#1086#1089#1090#1091#1087
    TabOrder = 9
  end
  object btnAccept: TUniButton
    Left = 70
    Top = 228
    Width = 90
    Height = 35
    Hint = ''
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 10
    Default = True
    OnClick = btnAcceptClick
  end
  object btnCancel: TUniButton
    Left = 175
    Top = 228
    Width = 90
    Height = 35
    Hint = ''
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 11
    Default = True
    OnClick = btnCancelClick
  end
end
