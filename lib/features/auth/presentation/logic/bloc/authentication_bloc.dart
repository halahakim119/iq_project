// import 'package:bloc/bloc.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// import '../../../../user/domain/entities/user_entity.dart';
// import '../../../domain/repositories/auth_repository.dart';

// part 'authentication_event.dart';
// part 'authentication_state.dart';
// class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
//   final AuthRepository authRepository;

//   AuthenticationBloc({required this.authRepository}) : super(AuthenticationUninitialized());


//   @override
//   Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
//     if (event is AppStarted) {
//       final token = await authRepository.login();
//       if (token != null) {
//       } else {
//         yield AuthenticationUnauthenticated();
//       }
//     }

//     if (event is LoggedIn) {
//       yield AuthenticationLoading();
//       await authRepository.persistToken(event.token);

//       yield AuthenticationAuthenticated();
//     }

//     if (event is SignedUp) {
//       yield AuthenticationLoading();
//       await authRepository.persistToken(event.token);
//       final user = await authRepository.getUser(event.token);
//       yield AuthenticationAuthenticated();
//     }

//     if (event is LoggedOut) {
//       yield AuthenticationLoading();
//       await authRepository.deleteToken();
//       yield AuthenticationUnauthenticated();
//     }
//   }
// }
