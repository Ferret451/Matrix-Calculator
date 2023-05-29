unit untSaveLoad;

interface

uses
  System.Classes, clsMatrixList, clsDataManager, System.SysUtils, clsMatrix,
  untTypes, untConstants;

type
  TMatrixInfo = record
    FName: ShortString;
    FLinesAmount: Integer;
    FColumnsAmount: Integer;
  end;

procedure NewFile();
procedure OpenMatrFile(const APath: string);
procedure SaveMatrFile(const APath: string);

implementation

procedure NewFile();
  procedure ClearOpearation(const AOpeartion: TFullOperation);
  begin
    AOpeartion.FProblemMatrix.LinesAmount := DefaultMatrixLength;
    AOpeartion.FProblemMatrix.ColumnsAmount := DefaultMatrixHeight;
    AOpeartion.FProblemMatrix.MartixUpdate;
    AOpeartion.FProblemMatrix.Element[0, 0] := '';
    AOpeartion.FAnswer.FMatrix.LinesAmount := DefaultMatrixLength;
    AOpeartion.FAnswer.FMatrix.ColumnsAmount := DefaultMatrixHeight;
    AOpeartion.FAnswer.FMatrix.MartixUpdate;
    AOpeartion.FAnswer.FMatrix.Element[0, 0] := 0;
  end;
begin
  DataManager.MatrixList.Clear;
  DataManager.ExprProblemString := '';
  DataManager.ExprNumbAnswer := 0;
  DataManager.DetNumbAnswer := 0;
  DataManager.RankNumbAnswer := 0;
  ClearOpearation(DataManager.CurrentExpression);
  ClearOpearation(DataManager.CurrentDeterminant);
  ClearOpearation(DataManager.CurrentInverse);
  ClearOpearation(DataManager.CurrentRank);
end;

procedure OpenMatrFile(const APath: string);
var
  FileStream: TFileStream;
  MatrixInfo: TMatrixInfo;
  Bytes: TBytes;
  Element: Extended;
  i, j, k, Amount: Integer;
  Matrix: TMatrix<Extended>;
begin
  FileStream := TFileStream.Create(APath, fmOpenRead);
  SetLength(Bytes, SizeOf(Extended));
  try
    FileStream.Read(Amount, SizeOf(Integer));
    DataManager.MatrixList.Clear;
    DataManager.MatrixList.Size := Amount;
    for k := 1 to Amount do
    begin
      FileStream.Read(MatrixInfo, SizeOf(TMatrixInfo));
      Matrix := TMatrix<Extended>.Create(MatrixInfo.FName, MatrixInfo.FLinesAmount,
        MatrixInfo.FColumnsAmount);

      for i := 0 to MatrixInfo.FLinesAmount - 1 do
        for j := 0 to MatrixInfo.FColumnsAmount - 1 do
        begin
          FileStream.Read(Bytes[0], SizeOf(Extended));
          Move(Bytes[0], Element, SizeOf(Extended));
          Matrix.Element[i, j] := Element;
        end;
      DataManager.MatrixList.Add(Matrix);
    end;
  finally
    FileStream.Free;
    SetLength(Bytes, 0);
  end;
end;

procedure SaveMatrFile(const APath: string);
var
  FileStream: TFileStream;
  MatrixInfo: TMatrixInfo;
  CurrNode: TMatrixList<Extended>.PNode;
  Bytes: TBytes;
  Element: Extended;
  i, j, MatrixesAmount: Integer;
begin
  FileStream := TFileStream.Create(APath, fmCreate);
  SetLength(Bytes, SizeOf(Extended));
  CurrNode := DataManager.MatrixList.Head;
  try
    MatrixesAmount := DataManager.MatrixList.Size;
    FileStream.Write(MatrixesAmount, SizeOf(Integer));
    while Assigned(CurrNode) do
    begin
      MatrixInfo.FName := CurrNode.FValue.Name;
      MatrixInfo.FLinesAmount := CurrNode.FValue.LinesAmount;
      MatrixInfo.FColumnsAmount := CurrNode.FValue.ColumnsAmount;
      FileStream.Write(MatrixInfo, SizeOf(TMatrixInfo));

      for i := 0 to MatrixInfo.FLinesAmount - 1 do
        for j := 0 to MatrixInfo.FColumnsAmount - 1 do
        begin
          Element := CurrNode.FValue.Element[i, j];
          Move(Element, Bytes[0], SizeOf(Extended));
          FileStream.Write(Bytes[0], SizeOf(Extended));
        end;

      CurrNode := CurrNode^.FNext;
    end;
  finally
    FileStream.Free;
    SetLength(Bytes, 0);
  end;
end;

end.
