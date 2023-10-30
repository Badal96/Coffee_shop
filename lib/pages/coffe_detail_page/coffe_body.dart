import 'package:coffee_shop/helpers/text_style.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../../helpers/colors.dart';
import '../../providers/detial_provider.dart';

class CoffePageBody extends StatelessWidget {
  const CoffePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    DetailProvider coffeeDetial = Provider.of<DetailProvider>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 226,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      image: NetworkImage(coffeeDetial.singlecoffee!.image ??
                          'https://www.ncenet.com/wp-content/uploads/2020/04/No-image-found.jpg'),
                      fit: BoxFit.fill)),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coffeeDetial.singlecoffee!.title ?? 'No title',
                      style: GoogleFonts.sora(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Appcolors.appBoldTextBlack),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(coffeeDetial.singlecoffee!.ingredients![0],
                        style: BoldTextStyle.light12),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        const ImageIcon(
                          AssetImage('assets/icons/Rating.png'),
                          color: Color(0xffFBBE21),
                        ),
                        Text('4.8', style: BoldTextStyle.bold16),
                        Text('(230)', style: BoldTextStyle.light12)
                      ],
                    )
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 55,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 44,
                          width: 44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: const Color(0xffF9F9F9),
                          ),
                          child: Image.asset(
                            'assets/icons/bean.png',
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Container(
                          height: 44,
                          width: 44,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: const Color(0xffF9F9F9)),
                          child: Image.asset(
                            'assets/icons/milk.png',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    color: const Color(0xffEAEAEA),
                    height: 1,
                  ),
                ),
              ],
            ),
            Text('Description', style: BoldTextStyle.bold16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 20),
                    color: const Color(0xFFFFFFFF),
                    height: 69,
                    child: SingleChildScrollView(
                      child: ReadMoreText(
                          coffeeDetial.singlecoffee!.description ?? '',
                          trimLines: 3,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Read more',
                          trimExpandedText: 'Show less',
                          moreStyle: GoogleFonts.sora(
                              color: const Color(0xffC67C4E),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                          lessStyle: GoogleFonts.sora(
                              color: const Color(0xffC67C4E),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                          style: BoldTextStyle.light14),
                    ),
                  ),
                ),
              ],
            ),
            Text('Size', style: BoldTextStyle.bold16),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  coffeSize(
                      isSelected: coffeeDetial.selectedSize == 'small',
                      text: 'S',
                      ontap: coffeeDetial.changesize),
                  coffeSize(
                      isSelected: coffeeDetial.selectedSize == 'medium',
                      text: 'M',
                      ontap: coffeeDetial.changesize),
                  coffeSize(
                      isSelected: coffeeDetial.selectedSize == 'large',
                      text: 'L',
                      ontap: coffeeDetial.changesize)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget coffeSize(
      {required bool isSelected,
      required String text,
      required void Function(String) ontap}) {
    return GestureDetector(
      onTap: () {
        ontap(text);
      },
      child: Container(
          width: 96,
          height: 43,
          decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xffFFF5EE)
                  : const Color(0xffFFFFFF),
              border: Border.all(
                width: 1,
                color: isSelected
                    ? const Color(0xffC67C4E)
                    : const Color(0xffDEDEDE),
              ),
              borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Text(text,
                style: GoogleFonts.sora(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: isSelected
                        ? Appcolors.appBrown
                        : Appcolors.appBoldTextBlack)),
          )),
    );
  }
}
