object frmEditPosition: TfrmEditPosition
  Left = 0
  Top = 0
  ClientHeight = 455
  ClientWidth = 399
  Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  TextHeight = 15
  object Label2: TUniLabel
    Left = 8
    Top = 11
    Width = 81
    Height = 13
    Hint = ''
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    TabOrder = 11
  end
  object Label3: TUniLabel
    Left = 8
    Top = 57
    Width = 54
    Height = 13
    Hint = ''
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    TabOrder = 12
  end
  object Label4: TUniLabel
    Left = 277
    Top = 10
    Width = 39
    Height = 13
    Hint = ''
    Caption = #1045#1076'.'#1048#1079#1084'.'
    TabOrder = 13
  end
  object Label5: TUniLabel
    Left = 277
    Top = 57
    Width = 8
    Height = 13
    Hint = ''
    Caption = #1044
    TabOrder = 14
  end
  object Label6: TUniLabel
    Left = 313
    Top = 57
    Width = 11
    Height = 13
    Hint = ''
    Caption = #1064
    TabOrder = 15
  end
  object Label7: TUniLabel
    Left = 356
    Top = 57
    Width = 6
    Height = 13
    Hint = ''
    Caption = #1042
    TabOrder = 16
  end
  object Label8: TUniLabel
    Left = 277
    Top = 103
    Width = 17
    Height = 13
    Hint = ''
    Caption = #1042#1077#1089
    TabOrder = 17
  end
  object Label9: TUniLabel
    Left = 8
    Top = 100
    Width = 51
    Height = 13
    Hint = ''
    Caption = #1047#1072#1082#1091#1087#1082#1072' '#8381
    TabOrder = 18
  end
  object Label10: TUniLabel
    Left = 135
    Top = 100
    Width = 71
    Height = 13
    Hint = ''
    Caption = #1055#1088#1086#1076#1072#1078#1085#1072#1103' '#8381
    TabOrder = 19
  end
  object Label11: TUniLabel
    Left = 135
    Top = 146
    Width = 95
    Height = 13
    Hint = ''
    Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1083#1077#1085#1080#1077' '#8381
    TabOrder = 20
  end
  object Label12: TUniLabel
    Left = 8
    Top = 146
    Width = 54
    Height = 13
    Hint = ''
    Caption = #1054#1095#1080#1089#1090#1082#1072' '#8381
    TabOrder = 21
  end
  object EditName: TUniEdit
    Left = 8
    Top = 30
    Width = 249
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 0
  end
  object EditDescription: TUniEdit
    Left = 8
    Top = 73
    Width = 249
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 1
  end
  object EditLength: TUniEdit
    Left = 262
    Top = 76
    Width = 37
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 2
  end
  object EditWidth: TUniEdit
    Left = 305
    Top = 76
    Width = 37
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 3
  end
  object EditHeight: TUniEdit
    Left = 348
    Top = 76
    Width = 37
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 4
  end
  object EditWeight: TUniEdit
    Left = 262
    Top = 119
    Width = 123
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 5
  end
  object EditBasePrice: TUniEdit
    Left = 8
    Top = 119
    Width = 121
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 6
  end
  object EditReleasePrice: TUniEdit
    Left = 135
    Top = 119
    Width = 121
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 7
  end
  object EditRecoveryPrice: TUniEdit
    Left = 135
    Top = 165
    Width = 121
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 8
  end
  object EditClearPrice: TUniEdit
    Left = 8
    Top = 165
    Width = 121
    Height = 21
    Hint = ''
    Text = ''
    TabOrder = 9
  end
  object btnAccept: TUniButton
    Left = 186
    Top = 413
    Width = 90
    Height = 35
    Hint = ''
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 10
    Default = True
    OnClick = btnAcceptClick
  end
  object btnCancel: TUniButton
    Left = 294
    Top = 413
    Width = 90
    Height = 35
    Hint = ''
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 22
    Default = True
    OnClick = btnCancelClick
  end
  object chrBasePrice: TUniChart
    Left = 8
    Top = 201
    Width = 377
    Height = 184
    Hint = ''
    LayoutConfig.BodyPadding = '10'
    TitleVisible = False
    object srlPrice: TUniLineSeries
      Colors.Strings = (
        '#0000FF'
        '#00FF00'
        '#FF0000'
        '#00FFFF'
        '#FFFF00'
        '#FF00FF')
      Title = #1062#1077#1085#1072
    end
  end
  object cmbUnit: TUniComboBox
    Left = 263
    Top = 29
    Width = 121
    Hint = ''
    Style = csDropDownList
    Text = ''
    TabOrder = 24
    IconItems = <>
  end
end
