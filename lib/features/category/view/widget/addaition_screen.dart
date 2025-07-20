import 'package:add_to_cart/core/color/colors.dart';
import 'package:add_to_cart/features/category/data/addation_data_model.dart';
import 'package:flutter/material.dart';

class AddaitionScreen extends StatefulWidget {
  final AddationDataModel add;
  const AddaitionScreen({super.key, required this.add,});

  @override
  State<AddaitionScreen> createState() => _AddaitionScreenState();
}

class _AddaitionScreenState extends State<AddaitionScreen> {
  // int count =0;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 383,
      height: 95,
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
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 78,
              height: 76,
              child: DecoratedBox(decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    widget.add.image ?? '',
                    ),
                  fit: BoxFit.cover,
                ),
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.add.name??"",
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Row(
                  children:[
                    Text(
                      (widget.add.price??"0").toString(),
                      style: const TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    const SizedBox(width: 109,),
                    SizedBox(
                      width: 112,
                      height: 34,
                      // color: Colors.amber,
                      child: Row(
                        children: [
                          Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              color: ColorsApp.primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.remove, color: Colors.white,size: 16,),
                              onPressed: () {
                                setState(() {
                                  if (widget.add.count! > 0) {
                                    widget.add.count=widget.add.count! -1;
                                  }
                                });
                              },
                            ),
                          ),
                          const Spacer(),
                          Text(
                            widget.add.count.toString(),
                            style: const TextStyle(fontSize: 16, color: Colors.black),
                          ),
                           const Spacer(),
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: ColorsApp.primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.add, color: Colors.white,size: 16,),
                              onPressed: () {
                                setState(() {
                                  widget.add.count=widget.add.count!+1;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                    
                    ],
                ),
                
                ],
            ),
          ),   
        ],
      )
    );
  }
}
