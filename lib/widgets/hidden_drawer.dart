import 'package:flutter/material.dart';
import 'package:flutter_navi_bar_ex/color/material_color.dart';
import 'package:flutter_navi_bar_ex/screens/card_details_screen.dart';
import 'package:flutter_navi_bar_ex/screens/home_screen.dart';
import 'package:flutter_navi_bar_ex/screens/transactions_screen.dart';
import 'package:flutter_navi_bar_ex/utils/text_styles.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

import '../screens/choose_screen.dart';

class HiddenDrawer extends StatelessWidget {
  const HiddenDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleHiddenDrawer(
      menu: Menu(),
      screenSelectedBuilder: (position, controller) {
        Widget? screenCurrent;
        switch (position) {
          case 0:
            screenCurrent = const HomeScreen();
            break;
          case 1:
            screenCurrent = const TransactionsScreen();
            break;
          case 2:
            screenCurrent = const CardDetailsScreen();
            break;
        }
        return Scaffold(
          appBar: buildAppBar(position, controller),
          body: screenCurrent,
        );
      },
    );
  }

  AppBar buildAppBar(int position, SimpleHiddenDrawerController controller) {
    return AppBar(
      backgroundColor: createMaterialColor(Color(0xFF333a54)),
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.menu),
        color: Colors.white,
        onPressed: () {
          controller.toggle();
        },
      ),
      centerTitle: true,
      title: (position == 0)
          ? Text("Home", style: AppTextStyles.mediumWhiteLargeTextStyle)
          : (position == 1)
              ? Text("Transactions",
                  style: AppTextStyles.mediumWhiteLargeTextStyle)
              : (position == 2)
                  ? Text("Card Details",
                      style: AppTextStyles.mediumWhiteLargeTextStyle)
                  : null,
      actions: [
        (position == 0)
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                        radius: 17,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.home,
                          color: Colors.black,
                        ))),
              )
            : (position == 1)
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                            radius: 17,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.filter_list_outlined,
                              color: Colors.black,
                            ))),
                  )
                : (position == 2)
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                            radius: 18,
                            backgroundColor: Colors.grey,
                            child: CircleAvatar(
                                radius: 17,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.credit_card,
                                  color: Colors.black,
                                ))),
                      )
                    : Container(),
      ],
    );
  }
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late SimpleHiddenDrawerController _controller;
  int selectedTile = 0;

  void selectTile(int index) {
    setState(() {
      selectedTile = index;
      print("selectedTile is $selectedTile");
    });
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _controller = SimpleHiddenDrawerController.of(context);
    _controller.addListener(() {
      if (_controller.state == MenuState.open) {
        _animationController.forward();
      }

      if (_controller.state == MenuState.closing) {
        _animationController.reverse();
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
          child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          elevation: 0,
          leadingWidth: 20,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 20,
              )),
          title: Row(
            children: <Widget>[
              Container(
                  width: 60.0,
                  height: 60.0,
                  child: Image(
                    image: AssetImage("assets/images/user.png"),
                  )),
              SizedBox(
                width: 10,
              ),
              Text("Ayana", style: AppTextStyles.boldWhiteSmallTextStyle),
              //Text("user@gmail.com",style: AppTextStyles.mediumWhiteTextStyle,)
            ],
          ),
          flexibleSpace: Container(
            decoration:
                BoxDecoration(color: createMaterialColor(Color(0xFF161d3a))),
          ),
        ),
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          // color: Colors.white,
          // decoration:
          //     BoxDecoration(color: createMaterialColor(Color(0xFF161d3a))),
          child: Stack(
            children: <Widget>[
              FadeTransition(
                opacity: _animationController,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Material(
                        //color: createMaterialColor(Color(0xFF161d3a)),
                        child: ListTile(
                          dense: true,
                          contentPadding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                          minLeadingWidth: 10,
                          title: Text(
                            "Home",
                            style: AppTextStyles.mediumBlackkTextStyle,
                          ),
                          selectedTileColor: Colors.grey[300],
                          selected: selectedTile == 0,
                          leading: Icon(
                            Icons.home,
                            color: Colors.black,
                          ),
                          onTap: () {
                            setState(() {
                              selectTile(0);
                            });
                            _controller.setSelectedMenuPosition(0);
                          },
                          //selected: true,
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      Material(
                        //color: createMaterialColor(Color(0xFF161d3a)),
                        child: ListTile(
                          dense: true,
                          minLeadingWidth: 10,
                          contentPadding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                          title: Text(
                            "Transactions",
                            style: AppTextStyles.mediumBlackkTextStyle,
                          ),
                          leading: Icon(
                            Icons.filter_list_outlined,
                            color: Colors.black,
                          ),
                          selectedTileColor: Colors.grey[300],
                          selected: selectedTile == 1,
                          onTap: () {
                            setState(() {
                              selectTile(1);
                            });
                            _controller.setSelectedMenuPosition(1);
                          },
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      Material(
                        //color: createMaterialColor(Color(0xFF161d3a)),
                        child: ListTile(
                          dense: true,
                          minLeadingWidth: 10,
                          contentPadding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                          title: Text(
                            "Card Details",
                            style: AppTextStyles.mediumBlackkTextStyle,
                          ),
                          leading: Icon(
                            Icons.credit_card,
                            color: Colors.black,
                          ),
                          selectedTileColor: Colors.grey[300],
                          selected: selectedTile == 2,
                          onTap: () {
                            setState(() {
                              selectTile(2);
                            });
                            _controller.setSelectedMenuPosition(2);
                          },
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      Spacer(),
                      Material(
                        child: ListTile(
                          key: const ObjectKey(3),
                          dense: true,
                          minLeadingWidth: 10,
                          contentPadding: EdgeInsets.fromLTRB(22, 0, 0, 0),
                          title: Text(
                            "Logout",
                            style: AppTextStyles.mediumBlackkTextStyle,
                          ),
                          leading: Icon(
                            Icons.logout,
                            color: Colors.black,
                          ),
                          onTap: () {
                            setState(() {
                              selectTile(3);
                            });

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChooseScreen()),
                                (Route<dynamic> route) => false);
                          },
                          selectedTileColor: Colors.grey[300],
                          selected: selectedTile == 3,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
