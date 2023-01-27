import '../auth/firebase_user_provider.dart';
import '../components/redirect_page_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScheduleScreenWidget extends StatefulWidget {
  const ScheduleScreenWidget({Key? key}) : super(key: key);

  @override
  _ScheduleScreenWidgetState createState() => _ScheduleScreenWidgetState();
}

class _ScheduleScreenWidgetState extends State<ScheduleScreenWidget> {
  DateTimeRange? calendarSelectedDay;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
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
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            title: Text(
              FFLocalizations.of(context).getText(
                'si02gcny' /* Schedule */,
              ),
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: FlutterFlowTheme.of(context).title2Family,
                    color: Colors.white,
                    fontSize: 22,
                    useGoogleFonts: GoogleFonts.asMap()
                        .containsKey(FlutterFlowTheme.of(context).title2Family),
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (!valueOrDefault<bool>(
                    loggedIn,
                    true,
                  ))
                    Expanded(
                      child: RedirectPageWidget(),
                    ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (loggedIn)
                            FlutterFlowCalendar(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              iconColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              weekFormat: true,
                              weekStartsMonday: true,
                              initialDate: FFAppState().initialDate,
                              onChange: (DateTimeRange? newSelectedDate) {
                                setState(() =>
                                    calendarSelectedDay = newSelectedDate);
                              },
                              titleStyle: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                              dayOfWeekStyle: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                              dateStyle: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                              selectedDateStyle: TextStyle(),
                              inactiveDateStyle: TextStyle(
                                color:
                                    FlutterFlowTheme.of(context).disabledColor,
                              ),
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
