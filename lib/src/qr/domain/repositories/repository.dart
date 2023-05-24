part of '../../qr.dart';

abstract class QRCodeRepository {
  Future<dz.Either<Failure, List<ResultEntity>>> scanQR();
  Future<dz.Either<Failure, List<ResultEntity>>> getResults();
  Future<dz.Either<Failure, bool>> saveResult(String result);
}
