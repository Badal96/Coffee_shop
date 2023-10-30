import 'package:coffee_shop/models/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../helpers/colors.dart';
import '../providers/filter_provider.dart';

class CoffeFilter extends StatelessWidget {
  const CoffeFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Consumer<FilterProvider>(
        builder: (context2, provider, child) {
          return Row(
            children: [
              ...Ingredients.values.map(
                (e) => _CoffeeFilterItem(
                    text: e.name.toString(), index: e.index, context: context),
              )
            ],
          );
        },
      ),
    );
  }
}

class _CoffeeFilterItem extends StatelessWidget {
  const _CoffeeFilterItem(
      {required this.text, required this.index, required this.context});
  final BuildContext context;
  final int index;
  final String text;
  @override
  Widget build(BuildContext context) {
    final provider = context.read<FilterProvider>();
    final bool selected = provider.itemExists(index);
    return GestureDetector(
      onTap: () => provider.addremoveFilter(index),
      child: Container(
        margin: const EdgeInsets.only(right: 8, top: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        height: 38,
        decoration: BoxDecoration(
            color: selected ? Appcolors.appBrown : Colors.white,
            borderRadius: BorderRadius.circular(12)),
        child: Center(
            child: Text(
          text,
          style: GoogleFonts.sora(
              fontSize: 14, color: selected ? Colors.white : Colors.black),
        )),
      ),
    );
  }
}
