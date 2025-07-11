import 'package:add_to_cart/core/assets.dart';
import 'package:add_to_cart/core/color/colors.dart';
import 'package:add_to_cart/features/category/data/product_data_model.dart';
import 'package:add_to_cart/features/category/view/shopping/widget/bottom_sheet_chat_message.dart';
import 'package:add_to_cart/features/category/widget/bottomsheet.dart';
import 'package:flutter/material.dart';

class ShppingCartWidget extends StatefulWidget {
  final ProductDataModel? prodect; 
  const ShppingCartWidget({super.key,  this.prodect,});

  @override
  State<ShppingCartWidget> createState() => _ShppingCartWidgetState();
}

class _ShppingCartWidgetState extends State<ShppingCartWidget> {
  int count=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height:170 ,
      width: 383,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
            color: ColorsApp.black.withOpacity(0.2),
          ),
        ],
        color: ColorsApp.white,
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16),
                child: SizedBox(
                  width: 138,
                  height: 138,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(Assets.assetsImagesProductImage),
                        fit: BoxFit.cover,
                        )
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0,horizontal: 15),
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    image:DecorationImage(image: AssetImage(Assets.assetsDelete)) ,
                  ),
                  
                ),
              ),
            ],
          ),
          SizedBox(width: 7,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 16,),
                Text(
                  "Grilled Steak, with Boiled\nBasmati Rice And Salad",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Weight:",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 5,),
                    Text(
                      "1 Kilo",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: ColorsApp.grey
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Salads:",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 5,),
                    Text(
                      "8 items",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: ColorsApp.grey
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Extras:",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 5,),
                    Text(
                      "Sesame Paste Salad",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: ColorsApp.grey
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "1263 EGP",
                      style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: ColorsApp.black
                          ),
                      ),
                      SizedBox(width: 20,),
                      SizedBox(
                        width: 100,
                        height: 32,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              // onTap: () => _showButtonPressed(context, widget.prodect!,),
                              child:SizedBox(
                                height: 32,
                                width: 32,
                                child: DecoratedBox(decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage(Assets.assetsCreate),),
                              )),),
                            ),
                            GestureDetector(
                              onTap: () => _showButtonPressedChatMessage(context),
                              child: SizedBox(
                                height: 32,
                                width: 32,
                                child:DecoratedBox(
                                  decoration:BoxDecoration(
                                  // color: ColorsApp.primaryColor,
                                image: DecorationImage(image: AssetImage(Assets.assetsChatMessage),),
                              )),),
                            )
                          ],
                        ),
                      )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 7.0,right: 8.0,bottom: 36,top: 36),
            child: SizedBox(
              width: 25,
              height: 99,
              child: Column(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: const Color(0xffFE962D),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                          count++;
                          });
                        },
                        icon: const Icon(Icons.add, color: Colors.white,size: 10,),
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(count.toString(),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),),
                  Spacer(),
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: const Color(0xffFE962D),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (count > 0) {
                            count--;
                          }
                        });
                      },
                      icon: const Icon(Icons.remove, color: Colors.white, size: 10,),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _showButtonPressedChatMessage(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: ColorsApp.white,
    context: context,
    sheetAnimationStyle: AnimationStyle(duration: Duration(milliseconds: 1000),),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    isScrollControlled: true,
    
    builder: (context) => BottomSheetChatMessage(),
  );
}

void _showButtonPressed(BuildContext context,ProductDataModel argument,int index) {
  showModalBottomSheet(
    backgroundColor: ColorsApp.white,
    context: context,
    builder: (context) => SingleChildScrollView(child: Bottomsheet(product: argument,index: index,)),
  );
}
