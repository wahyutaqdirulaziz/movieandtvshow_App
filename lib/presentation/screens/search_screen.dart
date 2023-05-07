part of "./screen.dart";

class SearchScreenPage extends StatefulWidget {
  const SearchScreenPage({Key? key}) : super(key: key);

  @override
  State<SearchScreenPage> createState() => _SearchScreenPageState();
}

class _SearchScreenPageState extends State<SearchScreenPage> {
  final FocusNode _focusNode = FocusNode();
  final _debouncer = Debouncer(milliseconds: 500);
  TextEditingController searchController = TextEditingController();
  String keyword = "";

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: GestureDetector(
          onTap: _removeFocus,
          child: Scaffold(
            backgroundColor: ColorConstant.kPrimaryColor,
            appBar: AppBar(
              title: Builder(builder: (context) {
                return FormSearch(
                  controller: searchController,
                  focusNode: _focusNode,
                  onSubmitted: (String? val) {
                    FocusScope.of(context).requestFocus();
                    _debouncer.run(() {
                      if (val != '') {
                        setState(() {
                          BlocProvider.of<SearchtvmovieBloc>(context,
                                  listen: false)
                              .add(SearchEvent(page: 1, keyword: val));
                        });

                        context
                            .watch<SearchtvmovieBloc>()
                            .add(SearchEvent(page: 1, keyword: val));
                      }
                    });
                  },
                );
              }),
              backgroundColor: ColorConstant.kPrimaryColor,
              elevation: 0,
              bottom: TabBar(
                indicatorColor: ColorConstant.kOrangeColor,
                labelStyle: TextStyleCustom.regularInter,
                isScrollable: true,
                tabs: const [
                  Tab(
                    text: "Movie",
                  ),
                  Tab(
                    text: "Tv",
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: TabBarView(
                    children: [
                      BlocBuilder<SearchtvmovieBloc, SearchtvmovieState>(
                        bloc: context.read<SearchtvmovieBloc>()
                          ..add(SearchEvent(
                              page: 1, keyword: searchController.text)),
                        builder: (context, state) {
                          if (state is SearchtvmovieError) {
                            return SafeArea(
                                child: Center(
                                    child: Text(
                              "Search movie & tv you !",
                              style: TextStyleCustom.regularInter.copyWith(
                                  color: ColorConstant.kWhiteColor
                                      .withOpacity(0.3)),
                            )));
                          }
                          if (state is SearchtvmovieInitial) {
                            return SafeArea(
                                child: Center(
                                    child: Text(
                              "Search movie & tv you !",
                              style: TextStyleCustom.regularInter.copyWith(
                                  color: ColorConstant.kWhiteColor
                                      .withOpacity(0.3)),
                            )));
                          }
                          if (state is SearchtvmovieLoaded) {
                            return SafeArea(
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 16, right: 16, top: 15),
                                child: MasonryGridView.count(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 6,
                                  itemCount: state.moviedata!.results!.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailScreenPage(
                                                        id: state
                                                            .moviedata!
                                                            .results![index]
                                                            .id)));
                                      },
                                      child: MasonryGridTile(
                                          image: state
                                                      .moviedata!
                                                      .results![index]
                                                      .posterPath !=
                                                  null
                                              ? "${ConstantHelper.basePosterUrl}${state.moviedata!.results![index].posterPath!}"
                                              : "https://example.com/placeholder-image.jpg"),
                                    );
                                  },
                                ),
                              ),
                            );
                          }
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      ),
                      SafeArea(
                          child: BlocBuilder<SearchtvBloc, SearchtvState>(
                        bloc: context.read<SearchtvBloc>()
                          ..add(SearchTvEvent(
                              page: 1, keyword: searchController.text)),
                        builder: (context, state) {
                          if (state is SearchtvInitial) {
                            return SafeArea(
                                child: Center(
                                    child: Text(
                              "Search movie & tv you !",
                              style: TextStyleCustom.regularInter.copyWith(
                                  color: ColorConstant.kWhiteColor
                                      .withOpacity(0.3)),
                            )));
                          }
                          if (state is SearchtvError) {
                            return SafeArea(
                                child: Center(
                                    child: Text(
                              "Search movie & tv you !",
                              style: TextStyleCustom.regularInter.copyWith(
                                  color: ColorConstant.kWhiteColor
                                      .withOpacity(0.3)),
                            )));
                          }
                          if (state is SearchtvLoaded) {
                            if (state.tvdata!.results!.length > 0) {
                              return Container(
                                margin: const EdgeInsets.only(
                                    left: 16, right: 16, top: 15),
                                child: MasonryGridView.count(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 6,
                                  itemCount: state.tvdata!.results!.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailScreenPage(
                                                        id: state
                                                            .tvdata!
                                                            .results![index]
                                                            .id)));
                                      },
                                      child: MasonryGridTile(
                                          image: state.tvdata!.results![index]
                                                      .posterPath !=
                                                  null
                                              ? "${ConstantHelper.basePosterUrl}${state.tvdata!.results![index].posterPath!}"
                                              : "https://example.com/placeholder-image.jpg"),
                                    );
                                  },
                                ),
                              );
                            } else {
                              return SafeArea(
                                  child: Center(
                                      child: Text(
                                "Data yang and Cari Tidak ada !",
                                style: TextStyleCustom.regularInter.copyWith(
                                    color: ColorConstant.kWhiteColor
                                        .withOpacity(0.3)),
                              )));
                            }
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void _removeFocus() {
    if (_focusNode.hasFocus) {
      _focusNode.unfocus();
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    searchController.dispose();
    super.dispose();
  }
}

class FormSearch extends StatelessWidget {
  const FormSearch(
      {super.key,
      required this.controller,
      required this.focusNode,
      required this.onSubmitted});
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String) onSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: TextInputType.text,
        focusNode: focusNode,
        controller: controller,
        textCapitalization: TextCapitalization.none,
        style: TextStyleCustom.regularInter.copyWith(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle:
              TextStyleCustom.regularInter.copyWith(color: Colors.white54),
          border: InputBorder.none,
        ),
        onFieldSubmitted: onSubmitted);
  }
}
