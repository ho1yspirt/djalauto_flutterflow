import '../components/option_button_widget.dart';
import '../components/question_without_image_card_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SingleQuestionPageWidget extends StatefulWidget {
  const SingleQuestionPageWidget({
    Key? key,
    this.singleQuestionData,
  }) : super(key: key);

  final dynamic singleQuestionData;

  @override
  _SingleQuestionPageWidgetState createState() =>
      _SingleQuestionPageWidgetState();
}

class _SingleQuestionPageWidgetState extends State<SingleQuestionPageWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (valueOrDefault<bool>(
            getJsonField(
                  widget.singleQuestionData,
                  r'''$.image''',
                ) ==
                FFAppState().emptyString,
            true,
          ))
            QuestionWithoutImageCardWidget(),
          if (valueOrDefault<bool>(
            getJsonField(
                  widget.singleQuestionData,
                  r'''$.image''',
                ) !=
                FFAppState().emptyString,
            false,
          ))
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  getJsonField(
                    widget.singleQuestionData,
                    r'''$.image''',
                  ),
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 24),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    valueOrDefault<String>(
                      getJsonField(
                        widget.singleQuestionData,
                        r'''$.questionText''',
                      ).toString(),
                      '[question text]',
                    ),
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).title3,
                  ),
                ),
              ],
            ),
          ),
          Builder(
            builder: (context) {
              final singleOptionData = getJsonField(
                widget.singleQuestionData,
                r'''$.options''',
              ).toList();
              return ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: singleOptionData.length,
                itemBuilder: (context, singleOptionDataIndex) {
                  final singleOptionDataItem =
                      singleOptionData[singleOptionDataIndex];
                  return OptionButtonWidget(
                    key: Key('optionButton_${singleOptionDataIndex}'),
                    optionText: valueOrDefault<String>(
                      getJsonField(
                        singleOptionDataItem,
                        r'''$.optionsText''',
                      ).toString(),
                      '[option text]',
                    ),
                  );
                },
              );
            },
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(),
          ),
        ],
      ),
    );
  }
}
