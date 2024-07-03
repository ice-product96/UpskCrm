object frmEditDriver: TfrmEditDriver
  Left = 0
  Top = 0
  ClientHeight = 85
  ClientWidth = 323
  Caption = #1042#1086#1076#1080#1090#1077#1083#1100
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  TextHeight = 15
  object edtFio: TUniEdit
    Left = 8
    Top = 24
    Width = 297
    Hint = ''
    Text = ''
    TabOrder = 0
  end
  object btnAcceprt: TUniButton
    Left = 230
    Top = 52
    Width = 75
    Height = 25
    Hint = ''
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
    OnClick = btnAcceprtClick
  end
  object lbl1: TUniLabel
    Left = 8
    Top = 8
    Width = 33
    Height = 13
    Hint = ''
    Caption = #1060'.'#1048'.'#1054'.'
    TabOrder = 2
  end
end
