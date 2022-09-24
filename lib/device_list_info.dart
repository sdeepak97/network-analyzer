import 'package:flutter/material.dart';
import 'package:networkfinder/devicedetails.dart';
import 'package:networkfinder/home.dart';
import './device.dart';

class DeviceListItem extends StatelessWidget {
  final Device _device;
  DeviceListItem(this._device);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: TextButton(
        child: const Text("Connect"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LinuxAppHome(deviceip: _device.ipAddress,)),
          );
        },
      ),
      title: Text(
        _device.ipAddress,
      ),
    );
  }
}
