import 'dart:convert';

import 'package:first_app/get_api_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}): super(key: key);



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> brand_list = [
    'Select Profession',
  ];
  List<Data> getApilist=[];
  List<GetApiData> product_info_model_List=[];

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("dropdown"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           DropdownButton(
             isExpanded: true,
               items: brand_list.map((item) => DropdownMenuItem<String>(
                 value: item,
                 child: Text(
                   item,
                   style: const TextStyle(
                     fontSize: 14,
                     color: Colors.black,
                   ),
                   overflow: TextOverflow.ellipsis,
                 ),
               )).toList(),
          hint: Row(
            children: const [
              Expanded(
                child: Text(
                  'Select Profession',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          onChanged: (String? newvalue) {
            setState(() {
              
            });
          },

           )],
        ),
      ),
    );
  }

  Future<void> getApiData() async{

    String Url= "https://grobiz.app/GRBCRM2022/JobPortals/api/get_Profession_List";
    var uri = Uri.parse(Url);
    final response = await http.get(uri);
    if(response.statusCode == 200){
      final res=jsonDecode(response.body);
      int status=res['status'];
      if(status==1){
        print("Status");
        print( status);
        GetApiData getApiData=GetApiData.fromJson(json.decode(response.body));
        getApilist=getApiData.data;


        for (var element in getApilist) {
          brand_list.add(element.name);
          print("Data");
          print(brand_list);
        }
      }

      if(mounted){
        setState(() {});
      }


      }
    }




    // print(result.body);
    // getApilist= jsonDecode(result.body)
    // .map((item) => GetApiData.fromJson(item))
    //     .toList()
    //     .cast<GetApiData>();


  }

