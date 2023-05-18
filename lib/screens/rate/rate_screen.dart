import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:school_phone/screens/home/home_screen.dart';

class RateScreen extends StatefulWidget {
  const RateScreen({Key? key}) : super(key: key);

  @override
  State<RateScreen> createState() => _RateScreenState();
}

class _RateScreenState extends State<RateScreen> {
  double rate = 0.0 ;
  late final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10,),
          child: SingleChildScrollView(
            child: Column(
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   InkWell(
                     onTap: ()
                     {
                       Navigator.of(context).pushReplacement(
                         MaterialPageRoute(
                           builder: (ctx) => const HomeScreen() ,
                         ),);
                     },
                     child: Container(
                       width: 40,
                       height: 40,
                       alignment: Alignment.center,
                       decoration: BoxDecoration(
                         color: Colors.blueAccent,
                         borderRadius: BorderRadius.circular(12),
                       ),
                       child:  const Icon(
                         Icons.arrow_back_ios,
                         color: Colors.white,
                         size: 14,
                       ),
                     ),
                   ),
                 ],
               ),
               const SizedBox(height: 40,),
               Stack(
                 alignment: Alignment.bottomRight,
                 children: [
                   Stack(
                     alignment: Alignment.center,
                     children: [
                       Container(
                         width: 100,
                         height: 100,
                         decoration: BoxDecoration(
                           border: Border.all(
                             color: Colors.blueAccent,
                             width: 3,
                           ),
                           borderRadius: BorderRadius.circular(100),
                         ),
                       ),
                       Image.asset(
                         'assets/images/user.png',
                         width: 90,
                         height: 90,
                       ),

                     ],
                   ),

                 ],
               ),
               const SizedBox(
                 height: 15,
               ),
               const Text(
                 'Ashry',
                 style: TextStyle(
                   color: Colors.blue,
                   fontSize: 18,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               const Text(
                 'Date',
                 style: TextStyle(color: Color(0xffC5C4D6), fontSize: 14),
               ),
               const SizedBox(
                 height: 50,
               ),
            RatingBar(
              initialRating: 2.5,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              ratingWidget: RatingWidget(
                full: _image('assets/images/heart.png'),
                half: _image('assets/images/heart_half.png'),
                empty: _image('assets/images/heart_border.png'),
              ),
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              onRatingUpdate: (rating) {
                setState(() {
                  rate = rating ;
                });
                print(rate);
              },
            ),
               const SizedBox(
                 height: 20,
               ),
               Container(
                 width: double.infinity,
                 padding: const EdgeInsets.all(10),
                 decoration: BoxDecoration(
                   border: Border.all(
                     color: Colors.orange,
                     width: 2,

                   ),
                   borderRadius: BorderRadius.circular(15),
                 ),
                 child: TextFormField(
                   maxLines: 6,
                   controller: _controller,
                   keyboardType: TextInputType.multiline,
                   decoration: const InputDecoration(
                       border: InputBorder.none,
                     hintText: 'Write something here...'
                   ),
                 ),
               ),
               const SizedBox(
                 height: 60,
               ),

               BuildCondition(
                 condition: true,
                 builder: (context) => MaterialButton(
                   color: Colors.blue,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(20),
                   ),
                   minWidth: 500,
                   height: 50,
                   onPressed: ()
                   {

                     Navigator.of(context).pushReplacement(
                       MaterialPageRoute(
                         builder: (ctx) => const HomeScreen(),
                       ),
                     );
                   },
                   child: Text(
                     'submit'.toUpperCase(),
                     style:
                     const TextStyle(color: Colors.white, fontSize: 16),
                   ),
                 ),
                 fallback: (context) => const Center(
                   child: CircularProgressIndicator(),
                 ),
               ),
             ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _image(String asset) {
    return Image.asset(
      asset,
      height: 15.0,
      width: 15.0,
      color: Colors.orange,
    );
  }
}
