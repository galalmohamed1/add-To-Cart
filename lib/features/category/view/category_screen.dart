import 'package:add_to_cart/core/assets.dart';
import 'package:add_to_cart/core/color/colors.dart';
import 'package:add_to_cart/core/routes/app_routes_name.dart';
import 'package:add_to_cart/features/category/data/product_data_model.dart';
import 'package:add_to_cart/features/category/logic/home_cubit.dart';
import 'package:add_to_cart/features/category/logic/home_state.dart';
import 'package:add_to_cart/features/category/view/widget/product_screen.dart';
import 'package:add_to_cart/features/category/view/widget/search_widget.dart';
import 'package:add_to_cart/features/category/view/bottomsheet/bottomsheet_screen.dart';
import 'package:add_to_cart/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({super.key});
  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: ColorsApp.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigatorKey.currentState!.pushNamed(PagesRouteName.ShoppingScreen);
          },
          backgroundColor: ColorsApp.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          child: const Image(image: AssetImage(Assets.assetsShoppingCart), width: 30),
        ),
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    image: DecorationImage(image: AssetImage(Assets.assetsImagesCategoryImage), fit: BoxFit.cover),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.pop(context);
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(color: ColorsApp.white, borderRadius: BorderRadius.circular(12)),
                            child: const Icon(Icons.arrow_back_ios_new_rounded, color: ColorsApp.black),
                          ),
                        ),
                        const Spacer(),
                        const Text(
                          "Grilled Meat \n& Chicken",
                          maxLines: 2,
                          style: TextStyle(color: ColorsApp.white, fontSize: 20, fontWeight: FontWeight.bold, height: 1.2),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            // Add your cart icon action here
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(color: ColorsApp.white, borderRadius: BorderRadius.circular(12)),
                            child: const Image(image: AssetImage(Assets.assetsMenu)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: -35,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: 132,
                      height: 132,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(60), color: ColorsApp.white.withOpacity(0.5)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.2),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            image: const DecorationImage(image: AssetImage(Assets.assetsImagesProduct)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 26),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
             child: SearchWidget(),
             ),
            Expanded(
              child: BlocConsumer<HomeCubit, HomeStates>(
                listener: (context, state) {
                  if (state is HomeSuccessState) {
                    print('object');
                  }
                },
                buildWhen: (previous, current) => current is HomeLoadingState ||
                 current is HomeErrorState || current is HomeSuccessState,
                builder: (context, state) {
                  if (state is HomeLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HomeErrorState) {
                    return Text(state.message.message ?? '');
                  } else if (state is HomeSuccessState) {
                    bool isfav = false;
                    return GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.9,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 35,
                      ),
                      itemCount: state.products.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: GestureDetector(
                          onTap: () => _showButtonPressed(context, state.products[index], state.products[index].id!),
                          child: ProductScreen(isFav: isfav, productData: state.products[index]),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showButtonPressed(BuildContext context, ProductModel argument, int id) {
  print('Show button pressed with id: $id');
  showModalBottomSheet(
    backgroundColor: ColorsApp.white,
    context: context,
    builder: (context) => Bottomsheet(product: argument, id: id),
  );
}
