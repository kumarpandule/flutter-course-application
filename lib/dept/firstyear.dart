import 'dart:math';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:dpharmacy/firstyear_subjects/0808%20Bio-Chem.%20_%20Clinical%20Pathology.dart';
import 'package:dpharmacy/firstyear_subjects/0809%20Human%20Anatomy%20_%20Physiology.dart';
import 'package:dpharmacy/firstyear_subjects/0810%20Health%20Edu.%20_%20Comm.%20Pharmacy.dart';
import 'package:flutter/material.dart';
import 'package:dpharmacy/firstyear_subjects/0805%20Pharmaceutics%20-%20I.dart';
import 'package:dpharmacy/firstyear_subjects/0806%20Pharmaceutical%20Chemistry%20-%20I.dart';
import 'package:dpharmacy/firstyear_subjects/0807%20Pharmacognosy.dart';
import '../AdService.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Admob.initialize();
  runApp(FirstYear());
}

class FirstYear extends StatelessWidget {
  const FirstYear({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'MSBTE',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/it1st": (context) => PharmaceuticsI(),
        "/it2nd": (context) => PharmaceuticsIChemistry(),
        "/it3rd": (context) => Pharmacognosy(),
        "/it4th": (context) => BioChemAndClinicalPathology(),
        "/it5th": (context) => HumanAnatomyAndPhysiology(),
        "/it6th": (context) => HealthEduAndCommPharmacy(),
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


  ScrollController scrollController;
  var currentColor = Color.fromRGBO(111, 194, 173, 1.0);

  AnimationController animationController;
  ColorTween colorTween;
  CurvedAnimation curvedAnimation;


  @override
  void dispose() {
    interstitialAd.dispose();
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

    interstitialAd.load();

  }

    @override
  Widget build(BuildContext context) {
    void _it1st() async {
      interstitialAd.show();
      Navigator.popAndPushNamed(context, "/it1st");
    }
    void _it2nd() async {
      interstitialAd.show();
      Navigator.popAndPushNamed(context, "/it2nd");
    }
    void _it3rd() async {
      interstitialAd.show();
      Navigator.popAndPushNamed(context, "/it3rd");
    }
    void _it4th() async {
      interstitialAd.show();
      Navigator.popAndPushNamed(context, "/it4th");
    }
    void _it5th() async {
      interstitialAd.show();
      Navigator.popAndPushNamed(context, "/it5th");
    }
    void _it6th() async {
      interstitialAd.show();
      Navigator.popAndPushNamed(context, "/it6th");
    }

    return new Scaffold(
      backgroundColor: Color.fromRGBO(111, 194, 173, 1.0),
      appBar: new AppBar(
        title: new Text("MSBTE", style: TextStyle(fontSize: 16.0),),
        backgroundColor: Color.fromRGBO(111, 194, 173, 1.0),
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
                  onTap:
                  _it1st,

            child: Container(
              width: 500.0,
              height: 60.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("0805 Pharmaceutics - I",textAlign: TextAlign.center,
                style: TextStyle(
                          color: Color.fromRGBO(111, 194, 173, 1.0),
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal,
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

                  onTap: _it2nd,

                  child: Container(
                    width: 500.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("0806 Pharmaceutical Chemistry - I",textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(111, 194, 173, 1.0),
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal,
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
                  onTap: _it3rd,

                  child: Container(
                    width: 500.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("0807 Pharmacognosy",textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(111, 194, 173, 1.0),
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal,
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
                  onTap: _it4th,

                  child: Container(
                    width: 500.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("0808 Bio-Chem. & Clinical Pathology",textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(111, 194, 173, 1.0),
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal,
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
                  onTap: _it5th,

                  child: Container(
                    width: 500.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("0809 Human Anatomy & Physiology",textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(111, 194, 173, 1.0),
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal,
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
                  onTap: _it6th,

                  child: Container(
                    width: 500.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text("0810 Health Edu. & Comm. Pharmacy",textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(111, 194, 173, 1.0),
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal,
                            fontFamily: 'Open Sans',
                            fontSize: 26),
                      ),
                    ),
                  ),
                ),
              ),

                  //
                  // AdmobBanner(adUnitId: getBannerAdUnitId(),
                  //     adSize: AdmobBannerSize.FULL_BANNER),

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

