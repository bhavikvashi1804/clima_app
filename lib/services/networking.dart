
import 'package:http/http.dart' as http;
import 'dart:convert';



class NetworkHelper{
  String url;
  NetworkHelper(this.url);



  Future getData()async {
    http.Response response=await http.get(url);
    print(response.body);
    var data=response.body;
    return jsonDecode(data);   
  }

}