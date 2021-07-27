
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:http/http.dart' as http;
import 'homepage.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String userName , password;


  showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Message'),
            content: Text(message),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Ok'),
              ),
            ],
          );
        });
  }

  login(context)async{
    final progress = ProgressHUD.of(context);
    progress.show();
    try{
      var headers = {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Cookie': 'CFID=1075314; CFTOKEN=fd56b20f01fb1a3c-9CD7E287-E785-21CC-DE5B5B6AF59E269E; JSESSIONID=E11F8A190FE627EA1CF790B4306F6730.cfusion'
      };
      Uri uri = Uri.parse('http://82.212.90.190:7777/rest/OmanAPI_DEV/MobileAPI');
     // var response = await http.post(uri, headers: headers ,body: {"ENTITY":"CONFIG","ACTION":"LOGIN","DATA":{"USER":{"SESSION":"2","URLTOKEN":"","USER_ID":"","USER_SOURCE":"EXTERNAL","LANGUAGE":1},"data":{"APPLICATION_NAME":"OMANTCS","LANGUAGE":"1","PASSWORD":"a123456","REMEMBER_ME":"0","USERNAME":"Awam_transport","USER_DEVICE_INFO":{"APPLICATION_VERSION":"2.0.0","DEVICE_ID":"649F60AC-C952-4DFF-B518-1E75DFBDF6B5","DEVICE_IN_INCH":"test","DEVICE_MAC_ADDRESS":"GetMac.macAddress","DEVICE_MANUFACTURE":"APPLE","DEVICE_MODEL":"iPhone","DEVICE_OS":"Darwin","DEVICE_OS_VERSION":"12.5.4","FCM_TOKEN":"7a667cfd-ae2c-4c7c-9aca-636eb6b0b934"}}}});
     // print('data from API = ' + response.toString());
      if (userName == 'Awam_transport' && password == 'a123456') {
        Navigator.pushNamed(context, HomePage.id);
      }else{
        showErrorDialog('Wrong userName or Password');
      }
      progress.dismiss();
    }catch(e){

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProgressHUD(
        child: Builder(
          builder: (context)=> Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                  Container(
                    height: 200.0,
                    child: Center(
                      child: Text('Nafith' ,
                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 60.0,
                          ),),
                    ),
                ),
                SizedBox(
                  height: 48.0,
                ),
                TextField(
                  onChanged: (value){
                    userName = value;
                  },
                  style:  TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 20.0),
                    hintText: 'Enter your UserName',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0),),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0),),
                      borderSide: BorderSide(
                        width: 1.0,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0),),
                      borderSide: BorderSide(
                        color: Colors.lightBlueAccent,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  style:  TextStyle(
                    color: Colors.black,
                  ),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your password.',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () {
                        login(context);
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'Log In',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
