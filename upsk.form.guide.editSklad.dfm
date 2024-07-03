object frmEditSklad: TfrmEditSklad
  Left = 0
  Top = 0
  ClientHeight = 100
  ClientWidth = 293
  Caption = #1057#1082#1083#1072#1076
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  TextHeight = 15
  object edtName: TUniEdit
    Left = 8
    Top = 24
    Width = 273
    Hint = ''
    Text = ''
    TabOrder = 0
  end
  object btnAccept: TUniButton
    Left = 86
    Top = 52
    Width = 90
    Height = 35
    Hint = ''
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    Default = True
    OnClick = btnAcceptClick
  end
  object btnCancel: TUniButton
    Left = 191
    Top = 52
    Width = 90
    Height = 35
    Hint = ''
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    Default = True
    OnClick = btnCancelClick
  end
  object lbl1: TUniLabel
    Left = 8
    Top = 8
    Width = 81
    Height = 13
    Hint = ''
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    TabOrder = 3
  end
end
