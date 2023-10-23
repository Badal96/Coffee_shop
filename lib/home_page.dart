import 'package:coffee_shop/helpers/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            label: '',
            icon: IconButton(
                onPressed: () {},
                icon: ImageIcon(AssetImage('assets/icons/Home.png')))),
        BottomNavigationBarItem(
            label: '',
            icon: IconButton(
                onPressed: () {},
                icon: ImageIcon(AssetImage('assets/icons/Home.png'))))
      ]),
      appBar: AppBar(
        foregroundColor: Appcolors.appTextLightBlack,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 37,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'location',
                      style: TextStyle(fontSize: 12, color: Color(0xFFb7b7b7)),
                    ),
                    Text(
                      'Blazen',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    )
                  ],
                ),
               
                Image.network(

                  'https://img.freepik.com/free-photo/smiley-tourist-s-selfie_23-2147643213.jpg',
                  height: 44,
                  width: 44,
                )
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: 280,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xFF131313), Color(0xFF313131)]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 128, left: 30,right: 30),
            child: Column(
           
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFF313131),
                      borderRadius: BorderRadius.circular(12)),
                  height: 52,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Image.asset('assets/icons/search_icon.png'),
                        hintStyle: TextStyle(color: Appcolors.appTextLightBlack ,fontSize: 14),
                        hintText: 'Search coffee',
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon:  Image.asset('assets/icons/filter.png'),)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                   Container(
                    height: 140,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16) ,image: DecorationImage(
                    image: NetworkImage('https://img.freepik.com/free-photo/smiley-tourist-s-selfie_23-2147643213.jpg'), fit: BoxFit.fill)  ),
                   ),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      
                      coffeeFilterItem(text: 'asasdasddd', color:Appcolors.appBrown),
                      coffeeFilterItem(text: 'asdd', color: Colors.white),
                      coffeeFilterItem(text: 'asdd', color: Colors.white),
                      coffeeFilterItem(text: 'asdd', color: Colors.white),
                      coffeeFilterItem(text: 'asdd', color: Colors.white),
                      coffeeFilterItem(text: 'asdd', color: Colors.white),
                    ],
                  ),
                ),
                Expanded(
                
                  child: Container(
                    margin: EdgeInsets.only(top: 15),
                   
                    child: GridView(
                       padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        
                      
                          crossAxisCount: 2),
                      children: [
                        coffeListitem(
                            title: 'sda',
                            descirption: 'asd',
                            img:
                                'https://img.freepik.com/free-photo/smiley-tourist-s-selfie_23-2147643213.jpg',
                            price: 26),
                        coffeListitem(
                            title: 'sda',
                            descirption: 'asd',
                            img:
                                'https://img.freepik.com/free-photo/smiley-tourist-s-selfie_23-2147643213.jpg',
                            price: 26),
                        coffeListitem(
                            title: 'sda',
                            descirption: 'asd',
                            img:
                                'https://img.freepik.com/free-photo/smiley-tourist-s-selfie_23-2147643213.jpg',
                            price: 26),
                        coffeListitem(
                            title: 'sda',
                            descirption: 'asd',
                            img:
                                'https://img.freepik.com/free-photo/smiley-tourist-s-selfie_23-2147643213.jpg',
                            price: 26),
                        coffeListitem(
                            title: 'sda',
                            descirption: 'asd',
                            img:
                                'https://img.freepik.com/free-photo/smiley-tourist-s-selfie_23-2147643213.jpg',
                            price: 26),
                        coffeListitem(
                            title: 'sda',
                            descirption: 'asd',
                            img:
                                'https://img.freepik.com/free-photo/smiley-tourist-s-selfie_23-2147643213.jpg',
                            price: 26),
                        coffeListitem(
                            title: 'sda',
                            descirption: 'asd',
                            img:
                                'https://img.freepik.com/free-photo/smiley-tourist-s-selfie_23-2147643213.jpg',
                            price: 26),
                        coffeListitem(
                            title: 'sda',
                            descirption: 'asd',
                            img:
                                'https://img.freepik.com/free-photo/smiley-tourist-s-selfie_23-2147643213.jpg',
                            price: 26),
                        coffeListitem(
                            title: 'sda',
                            descirption: 'asd',
                            img:
                                'https://img.freepik.com/free-photo/smiley-tourist-s-selfie_23-2147643213.jpg',
                            price: 26),
                        coffeListitem(
                            title: 'sda',
                            descirption: 'asd',
                            img:
                                'https://img.freepik.com/free-photo/smiley-tourist-s-selfie_23-2147643213.jpg',
                            price: 26),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget coffeeFilterItem({required Color color ,required String text}) {
    return Container(
      margin: EdgeInsets.only(right: 8, top: 16 ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 38,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12)),
      child: Center(child: Text(text)),
    );
  }

  Widget coffeListitem({
    required String title,
    required String descirption,
    required String img,
    required int price,
  }) {
    return Container(
      
      margin: EdgeInsets.all(8),
      height: 239,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    image: NetworkImage(img), fit: BoxFit.fill)),
          ),
          Text(title),
          Text(descirption),
          Row(
            children: [
              Text('\$ ${price.toString()}'),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add),
                color: Appcolors.appBrown,
              )
            ],
          )
        ],
      ),
    );
  }
}
