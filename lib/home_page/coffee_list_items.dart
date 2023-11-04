import 'package:coffee_shop/helpers/text_style.dart';
import 'package:coffee_shop/providers/filter_provider.dart';
import 'package:coffee_shop/providers/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../error_message.dart';
import '../helpers/colors.dart';
import '../models/coffee_model.dart';
import '../pages/coffe_detail_page/coffee_detail.dart';
import '../providers/coffee_provider.dart';
import '../providers/detial_provider.dart';

class CoffeeFilterItems extends StatelessWidget {
  const CoffeeFilterItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        child: Consumer<CoffeProvider>(
          builder: (context, provider, child) {
            if (provider.loading) {
              return const Center(
                child: LinearProgressIndicator(),
              );
            }

            if (provider.coffees.isEmpty) {
              return ErrorMessage(ontap: provider.getCoffeList);
            }

            return Consumer<FilterProvider>(builder: (context, value, child) {
              List<CoffeeModel> filteredList = provider.namedfilter == ''
                  ? List<CoffeeModel>.from(provider.coffees)
                  : List<CoffeeModel>.from(provider.nameFilteredCoffes);
              if (value.selctedIngridients.isNotEmpty) {
                List<String> selectedingridients = List.from(
                    value.selctedIngridients.map((e) =>
                        Ingredients.values[e].name.toString().toLowerCase()));

                filteredList.removeWhere((element) => !selectedingridients
                    .every((el) => (element.ingredients ?? [])
                        .map((e) => e.toLowerCase())
                        .contains(el))); //// filter
              }

              return Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: filteredList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: (145 / 220),
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    final CoffeeModel coffeeModel = filteredList[index];
                    return Consumer<UserdataProvider>(
                      builder: (context, value, child) => coffeListitem(
                          provider: value,
                          context: context,
                          id: coffeeModel.id!,
                          title: coffeeModel.title ?? '',
                          descirption: coffeeModel.ingredients![0],
                          img: coffeeModel.image ??
                              'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png',
                          price: 4.53),
                    );
                  },
                ),
              );
            });
          },
        ),
      ),
    );
  }

  Widget coffeListitem(
      {required String title,
      required String descirption,
      required String img,
      required double price,
      required BuildContext context,
      required UserdataProvider provider,
      required int id}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (context) => DetailProvider()..getCoffeeItem(id),
                child: CoffeeDetial(provider: provider))));
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 132,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        image: NetworkImage(
                          img,
                        ),
                        fit: BoxFit.fill)),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: BoldTextStyle.bold16),
                    const SizedBox(height: 5),
                    Text(descirption, style: BoldTextStyle.light12),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${price.toString()}',
                      style: GoogleFonts.sora(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: const Color(0xff2F4B4E)),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                              color: Appcolors.appBrown,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 16,
                          )),
                      color: Appcolors.appBrown,
                    )
                  ],
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
            height: 25,
            width: 51,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              color: Color.fromRGBO(0, 0, 0, 0.16),
            ),
            child: Center(
              child: Row(
                children: [
                  InkWell(
                    child: Image.asset(
                      'assets/icons/Rating.png',
                      height: 10,
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    '4.8',
                    style: GoogleFonts.sora(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 10),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
