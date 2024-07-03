object frmReqCalc: TfrmReqCalc
  Left = 0
  Top = 0
  ClientHeight = 551
  ClientWidth = 1123
  Caption = #1057#1087#1080#1089#1086#1082' '#1088#1072#1095#1077#1090#1086#1074
  WindowState = wsMaximized
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  TextHeight = 15
  object pcReq: TUniPageControl
    Left = 0
    Top = 0
    Width = 1123
    Height = 551
    Hint = ''
    ActivePage = pgLrsp200
    Align = alClient
    TabOrder = 0
    OnChangeValue = pcReqChangeValue
    ExplicitWidth = 1119
    ExplicitHeight = 550
    object pgLrsp200: TUniTabSheet
      Hint = ''
      Caption = #1051#1056#1057#1055'-200'
      ExplicitWidth = 1111
      ExplicitHeight = 522
      object gridLrsp200: TUniDBGrid
        Left = 0
        Top = 0
        Width = 1115
        Height = 523
        Hint = ''
        DataSource = dsLrsp
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        OnMouseDown = gridLrsp200MouseDown
        OnColumnFilter = gridLrsp200ColumnFilter
        Columns = <
          item
            FieldName = 'id'
            Filtering.Enabled = True
            Filtering.Editor = edtFilterId
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 64
          end
          item
            FieldName = 'part_name'
            Filtering.Enabled = True
            Filtering.Editor = edtFilterKagent
            Title.Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
            Width = 150
          end
          item
            FieldName = 'datatime'
            Filtering.Editor = dtFilterDate
            Title.Caption = #1044#1072#1090#1072
            Width = 150
          end
          item
            FieldName = 'phone'
            Filtering.Enabled = True
            Filtering.Editor = edtFilterPhone
            Title.Caption = #1058#1077#1083#1077#1092#1086#1085
            Width = 150
          end
          item
            FieldName = 'adress_object'
            Filtering.Enabled = True
            Filtering.Editor = edtFilterAdress
            Title.Caption = #1040#1076#1088#1077#1089
            Width = 200
          end
          item
            FieldName = 'comment'
            Filtering.Enabled = True
            Filtering.Editor = edtFilterComment
            Title.Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
            Width = 200
          end
          item
            FieldName = 'price_amount_calc'
            Filtering.Enabled = True
            Filtering.Editor = edtFilterAmount
            Title.Caption = #1057#1091#1084#1084#1072' '#1088#1072#1089#1095#1077#1090#1072
            Width = 150
          end>
      end
    end
  end
  object hpFilter: TUniHiddenPanel
    Left = 752
    Top = 168
    Width = 344
    Height = 336
    Hint = ''
    Visible = True
    object edtFilterKagent: TUniEdit
      Left = 96
      Top = 136
      Width = 121
      Hint = ''
      Text = ''
      TabOrder = 1
    end
    object edtFilterId: TUniNumberEdit
      Left = 96
      Top = 80
      Width = 121
      Hint = ''
      TabOrder = 2
      DecimalSeparator = ','
    end
    object edtFilterPhone: TUniEdit
      Left = 96
      Top = 164
      Width = 121
      Hint = ''
      Text = ''
      TabOrder = 3
    end
    object edtFilterAdress: TUniEdit
      Left = 96
      Top = 192
      Width = 121
      Hint = ''
      Text = ''
      TabOrder = 4
    end
    object edtFilterComment: TUniEdit
      Left = 96
      Top = 224
      Width = 121
      Hint = ''
      Text = ''
      TabOrder = 5
    end
    object edtFilterAmount: TUniNumberEdit
      Left = 96
      Top = 252
      Width = 121
      Hint = ''
      TabOrder = 6
      DecimalSeparator = ','
    end
    object dtFilterDate: TUniDateTimePicker
      Left = 96
      Top = 108
      Width = 120
      Hint = ''
      DateTime = 45158.000000000000000000
      DateFormat = 'dd.MM.yyyy'
      TimeFormat = 'HH:mm'
      TabOrder = 7
    end
  end
  object qryLrsp: TUniQuery
    Connection = UniMainModule.dbUpsk
    SQL.Strings = (
      'SELECT *,    '
      'CASE        '
      
        'WHEN cl.type_part = 1 THEN (SELECT fio as part_name FROM part_pe' +
        'rsone WHERE id = cl.part_id) '
      
        'WHEN cl.type_part = 2 THEN (SELECT name as part_name FROM part_e' +
        'ntity WHERE id = cl.part_id)   '
      ' END AS part_name'
      
        'FROM calc_lrsp200 AS cl where cl.id like :id and phone like :pho' +
        'ne and adress_object like :adress_object '
      
        'and comment like :comment and price_amount_calc like :price_amou' +
        'nt_calc '
      '  AND ('
      
        '    (cl.type_part = 1 AND (SELECT  LOWER(fio) FROM part_persone ' +
        'WHERE id = cl.part_id) LIKE LOWER(:part_name))'
      '    OR '
      
        '    (cl.type_part = 2 AND (SELECT LOWER(name) FROM part_entity W' +
        'HERE id = cl.part_id) LIKE LOWER(:part_name))'
      '  )'
      'order by cl.id desc')
    Left = 80
    Top = 368
    ParamData = <
      item
        DataType = ftWideString
        Name = 'id'
        ParamType = ptInputOutput
        Value = '%%'
      end
      item
        DataType = ftWideString
        Name = 'phone'
        ParamType = ptInputOutput
        Value = '%%'
      end
      item
        DataType = ftWideString
        Name = 'adress_object'
        ParamType = ptInputOutput
        Value = '%%'
      end
      item
        DataType = ftWideString
        Name = 'comment'
        ParamType = ptInputOutput
        Value = '%%'
      end
      item
        DataType = ftWideString
        Name = 'price_amount_calc'
        ParamType = ptInputOutput
        Value = '%%'
      end
      item
        DataType = ftWideString
        Name = 'part_name'
        ParamType = ptInputOutput
        Value = '%%'
      end>
  end
  object dsLrsp: TUniDataSource
    DataSet = qryLrsp
    Left = 80
    Top = 424
  end
  object popCl: TUniPopupMenu
    Left = 80
    Top = 304
    object unmntmN1: TUniMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100
      OnClick = unmntmN1Click
    end
    object unmntmN2: TUniMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100
      OnClick = unmntmN2Click
    end
    object unmntmN3: TUniMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = unmntmN3Click
    end
  end
end
