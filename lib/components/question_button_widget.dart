import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestionButtonWidget extends StatefulWidget {
  const QuestionButtonWidget({
    Key? key,
    this.paperButtonId,
  }) : super(key: key);

  final String? paperButtonId;

  @override
  _QuestionButtonWidgetState createState() => _QuestionButtonWidgetState();
}

class _QuestionButtonWidgetState extends State<QuestionButtonWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(12),
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
            style: FlutterFlowTheme.of(context).bodyText2,
          ),
        ],
      ),
    );
  }
}
