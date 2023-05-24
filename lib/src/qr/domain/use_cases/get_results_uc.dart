part of '../../qr.dart';

class GetResultsUC implements UseCase<List<ResultEntity>, NoParams> {
  final QRCodeRepository repository;
  GetResultsUC(this.repository);

  @override
  Future<dz.Either<Failure, List<ResultEntity>>> call(NoParams params) async {
    return await repository.getResults();
  }
}
