object frmSkladHistory: TfrmSkladHistory
  Left = 0
  Top = 0
  ClientHeight = 505
  ClientWidth = 1089
  Caption = #1044#1074#1080#1078#1077#1085#1080#1077
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  OnAfterShow = UniFormAfterShow
  TextHeight = 15
  object gridHistory: TUniDBGrid
    Left = 0
    Top = 0
    Width = 1089
    Height = 505
    Hint = ''
    DataSource = dsHistory
    WebOptions.Paged = False
    LoadMask.Message = 'Loading data...'
    Align = alClient
    TabOrder = 0
    OnMouseDown = gridHistoryMouseDown
    Columns = <
      item
        FieldName = 'id'
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 64
      end
      item
        FieldName = 'count'
        Title.Caption = #1050#1086#1083'-'#1074#1086
        Width = 64
      end
      item
        FieldName = 'unname'
        Title.Caption = #1045#1076'.'#1080#1079#1084'.'
        Width = 60
      end
      item
        FieldName = 'name'
        Title.Caption = #1054#1087#1077#1088#1072#1094#1080#1103
        Width = 200
        DisplayMemo = True
      end
      item
        FieldName = 'doc_number'
        Title.Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        Width = 150
        DisplayMemo = True
      end
      item
        FieldName = 'doc_date'
        Title.Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        Width = 150
      end
      item
        FieldName = 'fio'
        Title.Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
        Width = 150
      end
      item
        FieldName = 'datetime'
        Title.Caption = #1042#1088#1077#1084#1103' '#1079#1072#1087#1080#1089#1080
        Width = 150
      end>
  end
  object qryHistory: TUniQuery
    Connection = UniMainModule.dbUpsk
    SQL.Strings = (
      
        'Select it,id,pid,count,unname,name,doc_number,doc_date,fio,datet' +
        'ime from'
      
        '(SELECT 1 as it,sa.id,p.id as pid,sa.`count`,un.name AS unname,i' +
        'a.name,sa.doc_number,sa.doc_date,u.fio,sa.datetime  FROM sklad_a' +
        'rrival AS sa'
      'JOIN `position` AS p ON sa.position_id=p.id'
      'JOIN unit_ AS un ON p.unit__id=un.id'
      'JOIN items_arrival AS ia ON sa.items_arrival_id=ia.id'
      'JOIN user AS u ON sa.user_id=u.id where sa.sklad_id=:sid'
      'UNION ALL '
      
        'SELECT 2 as it,se.id,p.id as pid,se.`count`,un.name  AS unname,i' +
        'e.name ,se.doc_number,se.doc_date,u.fio,se.datetime  FROM sklad_' +
        'expense AS se'
      'JOIN `position` AS p ON se.position_id=p.id'
      'JOIN unit_ AS un ON p.unit__id=un.id'
      'JOIN items_expense AS ie ON se.items_expense_id=ie.id'
      'JOIN user AS u ON se.user_id=u.id where se.sklad_id=:sid '
      ') as X where pid=:pid   order by datetime desc')
    Left = 536
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'sid'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'pid'
        Value = nil
      end>
  end
  object dsHistory: TUniDataSource
    DataSet = qryHistory
    Left = 536
    Top = 376
  end
  object popHistory: TUniPopupMenu
    Left = 536
    Top = 256
    object miN1: TUniMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100
      OnClick = miN1Click
    end
  end
end
