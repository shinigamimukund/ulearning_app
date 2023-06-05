// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:ulearning_app/common/service/storage_services.dart';

// class Global {
//   static late StorageService storageService;

//   static Future init() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     await Firebase.initializeApp(
//         //firebase implementation
//         );
//         storageService = await StorageService().init();
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:ulearning_app/common/service/storage_services.dart';

class Global {
  static late StorageService storageService;

  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();

    ///firebase implementation
    await Firebase.initializeApp();

    ///storageService for singleton class to store welcome state
    storageService = await StorageService().init();
  }
}
