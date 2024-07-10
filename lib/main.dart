import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/android_images.dart';
import 'package:provider_state/provider/auth_provider.dart';
import 'package:provider_state/provider/container_provider.dart';
import 'package:provider_state/provider/count_provider.dart';
import 'package:provider_state/provider/favorite_provider.dart';
import 'package:provider_state/provider/img_provider.dart';
import 'package:provider_state/view/login_restapi.dart';
import 'package:provider_state/view/new.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CountProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ContainerProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavoriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ImgProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.blue,
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 25)),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AndroidImageScreen(),
      ),
    );
  }
}





// for single provider object:

/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state/provider/count_provider.dart';
import 'package:provider_state/view/count_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CountProvider>(
        create: (_) => CountProvider(),
        child: Builder(builder: (BuildContext context) {
          return MaterialApp(
            title: 'provider_statemanagement',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const CountScreen(),
          );
        }));
  }
}

 */