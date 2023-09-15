import 'package:go_router/go_router.dart';
import 'package:onsite_employee_management_system/page/authentication/Sign_in/sign_in.dart';
import 'package:onsite_employee_management_system/page/authentication/authentication_option/authentication_option.dart';
import 'package:onsite_employee_management_system/page/splash/splash.dart';
import 'package:onsite_employee_management_system/routes/route_named.dart';

import '../page/authentication/sign_up/sign_up.dart';

class RoutesManagement {
  static final routes = GoRouter(initialLocation: '/splashPage/authenticationOptionPage/signInPage', routes: [
    GoRoute(
      name: RouteNamed.splashPage,
      path: '/splashPage',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      name: RouteNamed.authenticationOptionPage,
      path: '/splashPage/authenticationOptionPage',
      builder: (context, state) => const AuthenticationOptionPage(),
    ),
    GoRoute(
      name: RouteNamed.signUpPage,
      path: '/splashPage/authenticationOptionPage/signUpPage',
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      name: RouteNamed.signInPage,
      path: '/splashPage/authenticationOptionPage/signInPage',
      builder: (context, state) => const SignInPage(),
    ),
  ]);
}
