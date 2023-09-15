  class RouteNamed {
  static const String splashPage = 'SplashPage';
  static const String authenticationOptionPage = 'authenticationOptionPage';
  static const String signUpPage = 'signUpPage';
  static const String signInPage = 'signInPage';
  static const String homePage = 'homePage';
  static const String profilePage = 'profilePage';
  static const String landingPage = 'landingPage';
  static const String declineAttendancePage = 'declineAttendancePage';
  static const String setPreferLocation = 'setPreferLocation';
}
class PathManagement{
  static const String splashPage ='/${RouteNamed.splashPage}';
  static const String authenticationOptionPage ='/${RouteNamed.splashPage}/${RouteNamed.authenticationOptionPage}';
  static const String signUpPage ='/${RouteNamed.splashPage}/${RouteNamed.authenticationOptionPage}/${RouteNamed.signInPage}';
  static const String signInPage ='/${RouteNamed.splashPage}/${RouteNamed.authenticationOptionPage}/${RouteNamed.signInPage}' ;
  static const String homePage ='/${RouteNamed.splashPage}/${RouteNamed.authenticationOptionPage}/${RouteNamed.signInPage}/${RouteNamed.homePage}';
  static const String profilePage ='/${RouteNamed.splashPage}/${RouteNamed.authenticationOptionPage}/${RouteNamed.signInPage}/${RouteNamed.homePage}${RouteNamed.profilePage}';
  static const String landingPage ='/${RouteNamed.splashPage}/${RouteNamed.authenticationOptionPage}/${RouteNamed.signInPage}/${RouteNamed.homePage}/${RouteNamed.landingPage}';
  static const String declineAttendancePage ='/${RouteNamed.splashPage}/${RouteNamed.authenticationOptionPage}/${RouteNamed.signInPage}/${RouteNamed.homePage}/${RouteNamed.landingPage}/${RouteNamed.declineAttendancePage}';
  static const String setPreferLocation ='/${RouteNamed.splashPage}/${RouteNamed.authenticationOptionPage}/${RouteNamed.signInPage}/${RouteNamed.homePage}/${RouteNamed.landingPage}/${RouteNamed.declineAttendancePage}/${RouteNamed.setPreferLocation}';
}