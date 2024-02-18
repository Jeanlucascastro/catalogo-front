abstract class AuthState {}

class InitialAuthState extends AuthState {}

class LoadingAuthState extends AuthState {}

class LoadedAuthState extends AuthState {
  final String token;

  LoadedAuthState(this.token);
}

class ErrorAuthState extends AuthState {
  final String message;

  ErrorAuthState(this.message);
}
