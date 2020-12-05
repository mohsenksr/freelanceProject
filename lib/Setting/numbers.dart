double appBarHeight = 80;
double pagesTopMargin = 10;
double pagesBottomMargin = 40;
double mobileViewMaxWidth = 800;

double pagesRightAndLeftMargin(double width, bool mobileView) {
  return mobileView ? 10 : width / 4;
}
