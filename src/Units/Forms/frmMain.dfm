object MainForm: TMainForm
  Left = 0
  Top = 0
  Margins.Bottom = 5
  Caption = 'MatrixCalculator'
  ClientHeight = 675
  ClientWidth = 1366
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = 14
  Font.Name = 'Times New Roman'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 1366
    Height = 29
    ButtonHeight = 29
    ButtonWidth = 54
    Caption = 'ToolBar'
    Images = ilToolBar
    TabOrder = 0
    object tbNewFile: TToolButton
      Left = 0
      Top = 0
      Action = aNewFile
    end
    object tbOpenFile: TToolButton
      Left = 54
      Top = 0
      Action = aOpenFile
    end
    object tbSaveFile: TToolButton
      Left = 108
      Top = 0
      Action = aSaveFile
    end
    object tbSaveFileAs: TToolButton
      Left = 162
      Top = 0
      Action = aSaveFileAs
    end
    object tbSeparator1: TToolButton
      Left = 216
      Top = 0
      Width = 8
      Caption = 'tbSeparator1'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object tbViewMatrixList: TToolButton
      Left = 224
      Top = 0
      Action = aViewMatrixList
    end
  end
  object panCalculatorButtons: TPanel
    Left = 0
    Top = 397
    Width = 1366
    Height = 278
    Align = alBottom
    TabOrder = 1
    object butTwo: TButton
      AlignWithMargins = True
      Left = 406
      Top = 183
      Width = 319
      Height = 46
      Cursor = crHandPoint
      Margins.Right = 100
      Caption = '2'
      DragCursor = crDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = butInputClick
    end
    object butFive: TButton
      AlignWithMargins = True
      Left = 406
      Top = 138
      Width = 319
      Height = 46
      Cursor = crHandPoint
      Margins.Right = 100
      Caption = '5'
      DragCursor = crDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = butInputClick
    end
    object butThree: TButton
      AlignWithMargins = True
      Left = 725
      Top = 183
      Width = 319
      Height = 46
      Cursor = crHandPoint
      Margins.Right = 100
      Caption = '3'
      DragCursor = crDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = butInputClick
    end
    object butSix: TButton
      AlignWithMargins = True
      Left = 725
      Top = 138
      Width = 319
      Height = 46
      Cursor = crHandPoint
      Margins.Right = 100
      Caption = '6'
      DragCursor = crDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = butInputClick
    end
    object butOne: TButton
      AlignWithMargins = True
      Left = 86
      Top = 183
      Width = 319
      Height = 46
      Cursor = crHandPoint
      Margins.Top = 230
      Margins.Right = 100
      Caption = '1'
      DragCursor = crDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = butInputClick
    end
    object butFour: TButton
      AlignWithMargins = True
      Left = 86
      Top = 138
      Width = 319
      Height = 46
      Cursor = crHandPoint
      Margins.Top = 230
      Margins.Right = 100
      Caption = '4'
      DragCursor = crDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = butInputClick
    end
    object butEight: TButton
      AlignWithMargins = True
      Left = 406
      Top = 93
      Width = 319
      Height = 46
      Cursor = crHandPoint
      Margins.Right = 100
      Caption = '8'
      DragCursor = crDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = butInputClick
    end
    object butSeven: TButton
      AlignWithMargins = True
      Left = 86
      Top = 93
      Width = 319
      Height = 46
      Cursor = crHandPoint
      Margins.Top = 230
      Margins.Right = 100
      Caption = '7'
      DragCursor = crDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = butInputClick
    end
    object butNine: TButton
      AlignWithMargins = True
      Left = 725
      Top = 93
      Width = 319
      Height = 46
      Cursor = crHandPoint
      Margins.Right = 100
      Caption = '9'
      DragCursor = crDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = butInputClick
    end
    object butZero: TButton
      AlignWithMargins = True
      Left = 406
      Top = 228
      Width = 319
      Height = 46
      Cursor = crHandPoint
      Margins.Right = 100
      Caption = '0'
      DragCursor = crDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = butInputClick
    end
    object butComma: TButton
      AlignWithMargins = True
      Left = 725
      Top = 228
      Width = 319
      Height = 46
      Cursor = crHandPoint
      Margins.Right = 100
      Caption = ','
      DragCursor = crDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      OnClick = butInputClick
    end
    object butDelete: TButton
      AlignWithMargins = True
      Left = 1164
      Top = 3
      Width = 100
      Height = 46
      Cursor = crHandPoint
      Margins.Right = 100
      Caption = #8592
      DragCursor = crDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      OnClick = butDeleteClick
    end
    object butCalculate: TButton
      AlignWithMargins = True
      Left = 1043
      Top = 228
      Width = 319
      Height = 46
      Cursor = crHandPoint
      Margins.Left = 500
      Margins.Right = 100
      Margins.Bottom = 7
      Caption = '='
      DragCursor = crDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      OnClick = butCalculateClick
    end
    object butPlus: TButton
      AlignWithMargins = True
      Left = 1043
      Top = 183
      Width = 319
      Height = 46
      Cursor = crHandPoint
      Margins.Left = 500
      Margins.Right = 100
      Margins.Bottom = 7
      Caption = '+'
      DragCursor = crDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      OnClick = butInputClick
    end
    object butMinus: TButton
      AlignWithMargins = True
      Left = 1043
      Top = 138
      Width = 319
      Height = 46
      Cursor = crHandPoint
      Margins.Left = 500
      Margins.Right = 100
      Margins.Bottom = 7
      Caption = '-'
      DragCursor = crDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
      OnClick = butInputClick
    end
    object butMultiplication: TButton
      AlignWithMargins = True
      Left = 1043
      Top = 93
      Width = 319
      Height = 46
      Cursor = crHandPoint
      Margins.Left = 500
      Margins.Right = 100
      Margins.Bottom = 7
      Caption = '*'
      DragCursor = crDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
      OnClick = butInputClick
    end
    object butDivision: TButton
      AlignWithMargins = True
      Left = 1043
      Top = 48
      Width = 319
      Height = 46
      Cursor = crHandPoint
      Margins.Left = 500
      Margins.Right = 100
      Margins.Bottom = 7
      Caption = '/'
      DragCursor = crDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
      OnClick = butInputClick
    end
    object butClear: TButton
      AlignWithMargins = True
      Left = 1264
      Top = 3
      Width = 49
      Height = 46
      Cursor = crHandPoint
      Margins.Left = 500
      Margins.Right = 100
      Margins.Bottom = 7
      Caption = 'C'
      DragCursor = crDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 17
      OnClick = butClearClick
    end
    object butExponentaition: TButton
      AlignWithMargins = True
      Left = 725
      Top = 48
      Width = 319
      Height = 46
      Cursor = crHandPoint
      Margins.Right = 100
      Caption = '^'
      DragCursor = crDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 18
      OnClick = butInputClick
    end
    object panCalcChoose: TPanel
      Left = 1
      Top = 1
      Width = 80
      Height = 276
      Align = alLeft
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 19
      object butExpressionChoose: TButton
        Left = 1
        Top = 1
        Width = 78
        Height = 68
        Align = alTop
        Caption = 'Expr'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = butChooseClick
      end
      object butDeterminantChoose: TButton
        Tag = 1
        Left = 1
        Top = 69
        Width = 78
        Height = 68
        Align = alTop
        Caption = 'Det'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = butChooseClick
      end
      object butInverseChoose: TButton
        Tag = 2
        Left = 1
        Top = 137
        Width = 78
        Height = 68
        Align = alTop
        Caption = 'Inverse'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = butChooseClick
      end
      object butRankChoose: TButton
        Tag = 3
        Left = 1
        Top = 205
        Width = 78
        Height = 68
        Align = alTop
        Caption = 'Rank'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Times New Roman'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = butChooseClick
      end
    end
    object butMant: TButton
      AlignWithMargins = True
      Left = 86
      Top = 228
      Width = 319
      Height = 46
      Margins.Top = 230
      Margins.Right = 100
      Caption = '*10^'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 20
      OnClick = butInputClick
    end
    object butMoveLeft: TButton
      Tag = 2
      AlignWithMargins = True
      Left = 86
      Top = 3
      Width = 67
      Height = 46
      Margins.Top = 230
      Margins.Right = 100
      Caption = #9664
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 21
      OnClick = butMoveSelectionClick
    end
    object butMoveRight: TButton
      Tag = 3
      AlignWithMargins = True
      Left = 224
      Top = 3
      Width = 68
      Height = 46
      Margins.Right = 100
      Caption = #9654
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 22
      OnClick = butMoveSelectionClick
    end
    object butOpenBrace: TButton
      AlignWithMargins = True
      Left = 86
      Top = 48
      Width = 319
      Height = 46
      Cursor = crHandPoint
      Margins.Top = 230
      Margins.Right = 100
      Caption = '('
      DragCursor = crDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 23
      OnClick = butInputClick
    end
    object butCloseBrace: TButton
      AlignWithMargins = True
      Left = 406
      Top = 48
      Width = 319
      Height = 46
      Cursor = crHandPoint
      Margins.Right = 100
      Caption = ')'
      DragCursor = crDefault
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 24
      OnClick = butInputClick
    end
    object butMoveUp: TButton
      AlignWithMargins = True
      Left = 155
      Top = 3
      Width = 67
      Height = 23
      Margins.Right = 100
      Caption = #9650
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 25
      OnClick = butMoveSelectionClick
    end
    object butMoveDown: TButton
      Tag = 1
      AlignWithMargins = True
      Left = 155
      Top = 26
      Width = 67
      Height = 23
      Margins.Right = 100
      Caption = #9660
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 26
      OnClick = butMoveSelectionClick
    end
    object butClearMatrix: TButton
      AlignWithMargins = True
      Left = 1313
      Top = 3
      Width = 49
      Height = 46
      Cursor = crHandPoint
      Margins.Left = 500
      Margins.Right = 100
      Margins.Bottom = 7
      Caption = 'CM'
      DragCursor = crDefault
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 27
      OnClick = butClearMatrixClick
    end
  end
  object sbExpression: TScrollBox
    Left = 0
    Top = 29
    Width = 1366
    Height = 368
    HorzScrollBar.Tracking = True
    VertScrollBar.Tracking = True
    Align = alClient
    TabOrder = 2
    OnClick = sbExpressionClick
    OnMouseWheel = sbExpressionMouseWheel
    object pbExpression: TPaintBox
      Left = 0
      Top = 0
      Width = 201
      Height = 147
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      OnPaint = pbExpressionPaint
    end
    object labX: TLabel
      Left = 72
      Top = 14
      Width = 8
      Height = 14
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = 14
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object edExpression: TEdit
      Left = 0
      Top = 0
      Width = 1362
      Height = 29
      Align = alTop
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = edExpressionChange
      OnExit = edExpressionExit
    end
    object sgDeterminant: TStringGrid
      Left = 26
      Top = 56
      Width = 70
      Height = 30
      ColCount = 1
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
      ScrollBars = ssNone
      TabOrder = 1
      Visible = False
      OnSetEditText = sgInputMatrixSetEditText
    end
    object sgInverse: TStringGrid
      Left = 26
      Top = 56
      Width = 70
      Height = 30
      ColCount = 1
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
      ScrollBars = ssNone
      TabOrder = 2
      Visible = False
      OnSetEditText = sgInputMatrixSetEditText
    end
    object sgRank: TStringGrid
      Left = 26
      Top = 56
      Width = 70
      Height = 30
      ColCount = 1
      FixedCols = 0
      RowCount = 1
      FixedRows = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
      ScrollBars = ssNone
      TabOrder = 3
      Visible = False
      OnSetEditText = sgInputMatrixSetEditText
    end
    object edColumnsAmount: TEdit
      Tag = 1
      Left = 84
      Top = 11
      Width = 42
      Height = 22
      TabOrder = 4
      Text = '2'
      Visible = False
      OnExit = edDimensionsExit
    end
    object edLinesAmount: TEdit
      Left = 26
      Top = 11
      Width = 42
      Height = 22
      Margins.Top = 0
      Margins.Right = 550
      TabOrder = 5
      Text = '2'
      Visible = False
      OnExit = edDimensionsExit
    end
    object butAddDimension: TButton
      AlignWithMargins = True
      Left = 26
      Top = 11
      Width = 42
      Height = 21
      Margins.Top = 99
      Caption = '+'
      TabOrder = 6
      Visible = False
      OnClick = butAddDimensionClick
    end
    object butRemoveDimension: TButton
      AlignWithMargins = True
      Left = 86
      Top = 11
      Width = 42
      Height = 21
      Margins.Top = 99
      Caption = '-'
      TabOrder = 7
      Visible = False
      OnClick = butRemoveDimensionClick
    end
  end
  object MainMenu: TMainMenu
    Images = ilToolBar
    Left = 576
    Top = 64
    object mmFile: TMenuItem
      Caption = 'File'
      object mmNew: TMenuItem
        Action = aNewFile
      end
      object mmOpen: TMenuItem
        Action = aOpenFile
        Caption = 'Open...'
      end
      object mmSave: TMenuItem
        Action = aSaveFile
      end
      object mmSaveAs: TMenuItem
        Action = aSaveFileAs
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mmExit: TMenuItem
        Action = aExit
      end
    end
    object mmMatrix: TMenuItem
      Caption = 'Matrix'
      object mmViewList: TMenuItem
        Action = aViewMatrixList
      end
      object Clearlist1: TMenuItem
        Caption = 'Clear list'
        ImageIndex = 5
      end
    end
    object mmInfo: TMenuItem
      Caption = 'Info'
      object mmHelp: TMenuItem
        Action = aOpenHelp
      end
      object mmAbout: TMenuItem
        Action = aOpenAbout
      end
      object mmStatistics: TMenuItem
        Caption = 'Statistics'
        object mmCurrentStat: TMenuItem
          Caption = 'Current'
          OnClick = mmCurrentStatClick
        end
        object mmOtherStat: TMenuItem
          Caption = 'Other...'
          OnClick = mmOtherStatClick
        end
      end
    end
  end
  object alToolBar: TActionList
    Images = ilToolBar
    Left = 632
    Top = 64
    object aNewFile: TAction
      Caption = 'New'
      ImageIndex = 0
      ShortCut = 16462
      OnExecute = aNewFileExecute
    end
    object aSaveFile: TAction
      Caption = 'Save'
      ImageIndex = 1
      ShortCut = 16467
      OnExecute = aSaveFileExecute
    end
    object aSaveFileAs: TAction
      Caption = 'Save As...'
      ImageIndex = 2
      ShortCut = 49235
      OnExecute = aSaveFileAsExecute
    end
    object aOpenFile: TAction
      Caption = 'Open'
      ImageIndex = 3
      ShortCut = 16463
      OnExecute = aOpenFileExecute
    end
    object aExit: TAction
      Caption = 'Exit'
      OnExecute = aExitExecute
    end
    object aOpenHelp: TAction
      Tag = 1
      Caption = 'Help'
      OnExecute = aExecuteInfo
    end
    object aOpenAbout: TAction
      Tag = 2
      Caption = 'About'
      OnExecute = aExecuteInfo
    end
    object aViewMatrixList: TAction
      Caption = 'View list'
      ImageIndex = 4
      OnExecute = aViewMatrixListExecute
    end
  end
  object ilToolBar: TImageList
    Left = 688
    Top = 64
    Bitmap = {
      494C010105000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF464646B90000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF6262629D0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF010101FE0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFD029090906F9090906F9090
      906F9090906F9090906F9090906F9090906F9090906F9090906F9090906F9090
      906F9090906F9090906F9191916E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008181817E020202FD020202FD0202
      02FD020202FD020202FD020202FD020202FD020202FD020202FD020202FD0202
      02FD020202FD020202FD020202FD000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000060606F9000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E25174B2CC0F3EFABF10
      3EF9B3123FF7A6123FF69A143EF48D153EF383153EF283173FF0841941EE851A
      43EC851C43EA861C43EBFCFAFB050000000000000000D76A56C0D54F38FE5226
      1FFE291D1BFE291D1BFE291D1BFE291D1BFE291D1BFE291D1BFE291D1BFE291D
      1BFE241A18FED54E38FED54F38FECD4930E800000000D76A56C0D54F38FE5226
      1FFE291D1BFE291D1BFE291D1BFE291D1BFE291D1BFE291D1AFE221629FE2216
      29FE201620FED54E38FED54F38FECD4930E80000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EB4D71B4F6F3E7FFF7F4
      E9FFF7F1E3FFF6EFDDFFF5ECD7FFF5EAD1FFF4E8CCFFF3E5C6FFF3E2C0FFF2E0
      BBFFF2E0BAFFB06168FFFCFAFB0500000000DA7765AFFE9D98FFFF9F9AFF543B
      39FFC5C5C5FFBDBEBEFFBEBEBEFFBDBEBEFFBCBCBCFFBCBCBCFFBCBCBCFFBCBC
      BCFF6F7071FFFF9E99FFFF9F9AFFD45640E9DA7765AFFE9D98FFFF9F9AFF543B
      39FFC5C5C5FFBDBEBEFFBEBEBEFFBDBEBEFFBCBCBCFFBFBFBBFF0202FFFF0404
      FFFF070899FFFF9E99FFFF9F9AFFD45640E900000000288DA8DD5CABC2A8A4CE
      D95DDFEDF120FCFDFD0300000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F54C72B4F7F4EDFFF9F8
      F5FFF8F6EFFFF7F4E9FFF7F3E4FFF6F1DEFFF5EFD9FFF5EED3FFF4ECCEFFF4EB
      C8FFF3E9C3FFAE5E66FFFCFBFB0400000000F9938BFFFF9E99FFFF9E99FF543A
      39FFC7C7C7FFE78571FFF47055FFDE9484FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2
      C2FF6E6F6FFFFF9E99FFFF9F9AFFD45540E9F9938BFFFF9E99FFFF9E99FF543A
      39FFC7C7C7FFE78571FFF47055FFDF9484FFC3C3C2FFC6C6C1FF0202FEFF0404
      FEFF070897FFFF9F98FFFFA099FFD45540E9000000001693BFFF0AB6F1FF10BB
      F5FF14B9EFFF16AEDFFF159FC8FC2E9BBBDE62AEC2A3A8CFDA59E0EDF11FFDFD
      FD020000000000000000000000000000000000000000FE4D73B4F7F6F1FFF9F9
      F8FFF8F7F3FFF8F6EEFFF7F4E8FFF6F2E2FFF6F1DDFFF5EFD7FFF5EDD2FFF4EC
      CCFFF3EAC7FFAD5D66FFFCFBFB0400000000F9938BFFFF9E99FFFF9E99FF543A
      39FFCBCCCCFFF2775EFFFF5B39FFE88B78FFCACACAFFCACACAFFCACACAFFCACA
      CAFF6E6F6FFFFF9E99FFFF9F9AFFD45540E9F9938BFFFF9E99FFFF9E99FF543A
      39FFCBCCCCFFF2775EFFFF5B39FF973F88FF2020F0FF2020F0FF0404FEFF0404
      FEFF0303EBFF2919E9FF2618EBFFD5573EE9FAFCFC0529B0E7FF0C99C5FF14BD
      F4FF19BFF5FF1EC1F6FF22C2F7FF25C4F7FF29C5F8FF2BC6F9FF2BC1F2FF27B4
      E0FF2F97B3DD00000000000000000000000000000000FF5776B4F7F7F3FFF9F9
      F9FFF9F8F7FFF8F7F2FFF8F5ECFFF7F3E6FFF6F2E1FFF6F0DBFFF5EFD6FFF4ED
      D0FFF4EBCBFFAC5D68FFFDFCFC0300000000F9938BFFFF9E99FFFF9E99FF543A
      39FFD0D0D0FFF27E66FFFD6141FFEA9380FFD3D3D3FFD3D3D3FFD3D3D3FFD3D3
      D3FF6D6F6FFFFF9E99FFFF9F9AFFD45540E9F9938BFFFF9E99FFFF9E99FF543A
      39FFD0D0D0FFF27E66FFFD6141FF883692FF0404FEFF0404FEFF0404FEFF0404
      FEFF0202FCFF0503FDFF0101FFFFD6573EE9E2EFF21D33BCF3FF1B9AC6FF19C0
      F6FF1DC1F6FF22C3F6FF26C4F7FF29C5F7FF2CC6F7FF2FC7F8FF31C7F8FF33C7
      F6FF57CAE5D5F3F8F90C000000000000000000000000FF6278B4F8F8F5FFF9F9
      F9FFF9F9F9FFF9F8F6FFF8F6F0FFF7F5EAFFF7F3E5FFF6F1DFFFF6F0DAFFF5EE
      D4FFF4EDCFFFAC5D69FFFDFCFC0300000000F9938BFFFF9E99FFFF9E99FF543B
      39FFDEDEDEFFDDDEDEFFDCDFDFFFDDDEDEFFDDDDDDFFDDDDDDFFDDDDDDFFDDDD
      DDFF777878FFFF9E99FFFF9F9AFFD45540E9F9938BFFFF9E99FFFF9E99FF543B
      39FFDEDEDEFFDDDEDEFFDCDFDFFF7D7FE3FF1111F8FF1111F8FF0404FEFF0404
      FEFF0202F5FF140CF3FF100AF5FFD6573EE9BBD9E2453CC6FAFF35BFF5FF18B2
      E1FF22C4F6FF26C5F7FF2AC7F8FF2DC8F7FF30C8F8FF32C9F9FF34C9F8FF38C6
      EDFD7DE7FEBA7BB9CA88000000000000000000000000FF6D7CB4F8F9F7FFF9F9
      F9FFF9F9F9FFF9F9F9FFF8F8F4FFF8F6EEFFF7F4E9FFF7F3E3FFF6F1DEFFF5EF
      D8FFF5EED3FFB25D6BFFFDFDFD0200000000F9938BFFFF9E99FFFF9E99FFAA6C
      69FF885755FF895755FF895755FF895755FF895755FF895755FF895755FF8957
      55FF885856FFFF9E99FFFF9F9AFFD45540E9F9938BFFFF9E99FFFF9E99FFAA6C
      69FF885755FF895755FF895755FF8A5955FF8B5A55FF8D5C52FF0100FDFF0201
      FBFF3724B1FFFFA098FFFFA199FFD45540E98AC0CF7944CDFCFF3DC7FBFF1493
      B9FF26C6F7FF2AC7F7FF2EC9F8FF31CAF8FF34CBF8FF36CBF9FF38CBF9FF52D0
      EDE57FE7FCB944AEC7D9000000000000000000000000FF787FB4F8F9F8FFF9F9
      F9FFF9F9F9FFF9F9F9FFF9F9F8FFF8F7F2FFF8F5EDFFF7F4E7FFF6F2E2FFF6F0
      DCFFF5EFD7FFBA5C6DFFFEFDFD0200000000F9938BFFFF9E99FFFF9E99FFFF9E
      99FFFF9E99FFFF9E99FFFF9E99FFFF9E99FFFF9E99FFFF9E99FFFF9E99FFFF9E
      99FFFF9E99FFFF9E99FFFF9F9AFFD45540E9F9938BFFFF9E99FFFF9E99FFFF9E
      99FFFF9E99FFFF9E99FFFF9E99FFFF9E99FFFF9E99FFFFA097FF0101FEFF0402
      FEFF6640CEFFFF9E99FFFF9F9AFFD45540E95AABC1AF49D2FCFF43CCFAFF30B3
      E1FF29C6F5FF2ECAF8FF32CBF9FF35CCF8FF38CDF9FF3ACDFAFF3BCCF7FF76E2
      F8C284E9FCB583E5F7B6D1E6EB2E0000000000000000FF8382B5F9FAF9FFF9F9
      F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F8F7FFF8F7F1FFF7F5EBFFF7F3E6FFF6F2
      E0FFF6F0DBFFC25B6EFFFEFEFE0100000000F9938BFFFF938FFFFF696AFFFF6A
      6BFFFF6A6BFFFF6A6BFFFF6A6BFFFF6A6BFFFF6A6BFFFF6A6BFFFF6A6BFFFF6A
      6BFFFF6768FFFF9F9AFFFF9F9AFFD45540E9F9938BFFFF938FFFFF696AFFFF6A
      6BFFFF6A6BFFFF6A6BFFFF6A6BFFFF6A6BFFFF6A6BFFFF6A6BFFD04D77FFD14D
      77FFE3566FFFFF9F9AFFFF9F9AFFD45540E93CA1BDDA4FD7FCFF49D1FBFF44CD
      FCFF1CA4CAFF33CCF8FF36CEF9FF39CFF9FF3CCFF9FF3ED0FAFF3DC9EEFE83E9
      FDB689EBFDB292EFFFAC52A7BCB90000000000000000FF8E86B5F9FAFAFFF9F9
      F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F8F5FFF8F6F0FFF7F5EAFFF7F3
      E4FFF6F1DFFFCB5C70FFFEFEFE0100000000F9938BFFFF8B87FFE9E9E9FFC8CB
      CAFFC8CBCAFFC8CBCAFFC8CBCAFFC8CBCAFFC8CBCAFFC8CBCAFFC8CBCAFFC7CA
      CAFFFFB8B9FFFF9F9AFFFF9F9AFFD45540E9F9938BFFFF8B87FFE9E9E9FFC8CB
      CAFFC8CBCAFFC8CBCAFFC8CBCAFFC8CBCAFFC8CBCAFFC8CBCAFFC8CBCAFFC7CA
      CAFFFFB8B9FFFF9F9AFFFF9F9AFFD45540E932A8C6F554DBFDFF4FD6FCFF49D2
      FBFF229FC4FF38D0FAFF3AD0FAFF3DD1FAFF40D2FAFF42D2FBFF53D0EBE788EB
      FDB38EEDFDAF95EFFEAA69CADDC5FDFDFE0200000000FF9989B5F9FAFAFFF9F9
      F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFF7EAE8FFF7D8D7FFF5D5D1FFF3D3
      CCFFF0D1C6FFD1526BFF0000000000000000F9938BFFFF8B87FFE4E3E3FFBDBD
      BDFFBDBDBDFFBDBDBDFFBDBDBDFFBDBDBDFFBDBDBDFFBDBDBDFFBDBDBDFFBCBC
      BCFFFFB7B9FFFF9F9AFFFF9F9AFFD45540E9F9938BFFFF8B87FFE4E3E3FFBDBD
      BDFFBDBDBDFFBDBDBDFFBDBDBDFFBDBDBDFFBDBDBDFFBDBDBDFFBDBDBDFFBCBC
      BCFFFFB7B9FFFF9F9AFFFF9F9AFFD45540E93EBDD8FF5AE1FDFF55DCFDFF4FD7
      FCFF46CDF5FF29B4D9FF36C5EBFF3BCAF0FF40CEF4FF43D1F7FF78E2F7C28EED
      FEAF95F1FFAA9CF4FFA5A0F5FFA291C4D17100000000FFA48CB5F9FAFBFFF9F9
      F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFFAA6B4FFFD5A29FDF75137FDF13E
      46FEEA2D56FED11141F30000000000000000F9938BFFFF8B87FFE7E6E6FFC3C3
      C3FFC3C3C3FFC3C3C3FFC3C3C3FFC3C3C3FFC3C3C3FFC3C3C3FFC3C3C3FFC2C2
      C2FFFFB7B9FFFF9F9AFFFF9F9AFFD45540E9F9938BFFFF8B87FFE7E6E6FFC3C3
      C3FFC3C3C3FFC3C3C3FFC3C3C3FFC3C3C3FFC3C3C3FFC3C3C3FFC3C3C3FFC2C2
      C2FFFFB7B9FFFF9F9AFFFF9F9AFFD45540E953D4EBFF60E6FEFF5BE1FDFF55DC
      FDFF4FD7FCFF48D0F9FF41C9F6FF3AC1F1FF32BAECFF1A97C1FEC6E0E739B3D6
      DF4D9FCBD7628DC2D0757BB9C98967AEC19D00000000FFB090B5F9FAFBFFF9F9
      F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFFAACB7FFFF9C16FBFC9020FCF975
      39FDEB1744F2FEFAFB050000000000000000F9938BFFFF8B87FFE9E8E8FFC9C9
      C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC8C8
      C8FFFFB7B9FFFF9F9AFFFF9F9AFFD45540E9F9938BFFFF8B87FFE9E8E8FFC9C9
      C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC9C9C9FFC8C8
      C8FFFFB7B9FFFF9F9AFFFF9F9AFFD45540E934A7C1F335ACC6F634ACC7F832AC
      CAFA27A0C0FDC8E0E737C8E1E737C8E1E737C8E1E737D1E6EB2F00000000A7A7
      A7580000000000000000000000000000000000000000FFBB93B6F9FAFBFFF9F9
      F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFFBB2B9FFFFAF49FCFFA814FBFF20
      45F1FEFAFB05000000000000000000000000F9938BFFFF8B87FFECEAEBFFCFCF
      CFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCECE
      CEFFFFB7B9FFFF9F9AFFFF9F9AFFD45540E9F9938BFFFF8B87FFECEAEBFFCFCF
      CFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCFCFCFFFCECE
      CEFFFFB7B9FFFF9F9AFFFF9F9AFFD45540E90000000000000000000000000000
      000000000000000000000000000000000000FAFAFA0500000000F6F6F609B1B1
      B14EFBFBFB0400000000000000000000000000000000FFC696B6F9FAFBFFF9F9
      F9FFF9F9F9FFF9F9F9FFF9F9F9FFF9F9F9FFFBB8BCFFFFC383FEFF3D50F2FFFA
      FB0500000000000000000000000000000000F9928AFFFF8986FFEEEDEDFFD5D5
      D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5D5FFD4D4
      D4FFFFB7B8FFFF9E99FFFF9E99FFD45540E9F9928AFFFF8986FFEEEDEDFFD5D5
      D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5D5FFD5D5D5FFD4D4
      D4FFFFB7B8FFFF9E99FFFF9E99FFD45540E90000000000000000000000000000
      000000000000000000000000000000000000BBBBBB4400000000F9F9F906DBDB
      DB240000000000000000000000000000000000000000FFCA98B6FBE4CEFFFBDF
      CCFFFBDACAFFFBD5C9FFFBD0C7FFFBCCC6FFFC9F9DFFFF585DF0FFFBFB050000
      000000000000000000000000000000000000ECD0C4FFF0E1D7FFF8EDEBFFF4E9
      E7FFF4E8E6FFF4E8E6FFF4E8E5FFF3E7E5FFF3E7E5FFF3E7E5FFF3E7E4FFF3E7
      E4FFF6E6E0FFEEE0D5FFEFE1D6FFD2604AE9ECD0C4FFF0E1D7FFF8EDEBFFF4E9
      E7FFF4E8E6FFF4E8E6FFF4E8E5FFF3E7E5FFF3E7E5FFF3E7E5FFF3E7E4FFF3E7
      E4FFF6E6E0FFEEE0D5FFEFE1D6FFD2604AE90000000000000000000000000000
      000000000000000000000000000000000000FEFEFE01D4D4D42BE5E5E51A0000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      000000000000000000000000000000000000000000000000FFFF000000000000
      FFFF000000000000000000000000000000000000000000000001000000000000
      FFFF000000000000000100000000000000000000000000000000000000000000
      FFFF000000000000FFFF000000000000800180008000FFFF80010000000083FF
      800100000000800F800100000000000780010000000000038001000000000003
      8001000000000003800100000000000180010000000000018001000000000000
      80030000000000008003000000000000800300000000002F800700000000FF47
      800F00000000FF4F801F00000000FF1F00000000000000000000000000000000
      000000000000}
  end
  object odMain: TOpenDialog
    Left = 689
    Top = 118
  end
  object sdMain: TSaveDialog
    Left = 640
    Top = 117
  end
end
