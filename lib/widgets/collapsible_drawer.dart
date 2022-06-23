import 'package:flutter/material.dart';
import 'package:flutter_navi_bar_ex/color/material_color.dart';
import 'package:flutter_navi_bar_ex/model/navigation_model.dart';
import 'package:flutter_navi_bar_ex/screens/card_details_screen.dart';
import 'package:flutter_navi_bar_ex/screens/home_screen.dart';
import 'package:flutter_navi_bar_ex/screens/transactions_screen.dart';
import 'package:flutter_navi_bar_ex/utils/text_styles.dart';
import '../screens/choose_screen.dart';
import 'collapsing_list_tile.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  final bool? isSimple;
  final bool? isHidden;
  final bool? isCollapse;
  final bool? isMultilevel;
  final int? collapseSelectedIndex;
  const CollapsingNavigationDrawer(
      {Key? key,
      this.isSimple,
      this.isHidden,
      this.isCollapse,
      this.isMultilevel,
      this.collapseSelectedIndex})
      : super(key: key);
  @override
  CollapsingNavigationDrawerState createState() {
    return CollapsingNavigationDrawerState();
  }
}

class CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 210;
  double minWidth = 70;
  bool isCollapsed = false;
  bool isLogoutCollapsed = false;
  AnimationController? _animationController;
  Animation<double>? widthAnimation;
  int currentSelectedIndex = 0;

  @override
  void initState() {
    super.initState();
    print("widget.isSimple is ${widget.isSimple}");
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController!);
    print("widget.collapseSelectedIndex is ${widget.collapseSelectedIndex}");
    if (widget.collapseSelectedIndex != null) {
      currentSelectedIndex = widget.collapseSelectedIndex!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, widgets) => getWidget(context, widgets),
    );
  }

  Widget getWidget(context, widgets) {
    return Material(
      elevation: 80.0,
      child: Container(
        width: widthAnimation!.value,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  //Expanded(
                  //child:
                  Flexible(
                    child: Container(
                      height: 100,
                      color: createMaterialColor(Color(0xFF161d3a)),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                )),
                          ),
                          Flexible(
                            child: Container(
                                width: 60.0,
                                height: 60.0,
                                child: Image(
                                  image: AssetImage("assets/images/user.png"),
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          (widthAnimation!.value >= 190)
                              ? Flexible(
                                  child: Text(
                                    "Ayana",
                                    style: AppTextStyles.mediumWhiteTextStyle,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                  //),
                  Divider(
                    color: Colors.white,
                  ),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, counter) {
                        return Divider(color: Colors.white, height: 12.0);
                      },
                      itemBuilder: (context, counter) {
                        return CollapsingListTile(
                          onTap: () {
                            setState(() {
                              currentSelectedIndex = counter;
                              print(
                                  "currentSelectedIndex is $currentSelectedIndex");
                              //print("widget.isSimple is ${isSimple}");
                            });
                            if (currentSelectedIndex == 0) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen(
                                            isSimple: widget.isSimple,
                                            isHidden: widget.isHidden,
                                            isCollapse: widget.isCollapse,
                                            isMultilevel: widget.isMultilevel,
                                            collapsibleSelectedIndex:
                                                currentSelectedIndex,
                                          )));
                            }
                            if (currentSelectedIndex == 1) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TransactionsScreen(
                                            isSimple: widget.isSimple,
                                            isHidden: widget.isHidden,
                                            isCollapse: widget.isCollapse,
                                            isMultilevel: widget.isMultilevel,
                                            collapsibleSelectedIndex:
                                                currentSelectedIndex,
                                          )));
                            }
                            if (currentSelectedIndex == 2) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CardDetailsScreen(
                                            isSimple: widget.isSimple,
                                            isHidden: widget.isHidden,
                                            isCollapse: widget.isCollapse,
                                            isMultilevel: widget.isMultilevel,
                                            collapsibleSelectedIndex:
                                                currentSelectedIndex,
                                          )));
                            }
                          },
                          isSelected: currentSelectedIndex == counter,
                          title: navigationItems[counter].title!,
                          icon: navigationItems[counter].icon!,
                          animationController: _animationController!,
                        );
                      },
                      itemCount: navigationItems.length,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                key: const ObjectKey(3),
                dense: true,
                minLeadingWidth: 10,
                contentPadding: EdgeInsets.fromLTRB(22, 0, 0, 0),
                title: isLogoutCollapsed == false ? Text(
                  "Logout",
                  style: AppTextStyles.mediumBlackkTextStyle,
                ) : Text(
                  " ",
                  style: AppTextStyles.mediumBlackkTextStyle,
                ),
                leading: Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                onTap: () {
                  setState(() {
                    setState(() {
                      isLogoutCollapsed = !isLogoutCollapsed;
                      isLogoutCollapsed
                          ? _animationController!.forward()
                          : _animationController!.reverse();
                    });
                  });

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => ChooseScreen()),
                      (Route<dynamic> route) => false);
                      isLogoutCollapsed = false;
                },
                selectedTileColor: Colors.grey[300],
                //selected: selectedTile == 3,
              ),
            ),
            Container(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: InkWell(
                  onTap: () {
                    setState(() {
                       isLogoutCollapsed = !isLogoutCollapsed;
                      isCollapsed = !isCollapsed;
                      isCollapsed
                          ? _animationController!.forward()
                          : _animationController!.reverse();
                    });
                  },
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: AnimatedIcon(
                      icon: AnimatedIcons.close_menu,
                      progress: _animationController!,
                      color: Colors.black,
                      size: 25.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
