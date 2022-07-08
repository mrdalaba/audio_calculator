import 'package:flutter/material.dart';
import 'package:audiocalculator/calFarm.dart';

import 'backgrounds.dart';








class BgStoreWidget extends StatefulWidget {
  const BgStoreWidget({Key? key}) : super(key: key);



  @override
  _BgStoreWidgetState createState() => _BgStoreWidgetState();
}

class _BgStoreWidgetState extends State<BgStoreWidget> {

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 8),
          child: IconButton(
            icon: Icon(
              Icons.calculate,
              color: Color(0xFF39FC07),
              size: 45,
            ),
            onPressed: () async {
              Navigator.pop(
                  (context)
              );
            },
          ),
        ),
        title: Text(
          'Backgrounds',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Color(0x3B1D2429),
                offset: Offset(0, -3),
              )
            ],
            borderRadius: BorderRadius.circular(0),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Background()
                          ));
                    },
                    child: Text( 'Backgrounds',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Background()
                          ));
                    },
                    child: Text( 'Store',
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(
                           (context)
                          );
                    },
                    child: Text( 'Cancel',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
