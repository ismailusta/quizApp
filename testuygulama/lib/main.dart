import 'package:flutter/material.dart';
import 'package:testuygulama/constans.dart';
import 'package:testuygulama/veri.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> cevaplar = [];
  Veri sorular = Veri();
  void allButton(bool secilenDurum) {
    if (sorular.sonSorumu() == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Test Bitmistir"),
            content: new Text("Sorular bitti"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(
                    () {
                      sorular.indexsifirla();
                      cevaplar = [];
                    },
                  );
                },
                child: Text("Basa don"),
              ),
            ],
          );
        },
      );
    } else {
      bool cevap = sorular.getYanitGetir();
      setState(
        () {
          if (cevap == secilenDurum) {
            cevaplar.add(kDogruIkon);
          } else {
            cevaplar.add(kYanlisIkon);
          }
        },
      );
      sorular.updateState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                sorular.getMetinGetir(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 3,
          spacing: 3,
          children: cevaplar,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 255, 109, 99)),
                        overlayColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 255, 0, 0)),
                      ),
                      child: const Icon(
                        Icons.thumb_down,
                        size: 30.0,
                      ),
                      onPressed: () {
                        allButton(false);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        overlayColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 26, 255, 0)),
                      ),
                      child: Icon(Icons.thumb_up, size: 30.0),
                      onPressed: () {
                        allButton(true);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
