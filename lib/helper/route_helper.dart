
import 'package:get/get.dart';
import 'package:get_my_properties/features/screens/auth/otp_verification_screen.dart';
import 'package:get_my_properties/features/screens/auth/sign_up.dart';
import 'package:get_my_properties/features/screens/dashboard/dashboard.dart';
import 'package:get_my_properties/features/screens/home/home_screen.dart';
import 'package:get_my_properties/features/screens/onboard/onboarding_screen.dart';
import 'package:get_my_properties/features/screens/onboard/splash_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String signUp = '/signUp';
  static const String otpVerification = '/otp-verification';
  static const String dashboard = '/dashboard';
  static const String home = '/home';


  /// Routes ==================>
  static String getInitialRoute() => initial;
  static String getSplashRoute() => splash;
  static String getOnboardingRoute() => onboarding;
  static String getSignUpRoute() => signUp;
  static String getOtpVerificationRoute() => otpVerification;
  static String getDashboardRoute() => dashboard;
  static String getHomeRoute() => home;



  /// Pages ==================>
  static List<GetPage> routes = [

    GetPage(name: initial, page: () => const SplashScreen()),
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(name: signUp, page: () =>  SignUpScreen()),
    GetPage(name: otpVerification, page: () =>  OtpVerificationScreen()),
    GetPage(name: dashboard, page: () =>  const DashboardScreen(pageIndex: 2)),
    GetPage(name: home, page: () =>  HomeScreen()),
  ];
}