object frmReqCalcLrsp200: TfrmReqCalcLrsp200
  Left = 0
  Top = 0
  ClientHeight = 754
  ClientWidth = 1243
  Caption = #1056#1072#1089#1095#1077#1090#1099
  BorderStyle = bsSingle
  WindowState = wsMaximized
  OldCreateOrder = False
  OnClose = UniFormClose
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  TextHeight = 15
  object gridPosition: TUniDBGrid
    Left = 0
    Top = 430
    Width = 1243
    Height = 223
    Hint = ''
    DataSource = dsPosition
    WebOptions.Paged = False
    LoadMask.Message = 'Loading data...'
    Align = alBottom
    TabOrder = 0
    OnMouseDown = gridPositionMouseDown
    OnSetCellValue = gridPositionSetCellValue
    Columns = <
      item
        FieldName = 'id'
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 64
      end
      item
        FieldName = 'PositionName'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 250
        Editor = cmbPosition
      end
      item
        FieldName = 'remains'
        Title.Caption = #1053#1072' '#1089#1082#1083#1072#1076#1077
        Width = 100
        ReadOnly = True
      end
      item
        FieldName = 'calc_count'
        Title.Caption = #1056#1072#1089#1095#1077#1090'. '#1082#1086#1083'-'#1074#1086
        Width = 130
        ReadOnly = True
      end
      item
        FieldName = 'add_count'
        Title.Caption = #1044#1086#1087' '#1082#1086#1083'-'#1074#1086
        Width = 100
      end
      item
        FieldName = 'all_count'
        Title.Caption = #1042#1089#1077#1075#1086
        Width = 80
        ReadOnly = True
      end
      item
        FieldName = 'price_unit'
        Title.Caption = #1062#1077#1085#1072' '#1079#1072' '#1077#1076'.'#1080#1079#1084
        Width = 130
      end
      item
        FieldName = 'amount'
        Title.Caption = #1057#1091#1084#1084#1072
        Width = 100
      end
      item
        Title.Caption = ' '
        Width = 64
        Visible = False
      end>
  end
  object pnlBot: TUniPanel
    Left = 0
    Top = 653
    Width = 1243
    Height = 42
    Hint = ''
    Align = alBottom
    TabOrder = 1
    Caption = ''
    ExplicitTop = 652
    ExplicitWidth = 1239
    object btnAddPos: TUniButton
      Left = 17
      Top = 6
      Width = 39
      Height = 25
      Hint = ''
      Caption = '+'
      ParentFont = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Height = -19
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      TabOrder = 1
      OnClick = btnAddPosClick
    end
    object btnDelPos: TUniButton
      Left = 62
      Top = 6
      Width = 39
      Height = 25
      Hint = ''
      Caption = '-'
      ParentFont = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Height = -19
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      TabOrder = 2
      OnClick = btnDelPosClick
    end
    object lblВ: TUniLabel
      Left = 582
      Top = 6
      Width = 212
      Height = 25
      Hint = ''
      Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1082#1086#1084#1087#1083#1077#1082#1090#1072':'
      ParentFont = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Height = -19
      Font.Style = [fsBold]
      TabOrder = 3
    end
    object lblPosAmount: TUniLabel
      Left = 800
      Top = 6
      Width = 11
      Height = 25
      Hint = ''
      Caption = '0'
      ParentFont = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Height = -19
      Font.Style = [fsBold]
      TabOrder = 4
    end
  end
  object cmbPart: TUniComboBox
    Left = 8
    Top = 176
    Width = 313
    Hint = ''
    Text = ''
    TabOrder = 2
    IconItems = <>
  end
  object rgPart: TUniRadioGroup
    Left = 8
    Top = 46
    Width = 129
    Height = 56
    Hint = ''
    Items.Strings = (
      #1060#1048#1047
      #1070#1056)
    Caption = #1058#1080#1087
    TabOrder = 3
    Columns = 2
    OnClick = rgPartClick
    OnChangeValue = rgPartChangeValue
  end
  object lbl1: TUniLabel
    Left = 8
    Top = 157
    Width = 61
    Height = 13
    Hint = ''
    Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
    TabOrder = 4
  end
  object cmbOrgan: TUniComboBox
    Left = 8
    Top = 129
    Width = 313
    Hint = ''
    Text = ''
    TabOrder = 5
    IconItems = <>
    OnChange = cmbOrganChange
  end
  object lbl11: TUniLabel
    Left = 8
    Top = 110
    Width = 72
    Height = 13
    Hint = ''
    Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
    TabOrder = 6
  end
  object pnlTop: TUniPanel
    Left = 0
    Top = 0
    Width = 1243
    Height = 40
    Hint = ''
    Align = alTop
    TabOrder = 7
    Caption = ''
    ExplicitWidth = 1239
    object dtReq: TUniDateTimePicker
      Left = 317
      Top = 5
      Width = 177
      Hint = ''
      DateTime = 45033.467688750000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 1
      DateMode = dtmDateTime
    end
    object edtNumberReq: TUniEdit
      Left = 62
      Top = 8
      Width = 121
      Hint = ''
      Text = '0'
      TabOrder = 2
      ReadOnly = True
    end
    object lbl2: TUniLabel
      Left = 8
      Top = 5
      Width = 48
      Height = 21
      Hint = ''
      Caption = #1053#1086#1084#1077#1088
      ParentFont = False
      Font.Height = -16
      TabOrder = 3
    end
    object lblDtReq: TUniLabel
      Left = 208
      Top = 5
      Width = 95
      Height = 21
      Hint = ''
      Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103
      ParentFont = False
      Font.Height = -16
      TabOrder = 4
    end
  end
  object lbl3: TUniLabel
    Left = 409
    Top = 48
    Width = 146
    Height = 13
    Hint = ''
    Caption = #1042#1093#1086#1076#1103#1097#1080#1081' '#1085#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072
    TabOrder = 8
  end
  object edtClientPhone: TUniEdit
    Left = 407
    Top = 67
    Width = 217
    Hint = ''
    Text = ''
    TabOrder = 9
  end
  object mmoComment: TUniMemo
    Left = 407
    Top = 167
    Width = 217
    Height = 69
    Hint = ''
    TabOrder = 10
  end
  object lbl4: TUniLabel
    Left = 407
    Top = 148
    Width = 74
    Height = 13
    Hint = ''
    Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
    TabOrder = 11
  end
  object gbSection: TUniGroupBox
    Left = 8
    Top = 204
    Width = 377
    Height = 187
    Hint = ''
    Caption = #1057#1077#1082#1094#1080#1080
    TabOrder = 12
    object pnlSection: TUniPanel
      Left = 2
      Top = 143
      Width = 373
      Height = 42
      Hint = ''
      Align = alBottom
      TabOrder = 1
      Caption = ''
      object btnAddSection: TUniButton
        Left = 3
        Top = 6
        Width = 43
        Height = 25
        Hint = ''
        Caption = '+'
        ParentFont = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Height = -19
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        TabOrder = 1
        OnClick = btnAddSectionClick
      end
      object btnDelSection: TUniButton
        Left = 52
        Top = 6
        Width = 39
        Height = 25
        Hint = ''
        Caption = '-'
        ParentFont = False
        Font.Charset = RUSSIAN_CHARSET
        Font.Height = -19
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        TabOrder = 2
        OnClick = btnDelSectionClick
      end
    end
    object gridSection: TUniDBGrid
      Left = 2
      Top = 15
      Width = 373
      Height = 128
      Hint = ''
      DataSource = dsSection
      WebOptions.Paged = False
      LoadMask.Message = 'Loading data...'
      Align = alClient
      TabOrder = 2
      OnSetCellValue = gridSectionSetCellValue
      Columns = <
        item
          FieldName = 'number'
          Title.Caption = ' '#1053#1086#1084#1077#1088
          Width = 60
          ReadOnly = True
        end
        item
          FieldName = 'Width'
          Title.Caption = #1044#1083#1080#1085#1072
          Width = 60
        end
        item
          FieldName = 'Heigth'
          Title.Caption = ' '#1042#1099#1089#1086#1090#1072
          Width = 60
        end
        item
          FieldName = 'info'
          Title.Caption = #1048#1085#1092#1086'.'
          Width = 100
          ReadOnly = True
          DisplayMemo = True
        end
        item
          FieldName = 'All'
          Title.Caption = #1054#1073#1097'.'
          Width = 60
        end>
    end
  end
  object lbl5: TUniLabel
    Left = 0
    Top = 417
    Width = 77
    Height = 13
    Hint = ''
    Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072
    Align = alBottom
    TabOrder = 13
    ExplicitTop = 416
  end
  object lbl31: TUniLabel
    Left = 407
    Top = 242
    Width = 105
    Height = 13
    Hint = ''
    Caption = #1057#1088#1086#1082' '#1072#1088#1077#1085#1076#1099' ('#1076#1085#1077#1081')'
    TabOrder = 14
  end
  object edtRentalPeriod: TUniEdit
    Left = 407
    Top = 261
    Width = 217
    Hint = ''
    Text = ''
    TabOrder = 15
    OnChange = edtRentalPeriodChange
  end
  object cmbDiscount: TUniComboBox
    Left = 1018
    Top = 381
    Width = 217
    Hint = ''
    Visible = False
    Style = csDropDownList
    Text = ''
    TabOrder = 16
    IconItems = <>
    OnChange = cmbDiscountChange
  end
  object lbl32: TUniLabel
    Left = 1020
    Top = 362
    Width = 95
    Height = 13
    Hint = ''
    Visible = False
    Caption = #1057#1082#1080#1076#1082#1080'/'#1053#1072#1076#1073#1072#1074#1082#1080
    TabOrder = 17
  end
  object gbHelpReq: TUniGroupBox
    Left = 640
    Top = 48
    Width = 361
    Height = 150
    Hint = ''
    Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' '#1076#1083#1103' '#1088#1072#1089#1095#1077#1090#1072
    TabOrder = 18
    object lbl6: TUniLabel
      Left = 19
      Top = 19
      Width = 87
      Height = 13
      Hint = ''
      Caption = #1054#1073#1097#1072#1103' '#1087#1083#1086#1097#1072#1076#1100
      TabOrder = 1
    end
    object lbl7: TUniLabel
      Left = 35
      Top = 38
      Width = 69
      Height = 13
      Hint = ''
      Caption = #1042#1077#1089' '#1082#1086#1087#1083#1077#1082#1090#1072
      TabOrder = 2
    end
    object lbl8: TUniLabel
      Left = 19
      Top = 57
      Width = 88
      Height = 13
      Hint = ''
      Caption = #1050#1086#1083'-'#1074#1086' '#1085#1072#1089#1090#1080#1083#1086#1074
      TabOrder = 3
    end
    object lbl9: TUniLabel
      Left = 11
      Top = 76
      Width = 95
      Height = 13
      Hint = ''
      Caption = #1050#1086#1083'-'#1074#1086' '#1073#1086#1096#1084#1072#1082#1086#1074
      TabOrder = 4
    end
    object lbl10: TUniLabel
      Left = 43
      Top = 103
      Width = 65
      Height = 13
      Hint = ''
      Caption = #1057#1090'-'#1090#1100' 1 '#1082#1074'.'#1084'.'
      TabOrder = 5
    end
    object lbl12: TUniLabel
      Left = 35
      Top = 122
      Width = 72
      Height = 13
      Hint = ''
      Caption = #1057#1090'-'#1090#1100' '#1085#1072#1089#1090#1080#1083#1072
      TabOrder = 6
    end
    object lblSquare: TUniLabel
      Left = 147
      Top = 19
      Width = 35
      Height = 13
      Hint = ''
      Caption = '0 '#1082#1074'.'#1084'.'
      TabOrder = 7
    end
    object lblWeigth: TUniLabel
      Left = 147
      Top = 38
      Width = 23
      Height = 13
      Hint = ''
      Caption = '0 '#1082#1075'.'
      TabOrder = 8
    end
    object lblFlooring: TUniLabel
      Left = 147
      Top = 57
      Width = 26
      Height = 13
      Cursor = crHandPoint
      Hint = ''
      Caption = '0 '#1096#1090'.'
      TabOrder = 9
      OnClick = lblFlooringClick
    end
    object lblShoes: TUniLabel
      Left = 147
      Top = 76
      Width = 26
      Height = 13
      Cursor = crHandPoint
      Hint = ''
      Caption = '0 '#1096#1090'.'
      TabOrder = 10
      OnClick = lblShoesClick
    end
    object lblCalcOne: TUniLabel
      Left = 147
      Top = 103
      Width = 63
      Height = 13
      Hint = ''
      Caption = '0 '#1088#1091#1073'./'#1089#1091#1090#1082#1080
      TabOrder = 11
    end
    object lblCalcFlooring: TUniLabel
      Left = 147
      Top = 122
      Width = 63
      Height = 13
      Hint = ''
      Caption = '0 '#1088#1091#1073'./'#1089#1091#1090#1082#1080
      TabOrder = 12
    end
  end
  object gbCalcResult: TUniGroupBox
    Left = 640
    Top = 204
    Width = 361
    Height = 199
    Hint = ''
    Caption = #1056#1072#1089#1095#1077#1090#1099'/'#1048#1090#1086#1075#1086#1074#1099#1077' '#1076#1072#1085#1085#1099#1077
    TabOrder = 19
    object UniLabel1: TUniLabel
      Left = 19
      Top = 19
      Width = 100
      Height = 13
      Hint = ''
      Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1072#1088#1077#1085#1076#1099
      TabOrder = 1
    end
    object UniLabel2: TUniLabel
      Left = 11
      Top = 38
      Width = 102
      Height = 13
      Hint = ''
      Caption = #1057#1091#1084#1084#1072' '#1079#1072' '#1074#1077#1089#1100' '#1089#1088#1086#1082
      TabOrder = 2
    end
    object UniLabel3: TUniLabel
      Left = 3
      Top = 57
      Width = 113
      Height = 13
      Hint = ''
      Caption = #1047#1072#1083#1086#1075#1086#1074#1072#1103' '#1089#1090#1086#1080#1084#1086#1089#1090#1100
      TabOrder = 3
    end
    object UniLabel4: TUniLabel
      Left = 67
      Top = 76
      Width = 49
      Height = 13
      Hint = ''
      Caption = #1044#1086#1089#1090#1072#1074#1082#1072
      TabOrder = 4
    end
    object UniLabel5: TUniLabel
      Left = 91
      Top = 112
      Width = 25
      Height = 13
      Hint = ''
      Caption = #1048#1090#1086#1075
      TabOrder = 5
    end
    object lblRent: TUniLabel
      Left = 147
      Top = 19
      Width = 63
      Height = 13
      Hint = ''
      Caption = '0 '#1088#1091#1073'./'#1089#1091#1090#1082#1080
      TabOrder = 6
    end
    object lblAmountPeriod: TUniLabel
      Left = 147
      Top = 38
      Width = 31
      Height = 13
      Hint = ''
      Caption = '0 '#1088#1091#1073'.'
      TabOrder = 7
    end
    object lblCollateralValue: TUniLabel
      Left = 147
      Top = 57
      Width = 31
      Height = 13
      Hint = ''
      Caption = '0 '#1088#1091#1073'.'
      TabOrder = 8
    end
    object lblShiping: TUniLabel
      Left = 147
      Top = 76
      Width = 31
      Height = 13
      Hint = ''
      Caption = '0 '#1088#1091#1073'.'
      TabOrder = 9
    end
    object lblAmount: TUniLabel
      Left = 147
      Top = 111
      Width = 31
      Height = 13
      Hint = ''
      Caption = '0 '#1088#1091#1073'.'
      TabOrder = 10
    end
    object UniLabel6: TUniLabel
      Left = 5
      Top = 153
      Width = 119
      Height = 13
      Hint = ''
      Caption = #1055#1088#1086#1094#1077#1085#1090' '#1086#1082#1091#1087#1072#1077#1084#1086#1089#1090#1080
      TabOrder = 11
    end
    object UniLabel7: TUniLabel
      Left = 12
      Top = 134
      Width = 112
      Height = 13
      Hint = ''
      Caption = #1056#1077#1082#1086#1084#1077#1085#1076#1091#1077#1084#1072#1103' '#1094#1077#1085#1072
      TabOrder = 12
    end
    object lblPrice: TUniLabel
      Left = 146
      Top = 134
      Width = 31
      Height = 13
      Hint = ''
      Caption = '0 '#1088#1091#1073'.'
      TabOrder = 13
    end
    object lblProc: TUniLabel
      Left = 146
      Top = 153
      Width = 31
      Height = 13
      Cursor = crIBeam
      Hint = 'payback'
      Caption = '0 '#1088#1091#1073'.'
      TabOrder = 14
      OnClick = lblProcClick
    end
    object lbl15: TUniLabel
      Left = 83
      Top = 93
      Width = 32
      Height = 13
      Hint = ''
      Caption = #1042#1099#1074#1086#1079
      TabOrder = 15
    end
    object lblDeliveryOut: TUniLabel
      Left = 147
      Top = 93
      Width = 31
      Height = 13
      Hint = ''
      Caption = '0 '#1088#1091#1073'.'
      TabOrder = 16
    end
  end
  object unhdnpnl1: TUniHiddenPanel
    Left = 948
    Top = 261
    Width = 324
    Height = 313
    Hint = ''
    Visible = True
    object cmbPosition: TUniComboBox
      Left = 35
      Top = 57
      Width = 273
      Hint = ''
      Text = 'cmbPosition'
      TabOrder = 1
      IconItems = <>
    end
    object btnAddBackage: TUniButton
      Left = 263
      Top = 90
      Width = 48
      Height = 25
      Hint = ''
      Visible = False
      Caption = '+'
      ParentFont = False
      Font.Height = -16
      Font.Style = [fsBold]
      TabOrder = 2
      OnClick = btnAddBackageClick
    end
    object cmbPackage: TUniComboBox
      Left = 24
      Top = 93
      Width = 233
      Hint = ''
      Visible = False
      Text = ''
      TabOrder = 3
      IconItems = <>
      OnKeyDown = cmbPackageKeyDown
    end
    object lbl13: TUniLabel
      Left = 24
      Top = 102
      Width = 51
      Height = 13
      Hint = ''
      Visible = False
      Caption = #1050#1086#1084#1087#1083#1077#1082#1090
      ParentColor = False
      Color = clWindow
      TabOrder = 4
    end
  end
  object lbl311: TUniLabel
    Left = 407
    Top = 287
    Width = 49
    Height = 13
    Cursor = crHandPoint
    Hint = ''
    Caption = #1044#1086#1089#1090#1072#1074#1082#1072
    TabOrder = 21
    OnClick = lbl311Click
  end
  object cmbRegion: TUniComboBox
    Left = 191
    Top = 77
    Width = 192
    Hint = ''
    Style = csDropDownList
    Text = ''
    TabOrder = 22
    IconItems = <>
  end
  object lbl14: TUniLabel
    Left = 191
    Top = 58
    Width = 38
    Height = 13
    Hint = ''
    Caption = #1056#1077#1075#1080#1086#1085
    TabOrder = 23
  end
  object edtDelivary: TUniNumberEdit
    Left = 407
    Top = 306
    Width = 216
    Hint = ''
    TabOrder = 24
    DecimalSeparator = ','
    OnChange = edtDelivaryChange
  end
  object edtCountFlooring: TUniNumberEdit
    Left = 406
    Top = 400
    Width = 59
    Hint = ''
    TabOrder = 25
    DecimalSeparator = ','
    OnChange = edtCountFlooringChange
  end
  object unlbl11: TUniLabel
    Left = 409
    Top = 381
    Width = 50
    Height = 13
    Hint = ''
    Caption = #1053#1072#1089#1090#1080#1083#1086#1074
    TabOrder = 26
  end
  object gbDiscount: TUniGroupBox
    Left = 1019
    Top = 46
    Width = 216
    Height = 190
    Hint = ''
    Caption = #1053#1072#1076#1073#1072#1074#1082#1080'/'#1044#1080#1089#1082#1086#1085#1090
    TabOrder = 27
    object unlbl2: TUniLabel
      Left = 24
      Top = 32
      Width = 67
      Height = 13
      Hint = ''
      Caption = #1062#1077#1085#1072' '#1079#1072' 1'#1084'2.'
      TabOrder = 1
    end
    object unlbl3: TUniLabel
      Left = 24
      Top = 59
      Width = 79
      Height = 13
      Hint = ''
      Caption = #1040#1088#1077#1085#1076#1072' '#1074' '#1089#1091#1090#1082#1080
      TabOrder = 2
    end
    object unlbl4: TUniLabel
      Left = 24
      Top = 92
      Width = 37
      Height = 13
      Hint = ''
      Caption = #1047#1072#1083#1086#1075#1080
      TabOrder = 3
    end
    object unlbl5: TUniLabel
      Left = 24
      Top = 121
      Width = 37
      Height = 13
      Hint = ''
      Caption = #1053#1072#1089#1090#1080#1083
      TabOrder = 4
    end
    object lblAddPriceOneKv: TUniLabel
      Left = 121
      Top = 30
      Width = 6
      Height = 13
      Cursor = crIBeam
      Hint = ''
      Caption = '0'
      TabOrder = 5
      OnClick = lblAddPriceOneKvClick
    end
    object lblAddRental: TUniLabel
      Left = 121
      Top = 59
      Width = 6
      Height = 13
      Cursor = crIBeam
      Hint = ''
      Caption = '0'
      TabOrder = 6
      OnClick = lblAddRentalClick
    end
    object lblAddDepos: TUniLabel
      Left = 121
      Top = 92
      Width = 6
      Height = 13
      Cursor = crIBeam
      Hint = ''
      Caption = '0'
      TabOrder = 7
      OnClick = lblAddDeposClick
    end
    object lblAddFlooring: TUniLabel
      Left = 121
      Top = 124
      Width = 6
      Height = 13
      Cursor = crIBeam
      Hint = ''
      Caption = '0'
      TabOrder = 8
      OnClick = lblAddFlooringClick
    end
    object lblAddPrecent: TUniLabel
      Left = 121
      Top = 156
      Width = 3
      Height = 13
      Cursor = crIBeam
      Hint = ''
      Caption = ''
      TabOrder = 9
      OnClick = lblAddPrecentClick
    end
    object lbl16: TUniLabel
      Left = 24
      Top = 153
      Width = 48
      Height = 13
      Hint = ''
      Caption = '% '#1047#1072#1083#1086#1075#1072
      TabOrder = 10
    end
  end
  object pnlBtn: TUniPanel
    AlignWithMargins = True
    Left = 3
    Top = 698
    Width = 1237
    Height = 53
    Hint = ''
    Align = alBottom
    TabOrder = 28
    Caption = ''
    ExplicitTop = 697
    ExplicitWidth = 1233
    object btnSaveAndCreate: TUniButton
      Left = 1040
      Top = 7
      Width = 182
      Height = 35
      Hint = ''
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1089#1086#1079#1076#1072#1090#1100' '#1089#1076#1077#1083#1082#1091
      Align = alCustom
      TabOrder = 1
      OnClick = btnSaveAndCreateClick
    end
    object btnSave: TUniButton
      Left = 927
      Top = 3
      Width = 107
      Height = 35
      Hint = ''
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Align = alCustom
      TabOrder = 2
      OnClick = btnSaveClick
    end
  end
  object btnEditOrg: TUniButton
    Left = 327
    Top = 124
    Width = 25
    Height = 25
    Hint = ''
    Caption = '...'
    TabOrder = 29
    OnClick = btnEditOrgClick
  end
  object btnAddOrg: TUniButton
    Left = 358
    Top = 124
    Width = 25
    Height = 25
    Hint = ''
    Caption = '+'
    TabOrder = 30
    OnClick = btnAddOrgClick
  end
  object btnEditPart: TUniButton
    Left = 327
    Top = 173
    Width = 25
    Height = 25
    Hint = ''
    Caption = '...'
    TabOrder = 31
    OnClick = btnEditPartClick
  end
  object btnAddPart: TUniButton
    Left = 358
    Top = 173
    Width = 25
    Height = 25
    Hint = ''
    Caption = '+'
    TabOrder = 32
    OnClick = btnAddPartClick
  end
  object edtAdressObject: TUniEdit
    Left = 407
    Top = 115
    Width = 217
    Hint = ''
    Text = ''
    TabOrder = 33
  end
  object lbl33: TUniLabel
    Left = 409
    Top = 96
    Width = 78
    Height = 13
    Hint = ''
    Caption = #1040#1076#1088#1077#1089' '#1086#1073#1098#1077#1082#1090#1072
    TabOrder = 34
  end
  object edtDelivaryOut: TUniNumberEdit
    Left = 408
    Top = 353
    Width = 216
    Hint = ''
    TabOrder = 35
    DecimalSeparator = ','
    OnChange = edtDelivaryOutChange
  end
  object lbl3111: TUniLabel
    Left = 406
    Top = 334
    Width = 32
    Height = 13
    Hint = ''
    Caption = #1042#1099#1074#1086#1079
    TabOrder = 36
  end
  object lbl17: TUniLabel
    Left = 474
    Top = 381
    Width = 44
    Height = 13
    Hint = ''
    Caption = #1051#1077#1089#1090#1085#1080#1094
    TabOrder = 37
  end
  object edtCountLadder: TUniNumberEdit
    Left = 471
    Top = 400
    Width = 59
    Hint = ''
    TabOrder = 38
    DecimalSeparator = ','
    OnChange = edtCountLadderChange
  end
  object popPosition: TUniPopupMenu
    Left = 40
    Top = 504
    object miN1: TUniMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    end
    object miN2: TUniMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
    end
  end
  object clPosition: TClientDataSet
    PersistDataPacket.Data = {
      C30000009619E0BD010000001800000009000000000003000000C30002696404
      000100000000000C506F736974696F6E4E616D65010049000000010005574944
      544802000200C8000772656D61696E7308000400000000000A63616C635F636F
      756E740800040000000000096164645F636F756E74080004000000000009616C
      6C5F636F756E7408000400000000000A70726963655F756E6974080004000000
      000006616D6F756E7408000400000000000B706F736974696F6E5F6964040001
      00000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'PositionName'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'remains'
        DataType = ftFloat
      end
      item
        Name = 'calc_count'
        DataType = ftFloat
      end
      item
        Name = 'add_count'
        DataType = ftFloat
      end
      item
        Name = 'all_count'
        DataType = ftFloat
      end
      item
        Name = 'price_unit'
        DataType = ftFloat
      end
      item
        Name = 'amount'
        DataType = ftFloat
      end
      item
        Name = 'position_id'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 336
    Top = 512
    object fldPositionid: TIntegerField
      FieldName = 'id'
    end
    object fldPositionPositionName: TStringField
      FieldName = 'PositionName'
      Size = 200
    end
    object fltfldPositionremains: TFloatField
      FieldName = 'remains'
    end
    object fltfldPositioncalc_count: TFloatField
      FieldName = 'calc_count'
    end
    object fltfldPositionadd_count: TFloatField
      FieldName = 'add_count'
    end
    object fltfldPositionall_count: TFloatField
      FieldName = 'all_count'
    end
    object fltfldPositionprice_unit: TFloatField
      FieldName = 'price_unit'
    end
    object fltfldPositionamount: TFloatField
      FieldName = 'amount'
    end
    object fldPositionposition_id: TIntegerField
      FieldName = 'position_id'
    end
    object clPositionrow_id: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'row_id'
      Calculated = True
    end
  end
  object dsPosition: TUniDataSource
    DataSet = clPosition
    Left = 456
    Top = 512
  end
  object dsSection: TUniDataSource
    DataSet = clSection
    Left = 328
    Top = 352
  end
  object clSection: TClientDataSet
    PersistDataPacket.Data = {
      770000009619E0BD0100000018000000050000000000030000007700066E756D
      6265720400010000000000055769647468080004000000000006486569677468
      080004000000000004696E666F01004900000001000557494454480200020014
      0003416C6C01004900000001000557494454480200020014000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'number'
        DataType = ftInteger
      end
      item
        Name = 'Width'
        DataType = ftFloat
      end
      item
        Name = 'Heigth'
        DataType = ftFloat
      end
      item
        Name = 'info'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'All'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 264
    Top = 352
    object intgrfldSectionnumber: TIntegerField
      FieldName = 'number'
    end
    object fltfldSectionWidth: TFloatField
      FieldName = 'Width'
    end
    object fltfldSectionHeigth: TFloatField
      FieldName = 'Heigth'
    end
    object clSectioninfo: TStringField
      FieldName = 'info'
    end
    object strngfldSectionAll: TStringField
      FieldName = 'All'
    end
  end
end
