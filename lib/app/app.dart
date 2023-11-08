import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/demo/presentation/bloc/driving/example_bloc.dart';
import '../routers/app_router.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider(create: (context) => ExampleBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Shorebird with Flutter',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        ),
        routerConfig: appRouter.config(),
      ),
    );
  }
}
