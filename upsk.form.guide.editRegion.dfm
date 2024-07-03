object frmEditRegion: TfrmEditRegion
  Left = 0
  Top = 0
  ClientHeight = 111
  ClientWidth = 397
  Caption = #1056#1077#1075#1080#1086#1085
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  TextHeight = 15
  object btnCancel: TUniButton
    Left = 294
    Top = 68
    Width = 90
    Height = 35
    Hint = ''
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 0
    Default = True
  end
  object btnAccept: TUniButton
    Left = 186
    Top = 68
    Width = 90
    Height = 35
    Hint = ''
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 1
    Default = True
    OnClick = btnAcceptClick
  end
  object edtName: TUniEdit
    Left = 8
    Top = 24
    Width = 185
    Hint = ''
    Text = ''
    TabOrder = 2
  end
  object edtKef: TUniNumberEdit
    Left = 199
    Top = 24
    Width = 60
    Hint = ''
    TabOrder = 3
    DecimalSeparator = ','
  end
  object UniLabel1: TUniLabel
    Left = 8
    Top = 8
    Width = 81
    Height = 13
    Hint = ''
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    TabOrder = 4
  end
  object UniLabel2: TUniLabel
    Left = 199
    Top = 8
    Width = 23
    Height = 13
    Hint = ''
    Caption = #1050#1101#1092'.'
    TabOrder = 5
  end
end
