import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navi_bar_ex/utils/text_styles.dart';

class CollapsingListTile extends StatefulWidget {
  final String? title;
  final IconData? icon;
  final AnimationController? animationController;
  final bool? isSelected;
  final Function()? onTap;

  CollapsingListTile(
      {this.title,
      this.icon,
      this.animationController,
      this.isSelected = false,
      this.onTap});

  @override
  _CollapsingListTileState createState() => _CollapsingListTileState();
}

class _CollapsingListTileState extends State<CollapsingListTile> {
  Animation<double>? widthAnimation, sizedBoxAnimation;

  @override
  void initState() {
    super.initState();
    widthAnimation =
        Tween<double>(begin: 200, end: 70).animate(widget.animationController!);
    sizedBoxAnimation =
        Tween<double>(begin: 10, end: 0).animate(widget.animationController!);
    print("widget.isSelected is ${widget.isSelected}");
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: widget.isSelected!
              ? Colors.grey[300]
              : Colors.transparent,
        ),
        width: widthAnimation!.value,
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 8.0),
        child:
        Row(
          children: <Widget>[
            widget.icon != null
                ? Padding(
                  padding: const EdgeInsets.fromLTRB(13.0,5,0,5),
                  child: Icon(
                      widget.icon,
                      color: Colors.black,
                      size: 25.0,
                    ),
                )
                : Flexible(
                  child: Row(
                        children: [
                          IconButton(
                               // padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 20,
                                )),
                           Flexible(
                             child: Container(
                                  width: 60.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  // padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Image(
                                    image: AssetImage("assets/images/user.png"),
                                  )),
                           ),

                        ],
                      ),
                ),
            SizedBox(width: sizedBoxAnimation!.value),
            (widthAnimation!.value >= 190)
                ? (widget.icon != null
                    ? Text(
                        widget.title!,
                        style: AppTextStyles.mediumBlackkTextStyle,
                      )
                    : Text(
                        widget.title!,
                        style: AppTextStyles.mediumWhiteTextStyle,
                      ))
                : Container()
          ],
        ),

      ),
    );
  }
}
