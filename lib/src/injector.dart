import 'package:fourth_pyramid_task/core/consts/consts.dart';
import 'package:fourth_pyramid_task/src/login/login.dart';
import 'package:fourth_pyramid_task/src/login/presentation/bloc/bloc.dart';
import 'package:fourth_pyramid_task/src/qr/data/sources/local_source.dart';
import 'package:fourth_pyramid_task/src/qr/presentation/bloc/bloc.dart';
import 'package:fourth_pyramid_task/src/qr/qr.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // ----------------- General Settings -----------------

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());

  // ----------------- Login -----------------

  //! Blocs
  sl.registerFactory(() => AuthenticationBloc(loginUC: sl()));

  //! Use cases
  sl.registerLazySingleton(() => LoginUC(sl()));

  //! Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  // ----------------- QR Scanning -----------------

  //! Blocs
  sl.registerFactory(() => QRBloc(
        scanQRUC: sl(),
        getResultsUC: sl(),
        saveResultsUC: sl(),
      ));

  //! Use cases
  sl.registerLazySingleton(() => ScanQRUC(sl()));
  sl.registerLazySingleton(() => GetResultsUC(sl()));
  sl.registerLazySingleton(() => SaveResultUC(sl()));

  //! Repository
  sl.registerLazySingleton<QRCodeRepository>(() => QRCodeRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  //! Data sources
  sl.registerLazySingleton<QRRemoteSource>(() => QRRemoteSourceImpl());
  sl.registerLazySingleton<QRLocalSource>(() => QRLocalSourceImpl(sl()));
}
