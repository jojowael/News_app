import 'package:flutter/material.dart';
import 'package:flutter_app_news/api/api_manager.dart';
import 'package:flutter_app_news/category/category_details_view_model.dart';
import 'package:flutter_app_news/model/SourceResponse.dart';
import 'package:flutter_app_news/model/category.dart';
import 'package:flutter_app_news/tabs/tab_container.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'category-details';
  Category category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSource(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<CategoryDetailsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.errorMessage != null) {
            return Column(
              children: [
                Text(viewModel.errorMessage!),
                ElevatedButton(
                    onPressed: () {
                      viewModel.getSource(widget.category.id);
                    },
                    child: Text('Try Again'))
              ],
            );
          } else if (viewModel.sourceList == null) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else {
            return TabContainer(sourcesList: viewModel.sourceList!);
          }
        },
        child: Text('Header'),
      ),
    );

    FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(widget.category.id),
        builder: (context, snapchot) {
          if (snapchot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            );
          } else if (snapchot.hasError) {
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getSources(widget.category.id);
                    },
                    child: Text('Try again'))
              ],
            );
          }
          //server rad(success,error)
          if (snapchot.data?.status != 'ok') {
            //error,message,code
            return Column(
              children: [
                Text(snapchot.data?.message ?? ''),
                ElevatedButton(onPressed: () {}, child: Text('Try again'))
              ],
            );
          }
          var sourcesList = snapchot.data?.sources ?? [];
          return TabContainer(sourcesList: sourcesList);
        });
  }
}
