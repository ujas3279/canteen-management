import 'package:canteen_management/home_screen.dart';
import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  String user_name=" ";
  String password=" ";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   

    final emailField = TextFormField(
      
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "User Name",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      onChanged: (val){
          user_name=val;
      },
      validator: (value) {
          if (value.isEmpty) {
               return 'Please Enter Username';
               }
        return null;
  },
     
    );

    final passwordField = TextFormField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      onChanged: (val){
        password=val;
      },
      validator: (value) {
       if (value.isEmpty) {
        return 'Please enter Password';
      }
      return null;
     },
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: Check_Login,
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
      child: Center(
        child: Container(
          color: Colors.white,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(36.0),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: <Widget>[
                
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "assets/images/logo.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45.0),
                emailField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                loginButon,
                SizedBox(
                  height: 15.0,
                ),
               
              ],
            ),
          ),
        ),
              ),
            ),
            
      ),
        
    );
  }
  void Check_Login(){
    if (_formKey.currentState.validate()){
          if(user_name=="admin"){
                 if(password=='admin'){
                       Navigator.push(context,  MaterialPageRoute(builder: (context)=>new HomeScreen()));        
                 }
                 else
                   print('incorrect password');
          }
          else
            print('incorrect username or password');
  } 
  }
}
