import 'package:coffee_shop/helpers/colors.dart';
import 'package:coffee_shop/providers/detial_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class CoffeeDetial extends StatefulWidget {
  const CoffeeDetial({super.key});

  @override
  State<CoffeeDetial> createState() => _CoffeeDetialState();
}

class _CoffeeDetialState extends State<CoffeeDetial> {
  @override
  Widget build(BuildContext context) {
    DetailProvider coffeeDetial = Provider.of<DetailProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 15, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context),
              ),
              Text(
                'Detail',
                style: TextStyle(
                    color: Appcolors.appBoldTextBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const ImageIcon(AssetImage('assets/icons/Heart2.png'))
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 121,
        decoration: const BoxDecoration(
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
                    const Text(
                      'Price',
                      style: TextStyle(
                          color: Color(
                            0xff9b9b9b,
                          ),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      '\$4.54',
                      style: TextStyle(
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
                    const EdgeInsets.only(top: 16, bottom: 43, right: 30.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    backgroundColor: Appcolors.appBrown,
                    minimumSize: const Size(100, 40),
                  ),
                  child: const SizedBox(
                    height: double.infinity,
                    child: Center(
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
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
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 27),
                      height: 226,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: NetworkImage(coffeeDetial
                                      .singlecoffee!.image ??
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
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Appcolors.appBoldTextBlack),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              coffeeDetial.singlecoffee!.ingredients![0],
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Appcolors.appTextLightBlack),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                const ImageIcon(
                                  AssetImage('assets/icons/Rating.png'),
                                  color: Color(0xffFBBE21),
                                ),
                                Text(
                                  '4.8',
                                  style: TextStyle(
                                      color: Appcolors.appBoldTextBlack,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Text(
                                  '(230)',
                                  style: TextStyle(
                                      color: Color(0xff808080),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                )
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
                                      color: const Color(0xffF9F9F9)),
                                  child: Image.asset(
                                    'assets/icons/bean.jpg',
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
                                    'assets/icons/milk.jpg',
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
                    Text(
                      'Description',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Appcolors.appBoldTextBlack,
                          fontSize: 16),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(top: 20, bottom: 20),
                            color: const Color.fromARGB(255, 244, 244, 244),
                            height: 69,
                            child: SingleChildScrollView(
                              child: ReadMoreText(
                                coffeeDetial.singlecoffee!.description ?? '',
                                trimLines: 3,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: '...Read more',
                                trimExpandedText: 'Show less',
                                colorClickableText: Appcolors.appBrown,
                                style: GoogleFonts.sora(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Appcolors.appTextLightBlack),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Size',
                      style: GoogleFonts.sora(
                          fontWeight: FontWeight.w600,
                          color: Appcolors.appBoldTextBlack,
                          fontSize: 16),
                    ),
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
                  : const Color(0xffDEDEDE),
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
