import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/login_entity.dart';
import '../../../domain/entities/signup_entity.dart';
import '../../../domain/usecases/login_use_case.dart';
import '../../../domain/usecases/signup_use_case.dart';

part 'authentication_cubit.freezed.dart';
part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final LoginUseCase loginUseCase;
  final SignupUseCase signupUseCase;
  final FirebaseAuth firebaseAuth;

  AuthenticationCubit({
    required this.signupUseCase,
    required this.loginUseCase,
    required this.firebaseAuth,
  }) : super(AuthenticationState.initial());

  void login(LoginEntity loginEntity) async {
    final result = await loginUseCase(loginEntity);

    result.fold(
      (failure) => emit(AuthenticationState.error(failure.message)),
      (_) => emit(AuthenticationState.loggedIn()),
    );
  }

  void signUp(SignupEntity signupEntity) async {
    final result = await signupUseCase(signupEntity);

    result.fold(
      (failure) => emit(AuthenticationState.error(failure.message)),
      (_) => emit(AuthenticationState.signedUp()),
    );
  }

  void logOut() async {
    await firebaseAuth.signOut();
    emit(AuthenticationState.loggedOut());
  }
}
