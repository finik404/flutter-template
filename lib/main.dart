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

  ErrorWidget.builder = (FlutterErrorDetails details) {
    bool inDebug = false;
    assert(() {
      inDebug = true;
      return true;
    }());
    // Если приложение в режиме отладки, показываем красный экран ошибки.
    if (inDebug) {
      return ErrorWidget(details.exception);
    }
    // В продакшене показываем свой экран ошибки.
    return CustomErrorScreen(
      errorDetails: details,
    );
  };

  runApp(LetMeTalk(store: store));
}

class LetMeTalk extends StatelessWidget {
  final Store<AppState> store;

  LetMeTalk({required this.store, super.key}) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.bg,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
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

class CustomErrorScreen extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const CustomErrorScreen({Key? key, required this.errorDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Упс! Произошла ошибка.', style: TextStyle(fontSize: 24)),
          Text('Error: ${errorDetails.exceptionAsString()}'),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Вернуться назад'),
          ),
        ],
      ),
    );
  }
}
