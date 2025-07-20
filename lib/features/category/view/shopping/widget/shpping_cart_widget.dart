import 'package:add_to_cart/core/assets.dart';
import 'package:add_to_cart/core/color/colors.dart';
import 'package:add_to_cart/features/category/data/cart_item_data.dart';
import 'package:add_to_cart/features/category/data/product_data_model.dart';
import 'package:add_to_cart/features/category/logic/cart_cubit.dart';
import 'package:add_to_cart/features/category/view/bottomsheet_update/bottomsheet_update_screen.dart';
import 'package:add_to_cart/features/category/view/shopping/widget/bottom_sheet_chat_message.dart';
import 'package:add_to_cart/features/category/view/bottomsheet/bottomsheet_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShppingCartWidget extends StatefulWidget {
  final CartItem items;
  final ProductModel? product;
  const ShppingCartWidget({super.key, required this.items, this.product});

  @override
  State<ShppingCartWidget> createState() => _ShppingCartWidgetState();
}

class _ShppingCartWidgetState extends State<ShppingCartWidget> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    double price= widget.items.selectedWeight.price! + widget.items.additionsPrice! + widget.items.extrasPrice!;
    return Container(
      height: 170,
      width: 383,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            offset: const Offset(0, 4),
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 16,
                ),
                child: SizedBox(
                  width: 138,
                  height: 138,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),

                      image: DecorationImage(
                        image: NetworkImage(widget.items.image ?? ""),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 25.0,
                  horizontal: 15,
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      context.read<CartCubit>().removeItem(
                        widget.items.id!,
                      );
                    });
                  },
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Assets.assetsDelete),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 7),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(height: 16),
                Text(
                  widget.items.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: [
                    const Text(
                      "Weight:",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      widget.items.selectedWeight.name??"",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: ColorsApp.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Salads:",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "${widget.items.selectedAdditions} items",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: ColorsApp.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Extras:",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "${widget.items.selectedExtras} items",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: ColorsApp.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      (price).toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: ColorsApp.black,
                      ),
                    ),
                    const SizedBox(width: 20),
                    SizedBox(
                      width: 85,
                      height: 32,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () =>
                                _showButtonPressed(context, widget.items.product!, widget.items!.id ?? 0),
                            child: const SizedBox(
                              height: 32,
                              width: 32,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(Assets.assetsCreate),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _showButtonPressedChatMessage(context),
                            child: const SizedBox(
                              height: 32,
                              width: 32,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  // color: ColorsApp.primaryColor,
                                  image: DecorationImage(
                                    image: AssetImage(Assets.assetsChatMessage),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 7.0,
              right: 8.0,
              bottom: 36,
              top: 36,
            ),
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
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 10,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    count.toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
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
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 10,
                      ),
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
    sheetAnimationStyle: const AnimationStyle(
      duration: Duration(milliseconds: 1000),
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    isScrollControlled: true,

    builder: (context) => const BottomSheetChatMessage(),
  );
}

// ignore: unused_element
void _showButtonPressed(BuildContext context, ProductModel argument, int id) {
  showModalBottomSheet(
    backgroundColor: ColorsApp.white,
    context: context,
    builder: (context) => SingleChildScrollView(
      child: BottomsheetUpdateScreen(product: argument, id: id),
    ),
  );
}
