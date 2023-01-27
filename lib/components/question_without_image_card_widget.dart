import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestionWithoutImageCardWidget extends StatefulWidget {
  const QuestionWithoutImageCardWidget({Key? key}) : super(key: key);

  @override
  _QuestionWithoutImageCardWidgetState createState() =>
      _QuestionWithoutImageCardWidgetState();
}

class _QuestionWithoutImageCardWidgetState
    extends State<QuestionWithoutImageCardWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 12, 8, 12),
          child: Text(
            FFLocalizations.of(context).getText(
              'dooi43o9' /* This question without an image */,
            ),
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).subtitle2,
          ),
        ),
      ),
    );
  }
}
