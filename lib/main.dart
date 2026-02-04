import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/config/routes/routes.dart';
import 'package:news/config/themes/light_theme.dart';
import 'package:news/config/themes/dark_theme.dart';
import 'package:news/features/presentation/home/home_page.dart';
import 'package:news/features/theme/presentation/bloc/theme_bloc.dart';
import 'package:news/injection/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(BlocProvider(create: (_) => sl<ThemeBloc>(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'News',
          theme: LightTheme().themeData,
          darkTheme: DarkTheme().themeData,
          themeMode: state.themeMode.data,
          initialRoute: HomePage.route,
          routes: routes,
        );
      },
    );
  }
}
