import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:tproject/generated/l10n.dart';
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

  static Future<bool> getPermission(Permission permission, {Widget? permissionPopup}) async {
    PermissionStatus status = await permission.request();

    if (status.isGranted) {
      return true;
    } else {
      if (permissionPopup != null) TDialog.showActionMenu(content: permissionPopup);
      return false;
    }
  }

  static Future<XFile?> pickImageFromGallery({int maxSize = 20, Widget? permissionPopup}) async {
    XFile? file = await pickFile(type: ImageSource.gallery, permission: Permission.camera, maxSize: maxSize, permissionPopup: permissionPopup);
    return file;
  }

  static Future<XFile?> pickPhoto({int maxSize = 20, Widget? permissionPopup}) async {
    XFile? file = await pickFile(type: ImageSource.camera, permission: Permission.camera, maxSize: maxSize, permissionPopup: permissionPopup);
    return file;
  }
}

// Pick file
Future<XFile?> pickFile({required ImageSource type, required Permission permission, required int maxSize, Widget? permissionPopup}) async {
  bool hasPermission = await TExternal.getPermission(permission, permissionPopup: permissionPopup);

  if (hasPermission) {
    // Picker
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: type, imageQuality: 75);

    if (image != null) {
      // Check type file
      final allowedExtensions = ['png', 'jpeg', 'jpg'];
      final fileExtension = image.path.split('.').last.toLowerCase();

      if (!allowedExtensions.contains(fileExtension)) {
        // TDialog.showSnackBar(S.of(Get.context!).errors_image_type, isError: true);
        return null;
      }

      // Check size file
      final fileSize = await image.length();
      int maxSizeBytes = maxSize * 1024 * 1024;

      if (fileSize > maxSizeBytes) {
        // TDialog.showSnackBar(S.of(Get.context!).errors_image_size(maxSize), isError: true);
        return null;
      } else {
        return image;
      }
    }
  }
}
