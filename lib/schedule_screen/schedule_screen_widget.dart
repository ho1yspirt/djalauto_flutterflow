import '../auth/firebase_user_provider.dart';
import '../components/appbar_divider_widget.dart';
import '../components/redirect_page_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScheduleScreenWidget extends StatefulWidget {
  const ScheduleScreenWidget({Key? key}) : super(key: key);

  @override
  _ScheduleScreenWidgetState createState() => _ScheduleScreenWidgetState();
}

class _ScheduleScreenWidgetState extends State<ScheduleScreenWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'Schedule',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: responsiveVisibility(
            context: context,
            desktop: false,
          )
              ? AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  automaticallyImplyLeading: false,
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'si02gcny' /* Schedule */,
                    ),
                    style: FlutterFlowTheme.of(context).title2.override(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontSize: 22,
                        ),
                  ),
                  actions: [],
                  centerTitle: true,
                  elevation: 1,
                )
              : null,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppbarDividerWidget(),
                  if (!valueOrDefault<bool>(
                    loggedIn,
                    true,
                  ))
                    Expanded(
                      child: RedirectPageWidget(),
                    ),
                  AppbarDividerWidget(),
                ],
              ),
            ),
          ),
        ));
  }
}
