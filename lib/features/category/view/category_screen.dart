import 'package:add_to_cart/core/routes/app_routes_name.dart';
import 'package:add_to_cart/features/category/data/addation_data_model.dart';
import 'package:add_to_cart/features/category/data/product_data_model.dart';
import 'package:add_to_cart/features/category/logic/home_provider.dart';
import 'package:add_to_cart/features/category/widget/bottomsheet.dart';
import 'package:add_to_cart/features/category/view/widget/product_screen.dart';
import 'package:add_to_cart/features/category/view/widget/search_widget.dart';
import 'package:add_to_cart/core/assets.dart';
import 'package:add_to_cart/core/color/colors.dart';
import 'package:add_to_cart/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
class AddToCart extends StatefulWidget {
  const AddToCart({super.key});
  @override
  State<AddToCart> createState() => _AddToCartState();
}
// List <ProductDataModel> productData = [
//   // ProductDataModel(
//     image:Assets.assetsImagesProductImage,
//     name: 'Name',
//     description: 'Description ....',
//     price: '\$15.00',
//   ),
//   // ProductDataModel(
//     image: Assets.assetsImagesProductImage2,
//     name: 'Name',
//     description: 'Description ....',
//     price: '\$20.00',
//   ),
//   // ProductDataModel(
//     image: Assets.assetsImagesProductImage,
//     name: 'Name',
//     description: 'Description ....',
//     price: '\$15.00',
//   ),
//   // ProductDataModel(
//     image: Assets.assetsImagesProductImage2,
//     name: 'Name',
//     description: 'Description ....',
//     price: '\$20.0',
//   ),
  
// ];
class _AddToCartState extends State<AddToCart> {
  late HomeProvider _provider;
  @override
  void initState() {
    _provider = Provider.of<HomeProvider>(context, listen: false);
    Future.wait([
      _provider.getAllSources(),
    ]
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var provider= Provider.of<HomeProvider>(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
  value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: ColorsApp.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
           navigatorKey.currentState!.pushNamed(
            PagesRouteName.ShoppingScreen
            );
          },
          backgroundColor: ColorsApp.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child:Image(image: AssetImage(
            Assets.assetsShoppingCart,
          ),
          width: 30,
          ) 
          
        ),
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                     Radius.circular(24),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        Assets.assetsImagesCategoryImage,
                        ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.pop(context);
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: ColorsApp.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(Icons.arrow_back_ios_new_rounded,
                              color: ColorsApp.black,
                            ),
                        ),
                        ),
                        const Spacer(),
                        Text("Grilled Meat \n& Chicken",
                        maxLines: 2,
                          style: TextStyle(
                            color: ColorsApp.white,
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
                            ),
                            child:Image(image: AssetImage( Assets.assetsMenu,)),
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: ColorsApp.white.withOpacity(0.5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.2),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          image:DecorationImage(image: AssetImage(
                            Assets.assetsImagesProduct,
                            ))),
                        ),
                        // child: 
                    ),
                  ),
                ),
              ),
              ],
            ),
            SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: SearchWidget(),
            ),
            Expanded(
              child:
               GridView.builder(
                     gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 35,
                     ),
                     itemCount: provider.prodectList.length,
                     itemBuilder: (context, index) => 
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 12.0),
                       child: GestureDetector(
                        onTap: () => _showButtonPressed(context,provider.prodectList[index] as ProductDataModel,index),
                         child: ProductScreen(productData: provider.prodectList[index]as ProductDataModel,index: index,),
                       ),
                     ),
            )
            ),
          ],
        ),
      ),
    );
  }
}

void _showButtonPressed(BuildContext context,ProductDataModel argument,int index) {
  showModalBottomSheet(
    backgroundColor: ColorsApp.white,
    context: context,
    builder: (context) => SingleChildScrollView(child: Bottomsheet(product: argument,index: index,)),
  );
}