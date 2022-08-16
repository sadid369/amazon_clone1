import 'package:amazon_clone1/constants/loader.dart';
import 'package:amazon_clone1/features/search/services/search_services.dart';
import 'package:amazon_clone1/models/product.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "/search-screen";
  final String searchQuery;
  const SearchScreen({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? products;
  final SearchServices searchServices = SearchServices();
  @override
  void initState() {
    super.initState();
    fetchSearchProduct();
  }

  void fetchSearchProduct() async {
    products = await searchServices.fetchSearchedProduct(
        context: context, searchQuery: widget.searchQuery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: products == null
          ? const Loader()
          : Center(
              child: Text(products![0].name),
            ),
    );
  }
}
