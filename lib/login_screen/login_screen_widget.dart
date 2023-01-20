import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({Key? key}) : super(key: key);

  @override
  _LoginScreenWidgetState createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<LoginScreenWidget> {
  TextEditingController? codeInputController;
  final codeInputMask = MaskTextInputFormatter(mask: '+###');
  TextEditingController? phoneInputController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    codeInputController = TextEditingController();
    phoneInputController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          codeInputController?.text = FFLocalizations.of(context).getText(
            '9n399h1x' /* +996 */,
          );
        }));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    codeInputController?.dispose();
    phoneInputController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'login_screen',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                    child: Image.network(
                      valueOrDefault<String>(
                        FFAppState().logo,
                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/djalauto-mdpcse/assets/q0v1ahsbk532/logo.png',
                      ),
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    FFLocalizations.of(context).getText(
                      'piwd2zq7' /* Log In your Account */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).title1,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 24),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'wbpwdl5d' /* Log into your school account b... */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).subtitle2.override(
                            fontFamily: 'Montserrat',
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                controller: codeInputController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  hintText: FFLocalizations.of(context).getText(
                                    'lnajsh6v' /* +996 */,
                                  ),
                                  hintStyle:
                                      FlutterFlowTheme.of(context).subtitle1,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(0),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(0),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .errorColor,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(0),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .errorColor,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(0),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          12, 24, 0, 24),
                                ),
                                style: FlutterFlowTheme.of(context).subtitle1,
                                minLines: 1,
                                inputFormatters: [codeInputMask],
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: TextFormField(
                                controller: phoneInputController,
                                onChanged: (_) => EasyDebounce.debounce(
                                  'phoneInputController',
                                  Duration(milliseconds: 2000),
                                  () => setState(() {}),
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle:
                                      FlutterFlowTheme.of(context).subtitle1,
                                  hintText: FFLocalizations.of(context).getText(
                                    'wjb728eu' /* 000 000 000 */,
                                  ),
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .disabledColor,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(12),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(12),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(12),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(12),
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .errorColor,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(12),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(12),
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .errorColor,
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(12),
                                      topLeft: Radius.circular(0),
                                      topRight: Radius.circular(12),
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          12, 24, 20, 24),
                                  suffixIcon: phoneInputController!
                                          .text.isNotEmpty
                                      ? InkWell(
                                          onTap: () async {
                                            phoneInputController?.clear();
                                            setState(() {});
                                          },
                                          child: Icon(
                                            Icons.clear,
                                            color: FlutterFlowTheme.of(context)
                                                .disabledColor,
                                            size: 24,
                                          ),
                                        )
                                      : null,
                                ),
                                style: FlutterFlowTheme.of(context).subtitle1,
                                minLines: 1,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true, decimal: true),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 0),
                    child: InkWell(
                      onLongPress: () async {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              (String codeNum, String phoneNum) {
                                return "$codeNum$phoneNum";
                              }(codeInputController!.text,
                                  phoneInputController!.text),
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor: Color(0x00000000),
                          ),
                        );
                      },
                      child: FFButtonWidget(
                        onPressed: () async {
                          final phoneNumberVal =
                              (String codeNum, String phoneNum) {
                            return "$codeNum$phoneNum";
                          }(codeInputController!.text,
                                  phoneInputController!.text);
                          if (phoneNumberVal == null ||
                              phoneNumberVal.isEmpty ||
                              !phoneNumberVal.startsWith('+')) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Phone Number is required and has to start with +.'),
                              ),
                            );
                            return;
                          }
                          await beginPhoneAuth(
                            context: context,
                            phoneNumber: phoneNumberVal,
                            onCodeSent: () async {
                              context.goNamedAuth(
                                'sms_auth_screen',
                                mounted,
                                ignoreRedirect: true,
                              );
                            },
                          );
                        },
                        text: FFLocalizations.of(context).getText(
                          '7gsn9gty' /* Send Code */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle: FlutterFlowTheme.of(context).subtitle2,
                          elevation: 3,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        }
                        context.pushNamed('papers_screen');
                      },
                      text: FFLocalizations.of(context).getText(
                        '8r4544x5' /* Continue as Guest */,
                      ),
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 50,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .subtitle2
                            .override(
                              fontFamily: 'Montserrat',
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                        elevation: 0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
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
