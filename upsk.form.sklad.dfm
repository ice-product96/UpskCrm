object frmSklad: TfrmSklad
  Left = 0
  Top = 0
  ClientHeight = 690
  ClientWidth = 970
  Caption = #1057#1082#1083#1072#1076
  OnShow = UniFormShow
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  TextHeight = 15
  object gridRemains: TUniDBGrid
    Left = 0
    Top = 51
    Width = 970
    Height = 639
    Hint = ''
    DataSource = dsRemains
    WebOptions.Paged = False
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 0
    OnMouseDown = gridRemainsMouseDown
    Columns = <
      item
        FieldName = 'id'
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 64
      end
      item
        FieldName = 'pname'
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 300
      end
      item
        FieldName = 'uname'
        Title.Caption = #1045#1076'.'#1048#1079#1084'.'
        Width = 64
      end
      item
        FieldName = 'remains'
        Title.Caption = #1054#1089#1090#1072#1090#1086#1082
        Width = 64
      end>
  end
  object pnlSklad: TUniPanel
    Left = 0
    Top = 0
    Width = 970
    Height = 51
    Hint = ''
    Align = alTop
    TabOrder = 1
    Caption = ''
    ExplicitWidth = 966
    object cmbSklad: TUniComboBox
      Left = 16
      Top = 23
      Width = 177
      Hint = ''
      Style = csDropDownList
      Text = ''
      TabOrder = 1
      IconItems = <>
      OnSelect = cmbSkladSelect
    end
    object lblSklad: TUniLabel
      Left = 16
      Top = 4
      Width = 31
      Height = 13
      Hint = ''
      Caption = #1057#1082#1083#1072#1076
      TabOrder = 2
    end
    object lblFilterPackage: TUniLabel
      Left = 216
      Top = 4
      Width = 51
      Height = 13
      Hint = ''
      Caption = #1050#1086#1084#1087#1083#1077#1082#1090
      TabOrder = 3
    end
  end
  object cmbFilterPackage: TUniComboBox
    Left = 216
    Top = 23
    Width = 193
    Hint = ''
    Text = ''
    TabOrder = 2
    ClearButton = True
    IconItems = <>
    OnSelect = cmbFilterPackageSelect
  end
  object qryRemains: TUniQuery
    Connection = UniMainModule.dbUpsk
    SQL.Strings = (
      ''
      'SELECT p.id, p.name AS pname, u.name AS uname,'
      
        ' ifnull((SELECT SUM(sa.count) FROM sklad_arrival AS sa WHERE sa.' +
        'position_id=p.id AND sa.sklad_id=:sid),0) '
      
        '- ifnull((SELECT SUM(se.count) FROM sklad_expense AS se WHERE se' +
        '.position_id=p.id AND se.sklad_id=:sid),0) AS remains FROM posit' +
        'ion AS p'
      'LEFT JOIN unit_ AS u ON p.unit__id=u.id; ')
    Left = 752
    Top = 592
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sid'
        Value = nil
      end>
  end
  object dsRemains: TUniDataSource
    DataSet = qryRemains
    Left = 832
    Top = 592
  end
  object popSklad: TUniPopupMenu
    Left = 672
    Top = 592
    object miN2: TUniMenuItem
      Caption = #1053#1086#1074#1099#1081' '#1087#1088#1080#1093#1086#1076
      OnClick = miN2Click
    end
    object miN3: TUniMenuItem
      Caption = #1053#1086#1074#1099#1081' '#1088#1072#1089#1093#1086#1076
      OnClick = miN3Click
    end
    object miN1: TUniMenuItem
      Caption = '-'
    end
    object miHistory: TUniMenuItem
      Caption = #1048#1089#1090#1086#1088#1080#1103
      OnClick = miHistoryClick
    end
    object miN5: TUniMenuItem
      Caption = '-'
    end
    object miN4: TUniMenuItem
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      OnClick = miN4Click
    end
  end
end
