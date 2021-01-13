import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:test_meet2go/environments/environment.dart';
import 'package:test_meet2go/models/blog_model.dart';

class BlogServiceExeption implements Exception {}

class BlogsService {
  Future<List<BlogModel>> getEvent() async {
    final response = await http.get(
      //Add ?fbclid=IwAR0eXPs33uApXuEwpA8mAYfNk_sFf7FcbhZAOHjaiw_ERWztDsqLzaSooQs esto es facebook y perjudica al SEO de los reportes
        "${Environments.apiURL}wp-json/wp/v2/posts",
        headers: {
          'Content-Type': 'application/json',
        });
    //Puede ser otra solucion; porque con los statusCode tu pudes diseccionar mejor el mensaje , 200 400 404 401 500 Investigar 
    //Ademas en este punto ya conoces la respuesta con solo saber el estado de la request y evitas hacer el mapeo con el json decode 
    if(response.statusCode != 200){
        print('algo salio mal');
    }
    print(response.body);
    final List<dynamic> decodeData = json.decode(response.body);

    if (decodeData == null) {
      //no mates  la aplicacion, intenta mandar un nulo y en interfaz intenta arreglar con un mensaje 
      throw BlogServiceExeption();
    }
  


    final List<BlogModel> blogs =
        decodeData.map((blog) => BlogModel.fromJson(blog)).toList();

    return blogs;
  }
}
