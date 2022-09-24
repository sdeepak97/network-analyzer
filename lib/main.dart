import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lan_scanner/lan_scanner.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:networkfinder/device_list_info.dart';

import './device.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Device Scanner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    initilize();
  }

  List<Device> devices = [];

  Future<void> initilize() async {
    if (devices.length > 0) devices.clear();
    final port = 23;
    var wifiIP = await (NetworkInfo().getWifiIP());
    print("WIFFFIIIIIII IPPPPP == ${wifiIP}");
    var subnet = ipToSubnet(wifiIP!);
    print("SUUUUUUUBB netttttt == ${subnet}");

    final scanner = LanScanner();

    final quickScn =
        scanner.quickScan(subnet: subnet, verbose: true, port: port);
    quickScn.listen((DeviceModel device) {
      if (device.exists) {
        log("Found device on ${device.ip}:${device.port}");
        devices.add(Device(device.ip!, device.port.toString()));
        log("====================== ${devices[0].ipAddress}");
        setState(() {});
      }
      return;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Networ analizer"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10, right: 20),
            child: GestureDetector(
              onTap: initilize,
              child: const Text(
                "Scan",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 242, 244, 243),
      body: Flex(
        crossAxisAlignment: CrossAxisAlignment.start,
        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: devices.length,
              itemBuilder: (BuildContext context, int index) {
                return DeviceListItem(devices[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
