import 'package:flutter/material.dart';

import '../../../../../../../../main.dart';
import '_/state_child.dart';
import '_/state_mother.dart';

class NewView extends StatefulWidget {
  NewView({super.key});

  @override
  State<NewView> createState() => StateChild();
}

class NewViewState extends State<NewView> with StateMother {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Container(
              width: 50,
              padding: EdgeInsets.only(bottom: 30),
              child: Image.asset('assets/view/login_view2/youtube.webp'),
            ),
            Center(
                child: Text(
              'Login In Now',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            )),
            Center(
              child: Text(
                'Kindly Login to continue using our app',
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 80, left: 40, right: 40),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Email Field must not be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 25.0, horizontal: 10.0),
                      ),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) => FocusScope.of(context)
                          .nextFocus(), // move focus to next
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).nextFocus(),
                      // move focus to next
                      obscureText: !_showPassword,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Password Field must not be empty';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 25.0, horizontal: 10.0),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 70,
                            padding: EdgeInsets.symmetric(vertical: 13),
                            child: Center(
                              child: Text(
                                _showPassword ? "Hide" : "Show",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize:
                              Size(MediaQuery.of(context).size.width, 70),
                          backgroundColor: Colors.white, // background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          print("Forgot Password Clicked");
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                fontSize: 15.0, color: Colors.grey[600]),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blueAccent,
                          minimumSize:
                              Size(MediaQuery.of(context).size.width, 70),
                          // text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          print('Logged In');
                        },
                        child: Text('Login'),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(30),
                      child: Text('Do not have an Account? SignUp'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                    child: Text('or connect with'),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/view/login_view2/facebook.webp'),
                          ),
                          Container(
                            color: Colors.white,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(
                                  'assets/view/login_view2/google.webp'),
                            ),
                          ),
                          CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/view/login_view2/twitter.webp'),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

main() async {
  return buildApp(appHome: NewView());
}
