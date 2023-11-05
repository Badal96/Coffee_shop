import 'package:coffee_shop/helpers/colors.dart';
import 'package:coffee_shop/home_page/home_body.dart';
import 'package:coffee_shop/pages/bag_page.dart';
import 'package:coffee_shop/pages/favouritlist.dart';
import 'package:coffee_shop/pages/notification.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int seletedNavIndex = 0;
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFF9F9F9),
        extendBodyBehindAppBar: true,
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -10),
                blurRadius: 24,
                color: Color.fromRGBO(228, 228, 228, 0.25),
              ),
            ],
          ),
          height: 70,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                unselectedItemColor: const Color(0xff8D8D8D),
                onTap: (value) => setState(() {
                      seletedNavIndex = value;
                    }),
                currentIndex: seletedNavIndex,
                selectedIconTheme: IconThemeData(color: Appcolors.appBrown),
                items: [
                  bottomNavigationBarItems(
                      index: 0,
                      icon:
                          const ImageIcon(AssetImage('assets/icons/Home.png'))),
                  bottomNavigationBarItems(
                      index: 1,
                      icon: const ImageIcon(
                          AssetImage('assets/icons/Heart1.png'))),
                  bottomNavigationBarItems(
                      index: 2,
                      icon:
                          const ImageIcon(AssetImage('assets/icons/Bag.png'))),
                  bottomNavigationBarItems(
                      index: 3,
                      icon: const ImageIcon(
                          AssetImage('assets/icons/Notification.png'))),
                ]),
          ),
        ),
        body: selectedPage());
  }

  BottomNavigationBarItem bottomNavigationBarItems(
      {required int index, required ImageIcon icon}) {
    return BottomNavigationBarItem(
        label: '',
        icon: Column(
          children: [
            icon,
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 5,
              width: seletedNavIndex == index ? 10 : 0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xFFC67C4E), Color(0xFFEDAB81)])),
            )
          ],
        ));
  }

  Widget selectedPage() {
    switch (seletedNavIndex) {
      case 0:
        return const HomeBody();

      case 1:
        return const FavouritListPage();

      case 2:
        return const BagPage();

      case 3:
        return const NotificationPage();

      default:
        return const HomeBody();
    }
  }
}
