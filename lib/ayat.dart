import 'package:flutter/material.dart';
import 'package:datadata/database.dart';
class Ayat extends StatelessWidget {
int id;
String name;
Ayat(this.id,this.name);
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
          if(snapshot.hasData){
            return ListView.separated
              (itemBuilder: (context, index) {
              return InkWell(
                onTap: (){},
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ListTile(
                    title : Text(
                      snapshot.data[index]['text'],
                      style: TextStyle(
                        fontFamily: 'quran',
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.right,
                    ),

                  ),
                ),
              );
            },
                separatorBuilder: (context, index) => Divider(),
                itemCount: snapshot.data.length);
          }else{
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
