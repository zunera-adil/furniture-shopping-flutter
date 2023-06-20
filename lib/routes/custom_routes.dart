import 'package:flutter/material.dart';
import 'package:furniture_shopping_flutter/components/bottom_nav_bar.dart';
import 'package:furniture_shopping_flutter/model/item_model.dart';
import 'package:furniture_shopping_flutter/routes/routes_names.dart';
import 'package:furniture_shopping_flutter/view/auth/loginin_screen.dart';
import 'package:furniture_shopping_flutter/view/auth/signup_screen.dart';
import 'package:furniture_shopping_flutter/view/auth/confirmation_forget_password_screen.dart';
import 'package:furniture_shopping_flutter/view/auth/forgetpassword_screen.dart';
import 'package:furniture_shopping_flutter/view/auth/welcome_screen.dart';
import 'package:furniture_shopping_flutter/view/cart/cart_screen.dart';
import 'package:furniture_shopping_flutter/view/home/home_page.dart';
import 'package:furniture_shopping_flutter/view/home/rating_and_review/show_product_rating.dart';
import 'package:furniture_shopping_flutter/view/home/product_detail_screen.dart';
import 'package:furniture_shopping_flutter/view/not_found_page.dart';
import 'package:furniture_shopping_flutter/view/onboarding/onboarding.dart';
import 'package:furniture_shopping_flutter/view/onboarding/splash_screen.dart';
import 'package:furniture_shopping_flutter/view/profile/my_order/my_order_screen.dart';
import 'package:furniture_shopping_flutter/view/profile/shipping_address/shipping_address_select_screen.dart';
import 'package:furniture_shopping_flutter/view/profile/payment_method/add_payment_screen.dart';
import 'package:furniture_shopping_flutter/view/profile/payment_method/show_payment_method_screen.dart';
import '../view/profile/shipping_address/add_shipping_address_page.dart';
import 'package:furniture_shopping_flutter/view/profile/Setting/profile_setting_screen.dart';
import 'package:furniture_shopping_flutter/view/profile/my_reviews/my_review_page.dart';

class CustomRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case splashScreenRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onboardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case welcomeRoute:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPassword());
      case confirmForgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ConfirmPasswordScreen());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case homePageRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case bottomNavBarRoute:
        return MaterialPageRoute(builder: (_) => const CustomBottomNavBar());
      case cartScreenRoute:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case myOderRoute:
        return MaterialPageRoute(builder: (_) => const MyOrderScreen());
      case productRatingRoute:
        var arg = settings.arguments as ItemModel;
        return MaterialPageRoute(builder: (_) =>  ShowProductRating(itemModel: arg,));
      case shippingAddressSelectScreenRoute:
        return MaterialPageRoute(builder: (_) => const ShippingAddressSelectedScreen());
      case showPaymentRoute:
        return MaterialPageRoute(builder: (_) => const ShowPaymentScreen());
      case addPaymentRoute:
        return MaterialPageRoute(builder: (_) => const AddPaymentMethodScreen());
      case addShippingAddressRoute:
        return MaterialPageRoute(builder: (_) => const AddShippingAddress());
      case settingScreenRoute:
        return MaterialPageRoute(builder: (_) => const ProfileSetting());
      case myReviewsScreenRoute:
        return MaterialPageRoute(builder: (_) => MyReviews());
      case productDetailScreenRoute:
        var arg = settings.arguments as ItemModel;
        return MaterialPageRoute(
            builder: (_) => DetailScreen(
                  item: arg,
                ));
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
