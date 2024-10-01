import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news_app/ui/home.dart';
import 'package:news_app/ui/news_details.dart';
import 'package:news_app/ui/settings_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'bloc/observer.dart';
bool isConnect = false;
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  final connectionChecker = InternetConnectionChecker();

  connectionChecker.onStatusChange.listen(
        (InternetConnectionStatus status) {
      if (status == InternetConnectionStatus.connected) {
        isConnect = true ;
        print('Connected to the internet');
      } else {
        isConnect = false;
        print('Disconnected from the internet');
      }
    },
  );
await  requestPermission();
  runApp(const MyApp());
}
Future<bool>requestPermission()async{
  var status = await Permission.storage.request();
  return status.isGranted;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SettingsScreen.routeName:(context) => SettingsScreen(),
        HomeScreen.routeName :(context) => HomeScreen(),
      NewsDetails.routeName :(context) => NewsDetails(),

      },
      initialRoute:HomeScreen.routeName ,

  );
  }
}