import 'package:flutter/material.dart';
import './request_screen.dart';
import './offer_screen.dart';
import './transaction_screen.dart';
import './akun_screen.dart';
import '../screens/loginPage.dart';
import 'package:pinjemin/assets/fonts/custom_icons.dart';

class MainScreen extends StatefulWidget {
  static String tag = 'main-screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 4;
  bool isInLogin = true;

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          final isFirstRouteInCurrentTab =
              !await _navigatorKeys[_selectedIndex].currentState.maybePop();

          print('isFirstRouteInCurrentTab: ' +
              isFirstRouteInCurrentTab.toString());

          // let system handle back button if we're on the first route
          return isFirstRouteInCurrentTab;
        },
        child: isInLogin
            ? Scaffold(
                body: Stack(
                  children: <Widget>[_buildOffstageNavigator(4)],
                ),
              )
            : Scaffold(
                body: Stack(
                  children: [
                    _buildOffstageNavigator(0),
                    _buildOffstageNavigator(1),
                    _buildOffstageNavigator(2),
                    _buildOffstageNavigator(3)
                  ],
                ),
                bottomNavigationBar: Theme(
                  data: Theme.of(context).copyWith(
                      // sets the background color of the `BottomNavigationBar`
                      canvasColor: Colors.white,
                      // sets the active color of the `BottomNavigationBar` if `Brightness` is light
                      primaryColor: Color.fromARGB(255, 255, 119, 0),
                      textTheme: Theme.of(context).textTheme.copyWith(
                          caption: new TextStyle(
                              color: Colors
                                  .grey))), // sets the inactive color of the `BottomNavigationBar`
                  child: new BottomNavigationBar(
                    currentIndex: _selectedIndex,
                    type: BottomNavigationBarType.fixed,
                    items: [
                      new BottomNavigationBarItem(
                        icon: Icon(Custom.iconrequest),
                        title: Text('Permintaan'),
                      ),
                      new BottomNavigationBarItem(
                        icon: Icon(Custom.iconoffer),
                        title: Text('Penawaran'),
                      ),
                      new BottomNavigationBarItem(
                          icon: Icon(Icons.receipt), title: Text('Transaksi')),
                      new BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        title: Text('Akun'),
                      )
                    ],
                    onTap: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
                )));
  }

  void _toLogout() {
    setState(() {
      isInLogin = true;
      _selectedIndex = 4;
    });
  }

  void _toHome() {
    setState(() {
      isInLogin = false;
      _selectedIndex = 0;
    });
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          RequestScreen(),
          OfferScreen(),
          TransactionScreen(),
          AkunScreen(toLogin: _toLogout),
          LoginScreen(toHome: _toHome)
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name](context),
          );
        },
      ),
    );
  }
}
