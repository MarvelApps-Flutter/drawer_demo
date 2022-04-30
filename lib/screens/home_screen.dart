import 'package:flutter/material.dart';
import 'package:flutter_navi_bar_ex/color/material_color.dart';
import 'package:flutter_navi_bar_ex/model/list_model.dart';
import 'package:flutter_navi_bar_ex/model/transaction_model.dart';
import 'package:flutter_navi_bar_ex/model/user_profile_model.dart';
import 'package:flutter_navi_bar_ex/screens/transactions_screen.dart';
import 'package:flutter_navi_bar_ex/utils/text_styles.dart';
import 'package:flutter_navi_bar_ex/widgets/collapsible_drawer.dart';
import 'package:flutter_navi_bar_ex/widgets/multilevel_menu_drawer.dart';
import 'package:flutter_navi_bar_ex/widgets/simple_drawer.dart';

class HomeScreen extends StatefulWidget {
  final bool? isSimple;
  final bool? isHidden;
  final bool? isCollapse;
  final bool? isMultilevel;
  final int? selectedIndex;
  final int? multilevelSelectedIndex;
  final int? collapsibleSelectedIndex;
  const HomeScreen(
      {Key? key,
      this.isSimple,
      this.isHidden,
      this.isCollapse,
      this.isMultilevel,
      this.selectedIndex,
      this.multilevelSelectedIndex,
      this.collapsibleSelectedIndex})
      : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Size? size;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        backgroundColor: createMaterialColor(const Color(0xFF333a54)),
        appBar: widget.isHidden == false ? buildAppBar() : null,
        body: body(),
      ),
    );
  }

  Widget body() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 10),
                buildBalanceCard(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverToBoxAdapter(
              child: SizedBox(
            height: 130,
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 8);
                },
                itemCount: list.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return buildItem(index, list);
                }),
          )),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                const SizedBox(height: 10),
                Container(
                    padding: const EdgeInsets.only(left: 8),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Send Again",
                      style: AppTextStyles.boldBigWhiteTextStyle,
                    )),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverToBoxAdapter(
              child: SizedBox(
            height: 90,
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(width: 20);
                },
                itemCount: userProfile.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: buildSearchItem(),
                        ),
                        Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: buildUserProfile(index, userProfile))
                      ],
                    );
                  } else {
                    return Container(
                        margin: const EdgeInsets.only(right: 15),
                        child: buildUserProfile(index, userProfile));
                  }
                }),
          )),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Recent Transactions",
                          style: AppTextStyles.boldBigWhiteTextStyle,
                        ),
                        Expanded(
                            child: InkWell(
                          child: Container(
                              alignment: Alignment.centerRight,
                              child: const Text(
                                "View All",
                                style: AppTextStyles.lightWhiteLargeTextStyle,
                              )),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const TransactionsScreen()));
                          },
                        )),
                        const SizedBox(
                          width: 3,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: Colors.white,
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 0),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
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
      height: MediaQuery.of(context).size.height * 45,
      width: MediaQuery.of(context).size.width * 0.3,
      child: Card(
        semanticContainer: true,
        color: list[index].colors,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Colors.grey, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                child: list[index].icons,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(list[index].text!,
                  style: AppTextStyles.boldBlackSmallTextStyle),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchItem() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 0, 15, 0),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.shade300,
            child: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          "Search",
          style: AppTextStyles.lightWhiteLargeTextStyle,
        )
      ],
    );
  }

  Widget buildUserProfile(index, List<UserProfileModel> userProfile) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey,
          backgroundImage: AssetImage(userProfile[index].image!),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          userProfile[index].name!,
          style: AppTextStyles.lightWhiteLargeTextStyle,
        )
      ],
    );
  }

  Widget buildBalanceCard() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 120,
          width: double.infinity,
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "Your Balance",
                        style: AppTextStyles.lightTextStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Rs.30,000",
                        style: AppTextStyles.boldSmallTextStyle,
                      ),
                    ],
                  ),
                ),
                const Image(
                    image: AssetImage("assets/images/bank.jpg"), width: 120)
              ],
            ),
          ),
        ),
        Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all()),
                child: Icon(Icons.add)))
      ],
    );
  }

  Widget buildTransactionItem(
      int index, List<TransactionModel> transactionList) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 23,
                backgroundImage: AssetImage(transactionList[index].icon!),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(width: 20),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        transactionList[index].name!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.boldBlackSmallTextStyle,
                      )),
                      const SizedBox(width: 5),
                      Text(
                        transactionList[index].amount!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.boldBlackSmallTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(transactionList[index].time!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.lightGreyBigTextStyle),
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

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: createMaterialColor(const Color(0xFF333a54)),
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: true,
      title: const Text("Home", style: AppTextStyles.mediumWhiteLargeTextStyle),
      actions: const [
        Padding(
          padding: EdgeInsets.all(8.0),
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
        ),
      ],
    );
  }
}
