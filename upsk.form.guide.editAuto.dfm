object frmEditAuto: TfrmEditAuto
  Left = 0
  Top = 0
  ClientHeight = 92
  ClientWidth = 373
  Caption = #1040#1074#1090#1086#1084#1086#1073#1080#1083#1100
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  TextHeight = 15
  object edtAuto: TUniEdit
    Left = 8
    Top = 24
    Width = 355
    Hint = ''
    Text = ''
    TabOrder = 0
  end
  object btnAccept: TUniButton
    Left = 290
    Top = 59
    Width = 75
    Height = 25
    Hint = ''
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
    OnClick = btnAcceptClick
  end
  object lbl1: TUniLabel
    Left = 8
    Top = 8
    Width = 78
    Height = 13
    Hint = ''
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1072#1074#1090#1086
    TabOrder = 2
  end
end
