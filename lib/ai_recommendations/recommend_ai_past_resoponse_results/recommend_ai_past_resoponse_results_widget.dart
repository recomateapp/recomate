import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'recommend_ai_past_resoponse_results_model.dart';
export 'recommend_ai_past_resoponse_results_model.dart';

/// Welcome screen
class RecommendAiPastResoponseResultsWidget extends StatefulWidget {
  const RecommendAiPastResoponseResultsWidget({
    super.key,
    String? test,
    String? pageTitle,
  })  : this.test = test ?? 'test',
        this.pageTitle = pageTitle ?? 'AI Response';

  final String test;
  final String pageTitle;

  static String routeName = 'recommend_ai_past_resoponse_results';
  static String routePath = '/recommendAiPastResoponseResults';

  @override
  State<RecommendAiPastResoponseResultsWidget> createState() =>
      _RecommendAiPastResoponseResultsWidgetState();
}

class _RecommendAiPastResoponseResultsWidgetState
    extends State<RecommendAiPastResoponseResultsWidget> with RouteAware {
  late RecommendAiPastResoponseResultsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecommendAiPastResoponseResultsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.aiResponse =
          functions.formateAIResponse(widget!.test).toList().cast<dynamic>();
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: WillPopScope(
        onWillPop: () async => false,
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: AutoSizeText(
                                widget!.pageTitle,
                                minFontSize: 16.0,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                            Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                            ),
                          ].divide(SizedBox(width: 4.0)),
                        ),
                        Expanded(
                          child: Builder(
                            builder: (context) {
                              final aiRespItem = _model.aiResponse.toList();
                              _model.debugGeneratorVariables[
                                      'aiRespItem${aiRespItem.length > 100 ? ' (first 100)' : ''}'] =
                                  debugSerializeParam(
                                aiRespItem.take(100),
                                ParamType.JSON,
                                isList: true,
                                link:
                                    'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=recommend_ai_past_resoponse_results',
                                name: 'dynamic',
                                nullable: false,
                              );
                              debugLogWidgetClass(_model);

                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: 0.46,
                                ),
                                primary: false,
                                scrollDirection: Axis.vertical,
                                itemCount: aiRespItem.length,
                                itemBuilder: (context, aiRespItemIndex) {
                                  final aiRespItemItem =
                                      aiRespItem[aiRespItemIndex];
                                  return Container(
                                    width: 190.0,
                                    constraints: BoxConstraints(
                                      maxHeight: 380.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Color(0x4D4D3C3C),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    getJsonField(
                                                      aiRespItemItem,
                                                      r'''$['image_url']''',
                                                    )?.toString(),
                                                    'https://s3-alpha-sig.figma.com/img/4e2d/2335/8c34a50a5ff8a6d57e9975612b28f7f7?Expires=1736726400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=AV~r3PvdTL4qa5MaM7VwhJCVSPeGL6UvnvX66wkKagDI9HyB4tRzIIOnWeiuMKqng~9BhxWM6JvPwWxaSM1BpGnH~G25rAMtfaxE9SFxd0oyNEmRLXlTtVAAw13GBPNZWiZQwyX4EOkqAZ9Cc8FFd5FoUjLXnXk9BZfG7QMofRxHI4bATIsjb10LmXPpRBn2mveNaqF99RgrzYvU4znUNfvT5DO5zH7RYb7S-UVrSV50-fLcw9C54TCgZ~sFDspiy2s9uE0Nyl91O53jVDU-L4NhUY4o5e8PHRhrJRUWHLcnYJeEdJwflggBubtKdiXPovfsO-X6fazCToIkatyxHw__',
                                                  ),
                                                  width: 174.0,
                                                  height: 175.0,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Image.asset(
                                                    'assets/images/error_image.png',
                                                    width: 174.0,
                                                    height: 175.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    constraints: BoxConstraints(
                                                      maxHeight: 40.0,
                                                    ),
                                                    decoration: BoxDecoration(),
                                                    child: SelectionArea(
                                                        child: AutoSizeText(
                                                      valueOrDefault<String>(
                                                        getJsonField(
                                                          aiRespItemItem,
                                                          r'''$['title']''',
                                                        )?.toString(),
                                                        'title',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    )),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      color: Color(0xFFFBB040),
                                                      size: 16.0,
                                                    ),
                                                    Text(
                                                      valueOrDefault<String>(
                                                        getJsonField(
                                                          aiRespItemItem,
                                                          r'''$['rating']''',
                                                        )?.toString(),
                                                        'rating',
                                                      ),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 12.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 4.0)),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              constraints: BoxConstraints(
                                                maxHeight: 60.0,
                                              ),
                                              decoration: BoxDecoration(),
                                              child: SelectionArea(
                                                  child: Text(
                                                getJsonField(
                                                  aiRespItemItem,
                                                  r'''$['description']''',
                                                ).toString(),
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color:
                                                              Color(0xFFADADAD),
                                                          fontSize: 11.5,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                          lineHeight: 1.1,
                                                        ),
                                              )),
                                            ),
                                            Divider(
                                              thickness: 1.0,
                                              color: Color(0xFF333333),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Text(
                                                () {
                                                  if (widget!.pageTitle ==
                                                      'Recommended Movies ') {
                                                    return 'Enjoy something to watch';
                                                  } else if (widget!
                                                          .pageTitle ==
                                                      'Recommended Eating Options') {
                                                    return 'Enjoy your meal';
                                                  } else if (widget!
                                                          .pageTitle ==
                                                      'Recommended Activity') {
                                                    return 'Have fun';
                                                  } else {
                                                    return 'Enjoy';
                                                  }
                                                }(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMediumFamily,
                                                          color:
                                                              Color(0xFFADADAD),
                                                          fontSize: 10.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily),
                                                          lineHeight: 1.0,
                                                        ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await launchURL(
                                                          valueOrDefault<
                                                              String>(
                                                        getJsonField(
                                                          aiRespItemItem,
                                                          r'''$['Link']''',
                                                        )?.toString(),
                                                        'recomate',
                                                      ));
                                                    },
                                                    text: () {
                                                      if (widget!.pageTitle ==
                                                          'Recommended Movies ') {
                                                        return 'Watch Now';
                                                      } else if (widget!
                                                              .pageTitle ==
                                                          'Recommended Eating Options') {
                                                        return 'Eat Now';
                                                      } else if (widget!
                                                              .pageTitle ==
                                                          'Recommended Activity') {
                                                        return 'Explore Now';
                                                      } else {
                                                        return 'Explore Now';
                                                      }
                                                    }(),
                                                    options: FFButtonOptions(
                                                      padding:
                                                          EdgeInsets.all(7.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmallFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                fontSize: 8.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleSmallFamily),
                                                              ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ].divide(SizedBox(height: 8.0)),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        if (FFAppConstants.versionNumber == 'v2')
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 0.0),
                              child: Container(
                                width: 195.0,
                                height: 49.0,
                                decoration: BoxDecoration(
                                  color: Color(0x4D4D3C3C),
                                  borderRadius: BorderRadius.circular(28.0),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 16.0, 24.0, 16.0),
                                    child: Text(
                                      'Suggest More Options',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                    ),
                                  ),
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
      ),
    );
  }
}
