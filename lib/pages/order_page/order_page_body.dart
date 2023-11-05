import 'package:coffee_shop/pages/order_page/widgets.dart';
import 'package:coffee_shop/providers/detial_provider.dart';
import 'package:coffee_shop/providers/user_data_provider.dart';
import 'package:coffee_shop/update_userlocation_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../helpers/text_style.dart';

class OrderPageBody extends StatelessWidget {
  final UserdataProvider userdata;
  const OrderPageBody({super.key, required this.userdata});

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(horizontal: 30);
    return Consumer<DetailProvider>(
      builder: (context, coffedetail, child) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(14)),
                child: Row(
                  children: [
                    deliverMethod('Deliver', coffedetail.deliverMethod,
                        coffedetail.changeDeliverMethod),
                    deliverMethod('Pick up', coffedetail.deliverMethod,
                        coffedetail.changeDeliverMethod)
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Padding(
              padding: padding,
              child: ChangeNotifierProvider<UserdataProvider>.value(
                value: userdata,
                child: Consumer<UserdataProvider>(
                    builder: (context, value, child) {
                  var location = value.userlocation ??
                      {
                        'user_location_name': {
                          'country': 'location not chosed',
                          'city': '',
                          'adress': ''
                        }
                      };

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Delivery Address', style: BoldTextStyle.bold16),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        location['user_location_name']['adress'],
                        style: BoldTextStyle.bold14,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        '${location['user_location_name']['adress']}, ${location['user_location_name']['country']}, ${location['user_location_name']['city']}',
                        style: BoldTextStyle.light14,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              showDialogFunc(context, value.editUserlocation);
                            },
                            child: editadress('Edit address',
                                const AssetImage('assets/icons/edit.png')),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          editadress('Add Note',
                              const AssetImage('assets/icons/add_note.png'))
                        ],
                      ),
                    ],
                  );
                }),
              ),
            ),
            Container(
                height: 1,
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                color: const Color(0xffEAEAEA)),
            Padding(
              padding: padding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 54,
                        width: 54,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: NetworkImage(
                                    coffedetail.singlecoffee!.image!),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            coffedetail.singlecoffee!.title!,
                            style: BoldTextStyle.bold16,
                          ),
                          Text(
                            coffedetail.singlecoffee!.ingredients![0],
                            style: BoldTextStyle.light12,
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            coffedetail.subtractCount();
                          },
                          child: Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: const Color(0xffeaeaea)),
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset(
                              'assets/icons/minus.png',
                              color: const Color(0xffAAADB0),
                            ),
                          ),
                        ),
                        Text(
                          coffedetail.orderCount.toString(),
                          style: BoldTextStyle.bold14,
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () {
                            coffedetail.addOrderCount();
                          },
                          child: Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: const Color(0xffeaeaea)),
                                borderRadius: BorderRadius.circular(20)),
                            child: Image.asset(
                              'assets/icons/add.png',
                              color: const Color(0xffAAADB0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              height: 4,
              color: const Color(0xffF4F4F4),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
              height: 56,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(width: 1, color: const Color(0xffEAEAEA))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16.0, bottom: 16, left: 16),
                    child: Row(
                      children: [
                        Image.asset('assets/icons/Discount.png'),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          '1 Discount is applied',
                          style: BoldTextStyle.bold14,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 16, top: 18, bottom: 18),
                    child: InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: Image.asset('assets/icons/arrow_right.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Summary',
                    style: BoldTextStyle.bold16,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  price(
                      'Price',
                      (coffedetail.price * coffedetail.orderCount)
                          .toStringAsFixed(2)),
                  const SizedBox(
                    height: 16,
                  ),
                  price('Delivery Fee',
                      coffedetail.deliveryFee.toStringAsFixed(2)),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 1,
                    color: const Color(0xffeaeaea),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  price(
                      'Total Payment',
                      (coffedetail.price * coffedetail.orderCount +
                              coffedetail.deliveryFee)
                          .toStringAsFixed(2))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
