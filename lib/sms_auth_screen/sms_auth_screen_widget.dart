import '../auth/auth_util.dart';
import '../components/appbar_divider_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SmsAuthScreenWidget extends StatefulWidget {
  const SmsAuthScreenWidget({Key? key}) : super(key: key);

  @override
  _SmsAuthScreenWidgetState createState() => _SmsAuthScreenWidgetState();
}

class _SmsAuthScreenWidgetState extends State<SmsAuthScreenWidget> {
  TextEditingController? pinCodeController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    pinCodeController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    pinCodeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'sms_auth_screen',
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
                  leading: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30,
                    borderWidth: 1,
                    buttonSize: 60,
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () async {
                      context.pushNamed('login_screen');
                    },
                  ),
                  title: Text(
                    FFLocalizations.of(context).getText(
                      'n5ei50en' /* SMS Auth */,
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
          body: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                AppbarDividerWidget(),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            FFLocalizations.of(context).getText(
                              '7pqlgorn' /* Confirm your Code */,
                            ),
                            style: FlutterFlowTheme.of(context).title1,
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 8, 24, 24),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '8bhl4np4' /* This code helps keep your acco... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).subtitle2,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                            child: PinCodeTextField(
                              appContext: context,
                              length: 4,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              enableActiveFill: true,
                              autoFocus: true,
                              showCursor: true,
                              cursorColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              obscureText: false,
                              hintCharacter: '-',
                              pinTheme: PinTheme(
                                fieldHeight: 60,
                                fieldWidth: 60,
                                borderWidth: 3,
                                borderRadius: BorderRadius.circular(12),
                                shape: PinCodeFieldShape.box,
                                activeColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                inactiveColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                selectedColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                                activeFillColor:
                                    FlutterFlowTheme.of(context).primaryColor,
                                inactiveFillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                selectedFillColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                              controller: pinCodeController,
                              onChanged: (_) => {},
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            GoRouter.of(context).prepareAuthEvent();
                            final smsCodeVal = pinCodeController!.text;
                            if (smsCodeVal == null || smsCodeVal.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Enter SMS verification code.'),
                                ),
                              );
                              return;
                            }
                            final phoneVerifiedUser = await verifySmsCode(
                              context: context,
                              smsCode: smsCodeVal,
                            );
                            if (phoneVerifiedUser == null) {
                              return;
                            }

                            context.goNamedAuth('schedule_screen', mounted);
                          },
                          text: FFLocalizations.of(context).getText(
                            'le3xxirb' /* Confirm & Continue */,
                          ),
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 50,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle: FlutterFlowTheme.of(context)
                                .subtitle2
                                .override(
                                  fontFamily: 'Montserrat',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                            elevation: 2,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
