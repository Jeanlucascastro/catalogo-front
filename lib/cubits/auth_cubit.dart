import 'package:bloc/bloc.dart';
import 'package:catalogo_front/cubits/auth_states.dart';

class AuthCubit extends Cubit<AuthState> {

  String _token = '';

  String get token => _token;

  AuthCubit(): super(InitialAuthState());

  Future<void> addToken({required String token}) async {
    emit(LoadingAuthState());

    await Future.delayed(const Duration(seconds: 1));

    if (_token.contains(token)) {
      emit(ErrorAuthState("Usuario anterior ainda logado"));
    } else {
      _token = token;
      emit(LoadedAuthState(_token));
    }
  }

  removeToken() {
    _token = "";
    emit(InitialAuthState());
  }

}
