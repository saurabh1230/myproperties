
import 'package:get/get.dart';
import 'package:get_my_properties/features/screens/auth/otp_verification_screen.dart';
import 'package:get_my_properties/features/screens/auth/sign_up.dart';
import 'package:get_my_properties/features/screens/dashboard/dashboard.dart';
import 'package:get_my_properties/features/screens/dashboard/seller_dashboard.dart';
import 'package:get_my_properties/features/screens/explore/explore_screen.dart';
import 'package:get_my_properties/features/screens/explore/ratings_and_review_screen.dart';
import 'package:get_my_properties/features/screens/home/home_screen.dart';
import 'package:get_my_properties/features/screens/onboard/onboarding_screen.dart';
import 'package:get_my_properties/features/screens/onboard/splash_screen.dart';
import 'package:get_my_properties/features/screens/property/prperties_details_screen.dart';
import 'package:get_my_properties/features/screens/saved/saved_screen.dart';
import 'package:get_my_properties/features/screens/search/explore_search_screen.dart';
import 'package:get_my_properties/features/screens/search/search_screen.dart';

import '../features/screens/property/sale_and_rent_dashboard/sale_and_rent_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String sellRentDashboard = '/sell-rent-dashboard';
  static const String onboarding = '/onboarding';
  static const String signUp = '/signUp';
  static const String otpVerification = '/otp-verification';
  static const String adminDashboard = '/admin-dashboard';
  static const String dashboard = '/dashboard';
  static const String home = '/home';
  static const String propertiesDetails = '/properties-details-screen';
  static const String saved = '/saved';
  static const String search = '/search';
  static const String explore = '/explore';
  static const String exploreSearch = '/explore-search';
  static const String ratingsAndReviews = '/rating-and-reviews';



  /// Routes ==================>
  static String getInitialRoute() => initial;
  static String getSplashRoute() => splash;
  static String getOnboardingRoute() => onboarding;
  static String getSignUpRoute() => signUp;
  static String getOtpVerificationRoute() => otpVerification;
  static String getDashboardRoute() => dashboard;
  static String getAdminDashboardRoute() => adminDashboard;
  static String getHomeRoute() => home;
  static String getPropertiesDetailsScreen(String title) => '$propertiesDetails?title=$title';
  static String getSavedRoute({bool isHistory = false}) => '$saved?isHistory=${isHistory.toString()}';
  static String getSearchRoute() => search;
  static String getExploreRoute({bool isBrowser = false, String? title}) =>
      '$explore?isBrowser=${isBrowser.toString()}&title=$title';
  static String getSellAndRentDashboardRoute(String page, String? type) => '$sellRentDashboard?page=$page&type=$type';
  static String getExploreSearchRoute(String? title) =>
      '$exploreSearch?&title=$title';
  static String getRatingsAndReviewRoute() => ratingsAndReviews;




  /// Pages ==================>
  static List<GetPage> routes = [

    GetPage(name: initial, page: () => const SplashScreen()),
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(name: signUp, page: () =>  SignUpScreen()),
    GetPage(name: otpVerification, page: () =>  OtpVerificationScreen()),
    GetPage(name: dashboard, page: () =>  const DashboardScreen(pageIndex: 0)),
    GetPage(name: adminDashboard, page: () =>  const SellerDashboardScreen(pageIndex: 0)),
    GetPage(name: home, page: () =>  HomeScreen()),
    GetPage(name: search, page: () =>   SearchScreen()),
    GetPage(name: propertiesDetails, page: () =>  PropertiesDetailsScreen(title: Get.parameters['title'])),
    GetPage(name: saved, page: () => SavedScreen(isHistory: Get.parameters['isHistory'] == 'true')),
    GetPage(name: explore, page: () => ExploreScreen(isBrowser: Get.parameters['isBrowser'] == 'true',title: Get.parameters["title"],),),
    GetPage(name: sellRentDashboard, page: () => SaleAndRentDashboard(pageIndex:Get.parameters['page'] == 'Sale' ? 0 : 1, type: Get.parameters['type'],),),
    GetPage(name: exploreSearch, page: () => ExploreSearchScreen(title: Get.parameters["title"],),),
    GetPage(name: ratingsAndReviews, page: () => const RatingsAndReviewScreen()),


  ];
}