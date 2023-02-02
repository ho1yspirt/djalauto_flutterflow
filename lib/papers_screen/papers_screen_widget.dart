import '../backend/api_requests/api_calls.dart';
import '../components/paper_bottom_sheet_widget.dart';
import '../components/paper_button_widget.dart';
import '../components/web_side_nav_bar_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PapersScreenWidget extends StatefulWidget {
  const PapersScreenWidget({
    Key? key,
    this.plus1,
  }) : super(key: key);

  final int? plus1;

  @override
  _PapersScreenWidgetState createState() => _PapersScreenWidgetState();
}

class _PapersScreenWidgetState extends State<PapersScreenWidget> {
  ApiCallResponse? singlePaperData;
  Completer<ApiCallResponse>? _apiRequestCompleter;
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
        title: 'Papers',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              print('FloatingActionButton pressed ...');
            },
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            icon: Icon(
              Icons.playlist_add_check_rounded,
            ),
            elevation: 8,
            label: Text(
              FFLocalizations.of(context).getText(
                'o015yp1e' /* Pass the exam */,
              ),
              style: FlutterFlowTheme.of(context).bodyText1,
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
                      'jq724syr' /* Papers */,
                    ),
                    style: FlutterFlowTheme.of(context).title2.override(
                          fontFamily: FlutterFlowTheme.of(context).title2Family,
                          color: Colors.white,
                          fontSize: 22,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).title2Family),
                        ),
                  ),
                  actions: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30,
                      borderWidth: 1,
                      buttonSize: 60,
                      icon: Icon(
                        Icons.more_vert_outlined,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30,
                      ),
                      onPressed: () async {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: MediaQuery.of(context).viewInsets,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                child: PaperBottomSheetWidget(),
                              ),
                            );
                          },
                        ).then((value) => setState(() {}));
                      },
                    ),
                  ],
                  centerTitle: true,
                  elevation: 0,
                )
              : null,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  WebSideNavBarWidget(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 24, 0, 0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'u9xvb75t' /* Choose exam paper */,
                              ),
                              style: FlutterFlowTheme.of(context).title1,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 8, 0, 24),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'laktg27m' /* Category ABM */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .subtitle2Family,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .subtitle2Family),
                                  ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                            child: FutureBuilder<ApiCallResponse>(
                              future: (_apiRequestCompleter ??= Completer<
                                      ApiCallResponse>()
                                    ..complete(
                                        PapersFirebaseRealtimeDBCall.call()))
                                  .future,
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 24, 0, 0),
                                      child: SizedBox(
                                        width: 50,
                                        height: 50,
                                        child: SpinKitRing(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 50,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final gridViewPapersFirebaseRealtimeDBResponse =
                                    snapshot.data!;
                                return Builder(
                                  builder: (context) {
                                    final paperId = getJsonField(
                                      gridViewPapersFirebaseRealtimeDBResponse
                                          .jsonBody,
                                      r'''$''',
                                    ).toList();
                                    return RefreshIndicator(
                                      onRefresh: () async {
                                        setState(
                                            () => _apiRequestCompleter = null);
                                        await waitForApiRequestCompleter();
                                      },
                                      child: GridView.builder(
                                        padding: EdgeInsets.zero,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 4,
                                          crossAxisSpacing: 8,
                                          mainAxisSpacing: 8,
                                          childAspectRatio: 1,
                                        ),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: paperId.length,
                                        itemBuilder: (context, paperIdIndex) {
                                          final paperIdItem =
                                              paperId[paperIdIndex];
                                          return InkWell(
                                            onTap: () async {
                                              singlePaperData =
                                                  await SinglePaperFirebaseRealtimeDBCall
                                                      .call(
                                                paperId: valueOrDefault<String>(
                                                  paperIdIndex.toString(),
                                                  '0',
                                                ),
                                              );

                                              context.pushNamed(
                                                'single_paper_screen',
                                                queryParams: {
                                                  'paperData': serializeParam(
                                                    (singlePaperData
                                                            ?.jsonBody ??
                                                        ''),
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );

                                              setState(() {});
                                            },
                                            child: PaperButtonWidget(
                                              key: Key(
                                                  'paperButton_${paperIdIndex}'),
                                              paperButtonId:
                                                  valueOrDefault<String>(
                                                (int paperId, int plus1) {
                                                  return "${paperId + plus1}";
                                                }(
                                                    paperIdIndex,
                                                    valueOrDefault<int>(
                                                      widget.plus1,
                                                      1,
                                                    )),
                                                '[-]',
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
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

  Future waitForApiRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
