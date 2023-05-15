unit untConstants;

interface

type
  TOperatorsPriority = record
    FOper: char;
    FPriority: byte;
  end;

const
  Symbols = ['0'..'9', ',', 'a'..'z', 'A'..'Z'];
  Operators = ['+', '-', '*', '/', '(', ')'];

  MatrixNameFirstElValidSymbols = ['a'..'z', 'A'..'Z', '_'];
  MatrixNameValidSymbols = ['a'..'z', 'A'..'Z', '_', '0'..'9'];

  ExampleText = '1234567890';
  DefaultFontName = 'Times New Roman';
  DefaultFontSize = 20;
  DefaulePenWidth = 3;
  MatrixListStartPosX = 10;
  MatrixListStartPosY = 20;
  LineInterval = 10;
  ColumnInterval = 15;
  EqualsLeftBraceInterval = 7;
  TopBottomBraceLinesLength = 5;


implementation

end.
