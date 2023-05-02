object fNewMatrix: TfNewMatrix
  Left = 0
  Top = 0
  Caption = 'NewMatrix'
  ClientHeight = 319
  ClientWidth = 551
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
    Height = 319
    Align = alLeft
    TabOrder = 0
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
      Top = 272
      Width = 167
      Height = 24
      Align = alBottom
      Caption = 'OK'
      TabOrder = 3
      OnClick = butOKClick
    end
    object butCancel: TButton
      Left = 1
      Top = 296
      Width = 167
      Height = 22
      Align = alBottom
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 4
    end
  end
  object sbMatrixElements: TScrollBox
    Left = 174
    Top = 296
    Width = 382
    Height = 319
    TabOrder = 1
    OnMouseActivate = sbMatrixElementsMouseActivate
    object pbMatrixElements: TPaintBox
      Left = 3
      Top = 3
      Width = 206
      Height = 110
    end
  end
  object StringGrid1: TStringGrid
    Left = 169
    Top = 0
    Width = 382
    Height = 319
    Align = alClient
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    TabOrder = 2
    ExplicitLeft = 174
    ExplicitTop = -1
  end
end
