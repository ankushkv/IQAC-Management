import 'package:flutter/material.dart';
import 'package:portfilioapp/pages/Home/attendance.dart';
import 'package:portfilioapp/pages/Home/home.dart';
import 'package:portfilioapp/pages/Home/login.dart';
import 'package:portfilioapp/pages/Home/user.dart';
import 'themes.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  final String title = "Hello";
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const LoginPage(),
    const HomePage(),
    const UserPage(),
    const AttendancePage()
  ];
  int currentindex = 0;
  void onTap(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// const color = Colors.black;
    final _theme = Theme.of(context);
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: _theme.primaryColor),
        ),
        actions: [
          IconButton(
              onPressed: () {
                currentTheme.toggleTheme();
              },
              icon: Icon(Icons.brightness_2_outlined))
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            //       // ignore: sort_child_properties_last
            Container(
              width: double.infinity,
              child: const DrawerHeader(
                // ignore: deprecated_member_use
                //  decoration: BoxDecoration(color: _theme.accentColor),
                child: Text(
                  'Side Menu',
                  style: TextStyle(
                      fontFamily: 'Loto',
                      //  color: Colors.white,
                      fontSize: 25,
                      overflow: TextOverflow.fade),
                ),
              ),
            ),
            Builder(builder: (context) {
              return Expanded(
                child: ListTile(
                  leading: const Icon(
                    Icons.input,
                    // color: Colors.cyan,
                  ),
                  title: const Text("Welcome",
                      selectionColor: Colors.cyan,
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 20,
                        //color: Colors.cyan
                      )),
                  //  tileColor: Colors.cyan,
                  onTap: () {
                    //Navigator.pop(context);
                  },
                ),
              );
            }),
            Container(
              width: double.infinity,
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Column(
                  children: [
                    Divider(
                        //  color: Colors.cyanAccent,
                        ),
                    ListTile(
                      contentPadding: EdgeInsetsDirectional.only(
                        start: 10.0,
                        bottom: 20.0,
                      ),
                      title: const Text("Logout",
                          style: TextStyle(
                            fontSize: 20,
                            //color: Colors.cyan
                          )),
                      leading: const Icon(
                        Icons.exit_to_app,
                        //  color: Colors.cyan,
                      ),
                      //  tileColor: Colors.cyan,
                      onTap: () {
                        //Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 13,
          selectedFontSize: 13,
          //   fixedColor: Colors.black45,
          type: BottomNavigationBarType.fixed,
          // backgroundColor: Colors.teal,
          onTap: onTap,
          currentIndex: currentindex,
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.amber.withOpacity(0.5),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
                tooltip: "Menu", label: "Menu", icon: Icon(Icons.menu)),
            BottomNavigationBarItem(
                tooltip: "Home", label: "Home", icon: Icon(Icons.apps)),
            BottomNavigationBarItem(
                tooltip: "Home",
                label: "Bar",
                icon: Icon(Icons.bar_chart_sharp)),
            BottomNavigationBarItem(
                tooltip: "User", label: "User", icon: Icon(Icons.person))
          ]),
    );
  }
}
