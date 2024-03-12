import 'package:beamer/beamer.dart';
import 'package:catalogo_front/screens/login_screen.dart';
import 'package:flutter/material.dart';

class LoginLocation extends BeamLocation<BeamState> {
  LoginLocation({RouteInformation? routeInformation}) : super(routeInformation);

  @override
  List<String> get pathPatterns => ['/login'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('login'),
        title: 'Login',
        child: LoginScreen(),
      ),
    ];
  }
}
