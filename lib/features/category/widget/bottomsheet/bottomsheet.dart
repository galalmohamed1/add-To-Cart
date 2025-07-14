import 'package:add_to_cart/features/category/data/addation_data_model.dart';
import 'package:add_to_cart/features/category/data/cart_item_data.dart';
import 'package:add_to_cart/features/category/data/extras_data_model.dart';
import 'package:add_to_cart/features/category/data/product_data_model.dart';
import 'package:add_to_cart/core/color/colors.dart';
import 'package:add_to_cart/features/category/data/weight_data.dart';
import 'package:add_to_cart/features/category/logic/home_cubit.dart';
import 'package:add_to_cart/features/category/logic/home_state.dart';
import 'package:add_to_cart/features/category/widget/bottomsheet/widgets/addition_widget.dart';
import 'package:add_to_cart/features/category/widget/bottomsheet/widgets/extras_widget.dart';
import 'package:add_to_cart/features/category/widget/bottomsheet/widgets/weights_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Bottomsheet extends StatefulWidget {
  final int index;
  final ProductModel product;
  const Bottomsheet({super.key, required this.product, required this.index});

  @override
  State<Bottomsheet> createState() => _BottomsheetState();
}

class _BottomsheetState extends State<Bottomsheet> {
  int count = 1;
  int isSelected = -1;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is HomeSuccessState) {
          print('object');
        }
      },
      buildWhen: (previous, current) =>
          current is HomeLoadingState ||
          current is HomeErrorState ||
          current is HomeSuccessWeightState ||
          current is HomeSuccessSaladsState ||
          current is HomeSuccessExtraState,
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is HomeErrorState) {
          return Text(state.error.message ?? '');
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
                SizedBox(height: 21),
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
                                  image: NetworkImage(widget.product.image ?? ""),
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
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(height: 18),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      (widget.product.priceBeforeDiscount ?? "")
                                          .toString(),
                                      // '178 EGP',
                                      style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: ColorsApp.grey,
                                      ),
                                    ),
                                    Text(
                                      (widget.product.price ?? 0).toString(),
                                      // '125 EGP',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xffFE962D),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 51),
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
                                          borderRadius: BorderRadius.circular(10),
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
                                      Spacer(),
                                      Text(
                                        count.toString(),
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: 32,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          color: const Color(0xffFE962D),
                                          borderRadius: BorderRadius.circular(10),
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
                                SizedBox(width: 9.15),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 17.61),
                WeightsWidget(weights: state is HomeSuccessWeightState ? state.weights : []),
                SizedBox(height: 23),
                AdditionWidget(
                  salads: state is HomeSuccessSaladsState ? state.salads : [],
                ),
                SizedBox(height: 33),
                ExtrasWidget(
                  extras: state is HomeSuccessExtraState ? state.extras : [],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      int quantity = 1; // example quantity, replace with actual state
                    WeightData? selectedWeight; // assign based on user selection
                    Map<AddationDataModel, int> selectedAdditions = {}; // assign based on user selection
                    List<ExtrasDataModel> selectedExtras = []; // assign based on user selection

                    final cartItem = CartItem(
                      product: widget.product,
                      quantity: quantity,
                      weight: selectedWeight,
                      additions: selectedAdditions,
                      extras: selectedExtras,
                    );

                    context.read<HomeCubit>().addToCart(cartItem);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Added to cart')),
                    );
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Add To Cart',
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
              ],
            ),
          );
        }
        // return SizedBox.shrink();
      },
    );
  }
}
