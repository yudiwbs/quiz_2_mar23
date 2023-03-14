import 'package:flutter/material.dart';
import 'dart:developer';

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
  int pilihan = 0;

  @override
  Widget build(BuildContext context) {
    log("mulai");

    List<DropdownMenuItem<int>> lPilihan = [];

    var itm1 = const DropdownMenuItem<int>(
      value: 0,
      child: Text("6 bulan"),
    );
    var itm2 = const DropdownMenuItem<int>(
      value: 1,
      child: Text("1 tahun"),
    );

    lPilihan.add(itm1);
    lPilihan.add(itm2);

    return MaterialApp(
      title: 'Hello App',
      home: Scaffold(
        appBar: AppBar(
            leading: FlutterLogo(),
            backgroundColor: Colors.blueGrey,
            title: Text('Quiz Flutter'),
            actions: <Widget>[ButtonNamaKelompok(), ButtonPerjanjian()]),
        body: Center(
          child: Column(children: [
            DropdownButton(
              value: pilihan,
              items: lPilihan,
              onChanged: (int? newValue) {
                setState(() {
                  if (newValue != null) {
                    pilihan = newValue;
                  }
                });
              },
            ),
            Expanded(child: MyListView(pilihan))
          ]),
        ),
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  int pilihan = 0;
  List<Data> arrData = [];

  MyListView(int pilihan) {
    this.pilihan = pilihan;
    if (pilihan == 0) {
      arrData.add(Data("Securinvest Sharia Sukuk Fund", "4.1",
          "Pendapatan Tetap", "6.2%", "Rp.1.080", "Rp.3.3T"));

      arrData.add(Data("Start Stable Income Fund", "3.2", "Pendapatan Tetap",
          "12%", "Rp.1.070", "Rp.256M"));
    } else {
      arrData.add(Data("Securinvest Sharia Sukuk Fund", "4.1",
          "Pendapatan Tetap", "16.2%", "Rp.1.080", "Rp.3.3T"));

      arrData.add(Data("Start Stable Income Fund", "3.2", "Pendapatan Tetap",
          "22%", "Rp.1.070", "Rp.256M"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return (ListView.builder(
        itemCount: arrData.length, //jumlah baris
        itemBuilder: (context, index) {
          return Container(
              decoration: BoxDecoration(border: Border.all()),
              padding: EdgeInsets.all(14),
              child: Column(children: [
                Row(children: [
                  Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                    height: 30,
                  ),
                  Expanded(
                      child: Column(children: [
                    Text(arrData[index].nama),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Icon(
                        Icons.star,
                        size: 15,
                      ),
                      Text(
                          " ${arrData[index].skor}  - ${arrData[index].jenis}"),
                    ]),
                  ])),
                  Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                    height: 20,
                  ),
                ]),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Column(
                        children: [
                          Text("Imbal Hasil"),
                          Text("${arrData[index].imbalHasil}")
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Column(
                        children: [
                          Text("Harga Unit"),
                          Text("${arrData[index].hargaUnit}")
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Column(
                        children: [
                          Text("Dana Kelolaan"),
                          Text("${arrData[index].danaKelolaan}")
                        ],
                      )),
                ]),
              ]));
        }));
  }
}

class Data {
  String nama = "";
  String skor = "";
  String jenis = "";
  String imbalHasil = "";
  String hargaUnit = "";
  String danaKelolaan = "";
  Data(String nama, String skor, String jenis, String imbalHasil,
      String hargaUnit, String danaKelolaan) {
    this.nama = nama;
    this.skor = skor;
    this.jenis = jenis;
    this.imbalHasil = imbalHasil;
    this.hargaUnit = hargaUnit;
    this.danaKelolaan = danaKelolaan;
  }
}

// ============================

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
