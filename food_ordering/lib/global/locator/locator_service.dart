import 'package:food_ordering/core/services/implements/auth_service.dart';
import 'package:food_ordering/core/services/interfaces/iauth_service.dart';
import 'package:food_ordering/global/locator/locator.dart';

void setUPService(){
  locator.registerLazySingleton<IAuthService>(() => AuthService());
}