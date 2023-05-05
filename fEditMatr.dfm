object fNewMatrix: TfNewMatrix
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'NewMatrix'
  ClientHeight = 329
  ClientWidth = 561
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object panMatrixMainInfo: TPanel
    Left = 0
    Top = 0
    Width = 169
    Height = 329
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 319
    object labMatrixName: TLabel
      Left = 16
      Top = 16
      Width = 125
      Height = 25
      Caption = 'Matrix Name:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object labDimensions: TLabel
      Left = 16
      Top = 74
      Width = 113
      Height = 25
      Caption = 'Dimensions:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object labX: TLabel
      Left = 79
      Top = 105
      Width = 9
      Height = 19
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edMatrixName: TEdit
      Left = 16
      Top = 47
      Width = 135
      Height = 21
      TabOrder = 0
    end
    object edMatrixLines: TEdit
      Left = 16
      Top = 105
      Width = 57
      Height = 21
      TabOrder = 1
    end
    object edMatrixColumns: TEdit
      Left = 94
      Top = 105
      Width = 57
      Height = 21
      TabOrder = 2
    end
    object butOK: TButton
      Left = 1
      Top = 282
      Width = 167
      Height = 24
      Align = alBottom
      Caption = 'OK'
      TabOrder = 3
      OnClick = butOKClick
      ExplicitTop = 272
    end
    object butCancel: TButton
      Left = 1
      Top = 306
      Width = 167
      Height = 22
      Align = alBottom
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 4
      ExplicitTop = 296
    end
  end
  object sgMatrixElements: TStringGrid
    Left = 169
    Top = 0
    Width = 392
    Height = 329
    Align = alClient
    ColCount = 1
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Times New Roman'
    Font.Style = []
    GradientEndColor = clCream
    GridLineWidth = 3
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    ParentFont = False
    TabOrder = 1
    OnMouseActivate = sgMatrixElementsMouseActivate
    ExplicitWidth = 382
    ExplicitHeight = 319
  end
end
