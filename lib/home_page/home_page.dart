import 'package:coffee_shop/helpers/colors.dart';
import 'package:coffee_shop/home_page/coffee_filters.dart';
import 'package:coffee_shop/home_page/coffee_list_items.dart';
import 'package:coffee_shop/providers/user_data_provider.dart';
import 'package:coffee_shop/update_userlocation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
import '../providers/coffee_provider.dart';

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
                    icon: const ImageIcon(AssetImage('assets/icons/Home.png'))),
                bottomNavigationBarItems(
                    index: 1,
                    icon:
                        const ImageIcon(AssetImage('assets/icons/Heart1.png'))),
                bottomNavigationBarItems(
                    index: 2,
                    icon: const ImageIcon(AssetImage('assets/icons/Bag.png'))),
                bottomNavigationBarItems(
                    index: 3,
                    icon: const ImageIcon(
                        AssetImage('assets/icons/Notification.png'))),
              ]),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 280,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                tileMode: TileMode.repeated,
                begin: FractionalOffset.topRight,
                end: FractionalOffset.bottomLeft,
                colors: [
                  Color(0xFF131313),
                  Color(0xFF313131),
                  Color(0xFF313131),
                ],
                stops: [0.0, 0.9323, 0.9948],
              ),
            ),
          ),
          Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 61,
                    left: 31,
                    right: 30,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Location',
                                  style: GoogleFonts.sora(
                                      fontSize: 12,
                                      color: const Color(0xFFb7b7b7)),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Row(
                                  children: [
                                    Consumer<UserdataProvider>(
                                        builder: (context, value, child) {
                                      var location = value.userlocation ??
                                          {
                                            'user_location_name': {
                                              'country': 'location not chosed',
                                              'city': '',
                                              'adress': ''
                                            }
                                          };
                                      return Text(
                                        ' ${location['user_location_name']['country']}  ${location['user_location_name']['city']}',
                                        style: GoogleFonts.sora(
                                            color: Colors.white, fontSize: 14),
                                      );
                                    }),
                                    Consumer<UserdataProvider>(
                                      builder: (context, value, child) =>
                                          InkWell(
                                        onTap: () {
                                          showDialogFunc(
                                              context, value.editUserlocation);
                                        },
                                        child: const Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Consumer<UserdataProvider>(
                              builder: (context, value, child) =>
                                  GestureDetector(
                                onTap: () {
                                  value.onuploade();
                                },
                                child: Container(
                                  height: 44,
                                  width: 44,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      image: DecorationImage(
                                          image: NetworkImage(value
                                                  .user!.photoURL ??
                                              'https://w7.pngwing.com/pngs/973/860/png-transparent-anonym-avatar-default-head-person-unknown-user-user-pictures-icon.png'),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFF313131),
                            borderRadius: BorderRadius.circular(12)),
                        height: 52,
                        child: Consumer<CoffeProvider>(
                          builder: (context, provder, child) => TextField(
                            onChanged: (value) =>
                                provder.filterWithNamed(value),
                            style: GoogleFonts.sora(
                                decorationThickness: 0,
                                color: Colors.white,
                                decoration: TextDecoration.none),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Image.asset(
                                  'assets/icons/search_icon.png',
                                  color: Colors.white,
                                ),
                                hintStyle: TextStyle(
                                    color: Appcolors.appTextLightBlack,
                                    fontSize: 14),
                                hintText: 'Search coffee',
                                suffixIconConstraints: const BoxConstraints(
                                  maxHeight: 55,
                                  maxWidth: 55,
                                ),
                                suffixIcon: Consumer<UserdataProvider>(
                                  builder: (context, value, child) =>
                                      IconButton(
                                    iconSize: 60,
                                    padding: const EdgeInsets.all(4),
                                    onPressed: () {
                                      QuickAlert.show(
                                          context: context,
                                          type: QuickAlertType.confirm,
                                          confirmBtnColor: Appcolors.appBrown,
                                          onConfirmBtnTap: () {
                                            value.signout();
                                            Navigator.of(context).pop();
                                          });
                                    },
                                    icon: Image.asset(
                                      'assets/icons/filter.png',
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: const DecorationImage(
                                image: AssetImage('assets/icons/promo.png'),
                                fit: BoxFit.fill)),
                      ),
                    ],
                  ),
                ),
                const CoffeFilter(),
                const CoffeeFilterItems()
              ],
            ),
          )
        ],
      ),
    );
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
}
