import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lan_scanner/lan_scanner.dart';
import 'package:network_info_plus/network_info_plus.dart';

class Network extends StatefulWidget {
  @override
  State<Network> createState() => _NetworkState();
}

class _NetworkState extends State<Network> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initilize();
  }

  Future<void> initilize() async {
    final port = 80;
    var wifiIP = await (NetworkInfo().getWifiIP());
    print("WIFFFIIIIIII IPPPPP == ${wifiIP}");
    var subnet = ipToSubnet(wifiIP!);
    print("SUUUUUUUBB netttttt == ${subnet}");
    // final subnet = "192.168.0";

    final scanner = LanScanner();
    // final stream = scanner.preciseScan(
    //   subnet,
    //   progressCallback: (ProgressModel progress) {
    //     print('${progress.percent * 100}% ${subnet}.${progress.currIP}');
    //   },
    // );
    final quickScn = scanner.quickScan(subnet: subnet, verbose: true);
    quickScn.listen((DeviceModel device) {
      if (device.exists) {
        log("Found device on ${device.ip}:${device.port}");
      }
    });

    // stream.listen((DeviceModel device) {
    //   if (device.exists) {
    //     log("Found device on ${device.ip}:${device.port}");
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
