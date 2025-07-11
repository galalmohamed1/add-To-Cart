import 'package:add_to_cart/features/category/data/product_data_model.dart';
import 'package:add_to_cart/core/color/colors.dart';
import 'package:add_to_cart/features/category/view/widget/addaition_data.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final int index;
   final ProductDataModel productData;
  const ProductScreen({
    super.key,
    required this.productData, required this.index,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 173,
        height: 235,
        decoration: BoxDecoration(
            color: ColorsApp.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
                BoxShadow(
                    color: ColorsApp.black.withOpacity(0.2), 
                    spreadRadius: 2, 
                    blurRadius: 5, 
                    offset: Offset(0, 3),
                ),
            ],
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Stack(
                  children: [
                    Container(
                        width: double.infinity,
                        height: 119,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                           topRight: Radius.circular(12)),
                        image: DecorationImage(
                            image:AssetImage(productData.prodect[index].image,),
                            fit: BoxFit.cover,
                        ),
                        ),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                      child: IconButton(onPressed: () {
                        
                      }, icon: Icon(
                        Icons.favorite_border_outlined,
                        color: ColorsApp.primaryColor,
                        )),
                    )
                  ],
                ),
                SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,   
                    children: [
                      Text(
                      productData.prodect[index].name,
                      style: TextStyle(
                          color: ColorsApp.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                      ),
                      ),
                      Text(
                        productData.prodect[index].description,
                      maxLines: 1,
                      style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: ColorsApp.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                      ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Stack(
                  clipBehavior:Clip.none,
                  children: [
                    Container(
                        width: double.infinity,
                        height: 33,
                        decoration: BoxDecoration(
                            color: ColorsApp.white, 
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                              boxShadow: [
                                BoxShadow(
                                    color: ColorsApp.black.withOpacity(0.2), 
                                    spreadRadius: 2, 
                                    blurRadius: 15, 
                                    offset: Offset(0, -5),
                                ),
                            ],
                        ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  productData.prodect[index].price,                        
                              style: TextStyle(
                                  color: ColorsApp.primaryColor,
                                  fontSize: 14,
                              ),
                              ),
                            ),
                          ),
                    Positioned(
                        right: 11,
                        bottom: 14,
                        child: GestureDetector(
                          onTap: () {
                            // Add your cart icon action here
                          },
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorsApp.primaryColor
                            ),
                            child: Icon(Icons.add, color: ColorsApp.white, size: 16),
                            ),
                        ),
                    ),
                  ],
                ),
              
            ],
        ),
    );
  }
}