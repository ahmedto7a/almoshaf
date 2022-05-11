import 'package:datadata/database.dart';
import 'package:datadata/screens/sora.dart';
import 'package:flutter/material.dart';

void main()async {
WidgetsFlutterBinding.ensureInitialized(); ///sqlite needs to deals with native code
await QuranDB.initializeDatabase();
//await QuranDB.retrieve("sora", "place=1"); //2 madina
runApp(QuranApp());
}
class QuranApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: Sora(),
    );
  }
}

