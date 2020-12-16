import 'package:flutter/material.dart';
import 'package:project_new_style/AppBars/normalAppBar.dart';
import 'package:project_new_style/Pages/customErrorWidget.dart';
import 'package:project_new_style/Components/customIndicator.dart';
import 'package:project_new_style/Components/MoreRoute/moreTextElement.dart';
import 'package:project_new_style/Setting/numbers.dart';
import 'package:project_new_style/Setting/strings.dart';
import 'package:project_new_style/Styles/icons.dart';
import 'package:project_new_style/providers/MorePageProviders/rulesProvider.dart';
import 'package:provider/provider.dart';

class Rules extends StatelessWidget {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(rulesPageTitle),
        centerTitle: true,
        textTheme: theme.textTheme,
      ),
      backgroundColor: theme.backgroundColor,
      body: FutureBuilder(
          future:
              Provider.of<RuleProvider>(context, listen: false).fetchRules(),
          builder: (ctx, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return CustomIndicator();
            } else {
              if (snapShot.hasError) {
                print('no data');
                return CustomErrorWidget();
              } else {
                return Scrollbar(
                  controller: _scrollController,
                  isAlwaysShown: true,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: pagesTopMargin,
                        bottom: pagesBottomMargin,
                        left: pagesRightAndLeftMargin(_width, _mobileView),
                        right: pagesRightAndLeftMargin(_width, _mobileView),
                      ),
                      child: Consumer<RuleProvider>(
                        builder: (ctx, data, child) => Container(
                          child: Column(
                            children: [
                              ...(data.rules as List<Map<String, Object>>)
                                  .map((item) {
                                return Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: MoreTextElement(
                                    item,
                                    'question',
                                    'answer',
                                    rulesIcon,
                                  ),
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
            }
          }),
    );
  }
}
