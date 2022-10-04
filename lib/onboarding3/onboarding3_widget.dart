import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding3Widget extends StatefulWidget {
  const Onboarding3Widget({Key? key}) : super(key: key);

  @override
  _Onboarding3WidgetState createState() => _Onboarding3WidgetState();
}

class _Onboarding3WidgetState extends State<Onboarding3Widget> {
  bool? monthPurchased;
  bool? terPurchased;
  bool? yearPurchased;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Onboarding3'});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        iconTheme:
            IconThemeData(color: FlutterFlowTheme.of(context).secondaryColor),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            logFirebaseEvent('ONBOARDING3_PAGE_Icon_nqtnuixa_ON_TAP');
            logFirebaseEvent('Icon_Navigate-Back');
            context.pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: FlutterFlowTheme.of(context).primaryColor,
            size: 24,
          ),
        ),
        title: Text(
          'Choose Subscription',
          style: FlutterFlowTheme.of(context).subtitle2.override(
                fontFamily: 'Ubuntu',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 20,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: Image.asset(
                          'assets/images/createAccount_bg@2x.png',
                        ).image,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                            child: StreamBuilder<List<SubscriptionsRecord>>(
                              stream: querySubscriptionsRecord(
                                queryBuilder: (subscriptionsRecord) =>
                                    subscriptionsRecord
                                        .where('period', isEqualTo: 'Monthly')
                                        .where('app',
                                            isEqualTo: 'etwelve papers'),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: SpinKitFadingCube(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        size: 25,
                                      ),
                                    ),
                                  );
                                }
                                List<SubscriptionsRecord>
                                    containerSubscriptionsRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the document does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final containerSubscriptionsRecord =
                                    containerSubscriptionsRecordList.isNotEmpty
                                        ? containerSubscriptionsRecordList.first
                                        : null;
                                return Container(
                                  width: double.infinity,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  alignment: AlignmentDirectional(
                                      0, -0.050000000000000044),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 10),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                containerSubscriptionsRecord!
                                                    .period!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Ubuntu',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                              ),
                                              Text(
                                                formatNumber(
                                                  containerSubscriptionsRecord!
                                                      .price!,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                  currency: 'R',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Ubuntu',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: Text(
                                                  containerSubscriptionsRecord!
                                                      .description!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Ubuntu',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 16,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            if (valueOrDefault(
                                                    currentUserDocument
                                                        ?.subscription,
                                                    '') !=
                                                'papers_24_1m_0m')
                                              AuthUserStreamWidget(
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'ONBOARDING3_PAGE_BUY_BTN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Button_Revenue-Cat');
                                                    monthPurchased =
                                                        await revenue_cat
                                                            .purchasePackage(
                                                                valueOrDefault<
                                                                    String>(
                                                      revenue_cat
                                                          .offerings!
                                                          .current!
                                                          .monthly!
                                                          .identifier,
                                                      'didPurchase',
                                                    ));
                                                    if (monthPurchased ==
                                                        true) {
                                                      logFirebaseEvent(
                                                          'Button_Backend-Call');

                                                      final usersUpdateData =
                                                          createUsersRecordData(
                                                        subscriptionPaid: true,
                                                        subscription:
                                                            'papers_24_1m_0m',
                                                      );
                                                      await currentUserReference!
                                                          .update(
                                                              usersUpdateData);
                                                      logFirebaseEvent(
                                                          'Button_Navigate-To');

                                                      context.pushNamed(
                                                          'Onboarding4');
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Button_Alert-Dialog');
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Sorry!!!'),
                                                            content: Text(
                                                                'Sorry your Subscriptio purchase was not successfull.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child: Text(
                                                                    'Try Again'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }

                                                    setState(() {});
                                                  },
                                                  text: 'Buy',
                                                  options: FFButtonOptions(
                                                    width: 130,
                                                    height: 40,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Ubuntu',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              ),
                                            if (valueOrDefault(
                                                    currentUserDocument
                                                        ?.subscription,
                                                    '') ==
                                                'papers_24_1m_0m')
                                              AuthUserStreamWidget(
                                                child: Icon(
                                                  Icons.check_circle,
                                                  color: Color(0xFF00D100),
                                                  size: 40,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                            child: StreamBuilder<List<SubscriptionsRecord>>(
                              stream: querySubscriptionsRecord(
                                queryBuilder: (subscriptionsRecord) =>
                                    subscriptionsRecord
                                        .where('period', isEqualTo: 'Term')
                                        .where('app',
                                            isEqualTo: 'etwelve papers'),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: SpinKitFadingCube(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        size: 25,
                                      ),
                                    ),
                                  );
                                }
                                List<SubscriptionsRecord>
                                    containerSubscriptionsRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the document does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final containerSubscriptionsRecord =
                                    containerSubscriptionsRecordList.isNotEmpty
                                        ? containerSubscriptionsRecordList.first
                                        : null;
                                return Container(
                                  width: double.infinity,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  alignment: AlignmentDirectional(
                                      0, -0.050000000000000044),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 10),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '1 ${containerSubscriptionsRecord!.period}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Ubuntu',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                              ),
                                              Text(
                                                formatNumber(
                                                  containerSubscriptionsRecord!
                                                      .price!,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                  currency: 'R',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Ubuntu',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: Text(
                                                  containerSubscriptionsRecord!
                                                      .description!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Ubuntu',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 16,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            if (valueOrDefault(
                                                    currentUserDocument
                                                        ?.subscription,
                                                    '') !=
                                                'papers_120_1q_0w')
                                              AuthUserStreamWidget(
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'ONBOARDING3_PAGE_BUY_BTN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Button_Revenue-Cat');
                                                    terPurchased =
                                                        await revenue_cat
                                                            .purchasePackage(
                                                                valueOrDefault<
                                                                    String>(
                                                      revenue_cat
                                                          .offerings!
                                                          .current!
                                                          .threeMonth!
                                                          .identifier,
                                                      'didPurchase',
                                                    ));
                                                    if (terPurchased == true) {
                                                      logFirebaseEvent(
                                                          'Button_Backend-Call');

                                                      final usersUpdateData =
                                                          createUsersRecordData(
                                                        subscriptionPaid: true,
                                                        subscription:
                                                            'papers_120_1q_0w',
                                                      );
                                                      await currentUserReference!
                                                          .update(
                                                              usersUpdateData);
                                                      logFirebaseEvent(
                                                          'Button_Navigate-To');

                                                      context.pushNamed(
                                                          'Onboarding4');
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Button_Alert-Dialog');
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Sorry!!!'),
                                                            content: Text(
                                                                'Sorry your Subscriptio purchase was not successfull.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child: Text(
                                                                    'Try Again'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }

                                                    setState(() {});
                                                  },
                                                  text: 'Buy',
                                                  options: FFButtonOptions(
                                                    width: 130,
                                                    height: 40,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Ubuntu',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              ),
                                            if (valueOrDefault(
                                                    currentUserDocument
                                                        ?.subscription,
                                                    '') ==
                                                'papers_120_1q_0w')
                                              AuthUserStreamWidget(
                                                child: Icon(
                                                  Icons.check_circle,
                                                  color: Color(0xFF00D100),
                                                  size: 40,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                            child: StreamBuilder<List<SubscriptionsRecord>>(
                              stream: querySubscriptionsRecord(
                                queryBuilder: (subscriptionsRecord) =>
                                    subscriptionsRecord
                                        .where('period', isEqualTo: 'Yearly')
                                        .where('app',
                                            isEqualTo: 'etwelve papers'),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: SpinKitFadingCube(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        size: 25,
                                      ),
                                    ),
                                  );
                                }
                                List<SubscriptionsRecord>
                                    containerSubscriptionsRecordList =
                                    snapshot.data!;
                                // Return an empty Container when the document does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final containerSubscriptionsRecord =
                                    containerSubscriptionsRecordList.isNotEmpty
                                        ? containerSubscriptionsRecordList.first
                                        : null;
                                return Container(
                                  width: double.infinity,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  alignment: AlignmentDirectional(
                                      0, -0.050000000000000044),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 10, 10, 10),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 10),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                containerSubscriptionsRecord!
                                                    .period!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Ubuntu',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                              ),
                                              Text(
                                                formatNumber(
                                                  containerSubscriptionsRecord!
                                                      .price!,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.automatic,
                                                  currency: 'R',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Ubuntu',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: Text(
                                                  containerSubscriptionsRecord!
                                                      .description!,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Ubuntu',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 16,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            if (valueOrDefault(
                                                    currentUserDocument
                                                        ?.subscription,
                                                    '') !=
                                                'papers_240_1y_0w')
                                              AuthUserStreamWidget(
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    logFirebaseEvent(
                                                        'ONBOARDING3_PAGE_BUY_BTN_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Button_Revenue-Cat');
                                                    yearPurchased =
                                                        await revenue_cat
                                                            .purchasePackage(
                                                                valueOrDefault<
                                                                    String>(
                                                      revenue_cat
                                                          .offerings!
                                                          .current!
                                                          .annual!
                                                          .identifier,
                                                      'didPurchase',
                                                    ));
                                                    if (yearPurchased == true) {
                                                      logFirebaseEvent(
                                                          'Button_Backend-Call');

                                                      final usersUpdateData =
                                                          createUsersRecordData(
                                                        subscriptionPaid: true,
                                                        subscription:
                                                            'papers_240_1y_0w',
                                                      );
                                                      await currentUserReference!
                                                          .update(
                                                              usersUpdateData);
                                                      logFirebaseEvent(
                                                          'Button_Navigate-To');

                                                      context.pushNamed(
                                                          'Onboarding4');
                                                    } else {
                                                      logFirebaseEvent(
                                                          'Button_Alert-Dialog');
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text(
                                                                'Sorry!!!'),
                                                            content: Text(
                                                                'Sorry your Subscriptio purchase was not successfull.'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child: Text(
                                                                    'Try Again'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    }

                                                    setState(() {});
                                                  },
                                                  text: 'Buy',
                                                  options: FFButtonOptions(
                                                    width: 130,
                                                    height: 40,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Ubuntu',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              ),
                                            if (valueOrDefault(
                                                    currentUserDocument
                                                        ?.subscription,
                                                    '') ==
                                                'papers_240_1y_0w')
                                              AuthUserStreamWidget(
                                                child: Icon(
                                                  Icons.check_circle,
                                                  color: Color(0xFF00D100),
                                                  size: 40,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'ONBOARDING3_PAGE_SKIP_BTN_ON_TAP');
                                    logFirebaseEvent('Button_Navigate-To');

                                    context.pushNamed(
                                      'Onboarding4',
                                      extra: <String, dynamic>{
                                        kTransitionInfoKey: TransitionInfo(
                                          hasTransition: true,
                                          transitionType:
                                              PageTransitionType.rightToLeft,
                                          duration: Duration(milliseconds: 100),
                                        ),
                                      },
                                    );
                                  },
                                  text: 'Skip',
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 40,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Ubuntu',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
