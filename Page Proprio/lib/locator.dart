import 'package:get_it/get_it.dart';
import 'package:testapp/Services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
