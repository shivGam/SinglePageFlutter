import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40,left: 20,right: 20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.11),
                  blurRadius: 20
                )
              ]
            ),
            child: _searchTf(),
          )
        ],
      ),
    );
  }

  TextField _searchTf() {
    return TextField(
            decoration: InputDecoration(
              hintText: 'Low Calorie',
              hintStyle: TextStyle(
                color: Colors.black38,
                fontSize: 16
              ),
              filled: true,
              contentPadding: EdgeInsets.all(15),
              prefixIcon: Icon(
                Icons.search
              ),
              suffixIcon: Icon(
                Icons.mic,
                color: Colors.redAccent,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none
              )
            ),
          );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'Breakfast',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),
      leading: GestureDetector(
        onTap: (){print('Back Clicked');},
        child: Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.pink[50],
          borderRadius: BorderRadius.circular(10)
        ),
        child: SvgPicture.asset('assets/icons/back_arrow_icon.svg',
        height: 20,
        width: 20),
      ),),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: (){print('Stack Clicked');},
          child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          width: 37,
          decoration: BoxDecoration(
              color: Colors.pink[50],
              borderRadius: BorderRadius.circular(10)
          ),
          child: SvgPicture.asset('assets/icons/stack_icon.svg',
              height: 20,
              width: 20),
        ),),
      ],
    );
  }
}

