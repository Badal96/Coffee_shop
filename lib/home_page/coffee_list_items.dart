import 'package:coffee_shop/coffee_detail.dart';
import 'package:coffee_shop/providers/filter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../error_message.dart';
import '../helpers/colors.dart';
import '../models/coffee_model.dart';
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
              return ErrorMessage(
                ontap: () {
                  // Provider.of<CoffeProvider>(context).getCoffeList();
                  provider.getCoffeList();
                },
              );
            }

            return Consumer<FilterProvider>(builder: (context, value, child) {
              List<CoffeeModel> filteredList = value.selctedFilters.isEmpty
                  ? List<CoffeeModel>.from(provider.coffees)
                  : provider.coffees
                      .where((subList) => value.selctedFilters.every(
                          (element) => (subList.ingredients ?? [])
                              .map((e) => e.toLowerCase())
                              .contains(Ingredients.values[element].name
                                  .toString()
                                  .toLowerCase())))
                      .toList();

              return GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: filteredList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: (145 / 230),
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final CoffeeModel coffeeModel = filteredList[index];
                  return coffeListitem(
                      context: context,
                      id: coffeeModel.id!,
                      title: coffeeModel.title ?? '',
                      descirption: coffeeModel.ingredients![0],
                      img: coffeeModel.image ??
                          'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png',
                      price: 26);
                },
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
      required int price,
      required BuildContext context,
      required int id}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (context) => DetailProvider()..getCoffeeItem(id),
                child: CoffeeDetial())));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Color(0xff2F2D2C),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(
                  descirption,
                  style:
                      const TextStyle(color: Color(0xff9B9B9B), fontSize: 12),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ ${price.toString()}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color(0xff2F4B4E)),
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
            )
          ],
        ),
      ),
    );
  }
}
