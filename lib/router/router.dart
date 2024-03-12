import 'dart:async';

import 'package:beamer/beamer.dart';
import 'package:catalogo_front/router/beam_guards.dart';
import 'package:flutter/material.dart';

class Authenticator extends ChangeNotifier {
  final BeamerDelegate beamerDelegate;

  static bool logged = true;

  Authenticator(this.beamerDelegate) {
    //TODO: Desenvolver aqui
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

BeamerDelegate routerCreate() {
  final routerDelegate = BeamerDelegate(
    guards: [
      authGuard,
    ],
    initialPath: '/',
    locationBuilder: BeamerLocationBuilder(
      beamLocations: [
        // RootLocation(),
        // LoginLocation(),
      ],
    ).call,
  );

  Authenticator(routerDelegate);

  return routerDelegate;
}
