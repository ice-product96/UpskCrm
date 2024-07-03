object frmDeal: TfrmDeal
  Left = 0
  Top = 0
  ClientHeight = 613
  ClientWidth = 1235
  Caption = #1057#1076#1077#1083#1082#1080
  BorderStyle = bsDialog
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  TextHeight = 15
  object pnlLeft: TUniPanel
    Left = 0
    Top = 0
    Width = 297
    Height = 613
    Hint = ''
    Align = alLeft
    TabOrder = 0
    Caption = ''
    ExplicitHeight = 612
    object lbl1: TUniLabel
      AlignWithMargins = True
      Left = 6
      Top = 78
      Width = 67
      Height = 17
      Hint = ''
      Margins.Left = 5
      Margins.Top = 15
      Margins.Right = 5
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
      Align = alTop
      ParentFont = False
      Font.Height = -13
      TabOrder = 1
    end
    object cmbPart: TUniComboBox
      AlignWithMargins = True
      Left = 6
      Top = 101
      Width = 285
      Hint = ''
      Margins.Left = 5
      Margins.Right = 5
      Text = ''
      Align = alTop
      TabOrder = 2
      IconItems = <>
      OnSelect = cmbPartSelect
    end
    object grbPart: TUniRadioGroup
      AlignWithMargins = True
      Left = 6
      Top = 4
      Width = 285
      Height = 56
      Hint = ''
      Margins.Left = 5
      Margins.Right = 5
      Items.Strings = (
        #1060#1048#1047
        #1070#1056)
      Align = alTop
      Caption = #1058#1080#1087
      TabOrder = 3
      Columns = 2
      OnClick = grbPartClick
    end
    object gbPartData: TUniGroupBox
      AlignWithMargins = True
      Left = 6
      Top = 141
      Width = 285
      Height = 148
      Hint = ''
      Margins.Left = 5
      Margins.Top = 15
      Margins.Right = 5
      Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099
      Align = alTop
      TabOrder = 4
      object pnl1: TUniPanel
        Left = 2
        Top = 15
        Width = 111
        Height = 131
        Hint = ''
        Align = alLeft
        TabOrder = 1
        Caption = ''
        object lbl_Inn: TUniLabel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 103
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1048#1053#1053':'
          Align = alTop
          TabOrder = 1
        end
        object lbl_mail: TUniLabel
          AlignWithMargins = True
          Left = 4
          Top = 23
          Width = 103
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1055#1086#1095#1090#1072':'
          Align = alTop
          TabOrder = 2
        end
        object lbl_manager: TUniLabel
          AlignWithMargins = True
          Left = 4
          Top = 42
          Width = 103
          Height = 30
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1044#1080#1088#1077#1082#1090#1086#1088':'
          Align = alTop
          TabOrder = 3
        end
        object lbl_ogrn: TUniLabel
          AlignWithMargins = True
          Left = 4
          Top = 78
          Width = 103
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1054#1043#1056#1053':'
          Align = alTop
          TabOrder = 4
        end
        object lbl_phone: TUniLabel
          AlignWithMargins = True
          Left = 4
          Top = 97
          Width = 103
          Height = 13
          Hint = ''
          Alignment = taRightJustify
          AutoSize = False
          Caption = #1058#1077#1083':'
          Align = alTop
          TabOrder = 5
        end
      end
      object pnl2: TUniPanel
        Left = 113
        Top = 15
        Width = 170
        Height = 131
        Hint = ''
        Align = alClient
        TabOrder = 2
        Caption = ''
        object lblINN: TUniLabel
          AlignWithMargins = True
          Left = 11
          Top = 4
          Width = 6
          Height = 13
          Hint = ''
          Margins.Left = 10
          Caption = '0'
          Align = alTop
          TabOrder = 1
        end
        object lblMail: TUniLabel
          AlignWithMargins = True
          Left = 11
          Top = 23
          Width = 6
          Height = 13
          Hint = ''
          Margins.Left = 10
          Caption = '  '
          Align = alTop
          TabOrder = 2
        end
        object lblManager: TUniLabel
          AlignWithMargins = True
          Left = 11
          Top = 42
          Width = 155
          Height = 30
          Hint = ''
          Margins.Left = 10
          AutoSize = False
          Caption = ' '
          Align = alTop
          TabOrder = 3
        end
        object lblOgrn: TUniLabel
          AlignWithMargins = True
          Left = 11
          Top = 78
          Width = 6
          Height = 13
          Hint = ''
          Margins.Left = 10
          Caption = '0'
          Align = alTop
          TabOrder = 4
        end
      end
    end
    object gbContact: TUniGroupBox
      AlignWithMargins = True
      Left = 6
      Top = 307
      Width = 285
      Height = 305
      Hint = ''
      Margins.Left = 5
      Margins.Top = 15
      Margins.Right = 5
      Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
      Align = alTop
      TabOrder = 5
      object sbContact: TUniScrollBox
        Left = 2
        Top = 15
        Width = 281
        Height = 288
        Hint = ''
        Align = alClient
        TabOrder = 1
      end
    end
  end
  object pnlClient: TUniPanel
    Left = 297
    Top = 0
    Width = 938
    Height = 613
    Hint = ''
    Align = alClient
    TabOrder = 1
    Caption = 'pnlClient'
    ExplicitWidth = 934
    ExplicitHeight = 612
    object gridDeal: TUniDBGrid
      Left = 1
      Top = 1
      Width = 936
      Height = 418
      Hint = ''
      DataSource = dsDeal
      WebOptions.Paged = False
      LoadMask.Message = 'Loading data...'
      Align = alClient
      TabOrder = 1
      OnMouseDown = gridDealMouseDown
      OnCellClick = gridDealCellClick
      Columns = <
        item
          FieldName = 'did'
          Title.Caption = #1048#1076
          Width = 64
        end
        item
          FieldName = 'date'
          Title.Caption = #1044#1072#1090#1072
          Width = 100
        end
        item
          FieldName = 'number_contract'
          Title.Caption = #1053#1086#1084#1077#1088' '#1076#1086#1075#1086#1074#1086#1088#1072
          Width = 150
        end
        item
          FieldName = 'number'
          Title.Caption = #1053#1086#1084#1077#1088' '#1089#1087#1077#1094'.'
          Width = 150
        end
        item
          FieldName = 'adress'
          Title.Caption = #1040#1076#1088#1077#1089' '#1086#1073#1098#1077#1082#1090#1072
          Width = 150
        end
        item
          FieldName = 'name'
          Title.Caption = #1058#1080#1087' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
          Width = 150
        end
        item
          FieldName = 'start_rental_date'
          Title.Caption = #1053#1072#1095#1072#1083#1086' '#1072#1088#1077#1085#1076#1099
          Width = 150
        end
        item
          FieldName = 'stop_rental_date'
          Title.Caption = #1054#1082#1086#1085#1095#1072#1085#1080#1077' '#1072#1088#1077#1085#1076#1099
          Width = 150
        end
        item
          FieldName = 'chk_pay'
          Title.Caption = #1055#1086#1083#1091#1095#1077#1085#1072' '#1086#1087#1083#1072#1090#1072
          Width = 120
        end
        item
          FieldName = 'chk_copy_contract'
          Title.Caption = #1057#1082#1072#1085'. '#1076#1086#1075#1086#1074#1086#1088#1072
          Width = 120
        end
        item
          FieldName = 'chk_orig_contract'
          Title.Caption = #1054#1088#1080#1075'. '#1076#1086#1075#1086#1074#1086#1088#1072
          Width = 120
        end
        item
          FieldName = 'chk_device'
          Title.Caption = #1054#1073#1086#1088#1091#1076'. '#1089#1076#1072#1085#1086
          Width = 120
        end
        item
          FieldName = 'chk_copy_upd'
          Title.Caption = #1059#1087#1076' '#1089#1082#1072#1085'.'
          Width = 120
        end
        item
          FieldName = 'chk_orig_upd'
          Title.Caption = #1059#1087#1076' '#1086#1088#1080#1075'.'
          Width = 120
        end
        item
          FieldName = 'chk_pay_deposit'
          Title.Caption = #1047#1072#1083#1086#1075' '#1074#1099#1087#1083#1072#1095#1077#1085
          Width = 120
        end>
    end
    object gridDelivery: TUniDBGrid
      Left = 1
      Top = 452
      Width = 936
      Height = 160
      Hint = ''
      DataSource = dsDelivery
      WebOptions.Paged = False
      LoadMask.Message = 'Loading data...'
      Align = alBottom
      TabOrder = 2
      OnMouseDown = gridDeliveryMouseDown
      Columns = <
        item
          FieldName = 'id'
          Title.Caption = #1053#1086#1084#1077#1088
          Width = 64
        end
        item
          FieldName = 'date'
          Title.Caption = #1044#1072#1090#1072
          Width = 80
        end
        item
          FieldName = 'fio'
          Title.Caption = #1042#1086#1076#1080#1090#1077#1083#1100
          Width = 200
        end
        item
          FieldName = 'name'
          Title.Caption = #1040#1074#1090#1086
          Width = 200
        end
        item
          FieldName = 'typename'
          Title.Caption = #1058#1080#1087
          Width = 120
        end
        item
          FieldName = 'price'
          Title.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
          Width = 100
        end>
    end
    object unspltr1: TUniSplitter
      Left = 1
      Top = 446
      Width = 936
      Height = 6
      Cursor = crVSplit
      Hint = ''
      Align = alBottom
      ParentColor = False
      Color = clBtnFace
      ExplicitTop = 445
      ExplicitWidth = 932
    end
    object pnlDelivery: TUniPanel
      Left = 1
      Top = 419
      Width = 936
      Height = 27
      Hint = ''
      Align = alBottom
      ParentFont = False
      Font.Height = -13
      TabOrder = 4
      Caption = #1044#1086#1089#1090#1072#1074#1082#1072
      ExplicitTop = 418
      ExplicitWidth = 932
    end
  end
  object popDeal: TUniPopupMenu
    Left = 16
    Top = 416
    object unmntmN1: TUniMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = unmntmN1Click
    end
  end
  object popDeliv: TUniPopupMenu
    Left = 96
    Top = 432
    object unmntmN2: TUniMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100
      OnClick = unmntmN2Click
    end
    object unmntmN3: TUniMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = unmntmN3Click
    end
  end
  object qryDeal: TUniQuery
    Connection = UniMainModule.dbUpsk
    SQL.Strings = (
      'SELECT d.id as did, '
      
        '  d.date,c.number_contract,s.number,d.adress,ct.name,d.start_ren' +
        'tal_date,d.stop_rental_date,d.chk_pay,'
      
        '  d.chk_copy_contract,d.chk_orig_contract,d.chk_device,d.chk_ori' +
        'g_upd,d.chk_copy_upd,d.chk_pay_deposit '
      'FROM deal AS d'
      'LEFT JOIN calc_lrsp200 AS calc ON d.calc_id=calc.id '
      'left join document as doc on d.document_id=doc .id'
      'LEFT JOIN spec AS s ON doc.spec_id=s.id'
      'LEFT JOIN part_entity AS p ON calc.part_id=p.id'
      'LEFT JOIN contract AS c ON c.part_id=p.id AND c.part_type=2'
      'LEFT JOIN calc_type AS ct ON d.calc_type_id=ct.id'
      ''
      'WHERE d.calc_type_id = 1 group by d.id')
    Left = 536
    Top = 320
  end
  object dsDeal: TUniDataSource
    DataSet = qryDeal
    Left = 720
    Top = 336
  end
  object qryDelivery: TUniQuery
    Connection = UniMainModule.dbUpsk
    SQL.Strings = (
      
        'select d.id,dr.fio,a.name,td.name as typename,d.price,d.date fro' +
        'm delivery as d'
      'left join driver as dr on d.driver_id=dr.id'
      'left join auto as a on d.auto_id=a.id'
      'left join type_delivery as td on d.type_delivery_id=td.id'
      'where d.deal_id=:did')
    Left = 440
    Top = 264
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'did'
        Value = nil
      end>
  end
  object dsDelivery: TUniDataSource
    DataSet = qryDelivery
    Left = 624
    Top = 280
  end
end
