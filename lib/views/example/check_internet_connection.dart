import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class CheckInternetConnectionView extends StatefulWidget {
  const CheckInternetConnectionView({super.key});
  @override
  _CheckInternetConnectionViewState createState() =>
      _CheckInternetConnectionViewState();
}

class _CheckInternetConnectionViewState
    extends State<CheckInternetConnectionView> {
  StreamSubscription? connection;
  bool isoffline = false;

  @override
  void initState() {
    // connection = Connectivity()
    //     .onConnectivityChanged
    //     .listen((ConnectivityResult result) {
    //   // whenevery connection status is changed.
    //   if (result == ConnectivityResult.none) {
    //     //there is no any connection
    //     setState(() {
    //       isoffline = true;
    //     });
    //   } else if (result == ConnectivityResult.mobile) {
    //     //connection is mobile data network
    //     setState(() {
    //       isoffline = false;
    //     });
    //   } else if (result == ConnectivityResult.wifi) {
    //     //connection is from wifi
    //     setState(() {
    //       isoffline = false;
    //     });
    //   } else if (result == ConnectivityResult.ethernet) {
    //     //connection is from wired connection
    //     setState(() {
    //       isoffline = false;
    //     });
    //   } else if (result == ConnectivityResult.bluetooth) {
    //     //connection is from bluetooth threatening
    //     setState(() {
    //       isoffline = false;
    //     });
    //   }
    // });
    super.initState();
  }

  @override
  void dispose() {
    connection!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check Internet Connection"),
        backgroundColor: Colors.redAccent,
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(children: [
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 30),
              color: isoffline ? Colors.red : Colors.lightGreen,
              //red color on offline, green on online
              padding: const EdgeInsets.all(10),
              child: Text(
                isoffline ? "Device is Offline" : "Device is Online",
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  var result = await Connectivity().checkConnectivity();
                  if (result == ConnectivityResult.mobile) {
                    print("Internet connection is from Mobile data");
                  } else if (result == ConnectivityResult.wifi) {
                    print("internet connection is from wifi");
                  } else if (result == ConnectivityResult.ethernet) {
                    print("internet connection is from wired cable");
                  } else if (result == ConnectivityResult.bluetooth) {
                    print("internet connection is from bluethooth threatening");
                  } else if (result == ConnectivityResult.none) {
                    print("No internet connection");
                  }
                },
                child: const Text("Check Internet Connection"))
          ])),
    );
  }
}
