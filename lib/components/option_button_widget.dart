import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OptionButtonWidget extends StatefulWidget {
  const OptionButtonWidget({
    Key? key,
    this.optionText,
  }) : super(key: key);

  final String? optionText;

  @override
  _OptionButtonWidgetState createState() => _OptionButtonWidgetState();
}

class _OptionButtonWidgetState extends State<OptionButtonWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 8),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            width: 3,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
          child: Text(
            widget.optionText!,
            style: FlutterFlowTheme.of(context).subtitle1,
          ),
        ),
      ),
    );
  }
}
