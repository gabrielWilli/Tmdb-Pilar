import 'package:flutter/material.dart';
import 'package:tmdb_pilar/di/di.dart';
import 'package:tmdb_pilar/presentation/router/router.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  
  await configureDependencies();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'TMDB Pilar',
      theme: ThemeData(useMaterial3: true),
    );
  }
}
