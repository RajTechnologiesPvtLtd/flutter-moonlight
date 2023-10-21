import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../services/services.dart';
import '../widgets/widgets.dart';

class LocalNotificationView extends StatefulWidget {
  const LocalNotificationView({Key? key}) : super(key: key);

  @override
  State<LocalNotificationView> createState() => _LocalNotificationViewState();
}

class _LocalNotificationViewState extends State<LocalNotificationView> {
  LocalNotificationService localNotificationService =
      LocalNotificationService();

  @override
  void initState() {
    super.initState();
    localNotificationService.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MoonLightDrawer("Local Notification"),
      appBar: const Navbar(title: "Local Notification"),
      bottomNavigationBar: const BannerAdWidget(),
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
                localNotificationService.showNotification(
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
                localNotificationService.scheduleNotification(
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
                localNotificationService.stopAllScheduleNotification();
              },
            )
          ],
        ),
      ),
    );
  }
}
