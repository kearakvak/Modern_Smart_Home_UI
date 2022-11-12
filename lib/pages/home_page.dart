import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modern_smart_home_ui/util/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Padding constants
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  //list of smart devices
  List mySmartDevices = [
    //[smartDeviceName, IconPath, powerStatatus]
    ["Smart Light", 'assets/images/light-bulb (1).png', true],
    ["Smart AC", 'assets/images/air-conditioner (1).png', false],
    ["Smart TV", 'assets/images/smart-tv.png', false],
    ["Smart Fan", 'assets/images/ac.png', false],
    ["Smart Person", 'assets/images/user (2).png', false],
  ];

  //power button Switched
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
      print(mySmartDevices[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //custom app bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //menu icon
                  Image.asset(
                    "assets/images/menu.png",
                    height: 45,
                    color: Colors.grey.shade800,
                  ),
                  //account icon
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey.shade800,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //welcome home MITCH KOKO
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Home,",
                    style: (TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade500,
                    )),
                  ),
                  Text(
                    "MITCH KOKO",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 72,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Divider(
                color: Colors.grey.shade400,
                thickness: 1,
              ),
            ),
            //Shart devices + grid
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
              child: Text(
                'Smart Devices',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey.shade800,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(25),
                //  physics: NeverScrollableScrollPhysics(),
                itemCount: mySmartDevices.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: ((context, index) {
                  return SmartDeviceBox(
                    iconPath: mySmartDevices[index][1],
                    smartDeviceName: mySmartDevices[index][0],
                    powerON: mySmartDevices[index][2],
                    onChaned: (value) => powerSwitchChanged(value, index),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
