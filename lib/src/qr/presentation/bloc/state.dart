part of "bloc.dart";

class QRCodeState extends Equatable {
  const QRCodeState();

  @override
  List<Object?> get props => [];
}

class InitialState extends QRCodeState {
  const InitialState();
}

class QRLoadingState extends QRCodeState {
  const QRLoadingState();
}

class ResultSavedState extends QRCodeState {
  final String message;
  const ResultSavedState(this.message);
}

class QRCodeScanFailedState extends QRCodeState {
  final String message;
  const QRCodeScanFailedState(this.message);
}

class QRShowResultsState extends QRCodeState {
  final List<ResultEntity> results;
  const QRShowResultsState(this.results);
}
