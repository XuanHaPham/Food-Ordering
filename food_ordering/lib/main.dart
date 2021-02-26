import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering/startups/init_locator.dart';
import 'package:food_ordering/ui/screens/splash_screen/splash_screen.dart';
import 'package:food_ordering/ui/utils/loading_dialog_utils.dart';
import 'package:food_ordering/ui/utils/my_route.dart';
import 'package:get/get.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupLocator();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
  configLoading();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      child: GetMaterialApp(
        locale: DevicePreview.locale(context),
        builder: EasyLoading.init(
          builder: (context, child){
            return DevicePreview.appBuilder(context, child);
          },
        ),
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: MyRoute.generateRoute,
        initialRoute: MyRoute.splashScreen,
      ),
    );
  }
}
