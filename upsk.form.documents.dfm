object frmDocuments: TfrmDocuments
  Left = 0
  Top = 0
  ClientHeight = 682
  ClientWidth = 992
  Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  TextHeight = 15
  object pcDoc: TUniPageControl
    AlignWithMargins = True
    Left = 3
    Top = 60
    Width = 986
    Height = 619
    Hint = ''
    ActivePage = pgCashIn
    Align = alClient
    TabOrder = 0
    OnChange = pcDocChange
    ExplicitWidth = 982
    ExplicitHeight = 618
    object pgContract: TUniTabSheet
      Hint = ''
      Caption = #1044#1086#1075#1086#1074#1086#1088#1072
      ExplicitWidth = 974
      ExplicitHeight = 590
      object gridDoc: TUniDBGrid
        Left = 0
        Top = 0
        Width = 978
        Height = 591
        Hint = ''
        DataSource = dsDoc
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        OnMouseDown = gridDocMouseDown
        Columns = <
          item
            FieldName = 'id'
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
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 100
          end
          item
            FieldName = 'organ_name'
            Title.Caption = #1054#1088#1075#1072#1085#1080#1079#1072#1094#1080#1103
            Width = 200
          end
          item
            FieldName = 'part_name'
            Title.Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
            Width = 200
          end>
      end
    end
    object pgSpec: TUniTabSheet
      Hint = ''
      Caption = #1057#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080
      ExplicitWidth = 974
      ExplicitHeight = 590
      object gridSpec: TUniDBGrid
        Left = 0
        Top = 0
        Width = 978
        Height = 591
        Hint = ''
        DataSource = dsDoc
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        OnMouseDown = gridSpecMouseDown
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = #1048#1076
            Width = 64
          end
          item
            FieldName = 'number'
            Title.Caption = ' '#1053#1086#1084#1077#1088
            Width = 100
          end
          item
            FieldName = 'device_name'
            Title.Caption = ' '#1058#1080#1087' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
            Width = 250
          end>
      end
    end
    object pgAkt: TUniTabSheet
      Hint = ''
      Caption = #1040#1082#1090#1099
      ExplicitWidth = 974
      ExplicitHeight = 590
      object gridAkt: TUniDBGrid
        Left = 0
        Top = 0
        Width = 978
        Height = 591
        Hint = ''
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = #1048#1076
            Width = 64
          end
          item
            FieldName = 'number'
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 200
          end>
      end
    end
    object pgAktBack: TUniTabSheet
      Hint = ''
      Caption = #1040#1082#1090'('#1042#1086#1079#1074#1088#1072#1090#1072')'
      ExplicitWidth = 974
      ExplicitHeight = 590
      object gridAkIn: TUniDBGrid
        Left = 0
        Top = 0
        Width = 978
        Height = 591
        Hint = ''
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = #1048#1076
            Width = 64
          end
          item
            FieldName = 'number'
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 80
          end>
      end
    end
    object pgOrder: TUniTabSheet
      Hint = ''
      Caption = #1057#1095#1077#1090#1072
      ExplicitWidth = 974
      ExplicitHeight = 590
      object gridOrder: TUniDBGrid
        Left = 0
        Top = 0
        Width = 978
        Height = 591
        Hint = ''
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 80
          end
          item
            FieldName = 'part_name'
            Title.Caption = ' '#1044#1072#1090#1072
            Width = 64
          end
          item
            FieldName = 'date'
            Title.Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
            Width = 200
          end
          item
            FieldName = 'amount'
            Title.Caption = ' '#1057#1091#1084#1084#1072
            Width = 150
          end>
      end
    end
    object pgCashIn: TUniTabSheet
      Hint = ''
      Caption = #1055#1086#1089#1090#1091#1087#1083#1077#1085#1080#1077' '#1076#1077#1085#1077#1075
      ExplicitWidth = 974
      ExplicitHeight = 590
      object gridCashIn: TUniDBGrid
        Left = 0
        Top = 0
        Width = 978
        Height = 591
        Hint = ''
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = #1048#1076
            Width = 64
          end
          item
            FieldName = 'date'
            Title.Caption = ' '#1044#1072#1090#1072
            Width = 80
          end
          item
            FieldName = 'name'
            Title.Caption = #1057#1090#1072#1090#1100#1103
            Width = 200
          end
          item
            FieldName = 'amount'
            Title.Caption = ' '#1057#1091#1084#1084#1072
            Width = 80
          end
          item
            FieldName = 'name'
            Title.Caption = #1057#1090#1072#1090#1100#1103
            Width = 200
          end>
      end
    end
    object pgExpenseOrder: TUniTabSheet
      Hint = ''
      Caption = #1054#1087#1083#1072#1090#1099
      ExplicitWidth = 974
      ExplicitHeight = 590
      object gridCashOut: TUniDBGrid
        Left = 0
        Top = 0
        Width = 978
        Height = 591
        Hint = ''
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = #1048#1076
            Width = 64
          end
          item
            FieldName = 'date'
            Title.Caption = ' '#1044#1072#1090#1072
            Width = 80
          end
          item
            FieldName = 'part_name'
            Title.Caption = ' '#1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
            Width = 200
          end
          item
            FieldName = 'amount'
            Title.Caption = ' '#1057#1091#1084#1084#1072
            Width = 80
          end
          item
            FieldName = 'name'
            Title.Caption = #1057#1090#1072#1090#1100#1103
            Width = 200
          end>
      end
    end
    object pgExpensPosition: TUniTabSheet
      Hint = ''
      Caption = #1054#1090#1075#1088#1091#1079#1082#1072' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
      ExplicitWidth = 974
      ExplicitHeight = 590
      object gridExpens: TUniDBGrid
        Left = 0
        Top = 0
        Width = 978
        Height = 591
        Hint = ''
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 64
          end
          item
            FieldName = 'datetime'
            Title.Caption = ' '#1044#1072#1090#1072' '#1086#1090#1075#1088#1091#1079#1082#1080
            Width = 150
          end
          item
            FieldName = 'snumber'
            Title.Caption = #1053#1086#1084#1077#1088' '#1089#1087#1077#1094'.'
            Width = 150
          end>
      end
    end
    object pgRefaundPosition: TUniTabSheet
      Hint = ''
      Caption = #1042#1086#1079#1074#1088#1072#1090' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1103
      ExplicitWidth = 974
      ExplicitHeight = 590
      object gridRefaund: TUniDBGrid
        Left = 0
        Top = 0
        Width = 978
        Height = 591
        Hint = ''
        LoadMask.Message = 'Loading data...'
        Align = alClient
        TabOrder = 0
        Columns = <
          item
            FieldName = 'id'
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 64
          end
          item
            FieldName = 'datetime'
            Title.Caption = ' '#1044#1072#1090#1072' '#1074#1086#1079#1074#1088#1072#1090#1072
            Width = 150
          end
          item
            FieldName = 'snumber'
            Title.Caption = #1053#1086#1084#1077#1088' '#1089#1087#1077#1094'.'
            Width = 150
          end>
      end
    end
  end
  object pnlTop: TUniPanel
    Left = 0
    Top = 0
    Width = 992
    Height = 57
    Hint = ''
    Align = alTop
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 988
    object lbl1: TUniLabel
      Left = 15
      Top = 3
      Width = 56
      Height = 13
      Hint = ''
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085
      TabOrder = 1
    end
    object cmbPart: TUniComboBox
      Left = 15
      Top = 22
      Width = 218
      Hint = ''
      Text = ''
      TabOrder = 2
      ClearButton = True
      IconItems = <>
      OnSelect = cmbPartSelect
    end
  end
  object qryDoc: TUniQuery
    Connection = UniMainModule.dbUpsk
    SQL.Strings = (
      
        'SELECT * from contract where part_id=:part_id and part_type=:par' +
        't_type and del=0')
    Left = 96
    Top = 480
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'part_id'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'part_type'
        Value = nil
      end>
  end
  object dsDoc: TUniDataSource
    DataSet = qryDoc
    Left = 96
    Top = 552
  end
  object popDoc: TUniPopupMenu
    Left = 96
    Top = 408
    object unmntmN1: TUniMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100
      OnClick = unmntmN1Click
    end
    object unmntmN2: TUniMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
    end
  end
  object popSpec: TUniPopupMenu
    Left = 152
    Top = 408
    object unmntmN5: TUniMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100' '#1088#1072#1089#1095#1077#1090#1099
    end
    object unmntmN3: TUniMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1072#1082#1090' '#1087#1077#1088#1077#1076#1072#1095#1080
    end
    object unmntmN4: TUniMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1072#1082#1090' '#1074#1086#1079#1074#1088#1072#1090#1072
    end
    object unmntmN6: TUniMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1087#1077#1094'.'
    end
  end
end
