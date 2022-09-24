import 'package:flutter/material.dart';

class Devicedetails extends StatefulWidget {
  final String deviceip;
  Devicedetails({
    super.key,
    required this.deviceip,
  });

  @override
  State<Devicedetails> createState() => _DevicedetailsState();
}

class _DevicedetailsState extends State<Devicedetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Cards")),
        body: Center(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Text(
                  widget.deviceip,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              TextField()
            ],
          ),
        ));
  }
}
