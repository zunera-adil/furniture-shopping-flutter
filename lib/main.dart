import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_shopping_flutter/provider/shipping_address_provider.dart';
import 'package:furniture_shopping_flutter/provider/payment_method_provider.dart';
import 'package:furniture_shopping_flutter/provider/setting_screen_provider.dart';
import 'package:furniture_shopping_flutter/theme/theme.dart';
import 'package:furniture_shopping_flutter/routes/custom_routes.dart';
import 'package:furniture_shopping_flutter/routes/routes_names.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<PaymentMethodProvider>(
                  create: (context) => PaymentMethodProvider()),
              ChangeNotifierProvider<SettingScreenProvider>(
                  create: (context) => SettingScreenProvider()),
              ChangeNotifierProvider<ShippingAddressProvider>(
                create: (context) => ShippingAddressProvider(),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              theme: appTheme,
              initialRoute: splashScreenRoute,
              onGenerateRoute: CustomRouter.allRoutes,
            ),
          );
        });
  }
}
