import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_beklentisi/result_page.dart';
import 'package:yasam_beklentisi/user_data.dart';

import 'MyColumn.dart';
import 'MyContainer.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? seciliCinsiyet;
  double icilenSigara = 15;
  double sporGunu = 3;
  int boy = 170;
  int kilo = 90;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'YAŞAM BEKLENTİSİ',
            style: TextStyle(color: Colors.black54),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlineButton("boy"),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      child: buildRowOutlineButton("kilo"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  children: [
                    Text("Haftada Kaç Gün Spor Yapıyorsun?",
                        style: kMetinStili),
                    Text(sporGunu.round().toString(), style: kSayiStili),
                    Slider(
                        value: sporGunu,
                        min: 0,
                        max: 7,
                        divisions: 7,
                        onChanged: (double newValue) {
                          setState(() {
                            sporGunu = newValue;
                          });
                        }),
                  ],
                ),
              ),
            ),
            Expanded(
              child: MyContainer(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Günde kaç Sigara İçiyorsunuz?", style: kMetinStili),
                    Text('${icilenSigara.round()}', style: kSayiStili),
                    Slider(
                      max: 30,
                      min: 0,
                      value: icilenSigara,
                      onChanged: (double newValue) {
                        setState(() {
                          icilenSigara = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainer(
                      onPress: () {
                        setState(() {
                          seciliCinsiyet = "KADIN";
                        });
                      },
                      renk: seciliCinsiyet == 'KADIN'
                          ? Colors.lightBlue[100]
                          : Colors.white,
                      child: MyColumn(
                        icon: FontAwesomeIcons.venus,
                        cinsiyet: "KADIN",
                      ),
                    ),
                  ),
                  Expanded(
                    child: MyContainer(
                      onPress: () {
                        setState(() {
                          seciliCinsiyet = "ERKEK";
                        });
                      },
                      renk: seciliCinsiyet == 'ERKEK'
                          ? Colors.lightBlue[100]
                          : Colors.white,
                      child: MyColumn(
                        icon: FontAwesomeIcons.mars,
                        cinsiyet: "ERKEK",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    fixedSize: Size.fromHeight(50)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => resultPage(UserData(
                              kilo: kilo,
                              boy: boy,
                              seciliCinsiyet: seciliCinsiyet,
                              sporGunu: sporGunu,
                              icilenSigara: icilenSigara))));
                },
                child: Text(
                  "Hesapla",
                  style: kMetinStili,
                )),
          ],
        ));
  }

  Row buildRowOutlineButton(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RotatedBox(
            quarterTurns: 3,
            child: Text(
              "$label",
              style: kMetinStili,
            )),
        //quarterTurns: 3 == quarterTurns: -1 ikiside kullanılır.
        RotatedBox(
          quarterTurns: -1,
          child: Text(label == "kilo" ? kilo.toString() : boy.toString(),
              style: kSayiStili),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize:
                      const Size(30, 40), //  1. Set size: width, height = 0
                  side: BorderSide(
                    color: Colors.lightBlue,
                  ), // 2. Set padding
                ),
                onPressed: () {
                  setState(() {
                    label == "kilo" ? kilo++ : boy++;
                  });

                  print("üstteki buton basıldı");
                },
                child: Icon(
                  FontAwesomeIcons.plus,
                  size: 10,
                )),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize:
                      const Size(30, 40), //  1. Set size: width, height = 0
                  side: BorderSide(
                    color: Colors.lightBlue,
                  ), // 2. Set padding
                ),
                onPressed: () {
                  setState(() {
                    label == "kilo" ? kilo-- : boy--;
                  });
                  print("alttaki buton basıldı");
                },
                child: Icon(
                  FontAwesomeIcons.minus,
                  size: 10,
                )),
          ],
        )
      ],
    );
  }
}
