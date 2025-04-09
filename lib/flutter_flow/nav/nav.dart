import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

const debugRouteLinkMap = {
  '/splashScreen':
      'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=splash_screen',
  '/loginScreen':
      'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=login_screen',
  '/createAccount':
      'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=create_account',
  '/aboutYou':
      'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=about_you',
  '/interestScreen':
      'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=interest_screen',
  '/homePage':
      'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=home_page',
  '/settings':
      'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=settings',
  '/editProfile':
      'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=edit_profile',
  '/notifications':
      'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=notifications',
  '/privacyPolices':
      'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=privacy_polices',
  '/forgetPasswordScreen':
      'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=forget_password_screen',
  '/otpVerificationCode':
      'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=otp_verification_code',
  '/otpConfirmationSuccessScreen':
      'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=otp_confirmation_success_screen',
  '/reportProblem':
      'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=report_problem',
  '/recommendAiActivity':
      'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=recommend_ai_activity',
  '/recommendAiActivityResult':
      'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=recommend_ai_activity_result',
  '/recommendAiFood':
      'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=recommend_ai_food',
  '/recommendAiMovies':
      'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=recommend_ai_movies',
  '/recommendAiFoodResult':
      'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=recommend_ai_food_result',
  '/recommendAiMoviesResult':
      'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=recommend_ai_movies_result',
  '/recommendAiPastResoponseResults':
      'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=recommend_ai_past_resoponse_results',
  '/webTest':
      'https://app.flutterflow.io/project/recomate-w5oj9e?tab=uiBuilder&page=webTest'
};

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? HomePageWidget() : SplashScreenWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? HomePageWidget()
              : SplashScreenWidget(),
        ),
        FFRoute(
          name: SplashScreenWidget.routeName,
          path: SplashScreenWidget.routePath,
          builder: (context, params) => SplashScreenWidget(),
        ),
        FFRoute(
          name: LoginScreenWidget.routeName,
          path: LoginScreenWidget.routePath,
          builder: (context, params) => LoginScreenWidget(),
        ),
        FFRoute(
          name: CreateAccountWidget.routeName,
          path: CreateAccountWidget.routePath,
          builder: (context, params) => CreateAccountWidget(),
        ),
        FFRoute(
          name: AboutYouWidget.routeName,
          path: AboutYouWidget.routePath,
          builder: (context, params) => AboutYouWidget(),
        ),
        FFRoute(
          name: InterestScreenWidget.routeName,
          path: InterestScreenWidget.routePath,
          builder: (context, params) => InterestScreenWidget(),
        ),
        FFRoute(
          name: HomePageWidget.routeName,
          path: HomePageWidget.routePath,
          builder: (context, params) => HomePageWidget(),
        ),
        FFRoute(
          name: SettingsWidget.routeName,
          path: SettingsWidget.routePath,
          builder: (context, params) => SettingsWidget(),
        ),
        FFRoute(
          name: EditProfileWidget.routeName,
          path: EditProfileWidget.routePath,
          builder: (context, params) => EditProfileWidget(),
        ),
        FFRoute(
          name: NotificationsWidget.routeName,
          path: NotificationsWidget.routePath,
          builder: (context, params) => NotificationsWidget(),
        ),
        FFRoute(
          name: PrivacyPolicesWidget.routeName,
          path: PrivacyPolicesWidget.routePath,
          builder: (context, params) => PrivacyPolicesWidget(),
        ),
        FFRoute(
          name: ForgetPasswordScreenWidget.routeName,
          path: ForgetPasswordScreenWidget.routePath,
          builder: (context, params) => ForgetPasswordScreenWidget(),
        ),
        FFRoute(
          name: OtpVerificationCodeWidget.routeName,
          path: OtpVerificationCodeWidget.routePath,
          builder: (context, params) => OtpVerificationCodeWidget(),
        ),
        FFRoute(
          name: OtpConfirmationSuccessScreenWidget.routeName,
          path: OtpConfirmationSuccessScreenWidget.routePath,
          builder: (context, params) => OtpConfirmationSuccessScreenWidget(),
        ),
        FFRoute(
          name: ReportProblemWidget.routeName,
          path: ReportProblemWidget.routePath,
          builder: (context, params) => ReportProblemWidget(),
        ),
        FFRoute(
          name: RecommendAiActivityWidget.routeName,
          path: RecommendAiActivityWidget.routePath,
          builder: (context, params) => RecommendAiActivityWidget(),
        ),
        FFRoute(
          name: RecommendAiActivityResultWidget.routeName,
          path: RecommendAiActivityResultWidget.routePath,
          builder: (context, params) => RecommendAiActivityResultWidget(
            aiRespData: params.getParam<dynamic>(
              'aiRespData',
              ParamType.JSON,
              isList: true,
            ),
            test: params.getParam(
              'test',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: RecommendAiFoodWidget.routeName,
          path: RecommendAiFoodWidget.routePath,
          builder: (context, params) => RecommendAiFoodWidget(
            location: params.getParam(
              'location',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: RecommendAiMoviesWidget.routeName,
          path: RecommendAiMoviesWidget.routePath,
          builder: (context, params) => RecommendAiMoviesWidget(),
        ),
        FFRoute(
          name: RecommendAiFoodResultWidget.routeName,
          path: RecommendAiFoodResultWidget.routePath,
          builder: (context, params) => RecommendAiFoodResultWidget(
            aiRespData: params.getParam<dynamic>(
              'aiRespData',
              ParamType.JSON,
              isList: true,
            ),
            test: params.getParam(
              'test',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: RecommendAiMoviesResultWidget.routeName,
          path: RecommendAiMoviesResultWidget.routePath,
          builder: (context, params) => RecommendAiMoviesResultWidget(
            aiRespData: params.getParam<dynamic>(
              'aiRespData',
              ParamType.JSON,
              isList: true,
            ),
            test: params.getParam(
              'test',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: RecommendAiPastResoponseResultsWidget.routeName,
          path: RecommendAiPastResoponseResultsWidget.routePath,
          builder: (context, params) => RecommendAiPastResoponseResultsWidget(
            test: params.getParam(
              'test',
              ParamType.String,
            ),
            pageTitle: params.getParam(
              'pageTitle',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: WebTestWidget.routeName,
          path: WebTestWidget.routePath,
          builder: (context, params) => WebTestWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/splashScreen';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Image.asset(
                    'assets/images/Splash_Screen.png',
                    fit: BoxFit.cover,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
