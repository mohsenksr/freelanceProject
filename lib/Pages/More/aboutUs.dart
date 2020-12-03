import 'package:flutter/material.dart';
import 'package:project_new_style/AppBars/normalAppBar.dart';
import 'package:project_new_style/Components/customIndicator.dart';
import 'package:project_new_style/Components/moreTextElement.dart';
import 'package:project_new_style/Setting/numbers.dart';
import 'package:project_new_style/Setting/strings.dart';
import 'package:project_new_style/Styles/colors.dart';
import 'package:project_new_style/Styles/icons.dart';
import 'package:project_new_style/providers/MorePageProviders/aboutUsProvider.dart';
import 'package:provider/provider.dart';

class AboutUs extends StatelessWidget {
  List<Map<String, String>> data = [
    {
      'question': """طاقچه چیست؟""",
      'answer':
          """طاقچه فروشگاه نسخه‌ی الکترونیک قانونی کتاب‌ها، مجلات و روزنامه‌های فارسی است که امکان مطالعه‌ی آن‌ها را بر روی سایت طاقچه، تلفن‌های هوشمند و تبلت‌های اندروید و iOS فراهم می‌کند.""",
    },
    {
      'question': """چه کتاب‌هایی روی طاقچه قرار می‌گیرد؟""",
      'answer':
          """هدف طاقچه، تبدیل شدن به یک کتابخانه‌ی جامع در تمام زمینه‌های نشر است و محدودیتی در زمینه‌ی دسته‌بندی محصولات ندارد. فروشگاه طاقچه هر روز با کتاب‌های تازه‌ای از ناشران فعال کشور و همچنین مجلات و روزنامه‌های ایران به‌روز می‌شود.""",
    },
    {
      'question': """آیا همه‌ی کتاب‌های طاقچه پولی هستند؟""",
      'answer':
          """خیر. کتاب‌های رایگان نیز در فروشگاه طاقچه وجود دارند و تلاش ما بر این است که به صورت مداوم به تعداد این کتب بیافزاییم. از این رو برخی از کتاب‌ها که دیگر مشمول حقوق مولف نیستند به رایگان در طاقچه قرار می‌گیرند.""",
    },
    {
      'question': """کتاب‌ها به چه قیمتی بر روی طاقچه عرضه می‌شوند؟""",
      'answer':
          """کتاب‌های قرار گرفته بر روی طاقچه بر اساس درخواست ناشر قیمت‌گذاری می‌شوند. البته به دلیل حذف شدن هزینه‌ی چاپ و کاغذ، قیمت کتاب در طاقچه حدود ۳۰ تا ۴۰ درصد نسخه‌ی چاپی آن است.""",
    },
    {
      'question':
          """کتاب‌های خریداری شده از طاقچه را به چه طریق می‌توان مطالعه کرد؟""",
      'answer':
          """اگر کتاب را از سایت طاقچه خریداری کرده باشید، آن کتاب در قسمت آرشیو کتاب‌خانه‌ی اپلیکیشن طاقچه‌ی شما (با همان حساب کاربری) قرار می‌گیرد. از این طریق شما می‌توانید کتاب را دریافت کرده و شروع به مطالعه‌ی آن کنید. اگر کتاب را مستقیما از درون اپلیکیشن خریداری کنید، پس از اتمام فرآیند خرید، دانلود کتاب به صورت خودکار شروع خواهد شد. همچنین با امکان جدیدی که طاقچه فراهم کرده است، شما می‌توانید کتاب خریداری‌شده را مستقیما در سایت طاقچه مطالعه کنید.(برای این کار لازم است با حساب کاربری خود وارد سایت طاقچه شوید)""",
    },
    {
      'question':
          """کتاب‌خانه‌ی طاقچه چیست و چه محدودیتی در نحوه‌ی استفاده از آن وجود دارد؟""",
      'answer':
          """همه‌ی کتاب‌هایی که شما با حساب کاربری خود از طاقچه خریداری می‌کنید در کتاب‌خانه‌ی حساب کاربری شما قرار می‌گیرند و همیشه در سامانه‌ی ابری طاقچه محفوظ خواهند بود. به‌این‌ترتیب حتی پس از پاکسازی یا تعویض گوشی یا تبلت خود می‌توانید بدون نیاز به پرداخت دوباره‌ی وجه، باز هم آنها را دریافت کنید. تنها محدودیت استفاده از کتاب‌خانه‌ی طاقچه در تعداد دستگاه‌هایی است که یک حساب کاربری طاقچه را به آن‌ها متصل می‌کنید (۳ دستگاه).""",
    }
  ];

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    bool _mobileView = _width < 800 ? true : false;

    return FutureBuilder(
        future:
            Provider.of<AboutUsProvider>(context, listen: false).fetchAboutUs(),
        builder: (ctx, snapShot) {
          print(snapShot.connectionState);
          if (snapShot.connectionState == ConnectionState.waiting) {
            return CustomIndicator();
          } else {
            if (snapShot.hasError) {
              print('no data');
              return Center(child: Text('sth went wrong'));
            } else {
              return Container(
                color: backgroundColor,
                child: Stack(children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: appBarHeight + pagesTopMargin),
                    child: SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: pagesBottomMargin,
                          left: _mobileView ? 10 : _width / 4,
                          right: _mobileView ? 10 : _width / 4,
                        ),
                        child:
                            Consumer<AboutUsProvider>(builder: (ctx, d, child) {
                          print(d.aboutUs[0]['id']);

                          return Column(
                            children: [
                              ...(d.aboutUs as List<Map<String, Object>>)
                                  .map((item) {
                                return Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: MoreTextElement(
                                      item,
                                      'question',
                                      'answer',
                                      aboutUsIcon,
                                    ));
                              }).toList(),
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                  NormalAppBar(aboutUsPageTitle, true),
                ]),
              );
            }
          }
        });
  }
}
