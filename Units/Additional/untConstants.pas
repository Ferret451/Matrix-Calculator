unit untConstants;

interface

type
  TOperatorsPriority = record
    FOper: char;
    FPriority: byte;
  end;

const
  Symbols = ['0'..'9', ',', '_', 'a'..'z', 'A'..'Z'];
  Operators = ['+', '-', '*', '/', '(', ')'];
  Numbers = ['0'..'9'];

  MatrixNameFirstElValidSymbols = ['a'..'z', 'A'..'Z', '_'];
  MatrixNameValidSymbols = ['a'..'z', 'A'..'Z', '_', '0'..'9'];

  ExampleText = '1234567890';
  DefaulePenWidth = 3;
  StartPosX = 10;
  StartPosY = 20;
  LineInterval = 10;
  ColumnInterval = 15;
  EqualsLeftBraceInterval = 7;
  TopBottomBraceLinesLength = 5;

  sgSizeFixingNumber = 6;
implementation

end.
