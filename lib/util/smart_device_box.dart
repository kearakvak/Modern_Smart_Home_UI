// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  SmartDeviceBox({
    required this.iconPath,
    required this.smartDeviceName,
    required this.powerON,
    required this.onChaned,
  });

  final String smartDeviceName;
  final String iconPath;
  final bool powerON;
  void Function(bool)? onChaned;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: powerON ? Colors.grey.shade700 : Colors.grey.shade400,
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Icon
            Image.asset(
              iconPath,
              height: 65,
              color: powerON ? Colors.white : Colors.black,
            ),
            //Smart device Name + Switch
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 25.0,
                    ),
                    child: Text(
                      smartDeviceName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: powerON ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: pi / 2,
                  child: CupertinoSwitch(
                    value: powerON,
                    onChanged: onChaned,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
