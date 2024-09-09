import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
  App ----------------
 */
class App extends StatelessWidget {
  const App({super.key});

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      // Providers
      providers: [
        BlocProvider(create: (context) => AccountBloc()),
      ],

      // Settings
      child: Builder(
        builder: (context) {
          return MaterialApp(
            // No debug banner
            debugShowCheckedModeBanner: false,
            // No Stretch Effect on Scroll
            scrollBehavior: CustomScrollBehavior(),
            // Theme Settings
            theme: theme(context),

            // RouterConfig
            initialRoute: '/',
            routes: routes,
          );
        },
      ),
    );
  }
}
