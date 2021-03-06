import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:nafa_money/Model/payment_model.dart';
import 'package:nafa_money/Screens/Dashboard/scanQr.dart';
import 'package:nafa_money/Screens/achatCredit/homeAchatCredit.dart';
import 'package:nafa_money/Screens/api/language.dart';
import 'package:nafa_money/Screens/payment/payment_home.dart';
import 'package:nafa_money/Screens/send/sendMany.dart';
import 'package:nafa_money/localization/demo_localization.dart';
import 'package:nafa_money/localization/language_constants.dart';
import 'package:nafa_money/main.dart';
import 'package:nafa_money/widgets/payment_card.dart';
import 'package:sizer/sizer.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class HomeDashBord extends StatefulWidget {
  const HomeDashBord({Key? key}) : super(key: key);

  @override
  _HomeDashBordState createState() => _HomeDashBordState();
}

class _HomeDashBordState extends State<HomeDashBord> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String dropdownValue = 'FR';

  List<PaymentModel> getPaymentsCard() {
  List<PaymentModel> paymentCards = [
    PaymentModel(Icons.chevron_right , Colors.greenAccent, getTranslated(context, "from_text").toString() + " Ahmed Diouf",
        "07-23", "20.04", 251.00, -1),
    PaymentModel(Icons.chevron_left , Color(0xFFff415f),getTranslated(context, "to_text").toString() + " Moustapha Sow",
        "07-23", "14.01", 64.00, -1),
    PaymentModel(Icons.my_library_books , Colors.blueGrey, getTranslated(context, "facture_text").toString() + " SENELEC",
        "07-23", "10.04", 1151.00, -1),
     PaymentModel(Icons.location_city, Color(0xFF50f3e2), getTranslated(context, "from_text").toString() + " Amadou Diop",
        "07-23", "10.04", 1151.00, -1),
    PaymentModel(Icons.mobile_friendly, Color(0xFF50f3e2), getTranslated(context, "buy_credit_for_text").toString()+" "+getTranslated(context, "to_text").toString().toLowerCase() + " Adama Séne",
        "07-23", "10.04", 1151.00, -1),    

  PaymentModel(Icons.location_city, Color(0xFF50f3e2), getTranslated(context, "to_text").toString() + " Pape Matar",
        "07-23", "10.04", 1151.00, -1),
  PaymentModel(Icons.my_library_books, Colors.blueGrey, getTranslated(context, "facture_text").toString() + " SENELEC",
        "07-23", "10.04", 1151.00, -1),    
  PaymentModel(Icons.mobile_friendly, Color(0xFF50f3e2), getTranslated(context, "buy_credit_for_text").toString()+" "+getTranslated(context, "to_text").toString().toLowerCase()+ " Ibrahima Dramé",
        "07-23", "10.04", 1151.00, -1),    
    
  ];

  return paymentCards;
}


