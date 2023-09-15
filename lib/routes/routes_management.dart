import 'package:go_router/go_router.dart';
import 'package:onsite_employee_management_system/page/authentication/Sign_in/sign_in.dart';
import 'package:onsite_employee_management_system/page/authentication/authentication_option/authentication_option.dart';
import 'package:onsite_employee_management_system/page/authentication/profile/profile.dart';
import 'package:onsite_employee_management_system/page/decline_attendance/decline_attendance.dart';
import 'package:onsite_employee_management_system/page/home/home.dart';
import 'package:onsite_employee_management_system/page/landing/landing.dart';
import 'package:onsite_employee_management_system/page/set_prefered_location/set_prefered_location.dart';
import 'package:onsite_employee_management_system/page/splash/splash.dart';
import 'package:onsite_employee_management_system/routes/route_named.dart';

import '../page/authentication/sign_up/sign_up.dart';

class RoutesManagement {
  static final routes =
      GoRouter(initialLocation: PathManagement.declineAttendancePage, routes: [
    GoRoute(
      name: RouteNamed.splashPage,
      path: PathManagement.splashPage,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      name: RouteNamed.authenticationOptionPage,
      path: PathManagement.authenticationOptionPage,
      builder: (context, state) => const AuthenticationOptionPage(),
    ),
    GoRoute(
      name: RouteNamed.signUpPage,
      path: PathManagement.signUpPage,
      builder: (context, state) => const SignUpPage(),
    ),
    GoRoute(
      name: RouteNamed.signInPage,
      path: PathManagement.signInPage,
      builder: (context, state) => const SignInPage(),
    ),
    GoRoute(
      name: RouteNamed.homePage,
      path: PathManagement.homePage,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      name: RouteNamed.profilePage,
      path: PathManagement.profilePage,
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      name: RouteNamed.landingPage,
      path: PathManagement.landingPage,
      builder: (context, state) => const LandingPage(),
    ),
    GoRoute(
      name: RouteNamed.declineAttendancePage,
      path: PathManagement.declineAttendancePage,
      builder: (context, state) => const DeclineAttendancePage(),
    ),
        GoRoute(
          name: RouteNamed.setPreferLocation,
          path: PathManagement.setPreferLocation,
          builder: (context, state) => const SetPreferLocation(),
        ),
  ]);
}
