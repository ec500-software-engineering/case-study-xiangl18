import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:demo/game_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(new MyApp());
final _usernameController = TextEditingController();
final _passwordController = TextEditingController();
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder> {
        '/game': (BuildContext context) => new GamePage()
      },
      theme: new ThemeData(primarySwatch: Colors.deepPurple),
      home: new LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {

  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(

      backgroundColor: Colors.deepPurple,
      body: new Stack(fit: StackFit.expand, children: <Widget>[

        new Theme(
          data: new ThemeData(
              brightness: Brightness.dark,
              inputDecorationTheme: new InputDecorationTheme(
                // hintStyle: new TextStyle(color: Colors.blue, fontSize: 20.0),
                labelStyle:
                    new TextStyle(color: Colors.tealAccent, fontSize: 25.0),
              )),
          isMaterialAppTheme: true,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 140.0,
              ),
              new Container(
                padding: const EdgeInsets.all(40.0),
                child: new Form(
                  autovalidate: true,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new TextFormField(controller: _usernameController,
                        decoration: new InputDecoration(
                            labelText: "Email", fillColor: Colors.black),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      new TextFormField(controller: _passwordController,
                        decoration: new InputDecoration(
                          labelText: "Password",
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.text,
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                      ),
                      new MaterialButton(
                        height: 50.0,
                        minWidth: 150.0,
                        color: Colors.green,
                        splashColor: Colors.teal,
                        textColor: Colors.white,
                        child: new Icon(FontAwesomeIcons.signInAlt),
                        onPressed: () {
                          if(_performLogin()){

                            Navigator.of(context).pushNamed('/game');
                          }
                        },
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
   _performLogin() {
    String username = _usernameController.text;
    String password = _passwordController.text;
    if(username == 'xiangl18@bu.edu' && password == '1234') {
      Fluttertoast.showToast(
          msg: "login attempt: $username",
          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0
      );
      print('login attempt: $username');
      return true;
    }
      else{
      Fluttertoast.showToast(
          msg: "password not match",
          toastLength: Toast.LENGTH_SHORT,
//          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0
      );
      print('password not match');
      return false;
     }

  }
}

