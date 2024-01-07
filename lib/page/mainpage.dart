import 'package:flutter/material.dart';
import 'package:sub_flutter_pemula/motor.dart';
import 'package:sub_flutter_pemula/page/detailpage.dart';
import 'package:sub_flutter_pemula/page/profilepage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late IconData iconData = Icons.light_mode;
  var appBarColor = Colors.lightBlue;
  var bgColor = Colors.grey[200];
  var colorIcon = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text('SiMotor Katalog'),
        actions: [
          InkWell(
            child: Container(
              padding: const EdgeInsets.only(right: 16),
              child: const Icon(Icons.person),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const ProfilePage();
              }));
            },
          ),
          InkWell(
            onTap: () {
              setState(() {
                if (iconData == Icons.light_mode) {
                  bgColor = Colors.black;
                  iconData = Icons.dark_mode;
                } else {
                  colorIcon == appBarColor;
                  bgColor = Colors.grey[200];
                  iconData = Icons.light_mode;
                }
              });
            },
            child: Container(
              padding: const EdgeInsets.only(right: 22),
              child: Icon(iconData),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          color: bgColor,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: listMotor.length,
            itemBuilder: (context, index) {
              final Motor placed = listMotor[index];
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailPage(place: placed);
                  }));
                },
                child: Card(
                  margin: const EdgeInsets.all(4),
                  child: Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            placed.img,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          placed.model,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
