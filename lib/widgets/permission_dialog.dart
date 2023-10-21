import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

permissionDialog(context) => showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => Platform.isAndroid
          ? AlertDialog(
              title: const Text('Permission Denied'),
              content: const Text('Allow access to gallery and photos'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => openAppSettings(),
                  child: const Text('Settings'),
                ),
              ],
            )
          : CupertinoAlertDialog(
              title: const Text('Permission Denied'),
              content: const Text('Allow access to gallery and photos'),
              actions: <CupertinoDialogAction>[
                CupertinoDialogAction(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () => openAppSettings(),
                  child: const Text('Settings'),
                ),
              ],
            ),
    );
