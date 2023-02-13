import 'package:get_it/get_it.dart';

import '../../features/order/data/datasources/order_data_source.dart';
import '../../features/order/data/repositories/order_repository_impl.dart';
import '../../features/order/domain/repositories/order_repository.dart';
import '../../features/order/domain/usecases/order_usecase.dart';
import '../../features/order/presentation/logic/cubit/order_cubit.dart';
import '../../features/profile/data/datasource/user_data_source.dart';
import '../../features/profile/data/repositories/user_repository_impl.dart';
import '../../features/profile/domain/repositories/user_repository.dart';
import '../../features/profile/domain/usecases/get_user_usecase.dart';
import '../../features/profile/presentation/logic/cubit/user_cubit.dart';
import '../../features/schedule/data/datasources/schedule_data_source.dart';
import '../../features/schedule/data/repositories/schedule_repository_impl.dart';
import '../../features/schedule/domain/repositories/schedule_repository.dart';
import '../../features/schedule/domain/usecases/get_schedule_usecase.dart';
import '../../features/schedule/presentation/logic/cubit/schedule_cubit.dart';
import '../network/internet_checker.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //!Theme

  //!internet Checker
  sl.registerLazySingleton(() => InternetChecker());
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
  //!order
// cubit
  sl.registerFactory(() => OrderCubit(orderUseCase: sl()));

// Usecases
  sl.registerLazySingleton(() => OrderUseCase(orderRepository: sl()));

// Repository
  sl.registerLazySingleton<OrderRepository>(
      () => OrderRepositoryImpl(orderDataSource: sl()));
// data sources
  sl.registerLazySingleton<OrderDataSource>(() => OrderDataSourceImpl());

  //!Schedule
// cubit
  sl.registerFactory(() => ScheduleCubit(getData: sl()));

// Usecases
  sl.registerLazySingleton(() => GetScheduleUsecase(scheduleRepository: sl()));

// Repository
  sl.registerLazySingleton<ScheduleRepository>(
      () => ScheduleRepositoryImpl(scheduleDataSource: sl()));
// data sources
  sl.registerLazySingleton<ScheduleDataSource>(() => ScheduleDataSourceImpl());
}

void setupLocator() {
  sl.registerSingleton(init);
}
