unit untConstants;

interface

type
  TOperatorsPriority = record
    FOper: char;
    FPriority: byte;
  end;

const
  Infinity = 1.0 / 0.0;

  DefaultMatrixLength = 1;
  DefaultMatrixHeight = 1;
  DefaultMatrixStringElement = '0';

  Symbols = ['0'..'9', ',', '_', 'a'..'z', 'A'..'Z'];
  Operators = ['+', '-', '*', '/', '(', ')', '^'];
  Numbers = ['0'..'9'];

  MatrixNameFirstElValidSymbols = ['a'..'z', 'A'..'Z', '_'];
  MatrixNameValidSymbols = ['a'..'z', 'A'..'Z', '_', '0'..'9'];
  MatrixInvalidNames: array of string = ['T'];
  MatrixOperations: array of string = ['T'];

  ExampleText = '1234567890';
  DefaulePenWidth = 3;
  StartPosX = 10;
  StartPosY = 10;
  LineInterval = 10;
  ColumnInterval = 15;
  EqualsLeftBraceInterval = 7;
  TopBottomBraceLinesLength = 5;

  ScrollStep = 42 shl 1;

  Ascending = True;
  Descending = False;

  dirAppData = 'AppData';
  constExtStat = '.stat';
  constExtFile = 'matr';

  msMatrListDelete = 'Are you sure you want to delete matrix list? All Matrixes will be deleted permatly';
implementation

end.
