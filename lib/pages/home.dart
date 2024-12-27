import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mom_social_page/models/category_model.dart';
import 'package:mom_social_page/models/recommendation_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> items = [];
  List<RecommendationModel> recommendedItems = [];
  void _getCategories(){
    items = CategoryModel.getCategory();
  }
  void _getRecommendations(){
    recommendedItems = RecommendationModel.getRecommendations();
  }
  void initInfo() {
    _getCategories();
    _getRecommendations();
  }
  @override
  Widget build(BuildContext context) {
    initInfo();
    return Scaffold(
      appBar: appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _searchTf(),
          SizedBox(height: 40),
          _categoryBuilder(),
          SizedBox(height: 40),
          _recommendationBuilder()

        ],
      ),
    );
  }

  Column _recommendationBuilder() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text('Recommended for you',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                ),
              )
            ),
            SizedBox(height: 15),
            Container(
              height: 210,
              child: ListView.separated(
                itemCount: recommendedItems.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 20,right: 20),
                separatorBuilder: (BuildContext context, int index) => SizedBox(width: 25),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 210,
                    decoration: BoxDecoration(
                      color: recommendedItems[index].bgColor.withOpacity(0.22),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            child: recommendedItems[index].isViewed ? const Icon(Icons.visibility,color: Colors.green):null,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.network(recommendedItems[index].iconPath,height: 90,width: 90),
                        ),
                        Text(recommendedItems[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16
                          ),),
                        Text('${recommendedItems[index].type} | ${recommendedItems[index].cal} Kcal',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14
                        ),)
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        );
  }

  Column _categoryBuilder() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,bottom: 20),
              child: Text('Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Container(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(
                  left: 20,
                  right:20,
                ),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: items[index].bgColor,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: SvgPicture.network(items[index].iconPath,height: 50,width: 50),
                        ),
                        Text(items[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic
                        ),)
                      ],
                    ),
                  );
                }, separatorBuilder: (BuildContext context, int index) => (SizedBox(width: 30,)),
              ),
            )
          ],
        );
  }

  Container _searchTf() {
    return Container(
          margin: EdgeInsets.only(top: 20,left: 20,right: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.11),
                blurRadius: 20
              )
            ]
          ),
          child: TextField(
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

