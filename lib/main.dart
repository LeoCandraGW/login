import 'package:flutter/material.dart';
import 'package:login/injection.dart' as di;
import 'package:login/presentation/bloc/post_bloc.dart';
import 'package:login/presentation/pages/login_page.dart';
import 'package:login/presentation/pages/splashcreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<PostLoginBloc>()),
        BlocProvider(create: (_) => di.locator<PostLogoutBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginPage(),
          SplashScreen.routeName: (context) => SplashScreen(
              Username: ModalRoute.of(context)?.settings.arguments as String),
        },
      ),
    );
  }
}
