import 'package:coffee_shop/delivery_page.dart';
import 'package:coffee_shop/helpers/colors.dart';
import 'package:coffee_shop/pages/order_page/order_page_body.dart';
import 'package:coffee_shop/providers/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../providers/detial_provider.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key, required this.provider, required this.userdata});
  final DetailProvider provider;
  final UserdataProvider userdata;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: provider,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            scrolledUnderElevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Container(
              padding: const EdgeInsets.only(right: 55),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Image.asset('assets/icons/back_arrow.png')),
                    Text(
                      'Order',
                      style: GoogleFonts.sora(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox()
                  ]),
            ),
          ),
          bottomNavigationBar: Container(
            height: 118,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, -10),
                  blurRadius: 24,
                  spreadRadius: 0,
                  color: Color.fromRGBO(228, 228, 228, 0.25),
                ),
              ],
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 27,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 29, right: 30, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/moneys.png',
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Container(
                              height: double.infinity,
                              width: 112,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: const Color(0xffF6F6F6)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Appcolors.appBrown),
                                      child: Center(
                                        child: Text(
                                          'Cash',
                                          style: GoogleFonts.sora(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Consumer<DetailProvider>(
                                        builder: (context, value, child) =>
                                            Text(
                                          '\$${(value.orderCount * value.price + value.deliveryFee).toStringAsFixed(2)}',
                                          style: GoogleFonts.sora(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  Appcolors.appBoldTextBlack),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          child: Image.asset('assets/icons/dots.png'),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    flex: 62,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 30.0, top: 16, bottom: 9, right: 30),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DeliverPage(
                                        adress: userdata.userlocation![
                                            'user_location_name']['adress'],
                                        userlocatin: List<double>.from(
                                            userdata.userlocation![
                                                'user_location_lat&long']))));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Appcolors.appBrown,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(16)))),
                              child: Center(
                                child: Text(
                                  'Order',
                                  style: GoogleFonts.sora(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
          body: OrderPageBody(
            userdata: userdata,
          )),
    );
  }
}
