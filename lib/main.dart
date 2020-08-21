import 'package:flutter/material.dart';
import 'package:learntech/home/home_screen.dart';
import 'package:learntech/stores/questcategory_store.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Deu ruim');
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return Provider<QuestCategoryStore>(
              create: (_) {
                final store = QuestCategoryStore();
                store.init();
                return store;
              },
              dispose: (_, store) => store.dispose(),
              child: MaterialApp(
                  initialRoute: "/",
                  routes: {
                    "/": (context) => const HomeScreen(),
                  }
              )
          );
        }

        return CircularProgressIndicator();
      }
    );
  }
}

