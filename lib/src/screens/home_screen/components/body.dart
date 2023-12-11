import 'dart:convert';

import 'package:SmartHome/config/size_config.dart';
import 'package:SmartHome/src/screens/home_screen/components/weather_container.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'add_device_widget.dart';
import 'dark_container.dart';

class Body extends StatefulWidget {
  dynamic devices;
  Body({Key? key, required this.devices}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future<void> updateDevices() async {
    var url = Uri.http('localhost:3000', 'products');
    var response = await http.get(url);

    print(response.statusCode);

    if(response.statusCode == 200){
      var newDevices = jsonDecode(response.body);
      setState(() {
        widget.devices = newDevices;
      });
    }

    print(widget.devices);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(7),
          vertical: getProportionateScreenHeight(7),
        ),
        decoration: const BoxDecoration(
          color: Color(0xFFF2F2F2),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(5)),
              child: WeatherContainer(),
            ),
            for (int i = 0; i < widget.devices.length; i+=2)
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(getProportionateScreenHeight(5)),
                      child: DarkContainer(
                        id: widget.devices[i]['id'],
                        isOn: widget.devices[i]['isOn'],
                        type: widget.devices[i]['type'],
                        description: widget.devices[i]['description'],
                        updateDevices: updateDevices,
                      ),
                    ),
                  ),
                  if (i + 1 < widget.devices.length)
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(getProportionateScreenHeight(5)),
                        child: DarkContainer(
                          id: widget.devices[i + 1]['id'],
                          isOn: widget.devices[i + 1]['isOn'],
                          type: widget.devices[i + 1]['type'],
                          description: widget.devices[i]['description'],
                          updateDevices: updateDevices,
                        ),
                      ),
                    )
                  else
                    Expanded(child: Container()),
                ],
              ),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenHeight(8)),
              child:  AddNewDevice(updateDevices: updateDevices,),
            ),
          ],
        ),
      ),
    );
  }
}
