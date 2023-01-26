import 'package:get_it/get_it.dart';

import 'core/routes/app_router.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.allowReassignment = true;
  sl.registerFactory<AppRouter>(() => AppRouter());
}
