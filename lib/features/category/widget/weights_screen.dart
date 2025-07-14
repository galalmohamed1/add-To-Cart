import 'package:add_to_cart/core/color/colors.dart';
import 'package:add_to_cart/features/category/data/weight_data.dart';
import 'package:flutter/material.dart';

class WeightsScreen extends StatefulWidget {
  final int index;
  final WeightData weight;
  const WeightsScreen({super.key, required this.weight, required this.index});

  @override
  State<WeightsScreen> createState() => _WeightsScreenState();
}

class _WeightsScreenState extends State<WeightsScreen> {
  int isSelected = -1;
  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 180,
          height: 45,
          decoration: BoxDecoration(
            color: ColorsApp.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: ColorsApp.borderColor,
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.weight.name??"",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: ColorsApp.textColor,
                  ),
                ),
                Text(
                  (widget.weight.price??"0").toString(),
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: ColorsApp.textColor,
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    isSelected = widget.index;
                  }),
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: ColorsApp.black, width: 2),
                    ),
                    child: isSelected == widget.index
                        ? Center(
                            child: Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorsApp.primaryColor,
                              ),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          )
                        : Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.transparent,
                              ),
                        ),
                              // child: ,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
