import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaperButtonWidget extends StatefulWidget {
  const PaperButtonWidget({
    Key? key,
    this.paperButtonId,
  }) : super(key: key);

  final String? paperButtonId;

  @override
  _PaperButtonWidgetState createState() => _PaperButtonWidgetState();
}

class _PaperButtonWidgetState extends State<PaperButtonWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          width: 3,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.paperButtonId!,
            style: FlutterFlowTheme.of(context).title2,
          ),
        ],
      ),
    );
  }
}
