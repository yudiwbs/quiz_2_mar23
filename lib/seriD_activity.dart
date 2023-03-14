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

class MyList extends StatelessWidget {
  List<String> data = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 5; i++) {
      data.add("Notifikasi ke-$i ");
    }

    return ListView.builder(
        itemCount: data.length, //jumlah baris
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(border: Border.all()),
            padding: EdgeInsets.all(14),
            child: Container(
                child: Column(children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text("Campus Alert",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.red))),
              Text(data[index])
            ])),
          );
        });
  }
}

class MyAppState extends State<MyApp> {
  int idx = 2; //index yang aktif

  //isi body akan sesuai index
  static List<Center> halaman = [
    Center(child: Text("satu")),
    Center(child: Text("dua")),
    Center(
        child: Column(children: [
      Stack(children: [
        Image.network(
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
          height: 100,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        const Center(
            child: Text("Activity",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))),
      ]),
      Container(
          child: Column(children: const [
        Icon(
          Icons.task_alt,
          size: 70,
        ),
        Text("No New Notifications",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
                "You're caught up! Checkback for notifications, campus alert and more",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                ))),
      ])),
      Expanded(child: MyList()),
    ])),
    Center(child: Text("tiga")),
  ];

  //event saat button di-tap
  void onItemTap(int index) {
    setState(() {
      idx = index;
    });
  }

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
        body: halaman[idx],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: idx,
            selectedFontSize: 12.0,
            unselectedFontSize: 1.0,
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.red,
            onTap: onItemTap, //event saat button di tap
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Today'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore), label: " Discover"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), label: "Activity"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Me"),
            ]),
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
