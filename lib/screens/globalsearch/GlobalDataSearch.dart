
import 'package:flutter/material.dart';
import 'package:highqfresh/apimanager/LandingApiCalls.dart';
import 'package:highqfresh/melabs/MEUIUtils.dart';
import 'package:highqfresh/request/GlobalSearchRequest.dart';
import 'package:highqfresh/response/GlobalSearchResponse.dart';
import 'package:highqfresh/strings/PageName.dart';

class GlobalDataSearch extends SearchDelegate<String> {


  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    if (query == null || query.isEmpty) {
      return MEUIUtils.setFailure(PageName.no_result_found);
    }
    return getGlobalSearch(query, context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Container();
  }

  FutureBuilder<GlobalSearchResponse> getGlobalSearch(
      String word, BuildContext context) {
    return FutureBuilder<GlobalSearchResponse>(
        future: LandingApiCalls.getGlobalSearchResponse(
            context, getGlobalSearchRequest(word)),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          print(snapshot.data);
          return snapshot.hasData
              ? setGlobalSearchResponse(snapshot.data)
              : Center(child: CircularProgressIndicator());
        });
  }

  getGlobalSearchRequest(String word) {
    GlobalSearchRequest globalSearchRequest = new GlobalSearchRequest();
    globalSearchRequest.word = word;
    return globalSearchRequest;
  }

  setGlobalSearchResponse(GlobalSearchResponse globalSearchResponse) {
    if (globalSearchResponse == null || globalSearchResponse.data == null) {
      return MEUIUtils.setFailure(PageName.no_result_found);
    }

  }

}