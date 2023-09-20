import 'package:go_router/go_router.dart';
import 'package:onsite_employee_management_system/page/attendance/attendance.dart';
import 'package:onsite_employee_management_system/page/authentication/Sign_in/sign_in.dart';
import 'package:onsite_employee_management_system/page/authentication/authentication_option/authentication_option.dart';
import 'package:onsite_employee_management_system/page/authentication/profile/profile.dart';
import 'package:onsite_employee_management_system/page/home/home.dart';
import 'package:onsite_employee_management_system/page/landing/landing.dart';
import 'package:onsite_employee_management_system/page/role_selection/role_selection.dart';
import 'package:onsite_employee_management_system/page/set_location/set_location.dart';
import 'package:onsite_employee_management_system/page/splash/splash.dart';
import 'package:onsite_employee_management_system/routes/route_named.dart';

import '../page/authentication/sign_up/sign_up.dart';

class RoutesManagement {
  static final routes =
      GoRouter(initialLocation: '/${RouteNamed.signInPage}', routes: [
    GoRoute(
      name: RouteNamed.splashPage,
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      name: RouteNamed.authenticationOptionPage,
      path: '/${RouteNamed.authenticationOptionPage}',
      builder: (context, state) => const AuthenticationOptionPage(),
    ),
    GoRoute(
      name: RouteNamed.signUpPage,
      path: '/${RouteNamed.signUpPage}',
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      name: RouteNamed.signInPage,
      path: '/${RouteNamed.signInPage}',
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      name: RouteNamed.homePage,
      path: '/${RouteNamed.homePage}',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: RouteNamed.profilePage,
      path: '/${RouteNamed.profilePage}',
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      name: RouteNamed.landingPage,
      path: '/${RouteNamed.landingPage}',
      builder: (context, state) => const LandingPage(),
    ),
    GoRoute(
      name: RouteNamed.setLocationPage,
      path: '/${RouteNamed.setLocationPage}',
      builder: (context, state) => const SetLocationPage(),
    ),
    GoRoute(
      name: RouteNamed.roleSelectionPage,
      path: '/${RouteNamed.roleSelectionPage}',
      builder: (context, state) => const RoleSelectionPage(),
    ),
    GoRoute(
      name: RouteNamed.attendancePage,
      path: '/${RouteNamed.attendancePage}',
      builder: (context, state) => const AttendancePage(),
    ),
  ]);
}
