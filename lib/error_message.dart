 
 import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key,required this.ontap});
 final void Function () ontap;


  @override
  Widget build(BuildContext context,) {
    return Center(
      child: Column(
     children: [
      Container( 
        height: 150,
        width: 200,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(17), image:const DecorationImage(image:NetworkImage('https://t4.ftcdn.net/jpg/04/25/04/31/360_F_425043151_fEW5PV5rZ5MX9LxcQd3sewzetmoooIpJ.jpg'), fit: BoxFit.fill),)),
        
      
     const SizedBox(height: 50,),
      ElevatedButton(onPressed: ontap
      , child:const Text('try again') )
     ],

      ),
    );
  }
}