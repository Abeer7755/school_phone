import 'package:flutter/material.dart';
import 'package:school_phone/screens/rate/rate_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
              const Text(
                'Ashry',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 20,
                ),
              ),
              const Text(
                '01004371412',
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

              _currentIndex == 0 ? _schoolWidget(size: size) : _myRatesWidget(),
            ],
          ),
        ),
      ),
    );
  }

  _schoolWidget
      (
  {
    required size ,
}
      )

  {
    return Expanded(child:
    ListView.builder(
        itemCount: 2,
        itemBuilder: (context,index)
    {
      return InkWell(
        onTap: ()
        {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => const RateScreen(),
            ),
          );
        },
        child: Container(
          width: size.width,
          height: 100,
          padding:const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 0,),
          margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 10,),
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
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  const [
                  Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Date',
                    style: TextStyle(
                      fontSize: 12,
                      color:Colors.grey,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap:()
                {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const RateScreen(),
                    ),
                  );
                },
                child: Container(
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
                ),
              )

            ],
          ),
        ),
      );
    }));
  }
  _myRatesWidget()
  {
    return Text('Hello');
  }
}
