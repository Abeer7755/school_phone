import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class DBModel {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List inviteList = [];
  List requestList = [];
  List fequestList = [];
  List schools = [];



  getInvite(String numb,String uid) async {
    Query<Map<String, dynamic>> collectionRef =
    FirebaseFirestore.instance.collection("Users").where("phone",isEqualTo: "$numb");

    try {

      await collectionRef.get().then((querySnapshot1) async {

        /**/

          Query<Map<String, dynamic>> collectionRef =
          FirebaseFirestore.instance.collection("Requests").where("uid",isEqualTo: "$uid");
          await collectionRef.get().then((querySnapshot) {

            print("isBlank  querySnapshot - querySnapshot ${querySnapshot.docs.length}");

            if(querySnapshot.docs.length==0){
              for (var result in querySnapshot1.docs) {



                inviteList.add(result.data());
              }
            }else{
              inviteList.clear();
              return [];
            }

          });






      });

      return inviteList;
    } catch (e) {
      print("Error - Ashry $e");
      return inviteList;
    }
  }
  getRequest(String uid) async {
    Query<Map<String, dynamic>> collectionRef =
    FirebaseFirestore.instance.collection("Requests").where("familyId",isEqualTo: "$uid").where("status",isEqualTo: "0");

    try {

      await collectionRef.get().then((querySnapshot1) {

        for (var result in querySnapshot1.docs) {



          requestList.add(result.data());
        }








      });

      return requestList;
    } catch (e) {
      print("Error - Ashry $e");
      return [];
    }
  }

  getAllRating(String uid) async {
    Query<Map<String, dynamic>> collectionRef =
    FirebaseFirestore.instance.collection("rating").where("userID",isEqualTo: "$uid");

    try {

      await collectionRef.get().then((querySnapshot1) {

        for (var result in querySnapshot1.docs) {



          fequestList.add(result.data());
        }








      });

      return fequestList;
    } catch (e) {
      print("Error - Ashry $e");
      return [];
    }
  }


  getAllSchool() async {
    Query<Map<String, dynamic>> collectionRef =
    FirebaseFirestore.instance.collection("school");

    try {

      await collectionRef.get().then((querySnapshot1) {

        for (var result in querySnapshot1.docs) {



          schools.add(result.data());
        }








      });

      return schools;
    } catch (e) {
      print("Error - Ashry $e");
      return [];
    }
  }

  /// update user
  updateUser({

    required String key,
    required String value ,

  }) async {
    await firestore.collection('Users').doc(auth.currentUser!.uid).update({
      key: value,

    }).then((value) {
      print('data updated');
    });
  }

  getCurrentUser(String uid)
  async{
    var user = await firestore.collection('Users').doc(uid).get();
    print('***********************');
    print(user);
  }
  List user = [];
  readCurrentUser()
  async{

    Query<Map<String, dynamic>> collectionRef =
    FirebaseFirestore.instance.collection("Users").doc(auth.currentUser!.uid) as Query<Map<String, dynamic>>;

    try {

      await collectionRef.get().then((querySnapshot) {
        for (var result in querySnapshot.docs) {

          user.add(result.data());
          print('***********************');
          print(user);
        }
      });

      return user;
    } catch (e) {
      print("Error - Ashry $e");
      return null;
    }

  }
  /// sign up with phone

  final FirebaseAuth auth = FirebaseAuth.instance;
  var verificationId = '';

  Future<void> phoneAuth(String phoneNumber) async {
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId = verificationId;
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var  credential = await auth.signInWithCredential(PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    ),);

    return credential.user != null ? true :false ;
  }



  Future<void> signOut()
  async{
    await auth.signOut();

  }
}
