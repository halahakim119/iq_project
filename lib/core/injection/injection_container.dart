import 'package:get_it/get_it.dart';

import '../../features/profile/data/datasource/user_data_source.dart';
import '../../features/profile/data/repositories/user_repository_impl.dart';
import '../../features/profile/domain/repositories/user_repository.dart';
import '../../features/profile/domain/usecases/get_user_usecase.dart';
import '../../features/profile/presentation/logic/cubit/user_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //!user
// cubit
  sl.registerFactory(() => UserCubit(getData: sl()));

// Usecases
  sl.registerLazySingleton(() => GetUserUsecase(userRepository: sl()));

// Repository
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(userDataSource: sl()));
// data sources
  sl.registerLazySingleton<UserDataSource>(() => UserDataSourceImpl());
}

void setupLocator() {
  sl.registerSingleton(init);
}
