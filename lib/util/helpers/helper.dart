import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tproject/util/constants/options.dart';
import 'package:url_launcher/url_launcher_string.dart';

class THelper {
  static void launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static String formatDate(String date, {String? format}) {
    DateTime dateTime = DateTime.parse(date);
    return DateFormat(format ?? TOptions.dateFormat).format(dateTime);
  }

  static String formatPhoneNumber(String phoneNumber, {bool replace7 = false, bool replace8 = false}) {
    String cleanedNumber = phoneNumber.replaceAll(' ', '');

    // Replace +7
    if (replace7 && cleanedNumber.startsWith('+7')) {
      cleanedNumber = '8${cleanedNumber.substring(2)}';
    }

    // Replace 8
    if (replace8 && cleanedNumber.startsWith('8')) {
      cleanedNumber = '+7${phoneNumber.substring(1)}';
    }

    return cleanedNumber;
  }

  static String unFormatPhoneNumber(String phoneNumber, {bool replace7 = false, bool replace8 = false}) {
    // Replace +7
    if (replace7 && phoneNumber.startsWith('+7')) {
      phoneNumber = '8${phoneNumber.substring(2)}';
    }

    // Replace 8
    if (replace8 && phoneNumber.startsWith('8')) {
      phoneNumber = '+7${phoneNumber.substring(1)}';
    }

    // Format phone
    final regex = RegExp(r'^(\+7|8)(\d{3})(\d{3})(\d{2})(\d{2})$');
    final match = regex.firstMatch(phoneNumber);
    if (match != null) {
      return '${match.group(1)} ${match.group(2)} ${match.group(3)} ${match.group(4)} ${match.group(5)}';
    }

    return phoneNumber;
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }
}
