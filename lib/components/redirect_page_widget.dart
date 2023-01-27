import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RedirectPageWidget extends StatefulWidget {
  const RedirectPageWidget({Key? key}) : super(key: key);

  @override
  _RedirectPageWidgetState createState() => _RedirectPageWidgetState();
}

class _RedirectPageWidgetState extends State<RedirectPageWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          FFLocalizations.of(context).getText(
            '172b21uj' /* Have an Account? */,
          ),
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.of(context).title1,
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 24),
          child: Text(
            FFLocalizations.of(context).getText(
              'nzhkn70s' /* Log into your school account b... */,
            ),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyText1,
          ),
        ),
        FFButtonWidget(
          onPressed: () async {
            if (Navigator.of(context).canPop()) {
              context.pop();
            }
            context.pushNamed('login_screen');
          },
          text: FFLocalizations.of(context).getText(
            'vvlu3jzh' /* Login */,
          ),
          options: FFButtonOptions(
            width: 130,
            height: 40,
            color: FlutterFlowTheme.of(context).primaryColor,
            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                  fontFamily: FlutterFlowTheme.of(context).subtitle2Family,
                  color: Colors.white,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).subtitle2Family),
                ),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ],
    );
  }
}
