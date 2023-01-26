import 'dart:async';
import 'dart:developer' as developer;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/routes/app_router.dart';
import 'core/splash/no_internet_splash.dart';
import 'home.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';
import 'login_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    // init();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      developer.log('Couldn\'t check connectivity status', error: e);
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final appRouter = di.sl<AppRouter>();
    return _connectionStatus == ConnectivityResult.wifi
        ?   Navigator(onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/':
                return MaterialPageRoute(builder: (_) => Home());
              case '/login':
                return MaterialPageRoute(builder: (_) => LoginScreen());

              default:
                return null;
              // MaterialPageRoute(
              //     builder: (_) => Scaffold( 
              //           body: Center(
              //             child:
              //                 Text('No route defined for ${settings.name}'),
              //           ),
              //         ));
            }
          })
        // MaterialApp(
        //     debugShowCheckedModeBanner: false,
        //     title: 'iq project',
        //     onGenerateRoute: appRouter.onGenerateRoute,
        //   )
        : const MaterialApp(home: NoInternetSplash());
  }
}
