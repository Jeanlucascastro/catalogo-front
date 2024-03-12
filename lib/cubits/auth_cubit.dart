import 'package:bloc/bloc.dart';
import 'package:catalogo_front/cubits/auth_states.dart';
import 'package:catalogo_front/services/auth_service.dart';

class AuthCubit extends Cubit<AuthState> {

  String _token = '';

  String get token => _token;

  AuthCubit(): super(InitialAuthState());

  Future<void> addToken({required String email, required String pass}) async {
    emit(LoadingAuthState());

      String maybeToken = "";

      AuthService.login(login: email, password: pass).then((String value) {
        maybeToken = value;
    });

    await Future.delayed(const Duration(seconds: 1));

    if (maybeToken != "false") {
      emit(ErrorAuthState("Usuario anterior ainda logado"));
    } else {
      _token = maybeToken;
      emit(LoadedAuthState(_token));
    }
  }

  Future<void> removeToken() async {
    emit(LoadingAuthState());
    await Future.delayed(const Duration(seconds: 1));
    _token = "";
    emit(InitialAuthState());
  }

}
