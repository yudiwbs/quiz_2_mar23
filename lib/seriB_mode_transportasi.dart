import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello App',
      home: Scaffold(
        appBar: AppBar(
            leading: FlutterLogo(),
            backgroundColor: Colors.blueGrey,
            title: Text('Quiz Flutter'),
            actions: <Widget>[ButtonNamaKelompok(), ButtonPerjanjian()]),
        body: Center(
          child: Column(children: [tgl(), info(), Expanded(child: listInfo())]),
        ),
      ),
    );
  }
}

//pemilihan tangggal
class tgl extends StatefulWidget {
  @override
  tglState createState() {
    return tglState();
  }
}

class tglState extends State<tgl> {
  String pilihTgl = "1 Januari 2023";

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> lTgl = [];

    var itm1 = const DropdownMenuItem<String>(
      value: "1 Januari 2023",
      child: Text("1 Januari 2023"),
    );
    var itm2 = const DropdownMenuItem<String>(
      value: "2 Januari 2023",
      child: Text("2 Januari 2023"),
    );

    lTgl.add(itm1);
    lTgl.add(itm2);
    return Container(
        decoration: BoxDecoration(border: Border.all()),
        child: Column(children: [
          Row(children: [
            Icon(Icons.keyboard_arrow_left),
            Expanded(
                child: Padding(
                    padding: EdgeInsets.only(left: 100, right: 100),
                    child: 
                    
                    DropdownButton(
                      isExpanded: true,
                      value: pilihTgl,
                      items: lTgl,
                      onChanged: (String? newValue) {
                        setState(() {
                          if (newValue != null) {
                            pilihTgl = newValue;
                          }
                        });
                      },
                    )
                    
                    
                    )),
            Icon((Icons.keyboard_arrow_right))
          ]),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Text("$pilihTgl",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red)),
          )
        ]));
  }
}

class info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Row(children: [
            Icon(
              Icons.car_repair,
              size: 30,
            ),
            Column(children: [Text("10 km"), Text("20 jam, 30 menit")]),
          ]),
          Row(children: [
            Icon(
              Icons.directions_walk_outlined,
              size: 30,
            ),
            Column(children: [Text("20 km"), Text("40 jam, 20 menit")]),
          ]),
          Row(children: [
            Icon(
              Icons.electric_bike,
              size: 30,
            ),
            Column(children: [Text("2 km"), Text("2 jam")]),
          ])
        ]));
  }
}

class listInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // List<String> data = [];
    // data = [];
    // for (int i = 0; i < 2; i++) {
    //   data.add("Data ke $i ");
    // }

    return Center(
        child: ListView(children: [
      Card(
          child: ListTile(
              onTap: () {},
              leading: Image.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
              trailing: const Icon(Icons.more_vert),
              title: const Text('Walking'),
              subtitle: const Text("3 km"),
              tileColor: Colors.white70)),
      Card(
          child: ListTile(
              onTap: () {},
              leading: Image.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
              trailing: const Icon(Icons.more_vert),
              title: const Text('Driving'),
              subtitle: const Text("10 km"),
              tileColor: Colors.white70))
    ]));
  }
}

class ButtonNamaKelompok extends StatelessWidget {
  const ButtonNamaKelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.account_circle_rounded),
      onPressed: () {
        // icon account di tap
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Nama Kelompok'),
            content: const Text('Nama (email) ; Nama (email)'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ButtonPerjanjian extends StatelessWidget {
  const ButtonPerjanjian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.access_alarm_rounded),
      onPressed: () {
        // icon setting ditap
        const snackBar = SnackBar(
          duration: Duration(seconds: 20),
          content: Text('Kami berjanji  ...'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
