object frmOrder: TfrmOrder
  Left = 0
  Top = 0
  ClientHeight = 219
  ClientWidth = 263
  Caption = #1057#1095#1077#1090' '#1085#1072' '#1086#1087#1083#1072#1091
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  TextHeight = 15
  object btnSave: TUniButton
    Left = 169
    Top = 176
    Width = 86
    Height = 25
    Hint = ''
    Caption = #1057#1086#1079#1076#1072#1090#1100
    TabOrder = 0
    OnClick = btnSaveClick
  end
  object chkDelivery: TUniCheckBox
    Left = 8
    Top = 102
    Width = 97
    Height = 17
    Hint = ''
    Checked = True
    Caption = #1044#1086#1089#1090#1072#1074#1082#1072
    TabOrder = 1
  end
  object chkDepos: TUniCheckBox
    Left = 8
    Top = 63
    Width = 97
    Height = 17
    Hint = ''
    Checked = True
    Caption = #1047#1072#1083#1086#1075
    TabOrder = 2
  end
  object chkRental: TUniCheckBox
    Left = 8
    Top = 24
    Width = 97
    Height = 17
    Hint = ''
    Checked = True
    Caption = #1040#1088#1077#1085#1076#1072
    TabOrder = 3
  end
  object lbl: TUniLabel
    Left = 125
    Top = 8
    Width = 70
    Height = 13
    Hint = ''
    Caption = #1050#1086#1083'-'#1074#1086' '#1089#1091#1090#1086#1082':'
    TabOrder = 4
  end
  object edtCountPeriod: TUniNumberEdit
    Left = 125
    Top = 27
    Width = 92
    Hint = ''
    TabOrder = 5
    DecimalSeparator = ','
    OnChange = edtCountPeriodChange
  end
  object chkDeliveryOut: TUniCheckBox
    Left = 8
    Top = 142
    Width = 97
    Height = 17
    Hint = ''
    Checked = True
    Caption = #1042#1099#1074#1086#1079
    TabOrder = 6
  end
end
