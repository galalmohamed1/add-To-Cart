import 'package:add_to_cart/core/color/colors.dart';
import 'package:add_to_cart/features/category/data/cart_item_data.dart';
import 'package:add_to_cart/features/category/data/product_data_model.dart';
import 'package:add_to_cart/features/category/logic/cart_cubit.dart';
import 'package:add_to_cart/features/category/logic/home_cubit.dart';
import 'package:add_to_cart/features/category/logic/home_state.dart';
import 'package:add_to_cart/features/category/view/bottomsheet/widget/addition_widget.dart';
import 'package:add_to_cart/features/category/view/bottomsheet/widget/extras_widget.dart';
import 'package:add_to_cart/features/category/view/bottomsheet/widget/weights_widget.dart';
import 'package:add_to_cart/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Bottomsheet extends StatefulWidget {
  final ProductModel product;
  final int id;
   const Bottomsheet({super.key, required this.product, required this.id});

  @override
  State<Bottomsheet> createState() => _BottomsheetState();
}

class _BottomsheetState extends State<Bottomsheet> {
  int count = 1;
  int isSelected = -1;
  // double price = 0;
  // late CartItem _item;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeCubit>().getProductData(widget.id);
    });



    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // price = _item.selectedWeight.price! + _item.additionsPrice! + _item.extrasPrice!;
    final price =context.read<CartCubit>();
    final cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeStates>(
      buildWhen: (previous, current) => current is HomeProductState,
      builder: (context, state) {
        if (state is! HomeProductState) return const SizedBox();
        if (state.state == ProductState.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.state == ProductState.error) {
          return Text(state.errorMessage ?? '');
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close, color: Colors.black),
                  ),
                ),
                const SizedBox(height: 21),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    width: 398,
                    height: 141,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SizedBox(
                            width: 132,
                            height: 132,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    widget.product.image ?? "",
                                  ),
                                  onError: (exception, stackTrace) {},
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 7),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 177,
                              height: 61,
                              child: Text(
                                widget.product.name ?? "",
                                // 'Grilled Steak, with Boiled\n Basmati Rice And Salad',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(height: 18),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      (widget.product.priceBeforeDiscount ?? "")
                                          .toString(),
                                      // '178 EGP',
                                      style: const TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: ColorsApp.grey,
                                      ),
                                    ),
                                    Text(
                                      (widget.product.price ?? 0).toString(),
                                      // '125 EGP',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xffFE962D),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 51),
                                SizedBox(
                                  width: 135,
                                  height: 41,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 32,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffFE962D),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (count > 1) {
                                                count--;
                                              }
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                            size: 16,
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
                                        width: 32,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffFE962D),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              count++;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 9.15),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 17.61),
                WeightsWidget(weights: state.weights),
                const SizedBox(height: 23),
                AdditionWidget(salads: state.additions),
                const SizedBox(height: 33),
                ExtrasWidget(extras: state.extras),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      final selectedWeight = cubit!.weights.firstWhere(
                        (e) => e.check == true,
                        orElse: () => cubit.weights.first,
                      );

                      final selectedAdditions = cubit.salads
                            .where((e) => e.count! > 0)
                            .toList();

                      final selectedExtras = cubit.extras
                          .where((e) => e.check == true)
                          .toList();
                      final totalSaladsPrice = cubit.salads
                          .where((e) => e.count! > 0)
                          .map((e) => e.price ?? 0)
                          .fold<num>(0, (sum, price) => sum + price);
                      final totalExtrasPrice = cubit.extras
                          .where((e) => e.check== true)
                          .map((e) => e.price ?? 0)
                          .fold<num>(0, (sum, price) => sum + price);
                      //  price= selectedWeight.price! + totalSaladsPrice + totalExtrasPrice;
                      final cartItem = CartItem(
                        product: widget.product,
                        id: widget.product.id,
                        name: widget.product.name ?? '',
                        quantity: widget.product.price ?? 0,
                        image: widget.product.image,
                        selectedWeight: selectedWeight,
                        selectedAdditions: selectedAdditions.length.toString(),
                        selectedExtras: selectedExtras.length.toString(),
                        additionsPrice:totalSaladsPrice,
                        extrasPrice: totalExtrasPrice,
                      );
                      context.read<CartCubit>().addItem(cartItem);
                      navigatorKey.currentState!.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsApp.primaryColor,
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 24,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child:   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Add To Cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "${price.calculateTotalPrice()} EGP",
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
              ],
            ),
          );
        }
        // return SizedBox.shrink();
      },
    );
  }
}
