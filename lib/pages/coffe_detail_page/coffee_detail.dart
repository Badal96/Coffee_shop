import 'package:coffee_shop/helpers/colors.dart';
import 'package:coffee_shop/helpers/text_style.dart';
import 'package:coffee_shop/pages/coffe_detail_page/coffe_body.dart';
import 'package:coffee_shop/pages/order_page/order_page.dart';
import 'package:coffee_shop/providers/detial_provider.dart';
import 'package:coffee_shop/providers/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CoffeeDetial extends StatelessWidget {
  final UserdataProvider provider;
  const CoffeeDetial({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    DetailProvider coffeeDetial = Provider.of<DetailProvider>(context);
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.only(top: 16.0, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  iconSize: 24,
                  icon: Image.asset(
                    'assets/icons/back_arrow.png',
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                Text(
                  'Detail',
                  style: GoogleFonts.sora(
                      color: Appcolors.appBoldTextBlack,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                IconButton(
                    iconSize: 24,
                    onPressed: () {},
                    icon:
                        const ImageIcon(AssetImage('assets/icons/Heart2.png')))
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 87,
          decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -10),
                  blurRadius: 24,
                  spreadRadius: 0,
                  color: Color.fromRGBO(228, 228, 228, 0.25),
                ),
              ],
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.all(Radius.circular(18))),
          child: Row(
            children: [
              Expanded(
                flex: 129,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Price', style: BoldTextStyle.light14),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        '\$4.54',
                        style: GoogleFonts.sora(
                            color: Appcolors.appBrown,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 247,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 16, bottom: 9, right: 30.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OrderPage(
                          provider: coffeeDetial,
                          userdata: provider,
                        ),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      backgroundColor: Appcolors.appBrown,
                      minimumSize: const Size(100, 40),
                    ),
                    child: SizedBox(
                      height: double.infinity,
                      child: Center(
                        child: Text(
                          'Buy Now',
                          style: GoogleFonts.sora(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        body: coffeeDetial.loading
            ? const Center(child: LinearProgressIndicator())
            : const CoffePageBody());
  }
}
