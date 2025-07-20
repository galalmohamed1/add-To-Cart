import 'package:add_to_cart/core/assets.dart';
import 'package:add_to_cart/core/color/colors.dart';
import 'package:add_to_cart/features/category/logic/cart_cubit.dart';
import 'package:add_to_cart/features/category/logic/home_cubit.dart';
import 'package:add_to_cart/features/category/view/shopping/widget/shpping_cart_widget.dart';
import 'package:add_to_cart/core/widget/main_text_field.dart';
import 'package:add_to_cart/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}


class _ShoppingScreenState extends State<ShoppingScreen> {
  
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();
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
                            offset: const Offset(0, 4),
                          )
                        ]
                      ),
                      child: const Icon(Icons.arrow_back_ios_new_rounded,color: ColorsApp.black,),
                      ),),
                const Spacer(),
                const Text("Cart Screen",maxLines: 2,
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
                              offset: const Offset(0, 4),
                            )
                          ]
                        ),
                        child:const Image(image: AssetImage( Assets.assetsMenu,)),
                      ),
                    ),

                  ],
                ),
              ),
            ),
         Expanded(child: ListView.builder(
          itemCount: cubit.cartItems.length,
          itemBuilder: (context, index) =>Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 30),
            child: ShppingCartWidget(items: cubit.cartItems[index],),),
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
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      'Checkout',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '${cubit.calculateTotalPrice()}EGP',
                      style: const TextStyle(
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
            onPressed: () {
              setState(() {
              context.read<CartCubit>().clearCart();
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsApp.BottonDeleteColor,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                ),),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
          const SizedBox(height: 20,),

        ],
        ),
      ),
    );
  }
}


