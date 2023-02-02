import '../auth/firebase_user_provider.dart';
import '../backend/backend.dart';
import '../components/web_side_nav_bar_widget.dart';
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
          floatingActionButton: Visibility(
            visible: !isWeb,
            child: FloatingActionButton.extended(
              onPressed: () async {
                context.pushNamed('add_lesson_screen');
              },
              backgroundColor: FlutterFlowTheme.of(context).primaryColor,
              icon: Icon(
                Icons.add_rounded,
              ),
              elevation: 8,
              label: Text(
                FFLocalizations.of(context).getText(
                  '9fbn1ae3' /* Add lesson */,
                ),
                style: FlutterFlowTheme.of(context).bodyText1,
              ),
            ),
          ),
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
                          fontFamily: FlutterFlowTheme.of(context).title2Family,
                          color: Colors.white,
                          fontSize: 22,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).title2Family),
                        ),
                  ),
                  actions: [],
                  centerTitle: true,
                  elevation: 0,
                )
              : null,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WebSideNavBarWidget(),
                  if (loggedIn)
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FlutterFlowCalendar(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              iconColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              weekFormat: true,
                              weekStartsMonday: true,
                              initialDate: FFAppState().initialDate,
                              rowHeight: 100,
                              onChange: (DateTimeRange? newSelectedDate) async {
                                calendarSelectedDay = newSelectedDate;
                                FFAppState().update(() {
                                  FFAppState().selectedDate =
                                      calendarSelectedDay?.start;
                                });
                                setState(() {});
                              },
                              titleStyle:
                                  FlutterFlowTheme.of(context).subtitle2,
                              dayOfWeekStyle:
                                  FlutterFlowTheme.of(context).bodyText2,
                              dateStyle: FlutterFlowTheme.of(context).bodyText1,
                              selectedDateStyle:
                                  FlutterFlowTheme.of(context).subtitle1,
                              inactiveDateStyle:
                                  FlutterFlowTheme.of(context).bodyText1,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                              child: Text(
                                valueOrDefault<String>(
                                  FFAppState().selectedDate?.toString(),
                                  'Date',
                                ),
                                style: FlutterFlowTheme.of(context).title1,
                              ),
                            ),
                            StreamBuilder<List<CalendarRecord>>(
                              stream: queryCalendarRecord(
                                queryBuilder: (calendarRecord) =>
                                    calendarRecord.where('time_start',
                                        isEqualTo: calendarSelectedDay?.start),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: SpinKitRing(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 50,
                                      ),
                                    ),
                                  );
                                }
                                List<CalendarRecord>
                                    listViewCalendarRecordList = snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewCalendarRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewCalendarRecord =
                                        listViewCalendarRecordList[
                                            listViewIndex];
                                    return InkWell(
                                      onTap: () async {
                                        context.pushNamed(
                                          'lesson_screen',
                                          queryParams: {
                                            'userName': serializeParam(
                                              listViewCalendarRecord.username,
                                              ParamType.String,
                                            ),
                                            'teacherName': serializeParam(
                                              listViewCalendarRecord
                                                  .teachername,
                                              ParamType.String,
                                            ),
                                            'start': serializeParam(
                                              listViewCalendarRecord.timeStart,
                                              ParamType.DateTime,
                                            ),
                                            'end': serializeParam(
                                              listViewCalendarRecord.timeEnd,
                                              ParamType.DateTime,
                                            ),
                                            'desc': serializeParam(
                                              listViewCalendarRecord
                                                  .description,
                                              ParamType.String,
                                            ),
                                            'created': serializeParam(
                                              listViewCalendarRecord
                                                  .timeCreated,
                                              ParamType.DateTime,
                                            ),
                                            'user': serializeParam(
                                              listViewCalendarRecord.userAssign,
                                              ParamType.DocumentReference,
                                            ),
                                            'teacher': serializeParam(
                                              listViewCalendarRecord
                                                  .teacherAssign,
                                              ParamType.DocumentReference,
                                            ),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: ListTile(
                                        title: Text(
                                          (String start, String end) {
                                            return '$start - $end';
                                          }(
                                              dateTimeFormat(
                                                'Hm',
                                                listViewCalendarRecord
                                                    .timeStart!,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              dateTimeFormat(
                                                'Hm',
                                                listViewCalendarRecord.timeEnd!,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )),
                                          style: FlutterFlowTheme.of(context)
                                              .title3,
                                        ),
                                        subtitle: Text(
                                          (String user, String teacher) {
                                            return '$teacher - $user';
                                          }(
                                              listViewCalendarRecord.username!,
                                              listViewCalendarRecord
                                                  .teachername!),
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle2,
                                        ),
                                        trailing: Icon(
                                          Icons.arrow_forward_ios,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20,
                                        ),
                                        tileColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        dense: false,
                                      ),
                                    );
                                  },
                                );
                              },
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
