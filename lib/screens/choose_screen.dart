import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navi_bar_ex/model/base_landing_model.dart';
import 'package:flutter_navi_bar_ex/utils/text_styles.dart';
import 'package:flutter_navi_bar_ex/widgets/hidden_drawer.dart';
import 'home_screen.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({Key? key}) : super(key: key);

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  bool isSimple = false;
  bool isHidden = false;
  bool isCollapse = false;
  bool isMultilevel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: buildBody());
  }

  Widget buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 15,
              ),
              buildTopHeader(),
              Container(
                height: MediaQuery.of(context).size.height * .36,
                width: MediaQuery.of(context).size.width * 0.70,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/header.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              buildLandingList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTopHeader() {
    return const Align(
      alignment: Alignment.center,
      child: Text(
        'Choose Drawer',
        style: AppTextStyles.mediumBlackTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildLandingList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: baseLandingList.length,
        itemBuilder: (context, index) {
          return buildLandingItem(index, baseLandingList);
        });
  }

  Widget buildLandingItem(int index, List<BaseLandingListModel> landingList) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(4, 5, 4, 5),
        child: InkWell(
          splashColor: landingList[index].colors!,
          child: Card(
              color: landingList[index].colors!,
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      landingList[index].text!,
                      style: AppTextStyles.mediumWhiteTextStyle,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
              )),
          onTap: () {
            if (landingList[index].text == "Hidden Drawer") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HiddenDrawer(),
                ),
              );
            }
            if (landingList[index].text == "Simple Drawer") {
              setState(() {
                isSimple = true;
                isHidden = false;
                isCollapse = false;
                isMultilevel = false;
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      HomeScreen(isSimple: isSimple, isHidden: isHidden, isCollapse : isCollapse , isMultilevel: isMultilevel,),
                ),
              );
            }

            if (landingList[index].text == "Multilevel Drawer") {
              setState(() {
                isSimple = false;
                isHidden = false;
                isCollapse = false;
                isMultilevel = true;
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        HomeScreen(isSimple: isSimple, isHidden: isHidden, isCollapse : isCollapse, isMultilevel: isMultilevel,)),
              );
            }

            if (landingList[index].text == "Collapsible Drawer") {
              setState(() {
                isSimple = false;
                isHidden = false;
                isCollapse = true;
                isMultilevel = false;
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        HomeScreen(isSimple: isSimple, isHidden: isHidden, isCollapse : isCollapse , isMultilevel: isMultilevel,)),
              );

              //CollapsibleScreen
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //       builder: (context) =>
              //           CollapsibleScreen()),
              // );
            }
          },
        ));
  }
}
