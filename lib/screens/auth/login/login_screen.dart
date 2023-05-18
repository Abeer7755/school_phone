import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:school_phone/screens/auth/register/register_screen.dart';
import 'package:school_phone/screens/home/home_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final _emailController = TextEditingController();
  late final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  IconData icon = Icons.visibility_off;
  bool isVisible = true;

  void visible() {
    setState(() {
      isVisible = !isVisible;
      icon = isVisible ?  Icons.visibility_off: Icons.visibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Login Screen',style: TextStyle(color: Colors.black,),),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Expanded(
          child: Container(
            width: double.infinity,
            height: double.infinity,

            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10,),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 50,),
                    const Text(
                      "Welcome Back",
                      style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w700,),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15,),
                    const Text(
                      "Sign in with your email and password",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey
                      ),
                    ),
                    const SizedBox(height: 30,),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: _emailController,
                      validator: ValidationBuilder().email().build(),
                      keyboardType: TextInputType.text,
                      decoration:  InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.teal,width: 1,),
                          borderRadius: BorderRadius.circular(60),
                        ),
                        hintText: 'enter your email',
                        label: const Text(
                          'Email',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(

                      controller: _passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.teal,width: 1,),
                          borderRadius: BorderRadius.circular(60),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            visible();
                          },
                          icon: Icon(icon),
                        ),
                        hintText: 'enter your password',
                        label: const Text('Password'),
                      ),
                      obscureText: isVisible,
                    ),
                    const SizedBox(height: 50),
                   
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
                          if(_formKey.currentState!.validate())
                            {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (ctx) => const HomeScreen(),
                                ),
                              );
                            }else
                            {}


                        },
                        child: Text(
                          'sign in'.toUpperCase(),
                          style:
                          const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      fallback: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx) => const RegisterScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}