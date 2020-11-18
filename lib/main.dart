import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UTS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageOne(),
    );
  }
}

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final namaText = TextEditingController();
  final alamatText = TextEditingController();

  int pilihan = -1;
  String hasilPilihan = "hasil";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Page"),
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: "Nama",
                  hintText: "Nama Anda Siapa ???",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.blue),
              style: TextStyle(fontSize: 20.0),
              controller: namaText,
            ),
            Padding(padding: EdgeInsets.all(5)),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.home),
                  labelText: "Alamat",
                  hintText: "Dimana Anda Tinggal ???",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  fillColor: Colors.blue),
              style: TextStyle(fontSize: 20.00),
              controller: alamatText,
            ),
            Padding(padding: EdgeInsets.all(5)),
            Text("Jenis Kelamin", style: TextStyle(fontSize: 18)),
            Row(
              children: <Widget>[
                Radio(
                    value: 11,
                    groupValue: this.pilihan,
                    onChanged: (value) {
                      setState(() {
                        pilihan = value;
                        hasilPilihan = "Pria";
                      });
                    }),
                Text("Pria", style: TextStyle(fontSize: 18)),
              ],
            ),
            Row(
              children: <Widget>[
                Radio(
                    value: 12,
                    groupValue: this.pilihan,
                    onChanged: (value) {
                      setState(() {
                        pilihan = value;
                        hasilPilihan = "Wanita";
                      });
                    }),
                Text("Wanita", style: TextStyle(fontSize: 18)),
              ],
            ),
            RaisedButton(
                shape: StadiumBorder(),
                color: Colors.green,
                child: Text(
                  "Proses",
                  textScaleFactor: 1.5,
                ),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageTwo(
                              namaText.text, alamatText.text, hasilPilihan)));
                })
          ],
        ),
      ),
    );
  }
}

class PageTwo extends StatefulWidget {
  @override
  final String nama, alamat, hasilpilihan;
  PageTwo(this.nama, this.alamat, this.hasilpilihan);
  _PageTwoState createState() =>
      _PageTwoState(this.nama, this.alamat, this.hasilpilihan);
}

class _PageTwoState extends State<PageTwo> {
  final String nama, alamat, hasilpilihan;
  _PageTwoState(this.nama, this.alamat, this.hasilpilihan);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Two"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Nama    : " + this.nama.toString(),
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Alamat   : " + this.alamat.toString(),
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Kelamin : " + this.hasilpilihan.toString(),
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            RaisedButton(
                shape: StadiumBorder(),
                color: Colors.red,
                child: Text(
                  "Back",
                  textScaleFactor: 1.5,
                ),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                }),
            Padding(padding: EdgeInsets.all(1.5)),
            Text("Program ini dibuat dengan Flutter"),
            Text("oleh"),
            Text("Nur Ali Sholikhin (NPM: 18053036 )"),
            Text("Tugas Ujian Tengah Semester 5"),
            Text("Mobile Multimedia Solution 2020")
          ],
        ),
      ),
    );
  }
}
