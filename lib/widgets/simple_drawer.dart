import 'package:flutter/material.dart';
import 'package:flutter_navi_bar_ex/color/material_color.dart';
import 'package:flutter_navi_bar_ex/screens/card_details_screen.dart';
import 'package:flutter_navi_bar_ex/screens/choose_screen.dart';
import 'package:flutter_navi_bar_ex/screens/home_screen.dart';
import 'package:flutter_navi_bar_ex/screens/transactions_screen.dart';
import 'package:flutter_navi_bar_ex/utils/text_styles.dart';

class SimpleDrawer extends StatefulWidget {
  final bool? isSimple;
  final bool? isHidden;
  final int? selectedIndex;
  const SimpleDrawer(
      {Key? key, this.isSimple, this.isHidden, this.selectedIndex})
      : super(key: key);
  @override
  _SimpleDrawerState createState() => _SimpleDrawerState();
}

class _SimpleDrawerState extends State<SimpleDrawer> {
  int selectedTile = 0;

  void selectTile(int index) {
    setState(() {
      selectedTile = index;
      print("selectedTile is $selectedTile");
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.selectedIndex != null) {
      selectedTile = widget.selectedIndex!;
    }
  }

  @override
  Widget build(BuildContext context) {
    //int _selectedTile = 0;
    return Drawer(
      child: Column(
        children: <Widget>[
          InkWell(
            child: DrawerHeader(
              decoration: BoxDecoration(
                  color: createMaterialColor(const Color(0xFF161d3a))),
              child: Row(
                children: <Widget>[
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
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
                  SizedBox(
                    width: 10,
                  ),
                  Text("Ayana", style: AppTextStyles.boldWhiteSmallTextStyle),
                ],
              ),
              //),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            key: const ObjectKey(0),
            dense: true,
            contentPadding: EdgeInsets.fromLTRB(22, 0, 0, 0),
            minLeadingWidth: 10,
            title: Text(
              "Home",
              style: AppTextStyles.mediumBlackkTextStyle,
            ),
            leading: Icon(
              Icons.home,
              color: Colors.black,
            ),
            onTap: () {
              setState(() {
                selectTile(0);
              });

              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeScreen(
                          selectedIndex: selectedTile,
                          isSimple: widget.isSimple,
                          isHidden: widget.isHidden)));
            },
            selectedTileColor: Colors.grey[300],
            selected: selectedTile == 0,
            //tileColor:  ,
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
            key: const ObjectKey(1),
            dense: true,
            minLeadingWidth: 10,
            contentPadding: EdgeInsets.fromLTRB(22, 0, 0, 0),
            title: Text(
              "Transactions",
              style: AppTextStyles.mediumBlackkTextStyle,
            ),
            leading: Icon(
              Icons.filter_list_outlined,
              color: Colors.black,
            ),
            onTap: () {
              setState(() {
                selectTile(1);
              });

              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TransactionsScreen(
                          selectedIndex: selectedTile,
                          isSimple: widget.isSimple,
                          isHidden: widget.isHidden)));
            },
            selected: selectedTile == 1,
            selectedTileColor: Colors.grey[300],
          ),
          const Divider(
            color: Colors.white,
          ),
          ListTile(
            key: const ObjectKey(2),
            dense: true,
            minLeadingWidth: 10,
            contentPadding: EdgeInsets.fromLTRB(22, 0, 0, 0),
            title: Text(
              "Card Details",
              style: AppTextStyles.mediumBlackkTextStyle,
            ),
            leading: Icon(
              Icons.credit_card,
              color: Colors.black,
            ),
            onTap: () {
              setState(() {
                selectTile(2);
              });

              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CardDetailsScreen(
                          selectedIndex: selectedTile,
                          isSimple: widget.isSimple,
                          isHidden: widget.isHidden)));
            },
            selectedTileColor: Colors.grey[300],
            selected: selectedTile == 2,
          ),
          const Divider(
            color: Colors.white,
          ),
          Spacer(),
          ListTile(
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
                  MaterialPageRoute(builder: (context) => ChooseScreen()),
                  (Route<dynamic> route) => false);
            },
            selectedTileColor: Colors.grey[300],
            selected: selectedTile == 3,
          ),
          SizedBox(
            height: 20,
          ),
        
        ],
      ),
    );
  }
}
