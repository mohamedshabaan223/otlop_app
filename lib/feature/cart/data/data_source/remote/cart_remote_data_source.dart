import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:otlop_app/feature/cart/data/models/cart_model.dart';

class CartRemoteDataSource {
  final Dio dio = Dio();
  Future<List<CartModel>> getCart() async {
    try {
      log('===============================');
      final List<CartModel> cartList = [];
      final Response response = await dio.get(
        'https://talabat639.runasp.net/api/Basket',
        options: Options(
          headers: {
            'Authorization': 'Bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJtdWhtZGRzaGFiYWFuMyIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6Im11aG1kZHNoYWJhYW4zQGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL25hbWVpZGVudGlmaWVyIjoiNDNjMzdjNmEtNWU4Yi00YzJmLTkxNWMtODA1NDUyYjA4Nzk0IiwiZXhwIjoxNzkzMjgzMDY3LCJpc3MiOiJodHRwczovL2xvY2FsaG9zdDo3MjY0IiwiYXVkIjoiTXlTZWN1cmVkQVBJVXNlcnMifQ.1SXiRE0L9kdNJjAE7eiHytcGm6JBvyj4mgjizCKN-gQ',
          },
        ),
      );
      log('==============${response.data['items']}');
      for (Map<String, dynamic> element in response.data['items']) {
        final CartModel cart = CartModel.fromJson(element);
        cartList.add(cart);
      }
      return cartList;
    } on DioException catch (e) {
      log(e.toString());
      throw Exception(e.response?.data['message'].toString());
    }
  }
}
