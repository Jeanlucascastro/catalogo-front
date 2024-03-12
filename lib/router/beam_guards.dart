import 'package:beamer/beamer.dart';
import 'package:catalogo_front/router/router.dart';

final authGuard = BeamGuard(
  // on which path patterns (from incoming routes) to perform the check
  pathPatterns: ['/login'],
  // perform the check on all patterns that **don't** have a match in pathPatterns
  guardNonMatching: true,
  // return false to redirect
  check: (context, location) {
    return Authenticator.logged;
  },
  // where to redirect on a false check
  beamToNamed: (origin, target) => '/login',
);
