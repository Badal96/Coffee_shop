import 'package:coffee_shop/helpers/colors.dart';
import 'package:coffee_shop/home_page/coffee_filters.dart';
import 'package:coffee_shop/home_page/coffee_list_items.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/coffee_provider.dart';
import '../providers/filter_provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CoffeProvider>(
          lazy: false,
          create: (_) => CoffeProvider()..getCoffeList(),
        ),
        ChangeNotifierProvider<FilterProvider>(
          create: (context) => FilterProvider(),
        )
      ],
      child: Scaffold(
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
        appBar: AppBar(
          scrolledUnderElevation: 0,
          foregroundColor: Appcolors.appTextLightBlack,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 19.0, left: 20, right: 20),
            child: SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'location',
                        style: GoogleFonts.sora(
                            fontSize: 12, color: const Color(0xFFb7b7b7)),
                      ),
                      Row(
                        children: [
                          Text(
                            'Bilzen,Tanjungbalai',
                            style: GoogleFonts.sora(
                                color: Colors.white, fontSize: 14),
                          ),
                          const Icon(Icons.keyboard_arrow_down_outlined)
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 44,
                    width: 44,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://img.freepik.com/free-photo/smiley-tourist-s-selfie_23-2147643213.jpg'),
                            fit: BoxFit.fill)),
                  ),
                ],
              ),
            ),
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
              padding: const EdgeInsets.only(top: 128, left: 30, right: 30)
                  .add(MediaQuery.of(context).viewInsets),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFF313131),
                        borderRadius: BorderRadius.circular(12)),
                    height: 52,
                    child: Consumer<CoffeProvider>(
                      builder: (context, provder, child) => TextField(
                        onChanged: (value) => provder.filterWithNamed(value),
                        style: GoogleFonts.sora(
                            decorationThickness: 0,
                            color: Colors.white,
                            decoration: TextDecoration.none),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon:
                                Image.asset('assets/icons/search_icon.png'),
                            hintStyle: TextStyle(
                                color: Appcolors.appTextLightBlack,
                                fontSize: 14),
                            hintText: 'Search coffee',
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/icons/filter.png',
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
                  const CoffeFilter(),
                  const CoffeeFilterItems()
                ],
              ),
            )
          ],
        ),
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
