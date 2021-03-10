import 'dart:math';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:dpharmacy/secondyear_subjects/0813%20Pharmacology%20_%20Toxicology.dart';
import 'package:dpharmacy/secondyear_subjects/0815%20Drug%20Store%20_%20Business%20Management.dart';
import 'package:dpharmacy/secondyear_subjects/0816%20Hospital%20_%20Clinical%20Pharmacy.dart';
import 'package:flutter/material.dart';
import 'package:dpharmacy/secondyear_subjects/0811%20Pharmaceutics%20-%20II.dart';
import 'package:dpharmacy/secondyear_subjects/0812%20Pharmaceutical%20Chemistry%20-%20II.dart';
import 'package:dpharmacy/secondyear_subjects/0814%20Pharmaceutical%20Jurisprudence.dart';


import '../AdService.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize();
  runApp(SecondYear());
}

class SecondYear extends StatelessWidget {
  const SecondYear({Key key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'MSBTE',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/computer1st": (context) => PharmaceuticsII(),
        "/computer2nd": (context) => PharmaceuticalChemistryII(),
        "/computer3rd": (context) => PharmacologyAndToxicology(),
        "/computer4th": (context) => PharmaceuticalJurisprudence(),
        "/computer5th": (context) => DrugStoreAndBusinessManagement(),
        "/computer6th": (context) => HospitalAndClinicalPharmacy(),
      },
      home: new MyHomePage(),
      debugShowCheckedModeBanner: false,
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

  @override
  void dispose() {
    interstitialAd.dispose();
    rewardAd.dispose();
    super.dispose();
  }

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

    rewardAd = AdmobReward(
      adUnitId: getRewardBasedVideoAdUnitId(),
      listener: (AdmobAdEvent event, Map<String, dynamic> args) {
        if (event == AdmobAdEvent.closed) rewardAd.load();
      },
    );

    interstitialAd.load();
    rewardAd.load();
  }

  @override
  Widget build(BuildContext context) {
    void _computer1st() async {
      interstitialAd.show();
      Navigator.popAndPushNamed(context, "/computer1st");
    }
    void _computer2nd() async {
      interstitialAd.show();
      Navigator.popAndPushNamed(context, "/computer2nd");
    }
    void _computer3rd() async {
      interstitialAd.show();
      Navigator.popAndPushNamed(context, "/computer3rd");
    }
    void _computer4th() async {
      interstitialAd.show();
      Navigator.popAndPushNamed(context, "/computer4th");
    }
    void _computer5th() async {
      interstitialAd.show();
      Navigator.popAndPushNamed(context, "/computer5th");
    }
    void _computer6th() async {
      interstitialAd.show();
      Navigator.popAndPushNamed(context, "/computer6th");
    }
    return new Scaffold(
      backgroundColor: Color.fromRGBO(99, 138, 223, 1.0),
      appBar: new AppBar(
        title: new Text("MSBTE", style: TextStyle(fontSize: 16.0),),
        backgroundColor: Color.fromRGBO(99, 138, 223, 1.0),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search),
          ),
        ],
        elevation: 0.0,
      ),
      body:SingleChildScrollView(
    child: Center(
    child: new Column(
    children: <Widget>[
            new Padding(
              padding: EdgeInsets.all(16.0),
              //padding: const EdgeInsets.all(9.0),
              child: InkWell(
                onTap: _computer1st,

                child: Container(
                  width: 500.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("0811 Pharmaceutics - II",textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(99, 138, 223, 1.0),
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: 26),
                    ),
                  ),
                ),
              ),
            ),



            new Padding(
              padding: EdgeInsets.all(16.0),
              //padding: const EdgeInsets.all(9.0),
              child: InkWell(
                onTap: _computer2nd,

                child: Container(
                  width: 500.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("0812 Pharmaceutical Chemistry - II",textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(99, 138, 223, 1.0),
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: 26),
                    ),
                  ),

                ),
              ),
            ),





            new Padding(
              padding: EdgeInsets.all(16.0),
              //padding: const EdgeInsets.all(9.0),
              child: InkWell(
                onTap: _computer3rd,

                child: Container(
                  width: 500.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("0813 Pharmacology & Toxicology",textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(99, 138, 223, 1.0),
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: 26),
                    ),
                  ),
                ),
              ),
            ),





            new Padding(
              padding: EdgeInsets.all(16.0),
              //padding: const EdgeInsets.all(9.0),
              child: InkWell(
                onTap: _computer4th,

                child: Container(
                  width: 500.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("0814 Pharmaceutical Jurisprudence",textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(99, 138, 223, 1.0),
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: 26),
                    ),
                  ),
                ),
              ),
            ),




            new Padding(
              padding: EdgeInsets.all(16.0),
              //padding: const EdgeInsets.all(9.0),
              child: InkWell(
                onTap: _computer5th,

                child: Container(
                  width: 500.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("0815 Drug Store & Business Management",textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(99, 138, 223, 1.0),
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: 26),
                    ),
                  ),
                ),
              ),
            ),



            new Padding(
              padding: EdgeInsets.all(16.0),
              //padding: const EdgeInsets.all(9.0),
              child: InkWell(
                onTap: _computer6th,

                child: Container(
                  width: 500.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("0816 Hospital & Clinical Pharmacy",textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(99, 138, 223, 1.0),
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: 26),
                    ),
                  ),
                ),
              ),
            ),


    //           AdmobBanner(adUnitId: getBannerAdUnitId(),
    // adSize: AdmobBannerSize.FULL_BANNER),


      Builder(
        builder: (BuildContext context) {
          final size = MediaQuery.of(context).size;
          final height = max(size.height * .05, 50.0);
          return Container(
            width: size.width,
            height: height,
            child: AdmobBanner(
              adUnitId: getBannerAdUnitId(),
              adSize: AdmobBannerSize.ADAPTIVE_BANNER(
                width: size.width.toInt(),
              ),
              listener: (AdmobAdEvent event, Map<String, dynamic> args) {
              },
            ),
          );
        },
      ),
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
}
