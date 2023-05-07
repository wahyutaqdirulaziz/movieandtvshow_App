part of './screen.dart';

class AppMainScreenPage extends StatefulWidget {
  AppMainScreenPage({super.key});

  @override
  State<AppMainScreenPage> createState() => _AppMainScreenPageState();
}

class _AppMainScreenPageState extends State<AppMainScreenPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreenPage(),
    WatchlistScreenPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Exit App'),
              content: const Text('Do you want to exit an App?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Yes'),
                ),
              ],
            ),
          ) ??
          false; //if showDialouge had returned null, then return false
    }

    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ColorConstant.kPrimaryColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/icons/home.png",
                color: _selectedIndex == 0
                    ? ColorConstant.kOrangeColor
                    : ColorConstant.kWhiteColor.withOpacity(0.9),
                width: 25,
              ),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.movie_rounded,
                size: 20,
              ),
              label: 'Watchlist',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: ColorConstant.kOrangeColor,
          unselectedItemColor: ColorConstant.kWhiteColor.withOpacity(0.9),
          selectedFontSize: 12,
          unselectedFontSize: 12,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
