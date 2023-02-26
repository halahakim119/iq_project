class FirebaseException implements Exception {
  const FirebaseException({required this.message});
  final String message;
}

class NoDataAvailableException implements FirebaseException {
  const NoDataAvailableException(this.message);
  final String message;
}

class SignUpWithEmailAndPasswordFailure implements FirebaseException {
  const SignUpWithEmailAndPasswordFailure(this.message);
  final String message;

  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
          'Please enter a stronger password.',
        );

      default:
        return const SignUpWithEmailAndPasswordFailure(
          'An unknown exception occurred.',
        );
    }
  }
}

class LogInWithEmailAndPasswordFailure implements FirebaseException {
  final String message;
  const LogInWithEmailAndPasswordFailure(this.message);

  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
          'Incorrect password, please try again.',
        );
      default:
        return const LogInWithEmailAndPasswordFailure(
          'An unknown exception occurred.',
        );
    }
  }
}

class LogOutFailure implements FirebaseException {
  const LogOutFailure(this.message);
  final String message;
}
