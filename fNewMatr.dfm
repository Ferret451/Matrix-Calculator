object fNewMatrix: TfNewMatrix
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'NewMatrix'
  ClientHeight = 154
  ClientWidth = 312
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
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
    Top = 62
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
    Left = 223
    Top = 71
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
    Left = 160
    Top = 23
    Width = 135
    Height = 21
    TabOrder = 0
  end
  object edLines: TEdit
    Left = 160
    Top = 69
    Width = 57
    Height = 21
    TabOrder = 1
  end
  object edColumns: TEdit
    Left = 238
    Top = 69
    Width = 57
    Height = 21
    TabOrder = 2
  end
  object butOK: TButton
    Left = 66
    Top = 111
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 3
    OnClick = butOKClick
  end
  object butCancel: TButton
    Left = 172
    Top = 111
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
end
