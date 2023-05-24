part of '../../qr.dart';

class ScanQRUC implements UseCase<List<ResultEntity>, NoParams> {
  final QRCodeRepository repository;
  ScanQRUC(this.repository);

  @override
  Future<dz.Either<Failure, List<ResultEntity>>> call(NoParams params) async {
    return await repository.scanQR();
  }
}
