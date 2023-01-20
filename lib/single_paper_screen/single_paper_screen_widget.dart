import '../components/appbar_divider_widget.dart';
import '../components/question_button_widget.dart';
import '../components/single_question_page_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_timer.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SinglePaperScreenWidget extends StatefulWidget {
  const SinglePaperScreenWidget({
    Key? key,
    this.paperData,
    this.currentQuestionIndex,
  }) : super(key: key);

  final dynamic paperData;
  final int? currentQuestionIndex;

  @override
  _SinglePaperScreenWidgetState createState() =>
      _SinglePaperScreenWidgetState();
}

class _SinglePaperScreenWidgetState extends State<SinglePaperScreenWidget> {
  int timerMilliseconds = 1200000;
  String timerValue = StopWatchTimer.getDisplayTime(
    1200000,
    hours: false,
    milliSecond: false,
  );
  StopWatchTimer timerController =
      StopWatchTimer(mode: StopWatchMode.countDown);

  PageController? pageViewController;
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
    timerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'single_paper_screen',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              await pageViewController?.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            icon: Icon(
              Icons.arrow_forward_rounded,
            ),
            elevation: 8,
            label: Text(
              FFLocalizations.of(context).getText(
                'qeekqouk' /* Next Question */,
              ),
              style: FlutterFlowTheme.of(context).bodyText1,
            ),
          ),
          appBar: responsiveVisibility(
            context: context,
            desktop: false,
          )
              ? PreferredSize(
                  preferredSize: Size.fromHeight(100),
                  child: AppBar(
                    backgroundColor:
                        FlutterFlowTheme.of(context).primaryBackground,
                    automaticallyImplyLeading: false,
                    actions: [],
                    flexibleSpace: FlexibleSpaceBar(
                      title: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 0, 0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 50,
                                      icon: Icon(
                                        Icons.arrow_back_rounded,
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      onPressed: () async {
                                        context.pop();
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 0, 0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'iiw1f6ry' /* Back */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .title2
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 0, 0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '84vipzch' /* Papers# */,
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .title2
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          fontSize: 22,
                                        ),
                                  ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    getJsonField(
                                      widget.paperData,
                                      r'''$.id''',
                                    ).toString(),
                                    '[-]',
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontSize: 22,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      centerTitle: true,
                      expandedTitleScale: 1.0,
                    ),
                    elevation: 0,
                  ),
                )
              : null,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'qcs5az7c' /* Question # */,
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            Text(
                              valueOrDefault<String>(
                                (pageViewController?.page?.round() ?? 0)
                                    .toString(),
                                '[-]',
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ],
                        ),
                        FlutterFlowTimer(
                          initialTime: timerMilliseconds,
                          getDisplayTime: (value) =>
                              StopWatchTimer.getDisplayTime(
                            value,
                            hours: false,
                            milliSecond: false,
                          ),
                          timer: timerController,
                          updateStateInterval: Duration(milliseconds: 1000),
                          onChanged: (value, displayTime, shouldUpdate) {
                            timerMilliseconds = value;
                            timerValue = displayTime;
                            if (shouldUpdate) setState(() {});
                          },
                          textAlign: TextAlign.start,
                          style: FlutterFlowTheme.of(context).bodyText2,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(),
                      child: Builder(
                        builder: (context) {
                          final questionsId = getJsonField(
                            widget.paperData,
                            r'''$.questions''',
                          ).toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: questionsId.length,
                            itemBuilder: (context, questionsIdIndex) {
                              final questionsIdItem =
                                  questionsId[questionsIdIndex];
                              return Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                                child: InkWell(
                                  onTap: () async {
                                    await pageViewController?.animateToPage(
                                      0,
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  },
                                  child: QuestionButtonWidget(
                                    key: UniqueKey(),
                                    paperButtonId: valueOrDefault<String>(
                                      getJsonField(
                                        questionsIdItem,
                                        r'''$.id''',
                                      ).toString(),
                                      '[-]',
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  AppbarDividerWidget(),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        final questionSinglePage = getJsonField(
                          widget.paperData,
                          r'''$.questions''',
                        ).toList();
                        return Container(
                          width: double.infinity,
                          height: double.infinity,
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                            child: PageView.builder(
                              controller: pageViewController ??= PageController(
                                  initialPage:
                                      min(0, questionSinglePage.length - 1)),
                              scrollDirection: Axis.horizontal,
                              itemCount: questionSinglePage.length,
                              itemBuilder: (context, questionSinglePageIndex) {
                                final questionSinglePageItem =
                                    questionSinglePage[questionSinglePageIndex];
                                return SingleQuestionPageWidget(
                                  key: UniqueKey(),
                                  singleQuestionData: getJsonField(
                                    questionSinglePageItem,
                                    r'''$''',
                                  ),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
