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
  String pilihanMobil = "Brio";
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
        body: Container(
            child: Column(children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                //decoration: BoxDecoration(border: Border.all()),
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  const Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      child: Text(
                        "Mobil Saya",
                        style: const TextStyle(fontSize: 20, color: Colors.red),
                      )),
                  Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                    height: 150,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 20),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Detail"),
                      )),
                ]),
              ),
              Expanded(
                  child: Container(
                      //decoration: BoxDecoration(border: Border.all()),
                      padding: EdgeInsets.all(10),
                      child: Column(children: [
                        DropdownButton(
                          isExpanded: true,
                          value: pilihanMobil,
                          onChanged: (String? newValue) {
                            setState(() {
                              if (newValue != null) {
                                pilihanMobil = newValue;
                              }
                            });
                          },
                          items: <String>['Brio', 'Civic']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text('$pilihanMobil',
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                            )),
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text('Nomor Rangka: XXXXXXXX',
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 15,
                                  )),
                            )),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text('Nomor Mesin: XXXXXXXX',
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontSize: 15,
                                  )),
                            )),
                      ]))),
            ],
          )),
          Container(
              decoration: BoxDecoration(border: Border.all()),
              child: Column(children: [
                Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text("Katalog Produk")),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                        height: 100,
                      ),
                      Image.network(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                        height: 100,
                      ),
                      Image.network(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                        height: 100,
                      ),
                    ]),
              ])),
        ])),
      ),
    );
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
