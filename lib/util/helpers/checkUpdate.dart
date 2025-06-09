import 'package:in_app_update/in_app_update.dart';

Future<void> checkUpdate() async {
  await InAppUpdate.checkForUpdate().then((info) async {
    print('info ${info}');
    await InAppUpdate.startFlexibleUpdate();
    InAppUpdate.completeFlexibleUpdate().then((_) {}).catchError((e) => print(e.toString()));
  }).catchError((e) => print(e.toString()));
}
