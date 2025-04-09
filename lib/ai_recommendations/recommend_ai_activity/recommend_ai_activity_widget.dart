import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/back_icon_button_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'recommend_ai_activity_model.dart';
export 'recommend_ai_activity_model.dart';

/// Welcome screen
class RecommendAiActivityWidget extends StatefulWidget {
  const RecommendAiActivityWidget({super.key});

  static String routeName = 'recommend_ai_activity';
  static String routePath = '/recommendAiActivity';

  @override
  State<RecommendAiActivityWidget> createState() =>
      _RecommendAiActivityWidgetState();
}

class _RecommendAiActivityWidgetState extends State<RecommendAiActivityWidget>
    with RouteAware {
  late RecommendAiActivityModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecommendAiActivityModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.addToUserResponses(<String, dynamic>{
        'question':
            FFAppState().fetchedActivityQuestions.firstOrNull?.questionTitle,
      });
      safeSetState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = DebugModalRoute.of(context);
    if (route != null) {
      routeObserver.subscribe(this, route);
    }
    debugLogGlobalProperty(context);
  }

  @override
  void didPopNext() {
    if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
      setState(() => _model.isRouteVisible = true);
      debugLogWidgetClass(_model);
    }
  }

  @override
  void didPush() {
    if (mounted && DebugFlutterFlowModelContext.maybeOf(context) == null) {
      setState(() => _model.isRouteVisible = true);
      debugLogWidgetClass(_model);
    }
  }

  @override
  void didPop() {
    _model.isRouteVisible = false;
  }

  @override
  void didPushNext() {
    _model.isRouteVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    DebugFlutterFlowModelContext.maybeOf(context)
        ?.parentModelCallback
        ?.call(_model);
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(0.0),
                  child: Image.asset(
                    'assets/images/background_style.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.safePop();
                            },
                            child: Container(
                              width: 52.0,
                              height: 52.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Color(0xFF555555),
                                ),
                              ),
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                            ),
                          ),
                          Text(
                            'Recommend an Activity',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                          Container(
                            width: 52.0,
                            height: 52.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 0.0),
                          child: Builder(
                            builder: (context) {
                              final chat = _model.userResponses.toList();
                              if (chat.isEmpty) {
                                return Center(
                                  child: Container(
                                    width: double.infinity,
                                    child: BackIconButtonWidget(),
                                  ),
                                );
                              }
                              _model.debugGeneratorVariables[
                                      'chat${chat.length > 100 ? ' (first 100)' : ''}'] =
                                  debugSerializeParam(
                                chat.take(100),
                                ParamType.JSON,
                                isList: true,
                                link:
                                    'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=recommend_ai_activity',
                                name: 'dynamic',
                                nullable: false,
                              );
                              debugLogWidgetClass(_model);

                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: chat.length,
                                itemBuilder: (context, chatIndex) {
                                  final chatItem = chat[chatIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  constraints: BoxConstraints(
                                                    maxWidth: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.8,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Color(0x4D4D3C3C),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(12.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        getJsonField(
                                                          chatItem,
                                                          r'''$['question']''',
                                                        )?.toString(),
                                                        'question',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        if (getJsonField(
                                              chatItem,
                                              r'''$['option']''',
                                            ) !=
                                            null)
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  16.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.8,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  12.0),
                                                          child: Text(
                                                            getJsonField(
                                                              chatItem,
                                                              r'''$['option']''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(28.0),
                                                        child: Image.network(
                                                          currentUserPhoto,
                                                          width: 28.0,
                                                          height: 28.0,
                                                          fit: BoxFit.cover,
                                                          errorBuilder: (context,
                                                                  error,
                                                                  stackTrace) =>
                                                              Image.asset(
                                                            'assets/images/error_image.png',
                                                            width: 28.0,
                                                            height: 28.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 6.0)),
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                  );
                                },
                                controller: _model.mainList,
                              );
                            },
                          ),
                        ),
                      ),
                      if (_model.aiLoading)
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Lottie.asset(
                              'assets/jsons/Animation_-_1734971091279.json',
                              width: 100.0,
                              height: 100.0,
                              fit: BoxFit.contain,
                              animate: true,
                            ),
                          ),
                        ),
                      if (!_model.aiLoading)
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: FlutterFlowChoiceChips(
                                options: FFAppState()
                                    .fetchedActivityQuestions
                                    .elementAtOrNull(
                                        _model.currentQuestionIndex)!
                                    .questionOptions
                                    .map((label) => ChipData(label))
                                    .toList(),
                                onChanged: (val) => safeSetState(
                                    () => _model.choiceChipsValues = val),
                                selectedChipStyle: ChipStyle(
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  iconColor: FlutterFlowTheme.of(context).info,
                                  iconSize: 16.0,
                                  labelPadding: EdgeInsets.all(4.0),
                                  elevation: 0.0,
                                  borderColor: Color(0xFF362E2E),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor: Color(0x4D4D3C3C),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  iconColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  iconSize: 16.0,
                                  labelPadding: EdgeInsets.all(4.0),
                                  elevation: 0.0,
                                  borderColor: Color(0xFF362E2E),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                chipSpacing: 12.0,
                                rowSpacing: 12.0,
                                multiselect: true,
                                initialized: _model.choiceChipsValues != null,
                                alignment: WrapAlignment.start,
                                controller:
                                    _model.choiceChipsValueController ??=
                                        FormFieldController<List<String>>(
                                  [],
                                ),
                                wrapped: true,
                              ),
                            ),
                          ),
                        ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          height: 56.0,
                          decoration: BoxDecoration(
                            color: Color(0x4D4D3C3C),
                            borderRadius: BorderRadius.circular(28.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 12.0, 20.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final userOptions = _model
                                                .choiceChipsValues
                                                ?.toList() ??
                                            [];
                                        _model.debugGeneratorVariables[
                                                'userOptions${userOptions.length > 100 ? ' (first 100)' : ''}'] =
                                            debugSerializeParam(
                                          userOptions.take(100),
                                          ParamType.String,
                                          isList: true,
                                          link:
                                              'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=recommend_ai_activity',
                                          name: 'String',
                                          nullable: false,
                                        );
                                        debugLogWidgetClass(_model);

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount: userOptions.length,
                                          separatorBuilder: (_, __) =>
                                              SizedBox(width: 10.0),
                                          itemBuilder:
                                              (context, userOptionsIndex) {
                                            final userOptionsItem =
                                                userOptions[userOptionsIndex];
                                            return Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Container(
                                                height: 33.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Text(
                                                            userOptionsItem,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 4.0)),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          controller: _model.listViewController,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      _model.updateUserResponsesAtIndex(
                                        _model.currentQuestionIndex,
                                        (_) => <String, dynamic>{
                                          'question': FFAppState()
                                              .fetchedActivityQuestions
                                              .elementAtOrNull(
                                                  _model.currentQuestionIndex)
                                              ?.questionTitle,
                                          'option':
                                              functions.convertListToString(
                                                  _model.choiceChipsValues
                                                      ?.toList()),
                                        },
                                      );
                                      safeSetState(() {});
                                      safeSetState(() => _model
                                          .choiceChipsValueController
                                          ?.value = []);
                                      if (FFAppState()
                                              .fetchedActivityQuestions
                                              .length ==
                                          (_model.currentQuestionIndex + 1)) {
                                        _model.aiLoading = true;
                                        safeSetState(() {});
                                        _model.aiResp = await AIModelGroup
                                            .chatCompletionCall
                                            .call(
                                          dob: currentUserDocument?.dob
                                              ?.toString(),
                                          gender: valueOrDefault(
                                              currentUserDocument?.gender, ''),
                                          country: valueOrDefault(
                                              currentUserDocument?.country, ''),
                                          interest:
                                              functions.convertListToString(
                                                  (currentUserDocument
                                                              ?.interests
                                                              ?.toList() ??
                                                          [])
                                                      .toList()),
                                          prompt: functions.convertJsonToString(
                                              _model.userResponses.toList()),
                                          uid: currentUserReference?.id,
                                          role: 'Activity ',
                                        );

                                        if ((_model.aiResp?.succeeded ??
                                            true)) {
                                          var userAiHistoryRecordReference =
                                              UserAiHistoryRecord.collection
                                                  .doc();
                                          await userAiHistoryRecordReference
                                              .set(
                                                  createUserAiHistoryRecordData(
                                            categoryTitle:
                                                'Recommended Activity',
                                            aiResponse: AIModelGroup
                                                .chatCompletionCall
                                                .response(
                                              (_model.aiResp?.jsonBody ?? ''),
                                            ),
                                            userId: currentUserReference,
                                            createdAt: getCurrentTimestamp,
                                          ));
                                          _model.historyResp = UserAiHistoryRecord
                                              .getDocumentFromData(
                                                  createUserAiHistoryRecordData(
                                                    categoryTitle:
                                                        'Recommended Activity',
                                                    aiResponse: AIModelGroup
                                                        .chatCompletionCall
                                                        .response(
                                                      (_model.aiResp
                                                              ?.jsonBody ??
                                                          ''),
                                                    ),
                                                    userId:
                                                        currentUserReference,
                                                    createdAt:
                                                        getCurrentTimestamp,
                                                  ),
                                                  userAiHistoryRecordReference);
                                          if (_model.historyResp?.aiResponse !=
                                                  null &&
                                              _model.historyResp?.aiResponse !=
                                                  '') {
                                            context.goNamed(
                                              RecommendAiActivityResultWidget
                                                  .routeName,
                                              queryParameters: {
                                                'test': serializeParam(
                                                  AIModelGroup
                                                      .chatCompletionCall
                                                      .response(
                                                    (_model.aiResp?.jsonBody ??
                                                        ''),
                                                  ),
                                                  ParamType.String,
                                                ),
                                                'aiRespData': serializeParam(
                                                  functions.formateAIResponse(
                                                      AIModelGroup
                                                          .chatCompletionCall
                                                          .response(
                                                    (_model.aiResp?.jsonBody ??
                                                        ''),
                                                  )),
                                                  ParamType.JSON,
                                                  isList: true,
                                                ),
                                              }.withoutNulls,
                                            );
                                          }
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Error in loading response',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 4000),
                                              backgroundColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                            ),
                                          );
                                          _model.aiLoading = false;
                                          safeSetState(() {});
                                        }
                                      } else {
                                        _model.currentQuestionIndex =
                                            _model.currentQuestionIndex + 1;
                                        safeSetState(() {});
                                        await Future.delayed(
                                            const Duration(milliseconds: 200));
                                        _model.addToUserResponses(<String,
                                            dynamic>{
                                          'question': FFAppState()
                                              .fetchedActivityQuestions
                                              .elementAtOrNull(
                                                  _model.currentQuestionIndex)
                                              ?.questionTitle,
                                        });
                                        safeSetState(() {});
                                        await _model.mainList?.animateTo(
                                          _model.mainList!.position
                                              .maxScrollExtent,
                                          duration: Duration(milliseconds: 100),
                                          curve: Curves.ease,
                                        );
                                      }

                                      await _model.mainList?.animateTo(
                                        _model
                                            .mainList!.position.maxScrollExtent,
                                        duration: Duration(milliseconds: 100),
                                        curve: Curves.ease,
                                      );

                                      safeSetState(() {});
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/send-2.png',
                                        width: 24.0,
                                        height: 24.0,
                                        fit: BoxFit.cover,
                                        alignment: Alignment(0.0, 0.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]
                        .divide(SizedBox(height: 8.0))
                        .addToStart(SizedBox(height: 16.0))
                        .addToEnd(SizedBox(height: 16.0)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
