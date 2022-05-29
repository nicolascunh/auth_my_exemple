import 'package:auth_my_exemple/modules/users/user_controller.dart';
import 'package:auth_my_exemple/modules/screens/explorer/explore_view.dart';
import 'package:auth_my_exemple/modules/screens/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Import the generated file
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'modules/screens/login/login_view.dart';
import 'modules/screens/register/register_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await UserController().initialize();

  Get.put(UserController(), permanent: true);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.from(
        colorScheme: const ColorScheme.highContrastDark(),
      ),
      initialRoute: UserController.to.isLoggedIn ? '/explorer' : '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const LoginView(),
        ),
        GetPage(
          name: '/register',
          page: () => const RegisterView(),
        ),
        GetPage(
          name: '/explorer',
          page: () => const ExploreView(),
        )
      ],
    );
  }
}
