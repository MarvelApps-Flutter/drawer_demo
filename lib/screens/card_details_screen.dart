import 'package:flutter/material.dart';
import 'package:flutter_navi_bar_ex/color/material_color.dart';
import 'package:flutter_navi_bar_ex/model/card_model.dart';
import 'package:flutter_navi_bar_ex/utils/text_styles.dart';
import 'package:flutter_navi_bar_ex/widgets/card_item.dart';
import 'package:flutter_navi_bar_ex/widgets/collapsible_drawer.dart';
import 'package:flutter_navi_bar_ex/widgets/simple_drawer.dart';
import '../widgets/multilevel_menu_drawer.dart';

class CardDetailsScreen extends StatelessWidget {
  final bool? isSimple;
  final bool? isHidden;
  final bool? isCollapse;
  final bool? isMultilevel;
  final int? selectedIndex;
  final int? multilevelSelectedIndex;
  final int? collapsibleSelectedIndex;
  const CardDetailsScreen({Key? key, this.isSimple, this.isHidden, this.isCollapse, this.isMultilevel, this.selectedIndex, this.multilevelSelectedIndex, this.collapsibleSelectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: createMaterialColor(const Color(0xFF333a54)),
      appBar : isHidden == false ? buildAppBar() : null,
      drawer:(isSimple == true)
          ? SimpleDrawer(
        isSimple: isSimple,
        isHidden: isHidden,
        selectedIndex: selectedIndex,
      )
          : (isMultilevel == true)
          ? MultilevelDrawer(
        isSimple: isSimple,
        isHidden: isHidden,
        isMultilevel: isMultilevel,
        multilevelSelectedIndex: multilevelSelectedIndex,

      )
          : (isCollapse == true)
          ? CollapsingNavigationDrawer(
          isSimple : isSimple,
          isHidden : isHidden,
          isCollapse : isCollapse,
          isMultilevel : isMultilevel,
        collapseSelectedIndex: collapsibleSelectedIndex,
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
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 20,
                  );
                },
                shrinkWrap: true,
                itemCount: cardsList.length,
                itemBuilder: (context, index) {
                  return CardItem(
                    card: cardsList[index],
                  );
                }),
          ),
        ),
      ],
    );
  }

  AppBar buildAppBar()
  {
    return AppBar(
      elevation: 0,
      backgroundColor: createMaterialColor(const Color(0xFF333a54)),
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      title: const Text("Card Details",
          style: AppTextStyles.mediumWhiteLargeTextStyle),
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
                    Icons.credit_card,
                    color: Colors.black,
                  ))),
        ),
      ],
    );
  }
}