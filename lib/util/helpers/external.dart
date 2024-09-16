import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tproject/util/helpers/dialog.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:share_plus/share_plus.dart';

class TExternal {
  static void launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static void share(String url) {
    Share.shareUri(Uri.parse(url));
  }

  static Future<void> getPermission() async {
    // var status = await Permission.camera.request();
  }

  static Future<XFile?> pickImageFromGallery({int maxSize = 20, bool hasPermissionPopup = true}) async {
    XFile? file = await pickFile(type: ImageSource.gallery, permission: Permission.camera, maxSize: maxSize, hasPermissionPopup: hasPermissionPopup);
    return file;
  }

  static Future<XFile?> pickPhoto({int maxSize = 20, bool hasPermissionPopup = true}) async {
    XFile? file = await pickFile(type: ImageSource.camera, permission: Permission.camera, maxSize: maxSize, hasPermissionPopup: hasPermissionPopup);
    return file;
  }
}

// Pick file
Future<XFile?> pickFile({required ImageSource type, required Permission permission, required int maxSize, required bool hasPermissionPopup}) async {
  PermissionStatus status = await permission.request();

  if (status.isGranted) {
    // Picker
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: type, imageQuality: 75);

    if (image != null) {
      final fileSize = await image.length();
      int maxSizeBytes = maxSize * 1024 * 1024;

      if (fileSize > maxSizeBytes) {
        TDialog.showErrorSnackBar('Ошибка', 'Размер файла не должен превышать ${maxSize} мб');
      } else {
        return image;
      }
    }
  } else {
    if (hasPermissionPopup) {}
  }
}
