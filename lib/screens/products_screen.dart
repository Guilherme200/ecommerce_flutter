import 'package:ecommerce_flutter/models/product_model.dart';
import 'package:ecommerce_flutter/providers/product_provider.dart';
import 'package:ecommerce_flutter/widgets/product/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<ProductModel> _products = ProductProvider().products;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 80,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 50,
            alignment: Alignment.center,
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: SearchField(),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: EdgeInsets.all(40),
                child: Image.asset("assets/logos/logo.png", width: 10),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Destaques",
              style: TextStyle(fontSize: 20),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: ProductProvider().count,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 220,
                mainAxisSpacing: 20,
                crossAxisSpacing: 30,
                childAspectRatio: 200 / 330,
              ),
              itemBuilder: (context, index) {
                // return ProductGridItem(_products[index]);
              },
            )
          ],
        ),
      ),
    );
  }
}
