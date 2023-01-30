import 'package:get_it/get_it.dart';

import '../../features/users/data/datasource/user_data_source.dart';
import '../../features/users/data/repositories/user_repository_impl.dart';
import '../../features/users/domain/repositories/user_repository.dart';
import '../../features/users/domain/usecases/get_user_usecase.dart';
import '../../features/users/presentation/logic/cubit/user_cubit.dart';


final sl = GetIt.instance;

Future<void> init() async {
  //!user
// Bloc
  sl.registerFactory(() => UserCubit(getData: sl()));
// Usecases
  sl.registerLazySingleton(() => GetUserUsecase(userRepository: sl()));
// Repository
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(userDataSource: sl()));
// data sources
  sl.registerLazySingleton<UserDataSource>(
    () => UserDataSourceImpl(),
  );
}
