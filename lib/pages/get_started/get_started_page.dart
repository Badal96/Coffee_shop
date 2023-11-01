import 'package:coffee_shop/helpers/colors.dart';
import 'package:coffee_shop/home_page/home_page.dart';
import 'package:coffee_shop/pages/get_started/register_page.dart';
import 'package:coffee_shop/providers/user_data_provider.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'login_page.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  final PageController _controler = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double container1h = size.height * (536 / 778);
    double container2h = size.height * (328 / 778);

    return Consumer<UserdataProvider>(
        builder: (context, value, child) => value.user != null
            ? const HomePage()
            : Scaffold(
                body: Stack(
                  children: [
                    Container(
                      height: container1h,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/cover.png'),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: size.height * (450 / 778)),
                      height: container2h,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Color.fromARGB(255, 0, 0, 0)
                          ],
                          stops: [0.0, 0.2367],
                        ),
                      ),
                    ),
                    PageView(controller: _controler, children: [
                      Container(
                        margin: const EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Coffee so good,\n your taste buds\n will love it.',
                              style: GoogleFonts.sora(
                                  fontSize: 34,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'The best grain,the finest roast,the \n  powerful flavor.',
                              style: GoogleFonts.sora(
                                  fontSize: 14,
                                  color: Appcolors.appTextLightBlack,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.14),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 96,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 24, bottom: 9),
                                child: ElevatedButton(
                                    onPressed: () {
                                      _controler.nextPage(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          curve: Curves.easeIn);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Appcolors.appBrown,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16))),
                                    child: Text('Get started',
                                        style: GoogleFonts.sora(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white))),
                              ),
                            )
                          ],
                        ),
                      ),
                      LoginPage(
                        controller: _controler,
                      ),
                      RegisterPage(controler: _controler)
                    ])
                  ],
                ),
              ));
  }
}
