import 'package:add_to_cart/core/color/colors.dart';
import 'package:flutter/material.dart';

class BottomSheetChatMessage extends StatelessWidget {
  const BottomSheetChatMessage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _noteController = TextEditingController();

      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Add Note',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: ColorsApp.lightGrey,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: ColorsApp.black,
                      blurRadius: 4,
                      offset: Offset(0, 4),
                    )
                  ],
                ),
                child: TextField(
                  controller: _noteController,
                  maxLines: 4,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(border: InputBorder.none,),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsApp.BottoncancelColor,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Cancel',style: TextStyle(color: ColorsApp.white,fontSize: 14,fontWeight: FontWeight.w700),),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String note = _noteController.text.trim();
                      if (note.isNotEmpty) {
                        print('Note: $note');
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsApp.primaryColor,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Confirm',style: TextStyle(color: ColorsApp.white,fontSize: 14,fontWeight: FontWeight.w700),),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
}