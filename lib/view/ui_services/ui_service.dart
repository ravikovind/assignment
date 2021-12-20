import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void showMessage(BuildContext context, String title, String message) async =>
    await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              title: Text(title),
              content: Text(message),
              actions: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.maxFinite, 48.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Okay",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ));

void showBannerMessage(BuildContext context, String message) {
  final banner = MaterialBanner(
    content: Text(message),
    backgroundColor: Colors.redAccent[100],
    actions: [
      TextButton(
        child: const Text(
          'Okay',
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () =>
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
      ),
    ],
  );
  ScaffoldMessenger.of(context).showMaterialBanner(banner);
}

extension DateTimeExtension on DateTime {
  String formatMyDate([String pattern = 'MMMM d, yyyy']) {
    return DateFormat(pattern).format(this);
  }
}
