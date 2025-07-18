import 'package:add_to_cart/features/category/data/product_data_model.dart';
import 'package:add_to_cart/core/color/colors.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  late bool isFav;
  final ProductModel productData;
  ProductScreen({super.key, required this.productData, required this.isFav});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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
            offset: const Offset(0, 3),
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
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(widget.productData.image!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      widget.isFav = !widget.isFav;
                    });
                  },
                  icon: widget.isFav
                      ? const Icon(
                          Icons.favorite,
                          color: ColorsApp.primaryColor,
                        )
                      : const Icon(
                          Icons.favorite_border_outlined,
                          color: ColorsApp.primaryColor,
                        ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.productData.name ?? "",
                  style: const TextStyle(
                    color: ColorsApp.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget.productData.description ?? "",
                  maxLines: 1,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: ColorsApp.black,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                height: 33,
                decoration: BoxDecoration(
                  color: ColorsApp.white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: ColorsApp.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 15,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    (widget.productData.price ?? 0).toString(),
                    style: const TextStyle(
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
                  onTap: () {},
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorsApp.primaryColor,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: ColorsApp.white,
                      size: 16,
                    ),
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
