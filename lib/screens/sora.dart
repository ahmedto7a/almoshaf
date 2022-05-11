import 'package:datadata/database.dart';
import 'package:flutter/material.dart';

import '../ayat.dart';
import '../ayat_besides.dart';

class Sora extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('السور'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: QuranDB.retrieve('sora', '1=1'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      var soraid = snapshot.data[index]["soraid"];
                      var name = snapshot.data[index]["name"];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AyatBeside(soraid, name)),
                      );
                    },
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListTile(
                        title: Text(
                          snapshot.data[index]['name'],
                          style: TextStyle(
                            fontFamily: 'quran',
                            fontSize: 22,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        subtitle: Text(
                          snapshot.data[index]['place'] == 1 ? 'مكيه' : 'مدنيه',
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'quran',
                            fontSize: 15,
                          ),
                        ),
                        leading: snapshot.data[index]['place'] == 1
                            ? Image.asset('assets/kaba.png')
                            : Image.asset('assets/medina.png'),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(height: 20,color: Colors.blue,),
                itemCount: snapshot.data.length);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
