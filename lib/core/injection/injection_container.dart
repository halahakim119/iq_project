import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repositories/login_repository_impl.dart';
import '../../features/auth/data/repositories/signup_repository_impl.dart';
import '../../features/auth/domain/repositories/login_repository.dart';
import '../../features/auth/domain/repositories/signup_repository.dart';
import '../../features/auth/domain/usecases/login_use_case.dart';
import '../../features/auth/domain/usecases/signup_use_case.dart';
import '../../features/auth/presentation/logic/cubit/authentication_cubit.dart';
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
import '../../features/schedule/data/datasources/schedule_management_data_source.dart';
import '../../features/schedule/data/repositories/schedule_management_repository_impl.dart';
import '../../features/schedule/domain/repositories/schedule_management_repository.dart';
import '../../features/schedule/domain/usecases/add_meal_usecase.dart';
import '../../features/schedule/domain/usecases/delete_meal_usecase.dart';
import '../../features/schedule/domain/usecases/get_all_meals_usecase.dart';
import '../../features/schedule/presentation/logic/add_delete_meal_bloc/add_delete_meal_bloc.dart';
import '../../features/schedule/presentation/logic/get_all_meals_bloc/cubit/get_all_meals_cubit.dart';
import '../network/internet_checker.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Firebase Auth
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  //! FirebaseDatabase
  sl.registerLazySingleton(() => FirebaseDatabase.instance);
  sl.registerLazySingleton(() => sl<FirebaseDatabase>().reference());

  //! Authentication Cubit
  sl.registerFactory(
    () => AuthenticationCubit(
      firebaseAuth: sl(),
      loginUseCase: sl(),
      signupUseCase: sl(),
    ),
  );

// Usecases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => SignupUseCase(sl()));

// Repository
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(sl()));
  sl.registerLazySingleton<SignupRepository>(
      () => SignupRepositoryImpl(sl(), sl()));

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
  sl.registerLazySingleton<UserDataSource>(
      () => UserDataSourceImpl(userDatabaseReference: sl()));

  //!Schedule
// bloc
  sl.registerFactory(() => GetAllMealsCubit(
      scheduleManagementDataSource: sl(), getAllMealsUsecase: sl()));
  sl.registerFactory(
      () => AddDeleteMealBloc(addMealUsecase: sl(), deleteMealUsecase: sl()));

// Usecases
  sl.registerLazySingleton(() => GetAllMealsUsecase(sl()));
  sl.registerLazySingleton(() => AddMealUsecase(sl()));
  sl.registerLazySingleton(() => DeleteMealUsecase(sl()));

// Repository
  sl.registerLazySingleton<ScheduleManagementRepository>(() =>
      ScheduleManagementRepositoryImpl(scheduleManagementDataSource: sl()));
// data sources
  sl.registerLazySingleton<ScheduleManagementDataSource>(
      () => ScheduleManagementDataSourceImpl());
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
}
