import 'package:flutter/material.dart';
import 'package:mdg_dms/gradient_wrapper.dart';

Widget hyperSearchAndFilter(
  BuildContext context,
  VoidCallback onSearch,
) {
  final TextEditingController searchController = TextEditingController();

  Gradient gradient = const LinearGradient(
    colors: [
      Color.fromARGB(255, 116, 251, 222),
      Color.fromARGB(255, 23, 26, 121),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  InputDecoration getInputDecoration() {
    return InputDecoration(
      fillColor: Colors.white10,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
      hintText: '검색어를 입력하세요',
      hintStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 15,
      ),
      suffixIcon: IconButton(
        icon: const Icon(Icons.search, color: Colors.black),
        onPressed: () {
          searchController.clear();
          onSearch();
        },
      ),
    );
  }

  return Container(
    margin: const EdgeInsets.only(top: 24, left: 16, right: 16),
    child: Row(
      children: [
        Expanded(
          child: GradientBorderWrapper(
            gradient: gradient,
            child: SizedBox(
              child: TextField(
                controller: searchController,
                cursorColor: Colors.black,
                decoration: getInputDecoration(),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}