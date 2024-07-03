object frmEditPackage: TfrmEditPackage
  Left = 0
  Top = 0
  ClientHeight = 301
  ClientWidth = 434
  Caption = #1050#1086#1084#1087#1083#1077#1082#1090
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  TextHeight = 15
  object edtName: TUniEdit
    Left = 8
    Top = 24
    Width = 417
    Hint = ''
    Text = ''
    TabOrder = 0
  end
  object btnAdd: TUniButton
    Left = 8
    Top = 246
    Width = 41
    Height = 25
    Hint = ''
    Caption = '+'
    ParentFont = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Height = -19
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    TabOrder = 1
    OnClick = btnAddClick
  end
  object btnDelete: TUniButton
    Left = 55
    Top = 246
    Width = 34
    Height = 25
    Hint = ''
    Caption = '-'
    ParentFont = False
    Font.Charset = RUSSIAN_CHARSET
    Font.Height = -19
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    TabOrder = 2
    OnClick = btnDeleteClick
  end
  object btnAccept: TUniButton
    Left = 231
    Top = 246
    Width = 90
    Height = 35
    Hint = ''
    Caption = #1055#1088#1080#1085#1103#1090#1100
    TabOrder = 3
    Default = True
    OnClick = btnAcceptClick
  end
  object btnCancel: TUniButton
    Left = 336
    Top = 246
    Width = 90
    Height = 35
    Hint = ''
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 4
    Default = True
  end
  object gridPackage: TUniDBGrid
    Left = 8
    Top = 80
    Width = 417
    Height = 160
    Hint = ''
    DataSource = dsPackage
    WebOptions.Paged = False
    LoadMask.Message = 'Loading data...'
    TabOrder = 5
    OnSetCellValue = gridPackageSetCellValue
    Columns = <
      item
        FieldName = 'position_id'
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 64
        ReadOnly = True
      end
      item
        FieldName = 'position_name'
        Title.Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072
        Width = 200
        Editor = cmbPosition
      end>
  end
  object lbl1: TUniLabel
    Left = 8
    Top = 8
    Width = 81
    Height = 13
    Hint = ''
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    TabOrder = 6
  end
  object lbl2: TUniLabel
    Left = 8
    Top = 61
    Width = 51
    Height = 13
    Hint = ''
    Caption = #1050#1086#1084#1087#1083#1077#1082#1090
    TabOrder = 7
  end
  object unhdnpnl1: TUniHiddenPanel
    Left = 266
    Top = 88
    Width = 160
    Height = 69
    Hint = ''
    Visible = True
    object cmbPosition: TUniComboBox
      Left = 3
      Top = 24
      Width = 145
      Hint = ''
      Text = 'cmbPosition'
      TabOrder = 1
      IconItems = <>
    end
  end
  object dsPackage: TUniDataSource
    DataSet = clPackage
    Left = 208
    Top = 176
  end
  object clPackage: TClientDataSet
    PersistDataPacket.Data = {
      5B0000009619E0BD0100000018000000030000000000030000005B000B706F73
      6974696F6E5F696404000100000000000D706F736974696F6E5F6E616D650100
      49000000010005574944544802000200140002696404000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'position_id'
        DataType = ftInteger
      end
      item
        Name = 'position_name'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'id'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 120
    Top = 168
    object fldPackageposition_id: TIntegerField
      FieldName = 'position_id'
    end
    object fldPackageposition_name: TStringField
      FieldName = 'position_name'
    end
    object fldPackageid: TIntegerField
      FieldName = 'id'
    end
  end
end
