class RouteNames{

  RouteNames._internalConstructor();

  static final RouteNames _instance = RouteNames._internalConstructor();

  factory RouteNames(){
    return _instance;
  }

  static const String kInitialRoute = "/";
  static const String kHomeScreenRoute = "/Home_Screen_Route";
 static const String kSearchRoute= "/Search_Screen_Route";
  static const String kListRoute= "/List_Screen_Route";


}