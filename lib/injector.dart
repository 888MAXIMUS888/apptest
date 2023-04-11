import 'package:apptest/presentation/blocs/navigator/navigator_bloc.dart';
import 'package:apptest/presentation/blocs/result/result_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/local/navigation_service.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  /// Navigator
  injector.registerLazySingleton(() => NavigationService());

  /// Blocs
  injector.registerLazySingleton(() => ResultBloc());
  injector.registerLazySingleton(() => NavigatorBloc());
}
