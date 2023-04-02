import 'package:flutter/material.dart';
import 'package:yasam_beklentisi/constants.dart';
import 'package:yasam_beklentisi/hesap.dart';
import 'package:yasam_beklentisi/user_data.dart';

class resultPage extends StatelessWidget {
  final UserData _userData;
  resultPage(this._userData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç Sayfası"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 8,
              child: Center(
                  child: Text(
                Hesap(_userData).hesaplama().round().toString(),
                style: kMetinStili,
              ))),
          Expanded(
              flex: 1,
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "GERİ DÖN",
                  style: kMetinStili,
                ),
              )),
        ],
      ),
    );
  }
}
