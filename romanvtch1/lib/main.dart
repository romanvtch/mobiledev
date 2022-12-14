import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Welcome",textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25.0,
                        color: Colors.purple,
                        fontWeight: FontWeight.w700),),
                ],
              ),
            ),
            Container(
              height: 36,
              child: TextField(
                controller: nameController,
                maxLines: 1,
                style: TextStyle(fontSize: 17),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  filled: true,
                  hintStyle: TextStyle(color: Colors.purple),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                  contentPadding: EdgeInsets.zero,
                  hintText: 'Username',
                ),
              ),
            ),


            Container(
              height: 36,
              child: TextField(
                controller: passwordController,
                maxLines: 1,
                obscureText: true,
                style: TextStyle(fontSize: 17),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  filled: true,
                  hintStyle: TextStyle(color: Colors.purple),
                  hintText: "Password (don't tell anyone)",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                  contentPadding: EdgeInsets.zero,

                ),
              ),
            ),


            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(35, 15, 35, 0),
                child: ElevatedButton(
                    child: const Text('Login'),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.purple,
                        onPrimary: Colors.white
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return SecondPage(nameController.text);
                      }));
                    }

                )
            ),
          ],
        ));
  }
}

class SecondPage extends StatelessWidget {
  final String username;
  const SecondPage( this.username,{super.key});
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(backgroundColor: Colors.purple,
        title: const Text('Second page'),
      ),
      body: Center(
          child: Column(
              children: <Widget> [
                Container(
                  child: Text('Welcome - $username ',
                    style: const TextStyle(color: Colors.purple,fontSize: 25),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(20),
                          primary: Colors.purple,
                          onPrimary: Colors.white
                      ),
                      child: const Text('Back',
                        style: TextStyle(fontSize: 16),


                      )),
                ),

              ]
          )

      ),

    );
  }
}