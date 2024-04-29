import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:template/hooks/fetchData.dart';
import 'generated/l10n.dart';
import 'package:template/store/store.dart';
import 'package:template/constants/colors.dart';
import 'package:template/pages/home.dart';
import 'package:redux/redux.dart';

/*
  main() ----------------
 */
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Только в вертикальном положении
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Инициализация dio
  initDio();

  // Подключаем хранилище (redux)
  final store = Store<AppState>(
    appReducers,
    initialState: AppState.initialState(),
  );

  // Подключаем поддержку env
  await dotenv.load(fileName: ".env");

  // Запуcк приложения
  runApp(App(store: store));
}

/*
  App ----------------
 */
class App extends StatelessWidget {
  final Store<AppState> store;

  App({required this.store, super.key}) {
    // Стилизация statusBar и navigationBar
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: AppColors.white,
      systemNavigationBarColor: AppColors.white,
    ));
  }

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    // Следим за изменениями lang
    return StoreProvider<AppState>(
        store: store,
        child: StoreConnector<AppState, Locale>(
            converter: (store) => store.state.accountState.lang,
            builder: (context, locale) {
              return MaterialApp(
                // Убрать debug banner
                debugShowCheckedModeBanner: false,

                // Тема
                theme: ThemeData(
                  primaryColor: AppColors.blue,
                  fontFamily: 'Circe',
                ),

                // Основной экран
                home: const HomeScreen(),

                // Список маршрутов
                routes: {
                  '/home': (context) => const HomeScreen(),
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
