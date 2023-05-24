part of "bloc.dart";

class QRCodeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartCameraScanningEvent extends QRCodeEvent {}

class ShareResultsEvent extends QRCodeEvent {
  final List<ResultEntity> results;

  ShareResultsEvent(this.results);
}

class ScanQRCodeEvent extends QRCodeEvent {}

class GetResultsEvent extends QRCodeEvent {}

class SaveResultsEvent extends QRCodeEvent {
  final String result;

  SaveResultsEvent(this.result);
}
