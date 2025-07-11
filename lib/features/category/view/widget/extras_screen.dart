import 'package:add_to_cart/core/color/colors.dart';
import 'package:add_to_cart/features/category/data/extras_data_model.dart';
import 'package:flutter/material.dart';

class ExtrasScreen extends StatefulWidget {
  final ExtrasDataModel dataModel;
  const ExtrasScreen({super.key, required this.dataModel,});

  @override
  State<ExtrasScreen> createState() => _ExtrasScreenState();
}

class _ExtrasScreenState extends State<ExtrasScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 384,
      height: 38,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            child: Text(
              widget.dataModel.name,
              // "Sesame Paste Salad",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),),
          ),
          const Spacer(),
          Text(
            widget.dataModel.price,
            // "10 EGP",
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w700,
          ),
          ),
          SizedBox(width: 5,),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.dataModel.check=!widget.dataModel.check;
              });
            },
            child: SizedBox(
              child:widget.dataModel.check?Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  // color: ColorsApp.primaryColor,
                  borderRadius: BorderRadius.circular(4),
                  color: ColorsApp.primaryColor,
                  border: BoxBorder.all(
                    color: ColorsApp.primaryColor,
                    width:1.5,
                    ),
                ),
                child: Icon(Icons.check,color: ColorsApp.white,),
              ):Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  // color: ColorsApp.primaryColor,
                  borderRadius: BorderRadius.circular(4),
                  border: BoxBorder.all(
                    color: ColorsApp.primaryColor,
                    width:1.5,
                    ),
                )
              )
            ),
          ),
          SizedBox(width: 5,),
      ],
      ),
    );
  }
}