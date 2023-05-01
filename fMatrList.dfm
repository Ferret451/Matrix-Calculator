object fMatrixList: TfMatrixList
  Left = 0
  Top = 0
  Caption = 'MatrixList'
  ClientHeight = 325
  ClientWidth = 450
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object tbMatrixList: TToolBar
    Left = 0
    Top = 0
    Width = 450
    Height = 49
    ButtonHeight = 49
    ButtonWidth = 49
    Caption = 'tbMatrixList'
    Images = ilMatrixList
    TabOrder = 0
    object tbNewMatrix: TToolButton
      Left = 0
      Top = 0
      Action = aNewMatrix
    end
    object ToolButton1: TToolButton
      Left = 49
      Top = 0
      Action = aSortListAtoZ
    end
    object tbClearList: TToolButton
      Left = 98
      Top = 0
      Action = aSortListZtoA
    end
    object tbClear: TToolButton
      Left = 147
      Top = 0
      Action = aClearList
    end
  end
  object alMatrixList: TActionList
    Images = ilMatrixList
    Left = 392
    Top = 8
    object aNewMatrix: TAction
      Caption = 'New Matrix...'
      ImageIndex = 0
      OnExecute = aNewMatrixExecute
    end
    object aSortListAtoZ: TAction
      Caption = 'Sort List A to Z...'
      ImageIndex = 1
      OnExecute = aSortListAtoZExecute
    end
    object aSortListZtoA: TAction
      Caption = 'Sort List Z to A...'
      ImageIndex = 2
    end
    object aClearList: TAction
      Caption = 'Clear List...'
      ImageIndex = 3
      OnExecute = aClearListExecute
    end
  end
  object ilMatrixList: TImageList
    Left = 336
    Top = 8
    Bitmap = {
      494C010104000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000191919E6020202FD000000FF000000FF030303FC5F5F5FA00000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000020202FD000000FF000000FF000000FF000000FF000000FF000000FF0505
      05FA000000000000000000000000000000000000000000000000000000000000
      00FF000000FF090909F6FDFDFD02000000000000000000000000000000FF0000
      00FF787878870000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF030303FC000000FF000000FF000000FF000000FF000000FF0000
      00FFFCFCFC030000000000000000000000000000000000000000040404FB0404
      04FB000000000000000000000000000000000000000000000000000000000000
      0000010101FE000000FF00000000000000000000000000000000000000000303
      03FC000000FF000000FF000000FFFCFCFC030000000000000000000000008181
      817E000000000000000000000000000000000000000000000000000000000303
      03FC000000FF000000FF000000FFFCFCFC030000000000000000000000000303
      03FC000000FF000000000000000000000000000000000000000000000000EAEA
      EA15000000FFFBFBFB04000000FF00000000454545BA181818E7000000000000
      00FF0000000000000000000000000000000000000000000000FF020202FD0000
      0000000000000000000000000000FDFDFD02FEFEFE0100000000000000000000
      000000000000010101FE78787887000000000000000000000000000000000000
      00FF000000FF00000000000000000000000000000000000000008181817E0000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      00FF000000FF0000000000000000000000000000000000000000000000000303
      03FC000000FF0000000000000000000000000000000000000000000000003030
      30CF000000FFFEFEFE01040404FB00000000464646B9000000FF000000000000
      00FF00000000000000000000000000000000FCFCFC03000000FF000000000000
      0000000000000000000000000000000000FFB9B9B94600000000000000000000
      00000000000000000000000000FF000000000000000000000000000000000000
      0000020202FD000000FF0000000000000000000000008484847B030303FC0000
      00FF000000FF030303FC00000000000000000000000000000000000000000000
      0000020202FD000000FF00000000000000000000000000000000000000000303
      03FC000000FF0000000000000000000000000000000000000000000000000000
      00FF000000FF00000000010101FE00000000464646B9000000FFFBFBFB040000
      00FF565656A9000000000000000000000000000000FF8585857A000000000000
      0000000000000000000000000000000000FFB9B9B94600000000000000000000
      00000000000000000000000000FF6060609F0000000000000000000000000000
      000000000000000000FF030303FC000000000000000000000000000000000303
      03FC000000FF0000000000000000000000000000000000000000000000000000
      000000000000000000FF030303FC000000000000000000000000000000000303
      03FC000000FF0000000000000000000000000000000000000000000000000404
      04FB000000FF00000000000000FF00000000464646B9040404FBFEFEFE010000
      00FF000000FF000000000000000000000000000000FFFEFEFE01000000000000
      0000000000000000000000000000000000FFB9B9B94600000000000000000000
      0000000000000000000000000000030303FC0000000000000000000000000303
      03FC000000FF000000FF000000FFFCFCFC030000000000000000000000000303
      03FC000000FF0000000000000000000000000000000000000000000000000303
      03FC000000FF000000FF000000FFFCFCFC030000000000000000000000000303
      03FC000000FF0000000000000000000000000000000000000000000000000000
      00FF000000FF00000000000000FF00000000464646B9010101FE000000000000
      00FF030303FC000000000000000000000000000000FF00000000000000000000
      0000B9B9B946B9B9B946B9B9B946000000FF87878778B9B9B946B9B9B946B9B9
      B946FEFEFE010000000000000000000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000303
      03FC000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000303
      03FC000000FF0000000000000000000000000000000000000000000000000000
      00FF000000FF00000000000000FF00000000464646B9000000FF000000000000
      00FF010101FE000000000000000000000000000000FF00000000000000000000
      0000000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FFFDFDFD020000000000000000000000FF000000000000000000000000FCFC
      FC03FCFCFC0300000000FCFCFC03000000000000000000000000000000000303
      03FC000000FF000000000000000000000000000000000000000000000000FCFC
      FC03FCFCFC0300000000FCFCFC03000000000000000000000000000000000303
      03FC000000FF0000000000000000000000000000000000000000000000000000
      00FF000000FF00000000000000FF00000000464646B9000000FF000000000000
      00FF000000FF000000000000000000000000000000FF00000000000000000000
      0000000000000000000000000000000000FFB9B9B94600000000000000000000
      00000000000000000000FDFDFD02010101FE0000000000000000000000000303
      03FC000000FF00000000000000FFFCFCFC030000000000000000000000000303
      03FC000000FF0000000000000000000000000000000000000000000000000303
      03FC000000FF00000000000000FFFCFCFC030000000000000000000000000303
      03FC000000FF0000000000000000000000000000000000000000000000000000
      00FF030303FC00000000000000FF00000000464646B9000000FF000000000000
      00FF000000FF000000000000000000000000000000FFDCDCDC23000000000000
      0000000000000000000000000000000000FFB9B9B94600000000000000000000
      000000000000000000000A0A0AF51C1C1CE30000000000000000000000000303
      03FC000000FF000000FF000000FFFCFCFC030000000000000000000000000303
      03FC000000FF0000000000000000000000000000000000000000000000000303
      03FC000000FF000000FF000000FFFCFCFC030000000000000000000000000303
      03FC000000FF0000000000000000000000000000000000000000FBFBFB040000
      00FF010101FE00000000000000FF7A7A7A85000000FF000000FFFCFCFC030000
      00FF000000FF000000000000000000000000FEFEFE01000000FF000000000000
      0000000000000000000000000000000000FFB9B9B94600000000000000000000
      00000000000000000000000000FF000000000000000000000000000000000303
      03FC000000FF00000000000000FFFCFCFC030000000000000000000000000303
      03FC000000FF0000000000000000000000000000000000000000000000000303
      03FC000000FF00000000000000FFFCFCFC0300000000000000FF000000FF0000
      00FF000000FF000000FF7070708F000000000000000000000000000000000202
      02FD020202FD020202FD020202FD020202FD020202FD020202FD020202FD0202
      02FD020202FDFBFBFB04000000000000000000000000010101FE000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000030303FC000000FF000000000000000000000000000000000303
      03FC000000FFFCFCFC03000000FFFCFCFC030000000000000000000000000303
      03FC000000FF0000000000000000000000000000000000000000000000000303
      03FC000000FFFCFCFC03000000FFFCFCFC030000000000000000000000FF0000
      00FF000000FF7E7E7E81000000000000000000000000000000000F0F0FF00000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FFA2A2A25D00000000000000000000000000000000000000FF0000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000030303FC040404FB0000000000000000000000000000000000000000A4A4
      A45B000000FF000000FF000000FF000000000000000000000000000000000303
      03FC000000FF000000000000000000000000000000000000000000000000A4A4
      A45B000000FF000000FF000000FF000000000000000000000000000000000000
      00FF7E7E7E810000000000000000000000000000000000000000020202FD0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF010101FE00000000000000000000000000000000000000000303
      03FC000000FFE0E0E01F000000000000000000000000FEFEFE01878787780000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000030303FC000000000000000000000000C8C8C837000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FDFDFD02000000FF000000FF000000FF000000FF000000FF010101FEFCFC
      FC03000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000FF000000FF000000FF262626D90000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F81FFFFFFFFFF00FE1C7FFFFFFFFF007
      CFF3E0EFE0E7E12F9E79E7C7E7E7E12F3E7DF383F3E7E5073E7CF9E7F9E7E507
      3E7EE0E7E0E7E5277006FFE7FFE7E5277006E5E7E5E7E5277E7CE4E7E4E7E527
      3E7CE0E7E0E7C4073E7DE4E7E481E0039FF9E0E7E0C3C003CFF3E1E7E1E7C003
      E387FFFFFFFFFB9FF00FFFFFFFFFF81F00000000000000000000000000000000
      000000000000}
  end
end
