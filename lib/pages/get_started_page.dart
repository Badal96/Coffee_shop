import 'package:coffee_shop/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.height);
    double container1h = size.height * (702 / 944);
    double container2h = size.height * (362 / 944);
    return Scaffold(
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
            margin: EdgeInsets.only(
              top: size.height * 668 / 976,
            ),
            height: container2h,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Color.fromARGB(255, 0, 0, 0)],
                stops: [0.0, 0.2367],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 668 / 976,
            ),
            child: SizedBox(
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Coffee so good,\n your taste buds\n will love it.',
                    style: GoogleFonts.sora(
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.34,
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
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    height: 62,
                    width: 315,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed('homepage');
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Appcolors.appBrown,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16))),
                        child: Text('Get started',
                            style: GoogleFonts.sora(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white))),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
