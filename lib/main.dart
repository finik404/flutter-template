import 'package:flutter/material.dart';
import 'package:flutter_letmetalk/constants/colors.dart';
import 'package:flutter_letmetalk/pages/register.dart';
import 'package:flutter/services.dart';
import 'package:flutter_letmetalk/store/store.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

void main() {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initialState(),
  );

  runApp(LetMeTalk(store: store));
}

class LetMeTalk extends StatelessWidget {
  final Store<AppState> store;

  LetMeTalk({required this.store, super.key}) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        systemNavigationBarColor: AppColors.white));
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: StoreConnector<AppState, Locale>(
            converter: (store) => store.state.accountState.lang,
            builder: (context, locale) {
              return MaterialApp(
                // Убрать debug banner
                debugShowCheckedModeBanner: false,

                // Тема
                theme: ThemeData(primaryColor: AppColors.blue),

                // Основной экран
                home: RegisterScreen(),

                // Список роутов
                routes: {
                  '/register': (context) => RegisterScreen(),
                },

                // Локализация (языки)
                locale: store.state.accountState.lang,
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                // Какие языки поддерживает приложение
                supportedLocales: const [
                  Locale('ru'),
                  Locale('en'),
                ],
              );
            }));
  }
}
