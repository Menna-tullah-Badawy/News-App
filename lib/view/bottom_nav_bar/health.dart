import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:newsapp/controller/controller.dart';
import 'package:newsapp/model/model.dart';

class health extends GetWidget {
  NewsController controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: FutureBuilder(
          future: controller.getData("health"),
          builder: (context, AsyncSnapshot snapshot) {
            Articles data = snapshot.data;
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: data.articles.length,
                  itemBuilder: (context, int index) {
                    return Card(
                      elevation: 10,
                      shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                         
                               Container(
                                width: double.infinity,
                                height: 150,
                                 child: Image.network(
                                    data.articles[index].urlToImage.toString(),
                                    fit:BoxFit.fill
                                ),),
                          Text(data.articles[index].title == null
                              ? "No Data"
                              : data.articles[index].title,
                              style: TextStyle(fontSize: 20,),),
                          Text(data.articles[index].description == null
                              ? "No Data"
                              : data.articles[index].description,
                              style: TextStyle(fontSize: 20,color: Colors.grey),
                              textDirection: TextDirection.rtl,),
                              
                        ],
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