//  @override
//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller!.pauseCamera();
//     }
//     controller!.resumeCamera();
//   }

  bool hideSum = false;

  void _changeLanguage(Language language) {
    Locale _temps;

    switch (language.languageCode) {
      case 'en':
        _temps = Locale(language.languageCode, 'US');
        break;
      case 'fr':
        _temps = Locale(language.languageCode, 'FR');
        break;
      default:
        _temps = Locale(language.languageCode, 'FR');
    }

    MyApp.setLocale(context, _temps);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
            toolbarHeight: 10.h,
            backgroundColor: Colors.blue,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.settings,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
                Container(
                  margin: EdgeInsets.only(left: 0.0.h, top: 0.5.h),
                  child: Row(
                    children: [
                      !hideSum
                          ? Text(
                              "30.000F",
                              style: TextStyle(
                                  fontSize: 23.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          : Container(
                              child: Row(
                              children: [
                                Container(
                                  height: 2.h,
                                  width: 2.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white,
                                          // offset: Offset(0, 0),
                                          // spreadRadius: 1.5,
                                          blurRadius: 2,
                                        )
                                      ]),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Container(
                                  height: 2.h,
                                  width: 2.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white,
                                          // offset: Offset(0, 0),
                                          // spreadRadius: 1.5,
                                          blurRadius: 2,
                                        )
                                      ]),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Container(
                                  height: 2.h,
                                  width: 2.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white,
                                          // offset: Offset(0, 0),
                                          // spreadRadius: 1.5,
                                          blurRadius: 2,
                                        )
                                      ]),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Container(
                                  height: 2.h,
                                  width: 2.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white,
                                          // offset: Offset(0, 0),
                                          // spreadRadius: 1.5,
                                          blurRadius: 2,
                                        )
                                      ]),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Container(
                                  height: 2.h,
                                  width: 2.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white,
                                          // offset: Offset(0, 0),
                                          // spreadRadius: 1.5,
                                          blurRadius: 2,
                                        )
                                      ]),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Container(
                                  height: 2.h,
                                  width: 2.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white,
                                          // offset: Offset(0, 0),
                                          // spreadRadius: 1.5,
                                          blurRadius: 2,
                                        )
                                      ]),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Container(
                                  height: 2.h,
                                  width: 2.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white,
                                          // offset: Offset(0, 0),
                                          // spreadRadius: 1.5,
                                          blurRadius: 2,
                                        )
                                      ]),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Container(
                                  height: 2.h,
                                  width: 2.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white,
                                          // offset: Offset(0, 0),
                                          // spreadRadius: 1.5,
                                          blurRadius: 2,
                                        )
                                      ]),
                                )
                              ],
                            )),
                      SizedBox(
                        width: 1.h,
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              hideSum = !hideSum;
                            });
                          },
                          child: Icon(!hideSum
                              ? Icons.remove_red_eye_sharp
                              : Icons.remove_red_eye_outlined)),
                      SizedBox(
                        width: 2.h,
                      ),
                      DropdownButton(
                          onChanged: (Language? language) {
                            setState(() {
                              _changeLanguage(language!);
                            });
                          },
                          underline: SizedBox(),
                          icon: Icon(
                            Icons.language,
                            color: Colors.white,
                          ),
                          items: Language.languageList()
                              .map<DropdownMenuItem<Language>>(
                                  (lang) => DropdownMenuItem(
                                        value: lang,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(lang.name),
                                            Text(lang.flag),
                                          ],
                                        ),
                                      ))
                              .toList())
                    ],
                  ),
                )
              ],
            ),
            expandedHeight: 40.h,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: Stack(
                  children: <Widget>[
                    Container(
                      child: Hero(
                          tag: Text("t"),
                          child: InkWell(
                            child: Container(
                                margin: EdgeInsets.only(top: 15.h),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => QRViewScan(),
                                        ));
                                    // _buildQrView(context)
                                  },
                                  child: Center(
                                    child: Image.asset(
                                      "assets/images/QR_code.png",
                                      width: 170.w,
                                      height: 23.h,
                                    ),
                                  ),
                                )),
                          )),
                    ),
                  ],
                ),
              ),
            )),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            width: 40.w,
            height: 11.h,
            margin: EdgeInsets.only(left: 20, right: 20, top: 1.h),
            padding: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    // spreadRadius: 5
                  )
                ]),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => SendMany()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 2.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.blue[900],
                          size: 5.h,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          getTranslated(context, "transfert_text").toString(),
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w900),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                VerticalDivider(
                  color: Colors.black.withOpacity(0.5),
                  width: 3.w,
                ),
                SizedBox(
                  width: 3.w,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => PaymentHome()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 1.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.orange[500],
                          size: 5.h,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          getTranslated(context, "payment_text").toString(),
                          style: TextStyle(
                              color: Colors.orange[500],
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w900),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 6.w,
                ),
                VerticalDivider(
                  color: Colors.black.withOpacity(0.5),
                  width: 3.w,
                ),
                SizedBox(
                  width: 3.w,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => HomeAchatCredit()));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 3.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phone_android,
                          color: Colors.blue[200],
                          size: 5.h,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Text(
                          getTranslated(context, "credit_text").toString(),
                          style: TextStyle(
                              color: Colors.blue[200],
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w900),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 3.h,
          ),

         //transfert(),
          transaction(),

        ])
            // itemExtent: MediaQuery.of(context).size.height
            ),
      ],
    ));
  }

Widget transaction(){

  return   Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    NotificationListener<OverscrollIndicatorNotification>(
                    
                      child: ListView.separated(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 85.0),
                            child: Divider(),
                          );
                        },
                        padding: EdgeInsets.zero,
                        itemCount: getPaymentsCard().length,
                        itemBuilder: (BuildContext context, int index) {
                          return PaymentCardWidget(
                            payment: getPaymentsCard()[index],
                          );
                        },
                      ),
                    ),
                  ],
                );
              
            
}

  Container transfert() => Container(
        width: 100.w,
        height: 70.h,
        margin: EdgeInsets.only(left: 15, right: 20, top: 1.h),
        padding: EdgeInsets.only(left: 1),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 5,
                // spreadRadius: 5
              )
            ]),
        child: Column(
          children: [
            ListTile(
              title: Text(
                getTranslated(context, "from_text").toString() + " Ahmed",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "+221 77 123 45 67",
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "sep. 11, 20:53",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              trailing: Text(
                "10.000F",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              title: Text(
                getTranslated(context, "to_text").toString() + " Moustapha Sow",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "+221 77 123 45 67",
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "sep. 11, 20:53",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              trailing: Text(
                "12.500F",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              title: Text(
                getTranslated(context, "to_text").toString() + " Fatou Ndiaye",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "+221 77 123 45 67",
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "sep. 11, 20:53",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              trailing: Text(
                "8.500F",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              title: Text(
                getTranslated(context, "from_text").toString() + " Amadou Diop",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "+221 77 123 45 67",
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "sep. 11, 20:53",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              trailing: Text(
                "13.000F",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              title: Text(
                getTranslated(context, "to_text").toString() + " Adama Séne",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "+221 77 123 45 67",
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "sep. 11, 20:53",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              trailing: Text(
                "25.000F",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              title: Text(
                getTranslated(context, "to_text").toString() + " Pape Matar",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "+221 77 123 45 67",
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "sep. 11, 20:53",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              trailing: Text(
                "500.000F",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              title: Text(
                getTranslated(context, "to_text").toString() + " Malick Fall",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "+221 77 123 45 67",
                    style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "sep. 11, 20:53",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
              trailing: Text(
                "50.000F",
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            
            ListTile(
              dense: true,
              trailing: Text(
            "50.000F",
             style: TextStyle(
              inherit: true, fontWeight: FontWeight.w700, fontSize: 16.0),
             ),
              leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Material(
            elevation: 10,
            shape: CircleBorder(),
            shadowColor: Colors.green.withOpacity(0.4),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ),
           title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
             "Modou",
              style: TextStyle(
                  inherit: true, fontWeight: FontWeight.w700, fontSize: 16.0),
            ),
          ],
        ),
            )
          ],
        ),
      );

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      controller.dispose();
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
