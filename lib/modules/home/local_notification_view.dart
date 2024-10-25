import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../core/classes/classes.dart';
import '../../widgets/widgets.dart';

class LocalNotificationView extends StatefulWidget {
  const LocalNotificationView({super.key});

  @override
  State<LocalNotificationView> createState() => _LocalNotificationViewState();
}

class _LocalNotificationViewState extends State<LocalNotificationView> {
  LocalNotification localNotification = LocalNotification();

  @override
  void initState() {
    super.initState();
    localNotification.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Navbar(title: "Local Notification"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Local Notification"),
            const SizedBox(height: 2),
            ElevatedButton(
              child: const Text("send Notification"),
              onPressed: () async {
                var status = await Permission.notification.status;
                if (status.isDenied) {
                  permissionDialog(context);
                  return;
                }
                localNotification.showNotification(
                    "Normal Notification", "This is a Body");
              },
            ),
            const SizedBox(width: 2),
            ElevatedButton(
              child: const Text("Schedule Notification"),
              onPressed: () async {
                var status = await Permission.notification.status;
                if (status.isDenied) {
                  permissionDialog(context);
                  return;
                }
                localNotification.scheduleNotification(
                    "Schedule Notification", "This is a Body");
              },
            ),
            const SizedBox(width: 2),
            ElevatedButton(
              child: const Text("Stop All Notification"),
              onPressed: () async {
                var status = await Permission.notification.status;
                if (status.isDenied) {
                  permissionDialog(context);
                  return;
                }
                localNotification.stopAllScheduleNotification();
              },
            )
          ],
        ),
      ),
    );
  }
}
