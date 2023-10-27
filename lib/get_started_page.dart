import 'package:coffee_shop/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
         body: Stack(
        children: [
          Column(
           
            children: [
              Expanded(
                flex: 702,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/cover.png'),
                          fit: BoxFit.cover)),
                ),
              ),
              Expanded(
                  flex: 274,
                  child: Container(
                 color: Colors.black,
                  ))
            ],
          ),
          Padding(
            padding:  EdgeInsets.only( top:size.height*668/976 - kToolbarHeight , ),
            child: SizedBox(
              width: size.width,
              child: Column(
               
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Coffee so good,\n your taste buds\n will love it.',
                    style: GoogleFonts.sora(fontSize:34,fontWeight: FontWeight.w600,letterSpacing: 0.34,color: Colors.white ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8,),
                  Text('the, best grain,the finest roast,the \n  powerful flavor.',style: GoogleFonts.sora(fontSize: 14,color:Appcolors.appTextLightBlack,fontWeight: FontWeight.w400,letterSpacing: 0.14),textAlign: TextAlign.center,),
                  SizedBox(height: 24,),
                  Container(height:62 , width: 315,
                  
                          child: ElevatedButton(onPressed: () {
                             Navigator.of(context).pushReplacementNamed('homepage');
                          }, child: Text('Get started',style: GoogleFonts.sora(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white),) ,style: ElevatedButton.styleFrom(
                            backgroundColor: Appcolors.appBrown,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
                          ),),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
