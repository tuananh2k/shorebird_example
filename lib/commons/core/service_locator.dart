import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'request.dart';

final getIt = GetIt.instance;

Future<void> setUpServiceLocator() async {
  //external
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerFactory<SharedPreferences>(() => sharedPreferences);
  // request
  getIt.registerSingleton<Request>(Request());

  /**
      // register bloc with getIt
      getIt.registerFactory<DrivingBloc>(() => DrivingBloc());

      // register direction remote datasource
      getIt.registerFactory<DirectionRemoteDatasource>(
      () => DirectionRemoteDatasource());
   */
}
