import 'package:flutter/material.dart';
import 'package:project_new_style/AppBars/normalAppBar.dart';
import 'package:project_new_style/Functions/moreFunctions.dart';
import 'package:project_new_style/Setting/numbers.dart';
import 'package:project_new_style/Setting/strings.dart';
import 'package:project_new_style/Styles/colors.dart';
import 'package:project_new_style/Styles/textStyles.dart';

class BlogPost extends StatefulWidget {
  final int _postId;

  BlogPost(this._postId);

  @override
  _BlogPostState createState() => _BlogPostState(_postId);
}

class _BlogPostState extends State<BlogPost> {
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
    List<Map<String, dynamic>> data = [
      {
        "id": 5,
        "title": "چطور از خارج از ایران با فریلنسرهای داخلی همکاری کنیم؟",
        "content":
            "در چند سال اخیر فریلنسینگ در ایران همگام با تغییرات جهانی رشد خیلی خوبی داشته و حالا تقریبا در همه‌ی مهارت‌ها فریلنسرهای متخصص داخل کشور داریم. اگر شما کارفرمایی خارج از ایران هستید، یا کارفرمایی خارج از ایران می‌شناسید که به دنبال نیروی متخصص است می‌توانید از طریق پونیشا با فریلنسرهای داخل ایران کار کنید. شما می‌توانید از طریق پی‌پال، واریز به حساب بانکی، یا حتی بیت کوین حساب خود را در پونیشا شارژ کنید و با نیروهای متخصص همکاری داشته باشید.\r\n\r\nمرحله‌ی اول: ثبت درخواست\r\n\r\nاز طریق فرم داخل این صفحه درخواست خود را برای ما ارسال کنید تا در اسرع وقت با شما تماس بگیریم.\r\n\r\nمرحله‌ی دوم: انتقال وجه\r\n\r\nپس از مشخص شدن نوع ارز، روش انتقال و ارزش ریالی انتقال وجه را انجام دهید تا حساب شما در پونیشا شارژ شود.\r\n\r\nمرحله‌ی سوم: ادامه کار با فریلنسر\r\n\r\nپس از شارژ حساب کاربری خود می‌توانید فعالیت خود را در پونیشا ادامه دهید، پروژه و مسابقه ایجاد کنید و از طریق قسمت گفتگو با فریلنسرها در ارتباط  باشید و از بین پیشنهادهای دریافتی برای انجام پروژه‌، با توجه به رزومه، نمونه کار و قیمت، فریلنسر یا فریلنسرهای مورد نظر خود را برای انجام کارانتخاب کنید. \r\n\r\nبا اطمینان با فریلنسرهای داخل ایران کار کنید:\r\n\r\nاز طریق پرداخت امن پونیشا با اطمینان با فریلنسرهای داخل ایران کار کنید، شما تا قبل از تحویل پروژه و اعلام رضایت از نتیجه کار هزینه‌ای به فریلنسر پرداخت نمی‌کنید،‌ بلکه این مبلغ در حساب شما قفل می‌شود تا زمانی که پس از تحویل کار شما این مبلغ را برای فریلنسر آزاد کنید.\r\n\r\nبرای کسب اطلاعات بیشتر و دریافت کد تخفیف به اینستاگرام پونیشا سر بزنید و با ما در ارتباط باشید",
        "update_time": "1399-09-10T07:43:39.022750+00:00",
        "create_time": "1399-09-10T07:43:39.022775+00:00",
        "image": "http://138.201.6.240:8001/media/blog_photos/abroad.jpg",
        "owner": null
      }
    ];

    _title = data[0]['title'];
    _content = data[0]['content'];
    _imageUrl = data[0]['image'];
    _date = getBlogPostDate(data[0]['create_time']);
    _time = getBlogPostTime(data[0]['create_time']);
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < mobileViewMaxWidth ? true : false;

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
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    _time,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontFamily: mainFontFamily,
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Icon(
                                      Icons.access_time,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    _date,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      fontFamily: mainFontFamily,
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.black, width: 2),
                                    borderRadius: BorderRadius.circular(5),
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
  }
}
