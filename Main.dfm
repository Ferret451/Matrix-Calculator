object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'MatrixCalculator'
  ClientHeight = 383
  ClientWidth = 728
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ShHistoryBorder: TShape
    Left = 8
    Top = 24
    Width = 153
    Height = 342
    Brush.Color = clHighlightText
    Pen.Width = 2
  end
  object LabHistory: TLabel
    Left = 8
    Top = 24
    Width = 3
    Height = 13
  end
  object ButHistory: TButton
    Left = 8
    Top = 8
    Width = 41
    Height = 17
    Caption = 'History'
    TabOrder = 12
  end
  object ButTwo: TButton
    Left = 368
    Top = 248
    Width = 75
    Height = 25
    Caption = '2'
    TabOrder = 0
    OnClick = OnCalcBattonClick
  end
  object ButFive: TButton
    Left = 368
    Top = 279
    Width = 75
    Height = 25
    Caption = '5'
    TabOrder = 1
    OnClick = OnCalcBattonClick
  end
  object ButThree: TButton
    Left = 449
    Top = 248
    Width = 75
    Height = 25
    Caption = '3'
    TabOrder = 2
    OnClick = OnCalcBattonClick
  end
  object ButSix: TButton
    Left = 449
    Top = 279
    Width = 75
    Height = 25
    Caption = '6'
    TabOrder = 3
    OnClick = OnCalcBattonClick
  end
  object ButOne: TButton
    Left = 287
    Top = 248
    Width = 75
    Height = 25
    Caption = '1'
    TabOrder = 4
    OnClick = OnCalcBattonClick
  end
  object ButFour: TButton
    Left = 287
    Top = 279
    Width = 75
    Height = 25
    Caption = '4'
    TabOrder = 5
    OnClick = OnCalcBattonClick
  end
  object ButEight: TButton
    Left = 368
    Top = 310
    Width = 75
    Height = 25
    Caption = '8'
    TabOrder = 6
    OnClick = OnCalcBattonClick
  end
  object ButSeven: TButton
    Left = 287
    Top = 310
    Width = 75
    Height = 25
    Caption = '7'
    TabOrder = 7
    OnClick = OnCalcBattonClick
  end
  object ButNine: TButton
    Left = 449
    Top = 310
    Width = 75
    Height = 25
    Caption = '9'
    TabOrder = 8
    OnClick = OnCalcBattonClick
  end
  object ButZero: TButton
    Left = 368
    Top = 341
    Width = 75
    Height = 25
    Caption = '0'
    TabOrder = 9
    OnClick = OnCalcBattonClick
  end
  object ButComma: TButton
    Left = 287
    Top = 341
    Width = 75
    Height = 25
    Caption = ','
    TabOrder = 10
  end
  object EdMatrixExpression: TEdit
    Left = 287
    Top = 117
    Width = 237
    Height = 21
    TabOrder = 11
    OnExit = EdMatrixExpressionExit
  end
  object ButMatrixes: TButton
    Left = 48
    Top = 8
    Width = 49
    Height = 17
    Caption = 'Matrixes'
    TabOrder = 13
  end
  object ButBackspace: TButton
    Left = 449
    Top = 341
    Width = 75
    Height = 25
    Caption = #8592
    TabOrder = 14
    OnClick = ButBackspaceClick
  end
  object ButCalculate: TButton
    Left = 530
    Top = 341
    Width = 75
    Height = 25
    Caption = '='
    TabOrder = 15
  end
  object ButPlus: TButton
    Left = 530
    Top = 310
    Width = 75
    Height = 25
    Caption = '+'
    TabOrder = 16
    OnClick = OnCalcBattonClick
  end
  object ButMinus: TButton
    Left = 530
    Top = 279
    Width = 75
    Height = 25
    Caption = '-'
    TabOrder = 17
    OnClick = OnCalcBattonClick
  end
  object ButMultiplication: TButton
    Left = 530
    Top = 248
    Width = 75
    Height = 25
    Caption = '*'
    TabOrder = 18
  end
  object ButDivision: TButton
    Left = 530
    Top = 217
    Width = 75
    Height = 25
    Caption = '/'
    TabOrder = 19
    OnClick = OnCalcBattonClick
  end
  object MainMenu1: TMainMenu
    Left = 688
    Top = 8
    object File1: TMenuItem
      Caption = 'File'
      object Open1: TMenuItem
        Caption = 'Open'
        ShortCut = 16463
      end
      object Close1: TMenuItem
        Caption = 'Save'
        ShortCut = 16467
      end
      object SaveAs1: TMenuItem
        Caption = 'SaveAs'
      end
    end
  end
end
