import 'package:add_to_cart/add_cart/data/product_data_model.dart';
import 'package:add_to_cart/core/color/colors.dart';
import 'package:flutter/material.dart';

class ProductData extends StatelessWidget {
   final ProductDataModel productData;
  const ProductData({
    super.key,
    required this.productData,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 173,
        height: 235,
        decoration: BoxDecoration(
            color: ColorsApp.white.withOpacity(0.5),
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
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                        image: DecorationImage(
                            image:AssetImage(productData.image,),
                            fit: BoxFit.cover,
                        ),
                        ),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                      child: IconButton(onPressed: () {
                        
                      }, icon: Icon(Icons.favorite_border_outlined,color: ColorsApp.primaryColor,)),
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
                      productData.name,
                      style: TextStyle(
                          color: ColorsApp.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                      ),
                      ),
                      Text(
                        productData.description,
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
                  children: [
                    Container(
                        width: double.infinity,
                        height: 33,
                        decoration: BoxDecoration(
                            color: ColorsApp.white, // لون الخلفية
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)), // زوايا دائرية
                        ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                            productData.price,                        
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
                        child: CircleAvatar(
                    radius: 12,
                    backgroundColor: ColorsApp.primaryColor,
                    child: IconButton(
                        onPressed: () {
                            // Add your cart icon action here
                        },
                        icon: Icon(Icons.add, color: ColorsApp.white, size: 16),
                    ),
                ),
                    ),
                  ],
                ),
                // CircleAvatar(
                //     radius: 12,
                //     backgroundColor: Color(0xffFE962D),
                //     child: IconButton(
                //         onPressed: () {
                //             // Add your cart icon action here
                //         },
                //         icon: Icon(Icons.add, color: Colors.white, size: 16),
                //     ),
                // ),
            ],
        ),
    );
  }
}