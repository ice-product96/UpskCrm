object frmEditSpec: TfrmEditSpec
  Left = 0
  Top = 0
  ClientHeight = 117
  ClientWidth = 329
  Caption = #1057#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1103
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  TextHeight = 15
  object edtNumber: TUniEdit
    Left = 8
    Top = 32
    Width = 121
    Hint = ''
    Text = ''
    TabOrder = 0
  end
  object dtDate: TUniDateTimePicker
    Left = 144
    Top = 32
    Width = 120
    Hint = ''
    DateTime = 45093.000000000000000000
    DateFormat = 'dd/MM/yyyy'
    TimeFormat = 'HH:mm:ss'
    TabOrder = 1
  end
  object pnlBtn: TUniPanel
    AlignWithMargins = True
    Left = 3
    Top = 65
    Width = 323
    Height = 49
    Hint = ''
    Align = alBottom
    TabOrder = 2
    Caption = ''
    ExplicitTop = 64
    ExplicitWidth = 319
    object btnSave: TUniButton
      Left = 223
      Top = 12
      Width = 101
      Height = 25
      Hint = ''
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Align = alCustom
      TabOrder = 1
      OnClick = btnSaveClick
    end
    object btnViewContract: TUniButton
      Left = 98
      Top = 11
      Width = 119
      Height = 25
      Hint = ''
      Caption = #1055#1077#1095#1072#1090#1100
      Align = alCustom
      TabOrder = 2
      OnClick = btnViewContractClick
    end
  end
  object lbl1: TUniLabel
    Left = 8
    Top = 13
    Width = 39
    Height = 13
    Hint = ''
    Caption = #1053#1086#1084#1077#1088':'
    TabOrder = 3
  end
  object lbl2: TUniLabel
    Left = 144
    Top = 13
    Width = 28
    Height = 13
    Hint = ''
    Caption = #1044#1072#1090#1072':'
    TabOrder = 4
  end
end
