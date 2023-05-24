part of '../../qr.dart';

class SaveResultUC implements UseCase<bool, String> {
  final QRCodeRepository repository;
  SaveResultUC(this.repository);

  @override
  Future<dz.Either<Failure, bool>> call(String params) async {
    return await repository.saveResult(params);
  }
}
