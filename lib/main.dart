import 'package:amazon_clone1/constants/global_variables.dart';
import 'package:amazon_clone1/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone1/features/auth/services/auth_service.dart';
import 'package:amazon_clone1/features/home/screens/home_screen.dart';
import 'package:amazon_clone1/providers/user_provider.dart';
import 'package:amazon_clone1/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  AuthServices authServices = AuthServices();
  @override
  void initState() {
    super.initState();
    authServices.getUserUser(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Amazon Clone1-',
        theme: ThemeData(
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
          colorScheme:
              const ColorScheme.light(primary: GlobalVariables.secondaryColor),
          appBarTheme: const AppBarTheme(
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black,
              )),
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? const HomeScreen()
            : const AuthScreen());
  }
}
