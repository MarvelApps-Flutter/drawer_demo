import 'package:flutter/material.dart';
import 'package:flutter_navi_bar_ex/color/material_color.dart';
import 'package:flutter_navi_bar_ex/screens/card_details_screen.dart';
import 'package:flutter_navi_bar_ex/screens/home_screen.dart';
import 'package:flutter_navi_bar_ex/screens/transactions_screen.dart';
import 'package:flutter_navi_bar_ex/utils/text_styles.dart';

import '../screens/choose_screen.dart';

class MultilevelDrawer extends StatefulWidget {
  final bool? isSimple;
  final bool? isHidden;
  final bool? isMultilevel;
  final int? multilevelSelectedIndex;
  const MultilevelDrawer({Key? key, this.isSimple, this.isHidden, this.isMultilevel,this.multilevelSelectedIndex})
      : super(key: key);
  @override
  _MultilevelDrawerState createState() => _MultilevelDrawerState();
}

class _MultilevelDrawerState extends State<MultilevelDrawer> {
  int selectedTile = 0;
  bool isExpandedDashboardTextColor = false;
  bool isExpandedSettingsTextColor = false;
  void selectTile(int index) {
    setState(() {
      selectedTile = index;
      print("selectedTile is $selectedTile");
    });
  }

  @override
  void initState() {
    super.initState();
    print("widget.multilevelSelectedIndex is ${widget.multilevelSelectedIndex}");
    if(widget.multilevelSelectedIndex != null)
    {
      selectedTile = widget.multilevelSelectedIndex!;
      print("multilevelSelectedIndex is $selectedTile");
    }

  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          InkWell(
            child: DrawerHeader(
              decoration: BoxDecoration(
                  color: createMaterialColor(const Color(0xFF161d3a))
              ),
              child: Center(
                child: Row(
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20,
                        )),
                    Container(
                        width: 60.0,
                        height: 60.0,
                        child: Image(
                          image: AssetImage("assets/images/user.png"),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("Ayana", style: AppTextStyles.boldWhiteSmallTextStyle),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Theme(
            data: ThemeData().copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              leading: Icon(
              Icons.dashboard,
              color: Colors.black,
            ),
              title: isExpandedDashboardTextColor == true ? Text(
                "Dashboard",
                style: AppTextStyles.mediumRedTextStyle,
              ) : Text(
                "Dashboard",
                style: AppTextStyles.mediumBlackkTextStyle,
              ),
              textColor: Colors.black,
              iconColor: const Color(0xFFff735c),

              collapsedTextColor: Color(0xFFff735c),
              collapsedIconColor: Colors.black,
              onExpansionChanged: (value){
                setState(() {
                  if(value)
                    {
                      isExpandedDashboardTextColor = true;
                    }
                  else
                    {
                      isExpandedDashboardTextColor = false;
                    }
                });
              },
              children: <Widget>[
                ListTile(
                  dense: true,
                  minLeadingWidth: 10,
                  contentPadding: EdgeInsets.fromLTRB(22, 0, 0, 0),
                  title: const Text(
                    "Home",
                    style: AppTextStyles.mediumBlackkTextStyle,
                  ),
                  leading: const Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  selectedTileColor: Colors.grey[300],
                  selected: selectedTile == 0,
                  //tileColor: selectedTile == 0 ? Colors.grey[300] : null,
                  onTap: () {
                    setState(() {
                      selectTile(0);
                    });
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeScreen(
                              isSimple: widget.isSimple, isHidden: widget.isHidden, isMultilevel: widget.isMultilevel,multilevelSelectedIndex: selectedTile,)));
                  },
                ),
                ListTile(
                  dense: true,
                  minLeadingWidth: 10,
                  contentPadding: EdgeInsets.fromLTRB(22, 0, 0, 0),
                  title: const Text(
                    "Transactions",
                    style: AppTextStyles.mediumBlackkTextStyle,
                  ),
                  leading: const Icon(
                    Icons.filter_list_outlined,
                    color: Colors.black,
                  ),
                  selectedTileColor: Colors.grey[300],
                  selected: selectedTile == 1,
                  //tileColor: selectedTile == 1 ? Colors.grey[300] : null,
                  onTap: () {
                    setState(() {
                      selectTile(1);
                    });
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TransactionsScreen(
                              isSimple: widget.isSimple, isHidden: widget.isHidden, isMultilevel: widget.isMultilevel,multilevelSelectedIndex: selectedTile,)));
                  },
                ),
                ListTile(
                  dense: true,
                  minLeadingWidth: 10,
                  contentPadding: EdgeInsets.fromLTRB(22, 0, 0, 0),
                  title: const Text(
                    "Card Details",
                    style: AppTextStyles.mediumBlackkTextStyle,
                  ),
                  leading: const Icon(
                    Icons.credit_card,
                    color: Colors.black,
                  ),
                  selectedTileColor: Colors.grey[300],
                  selected: selectedTile == 2,
                  //tileColor: selectedTile == 2 ? Colors.grey[300] : null,
                  onTap: () {
                    setState(() {
                      selectTile(2);
                    });
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CardDetailsScreen(
                              isSimple: widget.isSimple, isHidden: widget.isHidden, isMultilevel: widget.isMultilevel,multilevelSelectedIndex: selectedTile,)));
                  },
                ),
              ],
            ),
          ),
          Theme(
            data: ThemeData().copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              leading: Icon(
              Icons.settings,
              color: Colors.black,
            ),
              title: isExpandedSettingsTextColor == true ? Text(
                "Settings",
                style: AppTextStyles.mediumRedTextStyle,
              ) : Text(
                "Settings",
                style: AppTextStyles.mediumBlackkTextStyle,
              ),
              textColor: Colors.black,
              iconColor: const Color(0xFFff735c),

              collapsedTextColor: Color(0xFFff735c),
              collapsedIconColor: Colors.black,
              onExpansionChanged: (value){
                setState(() {
                  if(value)
                  {
                    isExpandedSettingsTextColor = true;
                  }
                  else
                  {
                    isExpandedSettingsTextColor = false;
                  }
                });
              },
              children: <Widget>[
                ListTile(
                  dense: true,
                  minLeadingWidth: 10,
                  contentPadding: EdgeInsets.fromLTRB(22, 0, 0, 0),
                  title: const Text(
                    "Favourites",
                    style: AppTextStyles.mediumBlackkTextStyle,
                  ),
                  leading: const Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                  ),
                  selectedTileColor: Colors.grey[300],
                  selected: selectedTile == 4,
                  //tileColor: selectedTile == 0 ? Colors.grey[300] : null,
                  onTap: () {
                    setState(() {
                      selectTile(4);
                    });
                  },
                ),
                ListTile(
                  dense: true,
                  minLeadingWidth: 10,
                  contentPadding: EdgeInsets.fromLTRB(22, 0, 0, 0),
                  title: const Text(
                    "Workflow",
                    style: AppTextStyles.mediumBlackkTextStyle,
                  ),
                  leading: const Icon(
                    Icons.filter_list_outlined,
                    color: Colors.black,
                  ),
                  selectedTileColor: Colors.grey[300],
                  selected: selectedTile == 5,
                  //tileColor: selectedTile == 1 ? Colors.grey[300] : null,
                  onTap: () {
                    setState(() {
                      selectTile(5);
                    });
                   },
                ),
                ListTile(
                  dense: true,
                  minLeadingWidth: 10,
                  contentPadding: EdgeInsets.fromLTRB(22, 0, 0, 0),
                  title: const Text(
                    "Updates",
                    style: AppTextStyles.mediumBlackkTextStyle,
                  ),
                  leading: const Icon(
                    Icons.credit_card,
                    color: Colors.black,
                  ),
                  selectedTileColor: Colors.grey[300],
                  selected: selectedTile == 6,
                  //tileColor: selectedTile == 2 ? Colors.grey[300] : null,
                  onTap: () {
                    setState(() {
                      selectTile(6);
                    });
                   },
                ),
              ],
            ),
          ),
          Spacer(),
            ListTile(
            key: const ObjectKey(7),
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
                selectTile(7);
              });

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ChooseScreen()),
                  (Route<dynamic> route) => false);
            },
            selectedTileColor: Colors.grey[300],
            selected: selectedTile == 7,
          ),
          SizedBox(
            height: 20,
          ),
        
        ],
      ),
    );
  }
}
