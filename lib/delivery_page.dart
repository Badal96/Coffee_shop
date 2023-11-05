import 'package:coffee_shop/helpers/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';

class DeliverPage extends StatefulWidget {
  final List<double> userlocatin;
  final String adress;
  const DeliverPage(
      {super.key, required this.userlocatin, required this.adress});

  @override
  State<DeliverPage> createState() => _DeliverPageState();
}

class _DeliverPageState extends State<DeliverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        titleSpacing: 0,
        title: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin:
                const EdgeInsets.only(left: 30, top: 60 - kTextTabBarHeight),
            padding: const EdgeInsets.all(10),
            height: 44,
            width: 44,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(14)),
                color: Colors.white),
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xff130F26),
              ),
            ),
          ),
        ),
      ),
      body: Stack(children: [
        FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(widget.userlocatin[0], widget.userlocatin[1]),
            initialZoom: 16,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
          ],
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.32,
          minChildSize: 0.12,
          maxChildSize: 0.4,
          builder: (context, scrollController) => Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(24)),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      height: 5,
                      width: 44,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.5),
                          color: const Color(0xffEAEAEA)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      '10 minutes left',
                      style: GoogleFonts.sora(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff303336)),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: 'Deliver to ',
                              style: GoogleFonts.sora(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff808080))),
                          TextSpan(
                              text: widget.adress,
                              style: GoogleFonts.sora(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff303336)))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: progresindicator(const Color(0xff36C07E))),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: progresindicator(const Color(0xff36C07E))),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: progresindicator(const Color(0xff36C07E))),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: progresindicator(const Color(0xffDFDFDF)))
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      height: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                              width: 1, color: const Color(0xffEAEAEA))),
                      child: Row(
                        children: [
                          Container(
                            height: 62,
                            width: 62,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: const Color(0xffEAEAEA)),
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Image.asset(
                                'assets/icons/bike.png',
                                height: 32,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Delivered your order',
                                  style: BoldTextStyle.bold14,
                                ),
                                Text(
                                  'we deliver your goods to you in the shortest possible time.',
                                  style: BoldTextStyle.light12,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 54,
                              width: 54,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/driver.jpg'),
                                      fit: BoxFit.fill)),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Johan Hawn',
                                  style: BoldTextStyle.bold14,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Personal Courier',
                                  style: BoldTextStyle.light12,
                                )
                              ],
                            )
                          ],
                        ),
                        Container(
                          height: 54,
                          width: 54,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                width: 1, color: const Color(0xffDEDEDE)),
                          ),
                          child: Center(
                              child: Image.asset('assets/icons/telpon.png')),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}

Widget progresindicator(Color color) {
  return Container(
    height: 4,
    decoration:
        BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
  );
}
