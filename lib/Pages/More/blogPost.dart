import 'package:flutter/material.dart';
import 'package:project_new_style/AppBars/normalAppBar.dart';
import 'package:project_new_style/Components/customErrorWidget.dart';
import 'package:project_new_style/Components/customIndicator.dart';
import 'package:project_new_style/Functions/moreFunctions.dart';
import 'package:project_new_style/Setting/numbers.dart';
import 'package:project_new_style/Setting/strings.dart';
import 'package:project_new_style/Styles/colors.dart';
import 'package:project_new_style/Styles/textStyles.dart';
import 'package:project_new_style/providers/MorePageProviders/blogPostProvider.dart';
import 'package:provider/provider.dart';

class BlogPost extends StatefulWidget {
  final int _postId;

  BlogPost(this._postId);

  @override
  _BlogPostState createState() => _BlogPostState(_postId);
}

class _BlogPostState extends State<BlogPost> {
  var _isInit = true;

  final int _postId;

  String _imageUrl;
  String _title;
  String _date;
  String _time;
  String _content;

  _BlogPostState(this._postId);

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // if (_isInit) {
    //   print(_postId);
    //   Provider.of<BlogPostProvider>(context).fetchBlogPost(_postId);
    //   List<Map<String, dynamic>> data =
    //       Provider.of<BlogPostProvider>(context).blogPost;
    //   print(data.length);
    //   _title = data[0]['title'];
    //   _content = data[0]['content'];
    //   _imageUrl = data[0]['image'];
    //   _date = getBlogPostDate(data[0]['create_time']);
    //   _time = getBlogPostTime(data[0]['create_time']);
    // }
    // _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;

    return FutureBuilder(
        future: Provider.of<BlogPostProvider>(context, listen: false)
            .fetchBlogPost(_postId),
        builder: (ctx, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return CustomIndicator();
          } else {
            if (snapShot.hasError) {
              return CustomErrorWidget();
            } else {
              return Consumer<BlogPostProvider>(builder: (ctx, data, child) {
                _title = data.blogPost[0]['title'];
                _content = data.blogPost[0]['content'];
                _imageUrl = data.blogPost[0]['image'];
                _date = getBlogPostDate(data.blogPost[0]['create_time']);
                _time = getBlogPostTime(data.blogPost[0]['create_time']);
                return Container(
                  color: backgroundColor,
                  child: Stack(children: [
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(
                        top: appBarHeight + pagesTopMargin,
                      ),
                      child: SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.only(
                            bottom: pagesBottomMargin,
                            left: pagesRightAndLeftMargin(_width, _mobileView),
                            right: pagesRightAndLeftMargin(_width, _mobileView),
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 3,
                            child: Column(
                              children: [
                                AspectRatio(
                                  aspectRatio: 1.5,
                                  child: Container(
                                    // height: _width / 4,
                                    width: double.infinity,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      child: Image.network(
                                        _imageUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                _time,
                                                textDirection:
                                                    TextDirection.rtl,
                                                style: TextStyle(
                                                  fontFamily: mainFontFamily,
                                                  fontSize: 14,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                child: Icon(
                                                  Icons.access_time,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                _date,
                                                textDirection:
                                                    TextDirection.rtl,
                                                style: TextStyle(
                                                  fontFamily: mainFontFamily,
                                                  fontSize: 14,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                child: Icon(
                                                  Icons.calendar_today,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                        child: Text(
                                          _title,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                            fontFamily: mainFontFamily,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                        child: Text(
                                          _content,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                            fontFamily: mainFontFamily,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          InkWell(
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Colors.black,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              color: themeColor,
                                              child: Container(
                                                margin: EdgeInsets.all(10),
                                                child: Icon(Icons.share),
                                              ),
                                            ),
                                            onTap: () => {},
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    NormalAppBar(blogPageTitle, true),
                  ]),
                );
              });
            }
          }
        });
  }
}
