import 'package:food_ordering/global/global_data.dart';
import 'package:food_ordering/global/locator/locator.dart';
import 'package:food_ordering/global/locator/locator_service.dart';

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => GlobalData());

  setUPService();
}