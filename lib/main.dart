import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'domain/news/entities/article.dart';
import 'injector.dart';
import 'presentation/details/pages/details_page.dart';
import 'presentation/home/blocs/home_bloc.dart';
import 'presentation/home/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initializeInjector();

  /// Initiliaze home bloc
  magic.get<HomeBloc>().load();

  runApp(const MyApp());
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'details',
          name: 'details',
          builder: (context, state) {
            return DetailsPage(article: state.extra as Article);
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(primarySwatch: Colors.blue),
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
    );
  }
}
