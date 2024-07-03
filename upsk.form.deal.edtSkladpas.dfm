object frmEditPosSklad: TfrmEditPosSklad
  Left = 0
  Top = 0
  ClientHeight = 420
  ClientWidth = 820
  Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  TextHeight = 15
  object gridPos: TUniDBGrid
    Left = 0
    Top = 0
    Width = 820
    Height = 304
    Hint = ''
    DataSource = dsPosition
    WebOptions.Paged = False
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 0
    Columns = <
      item
        FieldName = 'Name'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 250
        ReadOnly = True
      end
      item
        FieldName = 'remains'
        Title.Caption = #1054#1089#1090#1072#1090#1086#1082' '#1085#1072' '#1089#1082#1083#1072#1076#1077
        Width = 150
        ReadOnly = True
      end
      item
        FieldName = 'count'
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Width = 150
      end>
  end
  object pnlBot: TUniPanel
    Left = 0
    Top = 304
    Width = 820
    Height = 116
    Hint = ''
    Align = alBottom
    TabOrder = 1
    Caption = ''
    ExplicitTop = 303
    ExplicitWidth = 677
    object btnAccept: TUniButton
      Left = 678
      Top = 80
      Width = 75
      Height = 25
      Hint = ''
      Caption = #1055#1088#1080#1085#1103#1090#1100
      TabOrder = 1
      OnClick = btnAcceptClick
    end
    object dtOper: TUniDateTimePicker
      Left = 12
      Top = 14
      Width = 106
      Hint = ''
      DateTime = 45125.515101446760000000
      DateFormat = 'dd.MM.yyyy'
      TimeFormat = 'HH'
      TabOrder = 2
      DateMode = dtmDateTime
    end
    object chkAktOut: TUniCheckBox
      Left = 12
      Top = 42
      Width = 126
      Height = 17
      Hint = ''
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      TabOrder = 3
      OnChange = chkAktOutChange
    end
    object mmoComment: TUniMemo
      Left = 347
      Top = 22
      Width = 234
      Height = 91
      Hint = ''
      Enabled = False
      TabOrder = 4
    end
    object lbl1: TUniLabel
      Left = 347
      Top = 6
      Width = 108
      Height = 13
      Hint = ''
      Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081' '#1082' '#1072#1082#1090#1091
      TabOrder = 5
    end
    object rgDoc: TUniRadioGroup
      Left = 144
      Top = 16
      Width = 185
      Height = 97
      Hint = ''
      Enabled = False
      Items.Strings = (
        #1040#1082#1090' - '#1074#1086#1079#1074#1088#1072#1090#1072
        #1040#1082#1090' - '#1085#1077#1074#1086#1079#1074#1088#1072#1090#1072
        #1056#1077#1089#1090#1086#1074#1088#1072#1094#1080#1103)
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090
      TabOrder = 6
    end
  end
  object cdPosition: TClientDataSet
    PersistDataPacket.Data = {
      700000009619E0BD010000001800000005000000000003000000700002696404
      00010000000000044E616D65010049000000010005574944544802000200C800
      0772656D61696E73080004000000000005636F756E7408000400000000000B70
      6F736974696F6E5F696404000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'Name'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'remains'
        DataType = ftFloat
      end
      item
        Name = 'count'
        DataType = ftFloat
      end
      item
        Name = 'position_id'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 672
    Top = 311
    object intgrfldPositionid: TIntegerField
      FieldName = 'id'
    end
    object strngfldPositionPositionName: TStringField
      FieldName = 'Name'
      Size = 200
    end
    object fltfldPositionremains: TFloatField
      FieldName = 'remains'
    end
    object fltfldPositioncalc_count: TFloatField
      FieldName = 'count'
    end
    object intgrfldPositionposition_id: TIntegerField
      FieldName = 'position_id'
    end
  end
  object dsPosition: TUniDataSource
    DataSet = cdPosition
    Left = 728
    Top = 311
  end
end
