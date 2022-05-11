import 'package:flutter/material.dart';
import 'package:datadata/database.dart';

class AyatBeside extends StatelessWidget {
  int id;
  String name;

  AyatBeside(this.id, this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الايات'),
        centerTitle: true,
      ),
      body: FutureBuilder(

        future: QuranDB.retrieve('aya', 'soraid=$id'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "",
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: "quran",
                      color: Colors.black,
                    ),
                    children: ayat(snapshot.data),
                  ),
                ),
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  ayat(data) {
    List<InlineSpan> widget = [];
    for (Map aya in data) {
      widget.add(TextSpan(text: aya["text"]));
      widget.add(WidgetSpan (
        alignment:PlaceholderAlignment.middle,
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage("assets/ayahh.png"),
          backgroundColor: Colors.white,
          child: Text(
            aya["ayaid"].toString(),

            style: TextStyle(fontFamily: "quran", color: Colors.black),
          ),
        ),
      ));
    }
    return widget;
  }
}
