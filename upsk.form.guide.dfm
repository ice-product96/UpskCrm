object frmGuide: TfrmGuide
  Left = 0
  Top = 0
  ClientHeight = 705
  ClientWidth = 1033
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
  Color = clWhite
  BorderStyle = bsDialog
  WindowState = wsMaximized
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  TextHeight = 15
  object pnlMenu: TUniPanel
    Left = 0
    Top = 0
    Width = 145
    Height = 705
    Hint = ''
    Align = alLeft
    TabOrder = 0
    Caption = ''
    Collapsed = True
    Color = 12285971
    ExplicitHeight = 704
    object lblPartEntity: TUniLabel
      AlignWithMargins = True
      Left = 4
      Top = 49
      Width = 137
      Height = 25
      Cursor = crHandPoint
      Hint = ''
      Margins.Top = 10
      Alignment = taCenter
      AutoSize = False
      Caption = #1070#1056'.'
      Align = alTop
      ParentFont = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Cambria'
      ParentColor = False
      Color = clWhite
      TabOrder = 1
      OnClick = lblPartEntityClick
    end
    object lblPartPerson: TUniLabel
      AlignWithMargins = True
      Left = 4
      Top = 11
      Width = 137
      Height = 25
      Cursor = crHandPoint
      Hint = ''
      Margins.Top = 10
      Alignment = taCenter
      AutoSize = False
      Caption = #1060#1048#1047'.'
      Align = alTop
      ParentFont = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Cambria'
      ParentColor = False
      Color = clWhite
      TabOrder = 2
      OnClick = lblPartPersonClick
    end
    object lblUsers: TUniLabel
      AlignWithMargins = True
      Left = 4
      Top = 201
      Width = 137
      Height = 25
      Cursor = crHandPoint
      Hint = ''
      Margins.Top = 10
      Alignment = taCenter
      AutoSize = False
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
      Align = alTop
      ParentFont = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Cambria'
      ParentColor = False
      Color = clWhite
      TabOrder = 3
      OnClick = lblUsersClick
    end
    object lblRegions: TUniLabel
      AlignWithMargins = True
      Left = 4
      Top = 87
      Width = 137
      Height = 25
      Cursor = crHandPoint
      Hint = ''
      Margins.Top = 10
      Alignment = taCenter
      AutoSize = False
      Caption = #1056#1077#1075#1080#1086#1085#1099
      Align = alTop
      ParentFont = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Cambria'
      ParentColor = False
      Color = clWhite
      TabOrder = 4
      OnClick = lblRegionsClick
    end
    object lblSklad: TUniLabel
      AlignWithMargins = True
      Left = 4
      Top = 239
      Width = 137
      Height = 25
      Cursor = crHandPoint
      Hint = ''
      Margins.Top = 10
      Alignment = taCenter
      AutoSize = False
      Caption = #1057#1082#1083#1072#1076#1099
      Align = alTop
      ParentFont = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Cambria'
      ParentColor = False
      Color = clWhite
      TabOrder = 5
      OnClick = lblSkladClick
    end
    object lblPosition: TUniLabel
      AlignWithMargins = True
      Left = 4
      Top = 125
      Width = 137
      Height = 25
      Cursor = crHandPoint
      Hint = ''
      Margins.Top = 10
      Alignment = taCenter
      AutoSize = False
      Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072
      Align = alTop
      ParentFont = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Cambria'
      ParentColor = False
      Color = clWhite
      TabOrder = 6
      OnClick = lblPositionClick
    end
    object lblKef: TUniLabel
      AlignWithMargins = True
      Left = 4
      Top = 277
      Width = 137
      Height = 25
      Cursor = crHandPoint
      Hint = ''
      Margins.Top = 10
      Alignment = taCenter
      AutoSize = False
      Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      Align = alTop
      ParentFont = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Cambria'
      ParentColor = False
      Color = clWhite
      TabOrder = 7
      OnClick = lblKefClick
    end
    object lblPackage: TUniLabel
      AlignWithMargins = True
      Left = 4
      Top = 163
      Width = 137
      Height = 25
      Cursor = crHandPoint
      Hint = ''
      Margins.Top = 10
      Alignment = taCenter
      AutoSize = False
      Caption = #1050#1086#1084#1087#1083#1077#1082#1090
      Align = alTop
      ParentFont = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Cambria'
      ParentColor = False
      Color = clWhite
      TabOrder = 8
      OnClick = lblPackageClick
    end
    object lblOrgan: TUniLabel
      AlignWithMargins = True
      Left = 4
      Top = 315
      Width = 137
      Height = 25
      Cursor = crHandPoint
      Hint = ''
      Margins.Top = 10
      Alignment = taCenter
      AutoSize = False
      Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1080
      Align = alTop
      ParentFont = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Cambria'
      ParentColor = False
      Color = clWhite
      TabOrder = 9
      OnClick = lblOrganClick
    end
    object lblDiscount: TUniLabel
      AlignWithMargins = True
      Left = 4
      Top = 353
      Width = 137
      Height = 25
      Cursor = crHandPoint
      Hint = ''
      Margins.Top = 10
      Alignment = taCenter
      AutoSize = False
      Caption = #1057#1082#1080#1076#1082#1080
      Align = alTop
      ParentFont = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Cambria'
      ParentColor = False
      Color = clWhite
      TabOrder = 10
      OnClick = lblDiscountClick
    end
    object lblDriver: TUniLabel
      AlignWithMargins = True
      Left = 4
      Top = 391
      Width = 137
      Height = 25
      Cursor = crHandPoint
      Hint = ''
      Margins.Top = 10
      Alignment = taCenter
      AutoSize = False
      Caption = #1042#1086#1076#1080#1090#1077#1083#1080
      Align = alTop
      ParentFont = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Cambria'
      ParentColor = False
      Color = clWhite
      TabOrder = 11
      OnClick = lblDriverClick
    end
    object lblAuto: TUniLabel
      AlignWithMargins = True
      Left = 4
      Top = 429
      Width = 137
      Height = 25
      Cursor = crHandPoint
      Hint = ''
      Margins.Top = 10
      Alignment = taCenter
      AutoSize = False
      Caption = #1040#1074#1090#1086
      Align = alTop
      ParentFont = False
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Cambria'
      ParentColor = False
      Color = clWhite
      TabOrder = 12
      OnClick = lblAutoClick
    end
  end
  object pcPages: TUniPageControl
    Left = 145
    Top = 0
    Width = 888
    Height = 705
    Hint = ''
    ActivePage = pgPartPerson
    TabBarVisible = False
    Align = alClient
    TabOrder = 1
    OnChangeValue = pcPagesChangeValue
    ExplicitWidth = 884
    ExplicitHeight = 704
    object pgPartPerson: TUniTabSheet
      Hint = ''
      Caption = 'pgPartPerson'
      ExplicitWidth = 876
      ExplicitHeight = 676
      object gridPersone: TUniDBGrid
        Left = 0
        Top = 0
        Width = 880
        Height = 677
        Hint = ''
        DataSource = dsPersone
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        OnMouseDown = gridPersoneMouseDown
        OnColumnFilter = gridColumnFilter
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 64
          end
          item
            FieldName = 'fio'
            Filtering.Enabled = True
            Filtering.Editor = edtFilterFio
            Title.Caption = #1060#1048#1054
            Width = 226
          end
          item
            FieldName = 'doc_serial'
            Filtering.Enabled = True
            Filtering.Editor = edtFilterSerial
            Title.Caption = #1057#1077#1088#1080#1103
            Width = 64
          end
          item
            FieldName = 'doc_number'
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 177
          end>
      end
      object UniHiddenPanel1: TUniHiddenPanel
        Left = 548
        Top = 380
        Width = 329
        Height = 256
        Hint = ''
        Visible = True
        object edtFilterFio: TUniEdit
          Left = 24
          Top = 40
          Width = 193
          Hint = ''
          Text = ''
          TabOrder = 1
        end
        object edtFilterSerial: TUniEdit
          Left = 24
          Top = 68
          Width = 193
          Hint = ''
          Text = ''
          TabOrder = 2
        end
      end
    end
    object pgPartEntity: TUniTabSheet
      Hint = ''
      Caption = 'pgPartEntity'
      ExplicitWidth = 876
      ExplicitHeight = 676
      object gridEntyti: TUniDBGrid
        Left = 0
        Top = 0
        Width = 880
        Height = 677
        Hint = ''
        DataSource = dsEntity
        WebOptions.PageSize = 50
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        OnMouseDown = gridEntytiMouseDown
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 64
          end
          item
            FieldName = 'name'
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 254
          end
          item
            FieldName = 'inn'
            Title.Caption = #1048#1053#1053
            Width = 133
          end>
      end
    end
    object pgRegion: TUniTabSheet
      Hint = ''
      Caption = 'pgRegion'
      ExplicitWidth = 876
      ExplicitHeight = 676
      object gridRegion: TUniDBGrid
        Left = 0
        Top = 0
        Width = 880
        Height = 677
        Hint = ''
        DataSource = dsRegion
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        OnMouseDown = gridRegionMouseDown
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 64
          end
          item
            FieldName = 'name'
            Title.Caption = ' '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 300
          end
          item
            FieldName = 'kef'
            Title.Caption = #1050#1086#1101#1092#1080#1094#1080#1077#1085#1090
            Width = 100
          end>
      end
    end
    object pgSklad: TUniTabSheet
      Hint = ''
      Caption = 'pgSklad'
      ExplicitWidth = 876
      ExplicitHeight = 676
      object gridSklad: TUniDBGrid
        Left = 0
        Top = 0
        Width = 880
        Height = 677
        Hint = ''
        DataSource = dsSklad
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        OnMouseDown = gridSkladMouseDown
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 64
          end
          item
            FieldName = 'name'
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 200
          end>
      end
    end
    object pgUsers: TUniTabSheet
      Hint = ''
      TabVisible = False
      Caption = 'pgUsers'
      ExplicitWidth = 876
      ExplicitHeight = 676
      object gridUsers: TUniDBGrid
        Left = 0
        Top = 0
        Width = 880
        Height = 677
        Hint = ''
        DataSource = dsUser
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        OnMouseDown = gridUsersMouseDown
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 64
          end
          item
            FieldName = 'fio'
            Title.Caption = #1060'.'#1048'.'#1054'.'
            Width = 200
          end
          item
            FieldName = 'post'
            Title.Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
            Width = 150
          end>
      end
    end
    object pgPosition: TUniTabSheet
      Hint = ''
      Caption = 'pgPosition'
      ExplicitWidth = 876
      ExplicitHeight = 676
      object gridPosition: TUniDBGrid
        Left = 0
        Top = 0
        Width = 880
        Height = 677
        Hint = ''
        DataSource = dsPosition
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        OnMouseDown = gridPositionMouseDown
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 64
          end
          item
            FieldName = 'name'
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 300
          end>
      end
    end
    object pgKef: TUniTabSheet
      Hint = ''
      Caption = 'pgKef'
      ExplicitWidth = 876
      ExplicitHeight = 676
      object gridKef: TUniDBGrid
        Left = 0
        Top = 0
        Width = 880
        Height = 677
        Hint = ''
        DataSource = dsKef
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        OnMouseDown = gridKefMouseDown
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 64
          end
          item
            FieldName = 'name'
            Title.Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072
            Width = 200
          end
          item
            FieldName = 'count'
            Title.Caption = #1050#1086#1083'-'#1074#1086
            Width = 80
          end
          item
            FieldName = 'day'
            Title.Caption = #1050#1086#1083'-'#1074#1086' '#1076#1085#1077#1081
            Width = 100
          end
          item
            FieldName = 'value'
            Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
            Width = 100
          end>
      end
    end
    object pgPackage: TUniTabSheet
      Hint = ''
      Caption = 'pgPackage'
      ExplicitWidth = 876
      ExplicitHeight = 676
      object gridPackage: TUniDBGrid
        Left = 0
        Top = 0
        Width = 880
        Height = 677
        Hint = ''
        DataSource = dsPackage
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        OnMouseDown = gridPackageMouseDown
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 64
          end
          item
            FieldName = 'name'
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 250
          end>
      end
    end
    object pgOrgan: TUniTabSheet
      Hint = ''
      Caption = 'pgOrgan'
      ExplicitWidth = 876
      ExplicitHeight = 676
      object gridOrgan: TUniDBGrid
        Left = 0
        Top = 0
        Width = 880
        Height = 677
        Hint = ''
        DataSource = dsOrgan
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        OnMouseDown = gridOrganMouseDown
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 64
          end
          item
            FieldName = 'name'
            Title.Caption = ' '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 200
          end>
      end
    end
    object pgDiscount: TUniTabSheet
      Hint = ''
      Caption = 'pgDiscount'
      ExplicitWidth = 876
      ExplicitHeight = 676
      object gridDiscount: TUniDBGrid
        Left = 0
        Top = 0
        Width = 880
        Height = 677
        Hint = ''
        DataSource = dsDiscount
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        OnMouseDown = gridDiscountMouseDown
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 64
          end
          item
            FieldName = 'name'
            Title.Caption = ' '#1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 200
          end>
      end
    end
    object pgDriver: TUniTabSheet
      Hint = ''
      Caption = 'pgDriver'
      ExplicitWidth = 876
      ExplicitHeight = 676
      object gridDriver: TUniDBGrid
        Left = 0
        Top = 0
        Width = 880
        Height = 677
        Hint = ''
        DataSource = dsDriver
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        OnMouseDown = gridDriverMouseDown
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 64
          end
          item
            FieldName = 'fio'
            Title.Caption = #1060'.'#1048'.'#1054
            Width = 200
          end>
      end
    end
    object pgAuto: TUniTabSheet
      Hint = ''
      Caption = 'pgAuto'
      ExplicitWidth = 876
      ExplicitHeight = 676
      object gridAuto: TUniDBGrid
        Left = 0
        Top = 0
        Width = 880
        Height = 677
        Hint = ''
        DataSource = dsAuto
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        OnMouseDown = gridAutoMouseDown
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 64
          end
          item
            FieldName = 'name'
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 200
          end>
      end
    end
  end
  object popPersone: TUniPopupMenu
    Left = 248
    Top = 272
    object unmntmN1: TUniMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100
      OnClick = unmntmN1Click
    end
    object unmntmN2: TUniMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = unmntmN2Click
    end
    object unmntmN3: TUniMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = unmntmN3Click
    end
  end
  object popEntity: TUniPopupMenu
    Left = 176
    Top = 280
    object unmntmN11: TUniMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100
      OnClick = unmntmN11Click
    end
    object unmntmN21: TUniMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = unmntmN21Click
    end
    object unmntmN31: TUniMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = unmntmN31Click
    end
  end
  object qryPersone: TUniQuery
    Connection = UniMainModule.dbUpsk
    SQL.Strings = (
      
        'select * from part_persone where del=0 and (lower(fio) like :fio' +
        ' and doc_serial like :doc_serial)')
    Left = 240
    Top = 328
    ParamData = <
      item
        DataType = ftWideString
        Name = 'fio'
        ParamType = ptInputOutput
        Value = '%%'
      end
      item
        DataType = ftWideString
        Name = 'doc_serial'
        ParamType = ptInputOutput
        Value = '%%'
      end>
  end
  object qryEntity: TUniQuery
    Connection = UniMainModule.dbUpsk
    SQL.Strings = (
      'select * from part_entity where del=0')
    Left = 184
    Top = 328
  end
  object dsEntity: TUniDataSource
    DataSet = qryEntity
    Left = 184
    Top = 392
  end
  object dsPersone: TUniDataSource
    DataSet = qryPersone
    Left = 232
    Top = 392
  end
  object qryPosition: TUniQuery
    Connection = UniMainModule.dbUpsk
    SQL.Strings = (
      'select * from position where del=0')
    Left = 296
    Top = 328
  end
  object dsPosition: TUniDataSource
    DataSet = qryPosition
    Left = 296
    Top = 400
  end
  object popPosition: TUniPopupMenu
    Left = 312
    Top = 272
    object unmntmN12: TUniMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100
      OnClick = unmntmN12Click
    end
    object unmntmN22: TUniMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = unmntmN22Click
    end
    object unmntmN32: TUniMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = unmntmN32Click
    end
  end
  object qryRegion: TUniQuery
    Connection = UniMainModule.dbUpsk
    SQL.Strings = (
      'select * from region where del=0')
    Left = 368
    Top = 328
  end
  object dsRegion: TUniDataSource
    DataSet = qryRegion
    Left = 360
    Top = 400
  end
  object popRegion: TUniPopupMenu
    Left = 392
    Top = 280
    object unmntmN121: TUniMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100
      OnClick = unmntmN121Click
    end
    object unmntmN221: TUniMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = unmntmN221Click
    end
    object unmntmN321: TUniMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = unmntmN321Click
    end
  end
  object popSklad: TUniPopupMenu
    Left = 456
    Top = 280
    object mn1: TUniMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100
      OnClick = mn1Click
    end
    object mn2: TUniMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = mn2Click
    end
    object mn3: TUniMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = mn3Click
    end
  end
  object qrySklad: TUniQuery
    Connection = UniMainModule.dbUpsk
    SQL.Strings = (
      'select * from sklad where del=0')
    Left = 456
    Top = 336
  end
  object dsSklad: TUniDataSource
    DataSet = qrySklad
    Left = 456
    Top = 392
  end
  object popUser: TUniPopupMenu
    Left = 512
    Top = 280
    object mn11: TUniMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100
      OnClick = mn11Click
    end
    object mn21: TUniMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = mn21Click
    end
    object mn31: TUniMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = mn31Click
    end
  end
  object qryUser: TUniQuery
    Connection = UniMainModule.dbUpsk
    SQL.Strings = (
      'select * from user where del=0')
    Left = 512
    Top = 336
  end
  object dsUser: TUniDataSource
    DataSet = qryUser
    Left = 512
    Top = 392
  end
  object popKef: TUniPopupMenu
    Left = 560
    Top = 280
    object mn111: TUniMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100
      OnClick = mn111Click
    end
    object mn211: TUniMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = mn211Click
    end
    object mn311: TUniMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = mn311Clic
    end
  end
  object qryKef: TUniQuery
    Connection = UniMainModule.dbUpsk
    SQL.Strings = (
      'select k.id,p.name,k.count,k.day,k.value from kef as k '
      'left join  package as p on k.package_id=p.id where k.del=0')
    Left = 568
    Top = 336
  end
  object dsKef: TUniDataSource
    DataSet = qryKef
    Left = 568
    Top = 392
  end
  object popPackage: TUniPopupMenu
    Left = 616
    Top = 280
    object mi1: TUniMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100
      OnClick = mi1Click
    end
    object mi2: TUniMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = mi2Click
    end
    object mi3: TUniMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = mi3Click
    end
  end
  object qryPackage: TUniQuery
    Connection = UniMainModule.dbUpsk
    SQL.Strings = (
      'select * from package where del=0')
    Left = 624
    Top = 336
  end
  object dsPackage: TUniDataSource
    DataSet = qryPackage
    Left = 624
    Top = 392
  end
  object popOrgan: TUniPopupMenu
    Left = 672
    Top = 280
    object mi11: TUniMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100
      OnClick = mi11Click
    end
    object mi21: TUniMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = mi21Click
    end
    object mi31: TUniMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = mi31Click
    end
  end
  object qryOrgan: TUniQuery
    Connection = UniMainModule.dbUpsk
    SQL.Strings = (
      'select * from organization where del=0')
    Left = 680
    Top = 336
  end
  object dsOrgan: TUniDataSource
    DataSet = qryOrgan
    Left = 680
    Top = 392
  end
  object popDiscount: TUniPopupMenu
    Left = 736
    Top = 280
    object mi111: TUniMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100
      OnClick = mi111Click
    end
    object mi211: TUniMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = mi211Click
    end
    object mi311: TUniMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = mi311Click
    end
  end
  object qryDiscount: TUniQuery
    Connection = UniMainModule.dbUpsk
    SQL.Strings = (
      'select * from discount where del=0')
    Left = 736
    Top = 336
  end
  object dsDiscount: TUniDataSource
    DataSet = qryDiscount
    Left = 736
    Top = 392
  end
  object popDriver: TUniPopupMenu
    Left = 800
    Top = 272
    object unmntm1: TUniMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100
      OnClick = unmntm1Click
    end
    object unmntm2: TUniMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = unmntm2Click
    end
    object unmntm3: TUniMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = unmntm3Click
    end
  end
  object qryDriver: TUniQuery
    Connection = UniMainModule.dbUpsk
    SQL.Strings = (
      'select * from driver where del=0')
    Left = 800
    Top = 328
  end
  object dsDriver: TUniDataSource
    DataSet = qryDriver
    Left = 800
    Top = 400
  end
  object popAuto: TUniPopupMenu
    Left = 864
    Top = 272
    object unmntm11: TUniMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100
      OnClick = unmntm11Click
    end
    object unmntm21: TUniMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = unmntm21Click
    end
    object unmntm31: TUniMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = unmntm31Click
    end
  end
  object qryAuto: TUniQuery
    Connection = UniMainModule.dbUpsk
    SQL.Strings = (
      'select * from auto where del=0')
    Left = 864
    Top = 328
  end
  object dsAuto: TUniDataSource
    DataSet = qryAuto
    Left = 864
    Top = 400
  end
end
