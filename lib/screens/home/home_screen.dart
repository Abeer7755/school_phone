import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:school_phone/DBModel/db_model.dart';
import 'package:school_phone/screens/rate/rate_screen.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   String? _username , _userid , _email;

   List requestList = [];
   List requesRatetList = [];

  void getUser(){
    FirebaseFirestore.instance.collection('users').doc("${FirebaseAuth.instance.currentUser!.uid}").get().then((value) => {

    setState(() {
      _userid = FirebaseAuth.instance.currentUser!.uid;
      _username = value.get("name");
      _email = value.get("email");
    })


      
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUser();

  }
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {


    var size = MediaQuery.of(context).size;
    List items = [
      'Schools',
      'My Rates',
    ];
    return Scaffold
      (
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40,),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blueAccent,
                            width: 4,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      Image.asset(
                        'assets/images/user.png',
                        width: 100,
                        height: 100,
                      ),

                    ],
                  ),
                  InkWell(
                    onTap: ()
                    {

                     /* showMaterialModalBottomSheet(

                        duration:
                        const Duration(milliseconds: 700,),
                        context: context,
                        builder: (context) => Container(
                          height: size.height * 0.2,
                          color: Colors.white,
                          child: Column(
                            children: [
                              ListTile(
                                leading: const Icon(
                                  Icons.image,
                                ),
                                title: const Text('Gallery'),
                                onTap: () {
                                  PickImage(
                                    ImageSource.gallery,
                                  ).then((value) {
                                    DBModel().updateUser(key: 'url', value: url,);
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Divider(
                                color: secondaryColor,
                                thickness: 0.3,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              ListTile(
                                leading: const Icon(
                                  Icons.camera,
                                ),
                                title: const Text('Camera'),
                                onTap: () {
                                  PickImage(
                                    ImageSource.camera,
                                  ).then((value)
                                  {
                                    DBModel().updateUser(key: 'url', value: url,);

                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ).then((value)

                      {


                      }

                      );*/
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(2, 2),
                                    blurRadius: 5)
                              ]),
                        ),
                        Container(
                          width: 33,
                          height: 33,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Image.asset(
                            'assets/images/edit.png',
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
               Text(
                '${_username}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
               Text(
                '${_email}',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff676767),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: const Color(0xffE8DFDF).withOpacity(0.21),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(
                              milliseconds: 100,
                            ),
                            width: size.width * 0.4,
                            alignment: Alignment.center,
                            margin: _currentIndex == 0
                                ? const EdgeInsets.only(
                              right: 10,
                            )
                                : const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                color: _currentIndex == index
                                    ? Colors.white
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  _currentIndex == index
                                      ? BoxShadow(
                                    color: Colors.black26
                                        .withOpacity(0.2),
                                    blurRadius: 5,
                                    offset: const Offset(2, 4),
                                  )
                                      : const BoxShadow(
                                    color: Colors.transparent,
                                  ),
                                ]),
                            child: Text(items[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        );
                      }),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              _currentIndex == 0 
                  ? Expanded(
                child: Column(
                  children: [
                    FutureBuilder(
                        future: DBModel().getAllSchool(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return  Text(
                                "Something went wrong ${snapshot.error.toString()}");
                          }



                          if (snapshot.connectionState == ConnectionState.done) {
                            requestList = snapshot.data as List;
                            print("requestList $requestList");

                            return Expanded(
                              child: ListView.builder(
                                  itemCount:
                                  requestList.length,
                                  itemBuilder:
                                      (context, index) {

                                    return _schoolWidget( thubnail: '${requestList[index]['thubnail']}', name: '${requestList[index]['name']}', uid: '${requestList[index]['uid']}', url: '${requestList[index]['url']}', time: requestList[index]['time'] , size: size , userid: _userid.toString());
                                  }),
                            );
                          }

                          return const Center(
                            child: Text("loading......"),
                          );
                        }),
                  ],
                ),
              ) :Expanded(
                child: Column(
                  children: [
                    FutureBuilder(
                        future: DBModel().getAllRating(FirebaseAuth.instance.currentUser!.uid),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return  Text(
                                "Something went wrong ${snapshot.error.toString()}");
                          }



                          if (snapshot.connectionState == ConnectionState.done) {
                            requesRatetList = snapshot.data as List;
                            print("requestList $requesRatetList");

                            return Expanded(
                              child: ListView.builder(
                                  itemCount:
                                  requesRatetList.length,
                                  itemBuilder:
                                      (context, index) {

                                    return _myRatesWidget( thubnail: '${requesRatetList[index]['thubnail']}', name: '${requesRatetList[index]['school_name']}', uid: '${requesRatetList[index]['uid']}',   size: size , userid: '${requesRatetList[index]['userID']}', rate: '${requesRatetList[index]['rate']}');
                                  }),
                            );
                          }

                          return const Center(
                            child: Text("loading......"),
                          );
                        }),
                  ],
                ),
              ) ,
            ],
          ),
        ),
      ),
    );
  }

  _schoolWidget
      (
  {

    required size,
    required String thubnail ,
    required String name ,
    required String uid ,
    required String userid ,
    required String url ,
    required Timestamp time ,

}
      )

  {
    DateTime d = time.toDate();
    return InkWell(
      onTap:()
      {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) =>  RateScreen(uid:uid ,userid:userid ,name:name ,thubnail:thubnail,time:d.toString() ),
          ),
        );
      },
      child: Container(
        width: size.width,
        height: 100,
        padding:const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 0,),
        margin: const EdgeInsets.symmetric(vertical: 5,),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey, blurRadius: 5, offset: Offset(3, 3)),
            ]),
        child: Row(
          children: [
            Container(
              width: size.width * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage("$thubnail"),fit: BoxFit.cover),
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:   [
                Text(
                  '${name}',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: size.width * 0.3,
                  child: Text(
                    '$d',
                    style: TextStyle(
                      fontSize: 12,
                      color:Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: 30,
              height: 55,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft:  Radius.circular(15),
                ),
                color: Colors.orange,

              ),
              child: const Icon(Icons.star,color: Colors.white,size: 15,),
            )

          ],
        ),
      ),
    );
  }
  _myRatesWidget(
   {
     required size,
     required String thubnail ,
     required String name ,
     required String uid ,
     required String userid ,
     required String rate ,


   }
      )
  {
    return InkWell(

      child: Container(
        width: size.width,
        height: 100,
        padding:const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 0,),
        margin: const EdgeInsets.symmetric(vertical: 5,),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey, blurRadius: 5, offset: Offset(3, 3)),
            ]),
        child: Row(
          children: [
            Container(
              width: size.width * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage("$thubnail"),fit: BoxFit.cover),
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:   [
                Text(
                  '${name}',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),

                Container(child:   RatingBar.builder(
                  ignoreGestures: true,
                  itemSize: 20,
                  initialRating: double.parse(rate),

                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,

                  ),
                  onRatingUpdate: (rating) {

                  },
                ),)

              ],
            ),


          ],
        ),
      ),
    );
  }
}
