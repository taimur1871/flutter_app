import '../flutter_flow/flutter_flow_drop_down_template.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BladePicsWidget extends StatefulWidget {
  BladePicsWidget({
    Key key,
    this.numBlades,
  }) : super(key: key);

  final int numBlades;

  @override
  _BladePicsWidgetState createState() => _BladePicsWidgetState();
}

class _BladePicsWidgetState extends State<BladePicsWidget> {
  String dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Text(
          'Blade Pictures',
          style: FlutterFlowTheme.title1.override(
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, -0.9),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlutterFlowDropDown(
                  options: ['3', '4', '5', '6', '7', '8', '9'],
                  onChanged: (value) {
                    setState(() => dropDownValue = value);
                  },
                  width: 130,
                  height: 40,
                  textStyle: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  fillColor: Color(0xFF908991),
                  elevation: 2,
                  borderColor: Colors.transparent,
                  borderWidth: 0,
                  borderRadius: 0,
                  margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
