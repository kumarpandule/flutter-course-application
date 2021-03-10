import 'dart:async';
import 'dart:io';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:dpharmacy/CardItemModel.dart';
import 'package:dpharmacy/dept/firstyear.dart';
import 'package:dpharmacy/dept/secondyear.dart';
import 'package:dpharmacy/online.dart';
import 'package:url_launcher/url_launcher.dart';

import 'AdService.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'MSBTE',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: new MyHomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/zeroCategory': (context) => FirstYear(),
        '/firstCategory': (context) => SecondYear(),
        "/online1": (context) => Online(),
      },

    );

  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  GlobalKey<ScaffoldState> scaffoldState = GlobalKey();
  AdmobBannerSize bannerSize;
  AdmobInterstitial interstitialAd;
  AdmobReward rewardAd;


  final category = [
    'zeroCategory',
    'firstCategory',
  ];

  var appColors = [Color.fromRGBO(111, 194, 173, 1.0),Color.fromRGBO(99, 138, 223, 1.0)];
  var cardIndex = 0;
  ScrollController scrollController;
  var currentColor = Color.fromRGBO(111, 194, 173, 1.0);

  var cardsList = [CardItemModel("First Year D.Pharmacy", Icons.star, 33, 0.70),CardItemModel("Second Year D.Pharmacy", Icons.star, 36, 0.80)];

  AnimationController animationController;
  ColorTween colorTween;
  CurvedAnimation curvedAnimation;



  @override
  Future<void> initState() {

    Admob.requestTrackingAuthorization();
    bannerSize = AdmobBannerSize.BANNER;
    interstitialAd = AdmobInterstitial(
      adUnitId: getInterstitialAdUnitId(),
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) interstitialAd.load();
      },
    );


    interstitialAd.load();
    super.initState();
    scrollController = new ScrollController();
    Timer.run(() {
      try {
        InternetAddress.lookup('google.com').then((result) {
          if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          } else {
            _showDialog(); // show dialog
          }
        }).catchError((error) {
          _showDialog(); // show dialog
        });
      } on SocketException catch (_) {
        _showDialog();
        print('not connected'); // show dialog
      }
    });

  }




  void _showDialog() {
    // dialog implementation
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Internet needed!"),
        content: Text("Please Check Your Internet Connection"),
      ),
    );
  }

  _launchURL() async {
    interstitialAd.show();
    const url = 'https://msbte.org.in/portal/question-paper-search/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  _launchURL2() async {
    interstitialAd.show();
    const url = 'https://msbte.org.in/portal/draft-copy-of-curriculum/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    void _online1() {
      Navigator.popAndPushNamed(context, "/online1");
    }

    return new Scaffold(
      backgroundColor: currentColor,
      appBar: new AppBar(
        title: new Text("MSBTE", style: TextStyle(fontSize: 16.0),),
        backgroundColor: currentColor,
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: FlatButton(
              child: Icon(Icons.search),
              onPressed: () async {
                interstitialAd.show();
              },
            ),
            // child: Icon(Icons.search),


          ),
        ],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
     child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: ImageIcon(
                        AssetImage("assets/logo.png"),
                        size: 180,
                      ),
                    ),


                  ],
                ),
              ),
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0,0.0,0.0,0.0),
                    child: Text("Maharashtra State Board Of"+"\n"+"     Technical Education.", style: TextStyle(fontSize: 23.0, color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 14.0),
                  child: Text("Select Your Department.", style: TextStyle(color: Colors.white),),
                ),
                Container(
                  height: 180.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () async {
                        Navigator.pushNamed(context, '/zeroCategory');
                      },
                      child: Card(
                        child: Container(
                          width: 500.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Icon( Icons.add, color: Color.fromRGBO(111, 194, 173, 1.0),),
                                    Icon(Icons.more_vert, color: Colors.grey,),
                                  ],

                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                      child: Text("Total 33 Model Papers",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                      child: Text("First Year D.Pharmacy", style: TextStyle(fontSize: 28.0),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: LinearProgressIndicator(value: 0.70),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                      ),
                    ),
                  ),

                ),
                Container(
                  height: 180.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/firstCategory');
                      },
                      child: Card(
                        child: Container(
                          width: 500.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Icon( Icons.add_circle, color: Colors.blue,),
                                    Icon(Icons.more_vert, color: Colors.grey,),
                                  ],

                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                      child: Text("Total 46 Model Papers",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                      child: Text("Second Year D.Pharmacy", style: TextStyle(fontSize: 28.0),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: LinearProgressIndicator(value: 0.80),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                      ),
                    ),
                  ),

                ),
              ],
            ),


              Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 14.0),
                  child: Text("Question Paper Search.",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  //padding: const EdgeInsets.all(9.0),
                  child: InkWell(
                    onTap: _launchURL,

                    child: Container(
                      width: 500.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("Search Question Papers.",textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(000, 000, 000, 1.0),
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Open Sans',
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),


                Padding(
                  padding: EdgeInsets.all(16.0),
                  //padding: const EdgeInsets.all(9.0),
                  child: InkWell(
                    onTap: _launchURL2,

                    child: Container(
                      width: 500.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("View Syllabus.",textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(000, 000, 000, 1.0),
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Open Sans',
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 14.0),
                  child: Text("News.", style: TextStyle(color: Colors.white),),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  //padding: const EdgeInsets.all(9.0),
                  child: InkWell(
                    onTap: () {},

                    child: Container(
                      width: 500.0,
                      height: 140.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("It's a very worrying time for all. I hope you are all in good health, and the Coronavirus pandemic will soon be over.",textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(000, 000, 000, 1.0),
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.normal,
                              fontFamily: 'Open Sans',
                              fontSize: 23),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )

          ],
        ),
      ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/logo.png',
                    width: 80,
                    height: 80,),
                  SizedBox(height: 15,),
                  Text("Hello Student!",
                    style: TextStyle(color: Colors.grey),)
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (ctxt) => new AlertDialog(
                      title: Text("New update coming soon for settings."),
                    )
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (ctxt) => new AlertDialog(
                      title: Text("D.Pharmacy - MSBTE Model Answer Papers by kumar pandule is a decent app for papers.It was a small, But fine selection of model answer papers."+"\n"+"The app has other features and good looking UI,and  More.The app has a few bugs."),
                    )
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_phone),
              title: Text('Contact US'),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (ctxt) => new AlertDialog(
                      title: Text("Contact or get help on:"+"\n"+"kumarpandule20@gmail.com"),
                    )
                );
              },
            ),

          ],
        ),
      ),
    );
  }
    void _popupDialog(BuildContext context) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog();
          }
      );
    }
}
