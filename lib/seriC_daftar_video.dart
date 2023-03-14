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
  @override
  Widget build(BuildContext context) {
    List<String> data = [];
    for (int i = 0; i < 5; i++) {
      data.add("Video $i ");
    }
    return (ListView.builder(
        itemCount: data.length, //jumlah baris
        itemBuilder: (context, index) {
          return Container(
              decoration: BoxDecoration(border: Border.all()),
              padding: EdgeInsets.all(14),
              child: Row(children: [
                Image.network(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                  height: 100,
                ),
                Container(
                    padding: EdgeInsets.only(left: 40),
                    child:
                        Column(children: [Text(data[index]), Text("Delete")])),
              ]));
        }));
  }
}

class MyLearning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(bottom: 20, top: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Following",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  )),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    child: Text(
                      "Downloads",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )),
                  Expanded(
                      child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Following",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  )),
                ])),
        Expanded(child: MyList())
      ],
    );
  }
}

class MyAppState extends State<MyApp> {
  int idx = 2; //index yang aktif

  //isi body akan sesuai index
  static List<Center> halaman = [
    const Center(child: Text("satu")),
    const Center(child: Text("dua")),
    Center(child: MyLearning())
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
            selectedItemColor: Colors.red,
            onTap: onItemTap, //event saat button di tap
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.view_list), label: "Programme"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "My Learning"),
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
