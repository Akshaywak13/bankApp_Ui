import 'package:bank_app_ui/nofification/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NotificationController notificationController=Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Notification",style: TextStyle(
          color: Colors.white
        ),),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(),
          ElevatedButton.icon(onPressed: (){
            notificationController.showNotification();
          },
           icon: Icon(Icons.notifications),
            label:Text("Shwo Notification")
            ),
        ],
      )
    );
  }
}