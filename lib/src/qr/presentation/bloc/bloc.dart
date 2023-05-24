import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fourth_pyramid_task/core/consts/consts.dart';
import 'package:fourth_pyramid_task/core/public_models/public_models.dart';
import 'package:fourth_pyramid_task/src/qr/qr.dart';
import 'package:intl/intl.dart';
import 'package:share/share.dart';

import 'dart:async';

part 'event.dart';
part 'state.dart';

class QRBloc extends Bloc<QRCodeEvent, QRCodeState> {
  final ScanQRUC scanQRUC;
  final SaveResultUC saveResultsUC;
  final GetResultsUC getResultsUC;
  QRBloc(
      {required this.scanQRUC,
      required this.getResultsUC,
      required this.saveResultsUC})
      : super(const InitialState()) {
    on<ScanQRCodeEvent>(_scan);
    on<SaveResultsEvent>(_saveResult);
    on<GetResultsEvent>(_getResults);
    on<StartCameraScanningEvent>(_startCameraScanning);
    on<ShareResultsEvent>(_shareResults);
  }
  FutureOr<void> _scan(ScanQRCodeEvent event, Emitter<QRCodeState> emit) async {
    emit(const QRLoadingState());

    try {
      final admin = await scanQRUC.call(NoParams());
      emit(admin.fold((l) => QRCodeScanFailedState(_mapFailureToMessage(l)),
          (r) {
        return QRShowResultsState(r);
      }));
    } on Exception catch (e) {
      emit(QRCodeScanFailedState(e.toString()));
    }
  }

  FutureOr<void> _startCameraScanning(
          StartCameraScanningEvent event, Emitter<QRCodeState> emit) async =>
      emit(const InitialState());

  FutureOr<void> _saveResult(
      SaveResultsEvent event, Emitter<QRCodeState> emit) async {
    emit(const QRLoadingState());

    try {
      final admin = await saveResultsUC.call(event.result);
      emit(admin.fold((l) => QRCodeScanFailedState(_mapFailureToMessage(l)),
          (r) {
        if (!r) throw "Result not saved!";
        return const ResultSavedState("");
      }));
    } on Exception catch (e) {
      emit(QRCodeScanFailedState(e.toString()));
    }
  }

  FutureOr<void> _getResults(
      GetResultsEvent event, Emitter<QRCodeState> emit) async {
    emit(const QRLoadingState());

    try {
      final admin = await getResultsUC.call(NoParams());
      emit(admin.fold((l) => QRCodeScanFailedState(_mapFailureToMessage(l)),
          (r) {
        return QRShowResultsState(r);
      }));
    } on Exception catch (e) {
      emit(QRCodeScanFailedState(e.toString()));
    }
  }

  FutureOr<void> _shareResults(
      ShareResultsEvent event, Emitter<QRCodeState> emit) async {
    Share.share(
        event.results
            .map((e) =>
                "[${DateFormat('dd-MM-yy | hh:mm').format(e.createdAt)}]- ${e.data}")
            .toList()
            .join('\n'),
        subject: "Scanning Results for last 10 days");
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return failure.message;
      case CacheFailure:
        return failure.message;
      case ScanFailure:
        return failure.message;
      default:
        return 'Unexpected error';
    }
  }
}
