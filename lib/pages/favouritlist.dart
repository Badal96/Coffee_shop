import 'package:coffee_shop/helpers/text_style.dart';
import 'package:coffee_shop/models/coffee_model.dart';
import 'package:coffee_shop/providers/favourit_list_provider.dart';
import 'package:coffee_shop/providers/user_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee_shop/home_page/coffee_list_items.dart';

class FavouritListPage extends StatelessWidget {
  const FavouritListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Favourit Items',
          style: BoldTextStyle.bold16,
        ),
      ),
      body: Consumer<FavouritListProvider>(
          builder: (context, value, child) => value.favouritList.isEmpty
              ? Center(
                  child: Image.network(
                  'https://ibellstore.com/images/no-item-found-here.png',
                ))
              : GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: value.favouritList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: (145 / 200),
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    final CoffeeModel coffeeModel = value.favouritList[index];
                    UserdataProvider provider =
                        context.read<UserdataProvider>();
                    return coffeListitem(
                        model: coffeeModel,
                        provider: provider,
                        context: context,
                        id: coffeeModel.id!,
                        title: coffeeModel.title ?? '',
                        descirption: coffeeModel.ingredients![0],
                        img: coffeeModel.image ??
                            'https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png',
                        price: 4.53);
                  })),
    );
  }
}
