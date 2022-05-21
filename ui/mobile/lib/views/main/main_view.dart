import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/views/main/main_viewmodel.dart';
import 'package:stacked/stacked.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => MainViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 41, 47, 172),
                  Color.fromARGB(255, 41, 47, 172),
                  Color.fromARGB(255, 18, 26, 62),
                  Color.fromARGB(255, 18, 26, 62),
                  Color.fromARGB(255, 18, 26, 62),
                  Color.fromARGB(255, 18, 26, 62),
                  Color.fromARGB(255, 90, 54, 198),
                ],
              ),
            ),
            child: Container(
              padding: EdgeInsets.only(top: 50, bottom: 10),
              width: MediaQuery.of(context).size.width * 0.8,
              child: model.getViewForIndex(model.currentTabIndex),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color(0xff101832),
            unselectedItemColor: Colors.white,
            currentIndex: model.currentTabIndex,
            onTap: model.setTabIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.white),
                label: "Control",
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.graphic_eq, color: Colors.white),
                label: "Activity",
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings, color: Colors.white),
                label: "Settings",
                backgroundColor: Colors.white,
              ),
            ],
          ),
        );
      },
    );
  }
}
