import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app_hive_v1/pages/home_page.dart';
import 'package:to_do_app_hive_v1/theme/theme_provider.dart'; // Importa el ThemeProvider
import 'package:to_do_app_hive_v1/theme/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(), // Creamos el ThemeProvider
      child: Builder(
        builder: (context) {
          // Accedemos al ThemeProvider para usar el tema
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'ToDo Hive App',
            debugShowCheckedModeBanner: false,
            theme: themeProvider.currentTheme, // Aplicamos el tema actual
            home: HomePage(),
          );
        },
      ),
    );
  }
}