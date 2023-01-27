import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaperBottomSheetWidget extends StatefulWidget {
  const PaperBottomSheetWidget({Key? key}) : super(key: key);

  @override
  _PaperBottomSheetWidgetState createState() => _PaperBottomSheetWidgetState();
}

class _PaperBottomSheetWidgetState extends State<PaperBottomSheetWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () async {
                if (Navigator.of(context).canPop()) {
                  context.pop();
                }
                context.pushNamed('papers_screen');
              },
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Icon(
                            Icons.shuffle_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'nywmk25e' /* Pick Random */,
                          ),
                          style: FlutterFlowTheme.of(context).subtitle2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 3,
              color: FlutterFlowTheme.of(context).primaryBackground,
            ),
          ],
        ),
      ),
    );
  }
}
