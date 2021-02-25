import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ordering/ui/screens/splash_screen/splash_screen.dart';
import 'package:food_ordering/ui/utils/loading_dialog_utils.dart';
import 'package:get/get.dart';

void main() {
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
        home: SplashScreen(),
      ),
    );
  }
}
