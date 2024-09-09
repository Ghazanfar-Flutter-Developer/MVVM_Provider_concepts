import 'package:flutter/material.dart';
import 'package:mvvm_provider/res/components/round_button.dart';
import 'package:mvvm_provider/utlis/routes/routes_name.dart';
import 'package:mvvm_provider/utlis/utlis.dart';
import 'package:mvvm_provider/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  final ValueNotifier<bool> _obsCureText = ValueNotifier<bool>(true);

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsCureText.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    final authviewmodel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.brown.shade100,
        title: const Text("Login Screen"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.1),
              Icon(
                Icons.account_circle,
                color: Colors.brown.shade200,
                size: 80,
              ),
              SizedBox(height: height * 0.005),
              Text(
                "Welcome back to \nLogin Screen",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.brown.shade200,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: height * 0.05),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(color: Colors.brown.shade200),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.brown.shade200),
                  prefixIcon: Icon(
                    Icons.alternate_email,
                    color: Colors.brown.shade200,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.brown.shade200,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.brown.shade200,
                    ),
                  ),
                ),
                onFieldSubmitted: (value) {
                  Utlis.fieldFocusChange(
                      context, emailFocusNode, passwordFocusNode);
                },
              ),
              const SizedBox(height: 15),
              ValueListenableBuilder(
                valueListenable: _obsCureText,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    obscuringCharacter: '*',
                    obscureText: _obsCureText.value,
                    focusNode: passwordFocusNode,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.brown.shade200),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.brown.shade200),
                      prefixIcon: Icon(
                        Icons.lock_open,
                        color: Colors.brown.shade200,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _obsCureText.value = !_obsCureText.value;
                        },
                        icon: Icon(
                          _obsCureText.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.brown.shade200,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.brown.shade200,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.brown.shade200,
                        ),
                      ),
                    ),
                    onFieldSubmitted: (value) {
                      FocusScope.of(context).requestFocus();
                    },
                  );
                },
              ),
              SizedBox(height: height * 0.05),
              RoundButton(
                title: "Login",
                loading: authviewmodel.loading,
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    Utlis.flushBarError('Please Enter Email', context);
                  } else if (_passwordController.text.isEmpty) {
                    Utlis.flushBarError('Please Enter password', context);
                  } else if (_passwordController.text.length < 6) {
                    Utlis.flushBarError(
                        'Password must be 8 characters', context);
                  } else {
                    Map data = {
                      'email': _emailController.text.toString(),
                      'password': _passwordController.text.toString(),
                    };

                    authviewmodel.loginApi(data, context);
                    print('Api is workinig');
                  }
                },
              ),
              SizedBox(height: height * 0.02),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesName.signup);
                },
                child: RichText(
                  text: const TextSpan(
                    text: "Don't have account? ",
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          color: Colors.brown,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
