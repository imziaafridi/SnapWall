class PixelApiUrls {
  static String BASE_URL = 'https://api.pexels.com';
  static String TRENDING_URL = 'https://api.pexels.com/v1/curated';
  static String SEARCH_URL = 'https://api.pexels.com/v1/search';

  static String query = '?query';
// trending
  static String questionMark = '?';
  static String page = 'page';
  static String equalTo = '=';

  static String perPage = 'per_page';

  static String nd = '&';

  // string method

  static String getPage(int page) {
    return page.toString();
  }
}
