
import 'dart:async';

import 'package:Signs/Blocs/medicationList%20bloc/medicationList_bloc.dart';
import 'package:Signs/Utils/constants.dart';
import 'package:Signs/Utils/images.dart';
import 'package:Signs/Utils/strings.dart';
import 'package:Signs/Utils/styles.dart';
import 'package:Signs/widgets/medication_cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class MedicationScreen extends StatefulWidget {
  MedicationScreen({Key key}) : super(key: key);

  @override
  _MedicationScreenState createState() => _MedicationScreenState();
}

class _MedicationScreenState extends State<MedicationScreen> {
  bool shouldOpenAllItems = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _scaffoldKeyTest = new GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey = GlobalKey<LiquidPullToRefreshState>();
  ScrollController _scrollController;
  MedicationListBloc _medicationBloc;
  bool isLoading = false;
  int currentIndex=0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _medicationBloc = MedicationListBloc();
    _scrollController = new ScrollController();
  }


  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 1), () {
      completer.complete();
    });
    // setState(() {
    // });
    return completer.future.then<void>((_) {
      _scaffoldKeyTest.currentState?.showSnackBar(SnackBar(
          content: const Text('Refresh complete'),
          action: SnackBarAction(
              label: 'RETRY',
              onPressed: () {
                _refreshIndicatorKey.currentState.show();
              })));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: defaultBackgroundColor,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
        key: _scaffoldKey,
        body: BlocBuilder<MedicationListBloc, MedicationListState>(
        bloc: _medicationBloc,
        builder: (context, state) {
          if (state is MedicationLoadingListState) {
            // if (!isLoading) {
            //   showLoadingDialog(context);
            //   isLoading = true;
            // }
          } else if (state is MedicationLoadedListState) {
            print('loaded');
            Future.delayed(Duration(milliseconds: 1), () {
              if (state.medicationListresponse.code != 200) {
                _scaffoldKey.currentState.showSnackBar(
                    SnackBar(content: Text('error')));
                Navigator.of(context).pop();
              } else {
                if( Constants.isActive == 2){
                  Constants.medicationList.removeAt(currentIndex);
                  Constants.isActive =0;
                  print('remove');
                }
              }
              _medicationBloc.add(resetMedicationListState());
              // isLoading = false;
              print('close');
            }
        );
      }
          return Container(
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      'Medication List',
                      style: titleStyle(
                          color: defaultBackgroundColor,
                          fontSize: 24,
                          fontFamily: boldFontFamily),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        shouldOpenAllItems = !shouldOpenAllItems;
                      });
                    },
                    child: Text(
                      shouldOpenAllItems ? 'Done' : 'Edit',
                      style: titleStyle(
                          color: greyColor,
                          fontSize: 20,
                          fontFamily: semiBoldFontFamily),
                    ),
                  )
                ],
              ),
          LiquidPullToRefresh(
            key: _refreshIndicatorKey,	// key if you want to add
            onRefresh: _handleRefresh,	// refresh callback
            showChildOpacityTransition: false,
            animSpeedFactor: 3.0,
            color: defaultBackgroundColor,
            // springAnimationDurationInMilliseconds: 30,
            // height: 50,
            child:
              Expanded(
                child: Constants.medicationList.length > 0
                    ? ListView.builder(
                  // controller: _scrollController,
                  itemCount: Constants.medicationList.length,
                  itemBuilder: (context, index) {
                    currentIndex = index;
                    return MedicationCell(
                        shouldOpenAllItems: shouldOpenAllItems ? 1 : 2,
                        data: Constants.medicationList[index],index:index,bloc :_medicationBloc);
                  },
                )
                    : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage(Medicine_empty),
                      height: 90,
                      width: 90,
                    ),
                    Text(
                      Strings.empty(),
                      style: TextStyle(
                          fontFamily: boldFontFamily,
                          color: defaultBackgroundColor,
                          fontSize: 24),
                    ),
                  ],
                ),
              ),

          ),
            ],
          ),
        );


         },
        ),
        ),

      ),
    );
  }
}
