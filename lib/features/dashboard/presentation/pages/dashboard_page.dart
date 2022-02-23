import 'package:easy2know_flutter/features/dashboard/presentation/manager/dashboard_bloc/dashboard.dart';
import 'package:easy2know_flutter/features/dashboard/presentation/manager/queries_bloc/dashboard_queries.dart';
import 'package:easy2know_flutter/features/dashboard/presentation/widgets/dashboard_drawer.dart';
import 'package:easy2know_flutter/features/dashboard/presentation/widgets/queries/queries_widget.dart';
import 'package:easy2know_flutter/features/dashboard/presentation/widgets/sentiment_by_source_widget.dart';
import 'package:easy2know_flutter/features/home/presentation/manager/topics_bloc/topics_bloc.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatefulWidget {
  static const namedRout = '/dashboardPage';

  final int topicListIndex;

  DashboardPage({Key key, @required this.topicListIndex}) : super(key: key);

  @override
  _DashboardPageState createState() =>
      _DashboardPageState(topicListIndex: topicListIndex);
}

class _DashboardPageState extends State<DashboardPage> {
  final int topicListIndex;

  _DashboardPageState({@required this.topicListIndex});

  @override
  void dispose() {
    indexController.close();
    super.dispose();
  }

  PageController pageController = PageController(initialPage: 0);
  StreamController<int> indexController = StreamController<int>.broadcast();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DashboardBloc(
            topicsBloc: BlocProvider.of<TopicsBloc>(context),
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        drawer: DashboardDrawer(),
        body: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if (state is DataLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is DataLoaded) {
              return Center(
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    indexController.add(index);
                  },
                  controller: pageController,
                  children: <Widget>[
                    SentimentBySourceWidget(
                      topicName: state.topics.elementAt(topicListIndex).name,
                    ),
                    Center(
                      child: Text('Top Authors'),
                    ),
                    BlocProvider(
                      create: (context) => DashboardQueriesBloc(
                          dashboardBloc:
                              BlocProvider.of<DashboardBloc>(context)),
                      child: QueriesWidget(),
                    ),
                    Center(
                      child: Text('User'),
                    ),
                    Center(
                      child: Text('Security'),
                    ),
                    Center(
                      child: Text('Message'),
                    ),
                  ],
                ),
              );
            }
            if (state is DataEmpty) {
              return Center(
                child: Text('Error'),
              );
            }
            return Center(
              child: Text(''),
            );
          },
        ),
        bottomNavigationBar: StreamBuilder<Object>(
            initialData: 0,
            stream: indexController.stream,
            builder: (context, snapshot) {
              int cIndex = snapshot.data;
              return BottomNavigation(
                currentIndex: cIndex,
                items: <BottomNavigationItem>[
                  BottomNavigationItem(
                      icon: Icon(Icons.event),
                      title: Text('Sentiment by source')),
                  BottomNavigationItem(
                      icon: Icon(Icons.settings), title: Text('Top Authors')),
                  BottomNavigationItem(
                      icon: Icon(Icons.home), title: Text('Queries')),
                  BottomNavigationItem(
                      icon: Icon(Icons.person), title: Text('User')),
                  BottomNavigationItem(
                      icon: Icon(Icons.security), title: Text('Security')),
                  BottomNavigationItem(
                      icon: Icon(Icons.message), title: Text('Message')),
                ],
                onItemSelected: (int value) {
                  indexController.add(value);
                  pageController.jumpToPage(value);
                },
              );
            }),
      ),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  final int currentIndex;
  final double iconSize;
  final Color activeColor;
  final Color inactiveColor;
  final Color backgroundColor;
  final List<BottomNavigationItem> items;
  final ValueChanged<int> onItemSelected;

  BottomNavigation(
      {Key key,
      this.currentIndex = 0,
      this.iconSize = 24,
      this.activeColor,
      this.inactiveColor,
      this.backgroundColor,
      @required this.items,
      @required this.onItemSelected}) {
    assert(items != null);
    assert(onItemSelected != null);
  }

  @override
  _BottomNavigationState createState() {
    return _BottomNavigationState(
        items: items,
        backgroundColor: backgroundColor,
        currentIndex: currentIndex,
        iconSize: iconSize,
        activeColor: activeColor,
        inactiveColor: inactiveColor,
        onItemSelected: onItemSelected);
  }
}

class _BottomNavigationState extends State<BottomNavigation> {
  final int currentIndex;
  final double iconSize;
  Color activeColor;
  Color inactiveColor;
  Color backgroundColor;
  List<BottomNavigationItem> items;
  int _selectedIndex;
  ValueChanged<int> onItemSelected;

  _BottomNavigationState(
      {@required this.items,
      this.currentIndex,
      this.activeColor,
      this.inactiveColor = Colors.black,
      this.backgroundColor,
      this.iconSize,
      @required this.onItemSelected}) {
    _selectedIndex = currentIndex;
  }

  Widget _buildItem(BottomNavigationItem item, bool isSelected) {
    return AnimatedContainer(
      width: isSelected ? 124 : 50,
      height: double.maxFinite,
      duration: Duration(milliseconds: 250),
      padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
      decoration: !isSelected
          ? null
          : BoxDecoration(
              color: activeColor,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(0),
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconTheme(
                  data: IconThemeData(
                      size: iconSize,
                      color: isSelected ? backgroundColor : inactiveColor),
                  child: item.icon,
                ),
              ),
              isSelected
                  ? DefaultTextStyle.merge(
                      style: TextStyle(color: backgroundColor),
                      child: item.title,
                    )
                  : SizedBox.shrink()
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    activeColor =
        (activeColor == null) ? Theme.of(context).accentColor : activeColor;

    backgroundColor = (backgroundColor == null)
        ? Theme.of(context).bottomAppBarColor
        : backgroundColor;

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 56,
      padding: EdgeInsets.only(left: 8, right: 8, top: 6, bottom: 6),
      decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item) {
          var index = items.indexOf(item);
          return GestureDetector(
            onTap: () {
              onItemSelected(index);

              setState(() {
                _selectedIndex = index;
              });
            },
            child: _buildItem(item, _selectedIndex == index),
          );
        }).toList(),
      ),
    );
  }
}

class BottomNavigationItem {
  final Icon icon;
  final Text title;

  BottomNavigationItem({
    @required this.icon,
    @required this.title,
  }) {
    assert(icon != null);
    assert(title != null);
  }
}
