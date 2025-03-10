import 'package:first_app/screens/StepCounter.dart';
import 'package:first_app/screens/homescreen.dart';
import 'package:first_app/screens/BMIcalculator.dart';
import 'package:first_app/screens/login.dart';
import 'package:first_app/screens/weatherscreen.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.orange,
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    List<Widget> menuItems = [];
    menuItems.add(const DrawerHeader(
        child: Text(
      "Stay Fit",
      style: TextStyle(fontSize: 30),
    )));

    final Set<String> menuTitles = {
      "Home",
      "BMI",
      "Weather",
      "Step Counter",
      "Log Out"
    };
    menuTitles.forEach((element) {
      menuItems.add(ListTile(
        title: Text(
          element,
          style: const TextStyle(fontSize: 20),
        ),
        onTap: () {
          Widget screen = Container();
          switch (element) {
            case "Home":
              screen = HomeScreen();
              break;
            case "BMI":
              screen = BMIscreen();
              break;
            case "Weather":
              screen = Weatherscreen();
              break;
            case "Step Counter":
              screen = StepCounterScreen();
              break;
            case "Log Out":
              screen = MyLogin();
              break;
            default:
          }

          Navigator.of(context).pop();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => screen));
        },
      ));
    });
    return menuItems;
  }
}
