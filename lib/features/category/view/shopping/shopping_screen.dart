import 'package:add_to_cart/core/assets.dart';
import 'package:add_to_cart/core/color/colors.dart';
import 'package:add_to_cart/features/category/data/product_data_model.dart';
import 'package:add_to_cart/features/category/view/shopping/widget/bottom_sheet_chat_message.dart';
import 'package:add_to_cart/features/category/view/shopping/widget/shpping_cart_widget.dart';
import 'package:add_to_cart/features/category/widget/main_text_field.dart';
import 'package:add_to_cart/main.dart';
import 'package:flutter/material.dart';
import 'package:add_to_cart/features/category/widget/bottomsheet.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
  value: SystemUiOverlayStyle.dark,
    child: Scaffold(
      backgroundColor: ColorsApp.white,
      body: Column(
        children: [
         SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 8.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    navigatorKey.currentState!.pop(context);
                    },
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: ColorsApp.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius:0,
                            blurRadius: 4.0,
                            color: ColorsApp.black.withOpacity(0.2),
                            offset: Offset(0, 4),
                          )
                        ]
                      ),
                      child: Icon(Icons.arrow_back_ios_new_rounded,color: ColorsApp.black,),
                      ),),
                const Spacer(),
                Text("Cart Screen",maxLines: 2,
                      style: TextStyle(
                        color: ColorsApp.black2,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        // Add your cart icon action here
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: ColorsApp.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              spreadRadius:0,
                              blurRadius: 4.0,
                              color: ColorsApp.black.withOpacity(0.2),
                              offset: Offset(0, 4),
                            )
                          ]
                        ),
                        child:Image(image: AssetImage( Assets.assetsMenu,)),
                      ),
                    ),

                  ],
                ),
              ),
            ),
         Expanded(child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) =>Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 30),
            child: ShppingCartWidget(),),
          ) ,
          ),
          
          Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsApp.primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                ),),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    Text(
                      'Checkout',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '1263 EGP',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                 ],
               ),
           ),
        ),
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsApp.BottonDeleteColor,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                ),),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Delete All',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                 ],
               ),
           ),
        ),
          SizedBox(height: 20,),

        ],
        ),
      ),
    );
  }
}


