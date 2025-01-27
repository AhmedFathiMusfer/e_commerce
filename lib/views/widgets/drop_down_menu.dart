import 'package:e_commerce/utilities/router.dart';
import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  void Function(String? newValu) onChanged;
  final List<String> items;
  final String hint;
  DropDownMenu(
      {required this.onChanged, required this.items, required this.hint});
  @override
  _DropdownMenuState createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<DropDownMenu> {
  String? selectedValue; // القيمة المحددة حاليًا

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField<String>(
          value: null,
          menuMaxHeight: 200,
          onChanged: widget.onChanged,
          items: widget.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          decoration: InputDecoration(
            hintText: widget.hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(2),
            ),

            // أيقونة اختيارية
          ),
          style: TextStyle(
            color: Colors.black, // لون النص
            fontSize: 16,
          ),
          dropdownColor: Colors.grey[100], // لون خلفية القائمة المنسدلة
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black, // لون الأيقونة
          ),
          isExpanded: false, // لجعل القائمة تأخذ العرض الكامل
        ),
      ],
    );
  }
}
