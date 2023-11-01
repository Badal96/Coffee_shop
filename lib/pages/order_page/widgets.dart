import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helpers/colors.dart';
import '../../helpers/text_style.dart';

Widget price(String text, String price) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: GoogleFonts.sora(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Appcolors.appBoldTextBlack),
      ),
      Text(
        '\$$price',
        style: BoldTextStyle.bold14,
      )
    ],
  );
}

Widget editadress(String text, ImageProvider img) {
  {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xffDEDEDE), width: 1)),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Image(image: img),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            text,
            style: GoogleFonts.sora(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: const Color(0xff303336)),
          )
        ],
      ),
    );
  }
}

Widget deliverMethod(
    String deliverMethod, String chosed, void Function(String) ontap) {
  bool isSelected = deliverMethod == chosed;

  return Expanded(
    child: GestureDetector(
      onTap: () {
        ontap(deliverMethod);
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            color: isSelected ? Appcolors.appBrown : const Color(0xffF2F2F2),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            deliverMethod,
            style: GoogleFonts.sora(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected ? Colors.white : Appcolors.appBoldTextBlack),
          ),
        ),
      ),
    ),
  );
}
