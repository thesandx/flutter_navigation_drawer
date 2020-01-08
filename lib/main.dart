import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:insurance_app/new_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "/a": (BuildContext context) => NewPage("Sandeep")
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Insurance App"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Sandeep Kumar jha"),
              accountEmail: Text("kumarjha.sandeep@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.lightBlueAccent,
                child: new Text("S"),
              ),
            ),
            ListTile(
                title: Text("page one"),
                trailing: Icon(Icons.add_alert),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new NewPage("from page one")));
                  //Navigator.of(context).pushNamed("/a");
                }),
            ListTile(
                title: Text("page two"),
                trailing: Icon(Icons.add),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          new NewPage("from page two")));
                  //Navigator.of(context).pushNamed("/a");
                }),
            Divider(), //its add a line
            ListTile(
              title: Text("Logout"),
              trailing: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
      body: new Container(
        child: new Center(
          child: Text("Hello World"),
        ),
      ),
    );
  }
}
