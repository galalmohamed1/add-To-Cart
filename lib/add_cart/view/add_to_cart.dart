import 'package:add_to_cart/add_cart/data/product_data_model.dart';
import 'package:add_to_cart/add_cart/widget/bottomsheet.dart';
import 'package:add_to_cart/add_cart/view/widget/product_data.dart';
import 'package:add_to_cart/add_cart/view/widget/search_widget.dart';
import 'package:add_to_cart/core/assets.dart';
import 'package:add_to_cart/core/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({super.key});
  @override
  State<AddToCart> createState() => _AddToCartState();
}
List <ProductDataModel> productData = [
  ProductDataModel(
    image:Assets.assetsImagesProductImage,
    name: 'Name',
    description: 'Description ....',
    price: '\$15.00',
  ),
  ProductDataModel(
    image: Assets.assetsImagesProductImage2,
    name: 'Name',
    description: 'Description ....',
    price: 'price upon selection',
  ),
  ProductDataModel(
    image: Assets.assetsImagesProductImage,
    name: 'Name',
    description: 'Description ....',
    price: '\$15.00',
  ),
  ProductDataModel(
    image: Assets.assetsImagesProductImage2,
    name: 'Name',
    description: 'Description ....',
    price: 'price upon selection',
  ),
  
];
class _AddToCartState extends State<AddToCart> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
  value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: ColorsApp.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
           
          },
          backgroundColor: ColorsApp.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child:
           SvgPicture.asset(
            Assets.assetsSvgShoppingCart,
            width: 28,
            height: 28,
          ),
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
                            child: SvgPicture.asset(
                              Assets.assetsSvgMenu,
                              width: 20,
                              height: 20,
                            ),
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
                     itemCount: productData.length,
                     itemBuilder: (context, index) => 
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 12.0),
                       child: GestureDetector(
                        onTap: () => _showButtonPressed(context),
                         child: ProductData(productData: productData[index],),
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

void _showButtonPressed(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: ColorsApp.white,
    context: context,
    builder: (context) => SingleChildScrollView(child: Bottomsheet()),
  );
}