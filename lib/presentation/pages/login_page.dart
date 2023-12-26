// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login/presentation/bloc/post_bloc.dart';
import 'package:login/presentation/pages/splashcreen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/loginpage';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final textController_username = TextEditingController();
  final textController_password = TextEditingController();
  bool isObscured = true;
  late bool successCheck;
  String pesanCheck = '';
  bool isButtonDisabled = false;

  void revealText() {
    setState(() {
      isObscured = !isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffFDFDFD),
                Color(0xff00A1D4),
              ],
              stops: [0.4, 0.8],
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 250,
                    height: 150,
                    alignment: Alignment.center,
                    child: FlutterLogo(size: 200,),
                  ),
                  const Padding(padding: EdgeInsets.all(25)),
                  SizedBox(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              'Login ',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xff00A1D4),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.grey, width: 2),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Row(
                              children: <Widget>[
                                const Padding(padding: EdgeInsets.all(10)),
                                const Icon(FontAwesomeIcons.user),
                                const Padding(padding: EdgeInsets.all(10)),
                                Expanded(
                                    child: TextField(
                                  style: const TextStyle(fontSize: 20),
                                  controller: textController_username,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Username",
                                    hintStyle: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.grey, width: 2),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Row(
                              children: <Widget>[
                                const Padding(padding: EdgeInsets.all(10)),
                                const Icon(FontAwesomeIcons.user),
                                const Padding(padding: EdgeInsets.all(10)),
                                Expanded(
                                  child: TextField(
                                    style: const TextStyle(fontSize: 20),
                                    controller: textController_password,
                                    obscureText: isObscured,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      left: BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: InkWell(
                                      onTap: revealText,
                                      child: Icon(isObscured
                                          ? FontAwesomeIcons.eye
                                          : FontAwesomeIcons.eyeSlash),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(25)),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: InkWell(
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: isButtonDisabled
                                      ? Colors.grey
                                      : Colors.blue,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15))),
                              child: const Center(
                                child: Text(
                                  'MASUK',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            onTap: () async {
                              isButtonDisabled ? null : await _doLogin();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _doCheck() async {
    context.read<PostLoginBloc>().add(OnloginPost(
          textController_username.text,
          textController_password.text,
        ));
    final state = await context.read<PostLoginBloc>().stream.firstWhere(
          (state) => state is PostLoginHasData || state is PostHasError,
        );
    if (state is PostLoginHasData) {
      var user = state.login;
      setState(() {
        successCheck = user.success;
        pesanCheck = user.pesan;
      });
    } else if (state is PostHasError) {}
  }

  Future _doLogin() async {
    if (textController_username.text.isEmpty ||
        textController_password.text.isEmpty) {
      Alert(
              context: context,
              title: "Username dan Password tidak boleh kosong",
              type: AlertType.error)
          .show();
      return;
    }
    setState(() {
      isButtonDisabled = true;
    });
    await _doCheck();
    bool successini = successCheck;
    String pesanini = pesanCheck;
    if (successini == true) {
      Navigator.pushReplacementNamed(context, SplashScreen.routeName,
          arguments: textController_username.text);
    } else {
      Alert(context: context, title: pesanini, type: AlertType.error).show();
      setState(() {
        isButtonDisabled = false;
      });
    }
  }
}
