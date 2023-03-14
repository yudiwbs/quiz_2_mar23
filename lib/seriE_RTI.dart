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

class Data {
  String kode = "";
  String nama = "";
  String vol = "";
  String turnOver = "";
  String harga = "";
  String naikTurun = "";
  String pctNaikTurun = "";

  Data({
    required this.kode,
    required this.nama,
    required this.vol,
    required this.turnOver,
    required this.harga,
    required this.naikTurun,
    required this.pctNaikTurun,
  });
}

class MyListView extends StatelessWidget {
  String pilihanWaktu = "x";
  List<Data> ldata = [];

  MyListView(String pilihanWaktu) {
    this.pilihanWaktu = pilihanWaktu;

    if (pilihanWaktu == "1D") {
      ldata.add(Data(
          kode: "BBRI",
          nama: "Bank Rakyat Indonesia",
          vol: "125M",
          turnOver: "605B",
          harga: "4820",
          naikTurun: "+10",
          pctNaikTurun: "+0.21%"));

      ldata.add(Data(
          kode: "TLKM",
          nama: "Telkom Indonesia",
          vol: "77M",
          turnOver: "310",
          harga: "4810",
          naikTurun: "+40",
          pctNaikTurun: "+1.01%"));
    } else {
      ldata.add(Data(
          kode: "BBRI",
          nama: "Bank Rakyat Indonesia",
          vol: "125M",
          turnOver: "605B",
          harga: "4820",
          naikTurun: "+80",
          pctNaikTurun: "+2.00%"));

      ldata.add(Data(
          kode: "TLKM",
          nama: "Telkom Indonesia",
          vol: "77M",
          turnOver: "310",
          harga: "4810",
          naikTurun: "+100",
          pctNaikTurun: "+5.00%"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: ldata.length, //jumlah baris
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(border: Border.all()),
              padding: EdgeInsets.all(14),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 20, right: 30),
                        child: Column(children: [
                          Text(ldata[index].kode,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          Text("Volume"),
                          Text("Turn Over")
                        ])),
                    Container(
                        padding: EdgeInsets.only(right: 30),
                        child: Column(children: [
                          Text(ldata[index].nama,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(ldata[index].vol),
                          Text(ldata[index].turnOver),
                        ])),
                    Container(
                        padding: EdgeInsets.only(right: 30),
                        child: Column(children: [
                          Text(ldata[index].harga,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green)),
                          Text(""),
                          Text(""),
                        ])),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.green, border: Border.all()),
                        padding: EdgeInsets.only(right: 0),
                        child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(children: [
                              Text(ldata[index].naikTurun,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              Text(ldata[index].pctNaikTurun,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              Text(""),
                            ]))),
                  ]),
            );
          }),
    );
  }
}

class MyAppState extends State<MyApp> {
  String pilihan = "Active Turn Over";
  String pilihanWaktu = "1D";

  @override
  Widget build(BuildContext context) {
    // for (int i = 0; i < 20; i++) {
    //      data.add("Data ke $i ");
    // }

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
            Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: DropdownButton(
                        isExpanded: true,
                        value: pilihan,
                        onChanged: (String? newValue) {
                          setState(() {
                            if (newValue != null) {
                              pilihan = newValue;
                            }
                          });
                        },
                        items: <String>['Active Turn Over', 'Active Volume']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                      DropdownButton(
                        value: pilihanWaktu,
                        onChanged: (String? newValue) {
                          setState(() {
                            if (newValue != null) {
                              pilihanWaktu = newValue;
                            }
                          });
                        },
                        items: <String>['1D', '1W']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ])),
            Expanded(child: MyListView(pilihanWaktu))
          ]),
        ),
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
