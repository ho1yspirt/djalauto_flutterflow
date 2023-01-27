import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TeacherCardWidget extends StatefulWidget {
  const TeacherCardWidget({
    Key? key,
    this.image,
    this.name,
    this.profession,
    this.experience,
    this.age,
  }) : super(key: key);

  final String? image;
  final String? name;
  final String? profession;
  final String? experience;
  final String? age;

  @override
  _TeacherCardWidgetState createState() => _TeacherCardWidgetState();
}

class _TeacherCardWidgetState extends State<TeacherCardWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 250,
        height: 400,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.image!,
              width: double.infinity,
              height: 180,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 12, 0, 12),
              child: Text(
                widget.name!,
                style: FlutterFlowTheme.of(context).subtitle1,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      '0v5xuq7u' /* Profession:  */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                  Text(
                    widget.profession!,
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      '0ri0yqle' /* Experience: */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                  Text(
                    widget.experience!,
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    FFLocalizations.of(context).getText(
                      'cibkjyeu' /* Age:  */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                  Text(
                    widget.age!,
                    style: FlutterFlowTheme.of(context).bodyText1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
