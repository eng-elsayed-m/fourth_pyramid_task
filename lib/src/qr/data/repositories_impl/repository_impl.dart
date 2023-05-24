part of '../../qr.dart';

class QRCodeRepositoryImpl implements QRCodeRepository {
  final QRRemoteSource remoteDataSource;
  final QRLocalSource localDataSource;
  final NetworkInfo networkInfo;

  QRCodeRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<dz.Either<Failure, List<ResultEntity>>> scanQR() async {
    try {
      final scan = await remoteDataSource.scanQR();
      await localDataSource.savdeResults(scan.data);
      final results = localDataSource
          .loadResults()!
          .entries
          .map((e) =>
              ResultEntity(data: e.value, createdAt: DateTime.parse(e.key)))
          .toList();
      return dz.Right(results);
    } on ServerException {
      return const dz.Left(ScanFailure("No image selected!"));
    }
  }

  @override
  Future<dz.Either<Failure, List<ResultEntity>>> getResults() async {
    try {
      final response = localDataSource.loadResults() ?? {};
      return dz.Right(response.entries
          .map((element) => ResultEntity(
              data: element.value, createdAt: DateTime.parse(element.key)))
          .toList());
    } on CacheFailure {
      return const dz.Left(CacheFailure("No results history!"));
    }
  }

  @override
  Future<dz.Either<Failure, bool>> saveResult(String result) async {
    try {
      final response = await localDataSource.savdeResults(result);
      if (!response) throw const CacheFailure("Result is not saved");
      return dz.Right(response);
    } on ServerException {
      return const dz.Left(CacheFailure("Result is not saved"));
    }
  }
}
