import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:project_new_style/AppBars/normalAppBar.dart';
import 'package:project_new_style/Components/CustomRaisedButton.dart';
import 'package:project_new_style/Components/MoreRoute/blogPostElement.dart';
import 'package:project_new_style/Pages/customErrorWidget.dart';
import 'package:project_new_style/Components/customIndicator.dart';
import 'package:project_new_style/Functions/moreFunctions.dart';
import 'package:project_new_style/Pages/More/blogPost.dart';
import 'package:project_new_style/Setting/numbers.dart';
import 'package:project_new_style/Setting/strings.dart';
import 'package:project_new_style/Styles/textStyles.dart';
import 'package:project_new_style/providers/MorePageProviders/blogProvider.dart';
import 'package:provider/provider.dart';

class Blog extends StatefulWidget {
  final int postId;
  final int _pageIndex;

  Blog(this._pageIndex, {this.postId});

  @override
  _BlogState createState() => _BlogState();
}

class _BlogState extends State<Blog> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if (widget.postId != null) {
      WidgetsBinding.instance
          .addPostFrameCallback((_) => pushNewScreenWithRouteSettings(
                context,
                settings: null,
                screen: BlogPost(widget.postId),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(blogPageTitle),
        centerTitle: true,
        textTheme: theme.textTheme,
      ),
      backgroundColor: theme.backgroundColor,
      body: FutureBuilder(
          future: Provider.of<BlogProvider>(context, listen: false).fetchBlog(),
          builder: (ctx, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return CustomIndicator();
            } else {
              if (snapShot.hasError) {
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
                      child: Consumer<BlogProvider>(
                        builder: (ctx, data, child) => Column(
                          children: [
                            ...((widget._pageIndex + 1) * 5 < data.blogs.length
                                    ? data.blogs.sublist(widget._pageIndex * 5,
                                            (widget._pageIndex + 1) * 5)
                                        as List<Map<String, Object>>
                                    : data.blogs.sublist(widget._pageIndex * 5,
                                            data.blogs.length)
                                        as List<Map<String, Object>>)
                                .map((item) {
                              return BlogPostElement(
                                item['id'],
                                item['title'],
                                item['image'],
                                getBlogPostDate(item['create_time']),
                                getBlogPostTime(item['create_time']),
                              );
                            }).toList(),
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomRaisedButton(
                                    onPressed: () => {
                                      pushNewScreenWithRouteSettings(
                                        context,
                                        settings: null,
                                        screen: Blog(widget._pageIndex + 1),
                                        pageTransitionAnimation:
                                            PageTransitionAnimation.fade,
                                      ),
                                    },
                                    title: "صفحه بعد",
                                    isDisabled: widget._pageIndex ==
                                                (data.blogs.length / 5)
                                                    .round() ||
                                            (widget._pageIndex + 1) * 5 ==
                                                data.blogs.length
                                        ? true
                                        : false,
                                  ),
                                  Text(
                                    'صفحه ' +
                                        getPersianNumbers(
                                            (widget._pageIndex + 1).toString()),
                                    style: TextStyle(
                                      fontFamily: mainFontFamily,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  CustomRaisedButton(
                                    onPressed: () => {
                                      pushNewScreenWithRouteSettings(
                                        context,
                                        settings: null,
                                        screen: Blog(widget._pageIndex - 1),
                                        pageTransitionAnimation:
                                            PageTransitionAnimation.fade,
                                      )
                                    },
                                    title: "صفحه قبل",
                                    isDisabled:
                                        widget._pageIndex <= 0 ? true : false,
                                  ),
                                ],
                              ),
                            ),
                          ],
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

//TODO: implement share button
