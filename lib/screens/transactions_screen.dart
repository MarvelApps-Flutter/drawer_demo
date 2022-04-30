import 'package:flutter/material.dart';
import 'package:flutter_navi_bar_ex/color/material_color.dart';
import 'package:flutter_navi_bar_ex/model/list_model.dart';
import 'package:flutter_navi_bar_ex/model/transaction_model.dart';
import 'package:flutter_navi_bar_ex/utils/text_styles.dart';
import 'package:flutter_navi_bar_ex/widgets/collapsible_drawer.dart';
import 'package:flutter_navi_bar_ex/widgets/simple_drawer.dart';
import '../widgets/multilevel_menu_drawer.dart';

class TransactionsScreen extends StatefulWidget {
  final bool? isSimple;
  final bool? isHidden;
  final bool? isCollapse;
  final bool? isMultilevel;
  final int? selectedIndex;
  final int? multilevelSelectedIndex;
  final int? collapsibleSelectedIndex;
  const TransactionsScreen({Key? key, this.isSimple, this.isHidden, this.isCollapse, this.isMultilevel, this.selectedIndex, this.multilevelSelectedIndex, this.collapsibleSelectedIndex}) : super(key: key);

  @override
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: createMaterialColor(Color(0xFF333a54)),
      appBar : widget.isHidden == false ? buildAppBar() : null,
      drawer: (widget.isSimple == true)
          ? SimpleDrawer(
        isSimple: widget.isSimple,
        isHidden: widget.isHidden,
        selectedIndex: widget.selectedIndex,
      )
          : (widget.isMultilevel == true)
          ? MultilevelDrawer(
        isSimple: widget.isSimple,
        isHidden: widget.isHidden,
        isMultilevel: widget.isMultilevel,
        multilevelSelectedIndex: widget.multilevelSelectedIndex,
      )
          : (widget.isCollapse == true)
          ? CollapsingNavigationDrawer(
          isSimple : widget.isSimple,
          isHidden : widget.isHidden,
          isCollapse : widget.isCollapse,
          isMultilevel : widget.isMultilevel,
        collapseSelectedIndex: widget.collapsibleSelectedIndex,
      )
          : null,
      body: body(),
    );
  }

  Widget body() {
    return CustomScrollView(
      slivers: <Widget>[
       SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 10, 8, 0),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: transactionList.length,
                itemBuilder: (context, index) {
                  return buildTransactionItem(index, transactionList);
                }),
          ),
        ),
      ],
    );
  }

  Widget buildItem(int index, List<ListModel> list) {
    return Container(
      height: 130,
      width: 110,
      child: Card(
        //elevation: 10,
        semanticContainer: true,
        color: list[index].colors,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: list[index].icons,
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                list[index].text!,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTransactionItem(
      int index, List<TransactionModel> transactionList) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(height: 2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 23,
                backgroundImage: AssetImage(transactionList[index].icon!),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(width: 20),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                              child: Text(transactionList[index].name!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.boldBlackSmallTextStyle,))),
                      SizedBox(width: 5),
                      Container(
                          child: Text(transactionList[index].amount!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.boldBlackSmallTextStyle,))
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                          child: Text(transactionList[index].time!,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  AppTextStyles.lightGreyBigTextStyle)),
                    ],
                  ),
                ],
              )),
            ],
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar()
  {
    return AppBar(
      backgroundColor: createMaterialColor(Color(0xFF333a54)),
      iconTheme: IconThemeData(color: Colors.white),
      elevation: 0,
      centerTitle: true,
      title: Text("Transactions",
          style: AppTextStyles.mediumWhiteLargeTextStyle),
      actions: [
        Padding(
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
        ),
      ],
    );
  }
}
