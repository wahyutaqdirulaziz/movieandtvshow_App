part of './screen.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  final int _currentPage = 0;
  // ignore: prefer_final_fields
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorConstant.kPrimaryColor,
        appBar: AppBar(
          backgroundColor: ColorConstant.kPrimaryColor,
          title: Container(
              padding: const EdgeInsets.all(5),
              child: Image.asset(
                "assets/images/logo.png",
                width: 100,
              )),
          elevation: 0,
          actions: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteNames.kSearchRoute,
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(
                  "assets/icons/Search.png",
                  width: 40,
                ),
              ),
            )
          ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: TabbarWidget(),
          ),
        ),
        body: TabBarView(
          children: [
            MovieWidget(pageController: _pageController),
            TvshowWidget(pageController: _pageController)
          ],
        ),
      ),
    );
  }
}

class MovieWidget extends StatefulWidget {
  const MovieWidget({
    Key? key,
    required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;

  @override
  State<MovieWidget> createState() => _MovieWidgetState();
}

class _MovieWidgetState extends State<MovieWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TitleHead(
              title: "Playnow movies",
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteNames.kListRoute,
                );
              },
            ),
            BlocBuilder<MovieplayingnowBloc, MovieplayingnowState>(
              bloc: context.read<MovieplayingnowBloc>()
                ..add(const MoviePlayingnowEvent(page: "1")),
              builder: (context, state) {
                if (state is MovieplayingnowLoaded) {
                  return Container(
                    margin: const EdgeInsets.only(left: 8, right: 8),
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      child: MasonryGridView.count(
                        shrinkWrap: true,
                        physics: const PageScrollPhysics(),
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 4,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailScreenPage(
                                          id: state.moviedata
                                              .results![index + 1].id)));
                            },
                            child: MasonryGridTile(
                              image:
                                  "${ConstantHelper.basePosterUrl}${state.moviedata.results![index + 1].posterPath!}",
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
                return Container(
                    margin: const EdgeInsets.only(left: 8, right: 8),
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ));
              },
            ),
            TitleHead(
              title: "Popular movies",
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteNames.kListRoute,
                );
              },
            ),
            const PopulerCard(),
            TitleHead(
              title: "Top rated movies",
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteNames.kListRoute,
                );
              },
            ),
            const TopRateCard(),
            TitleHead(
              title: "UpComing movies",
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteNames.kListRoute,
                );
              },
            ),
            const UpComingrCard()
          ],
        ),
      ),
    ));
  }
}

class TopRateCard extends StatelessWidget {
  const TopRateCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 10),
      height: MediaQuery.of(context).size.height / 4.5,
      width: MediaQuery.of(context).size.width * 0.9,
      child: BlocBuilder<MovietoprateBloc, MovietoprateState>(
        bloc: context.read<MovietoprateBloc>()
          ..add(const MovieTopRateEvent(page: 1)),
        builder: (context, state) {
          if (state is MovietoprateLoaded) {
            return Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Container(
                margin: const EdgeInsets.only(left: 8, right: 8),
                child: MasonryGridView.count(
                  shrinkWrap: true,
                  physics: const PageScrollPhysics(),
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 4,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreenPage(
                                    id: state
                                        .moviedata.results![index + 1].id)));
                      },
                      child: MasonryGridTile(
                        image:
                            "${ConstantHelper.basePosterUrl}${state.moviedata.results![index + 1].posterPath!}",
                      ),
                    );
                  },
                ),
              ),
            );
          }
          return Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              height: 200,
              width: MediaQuery.of(context).size.width * 0.9,
              child: const Center(
                child: CircularProgressIndicator(),
              ));
        },
      ),
    );
  }
}

class PopulerCard extends StatelessWidget {
  const PopulerCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      bloc: context.read<MovieBloc>()..add(const MoviePopulerEvent(page: "1")),
      builder: (context, state) {
        if (state is MovieStateLoaded) {
          return Container(
            margin: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width * 0.9,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailScreenPage(
                                  id: state.moviedata.results![index + 6].id)));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Stack(children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 2.1,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.4),
                                  BlendMode.srcOver),
                              image: NetworkImage(
                                  "${ConstantHelper.baseBackdropUrl}${state.moviedata.results![index + 6].backdropPath!}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(
                                left: 12, right: 12, bottom: 20),
                            height: 100,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorConstant.kWhiteColor.withOpacity(0.3),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    state.moviedata.results![index + 6]
                                        .originalTitle!,
                                    style: TextStyleCustom.buttonInter.copyWith(
                                        color: ColorConstant.kWhiteColor,
                                        fontWeight: bold)),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    state.moviedata.results![index + 6]
                                        .overview!,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyleCustom.smallInter.copyWith(
                                        color: ColorConstant.kWhiteColor
                                            .withOpacity(0.8))),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 16, right: 16, top: 20, bottom: 20),
                            height: 30,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ColorConstant.kWhiteColor.withOpacity(0.3),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  "assets/icons/Play.png",
                                  width: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Popularity",
                                        style: TextStyleCustom.extraSmallInter
                                            .copyWith(
                                                color: ColorConstant.kWhiteColor
                                                    .withOpacity(0.8)),
                                      ),
                                      Text(
                                          state.moviedata.results![index + 6]
                                              .popularity!
                                              .toString(),
                                          style: TextStyleCustom.extraSmallInter
                                              .copyWith(
                                                  color: ColorConstant
                                                      .kWhiteColor
                                                      .withOpacity(0.8))),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                  );
                }),
          );
        }
        if (state is MovieStateLoading) {
          return Container(
              margin: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width * 0.9,
              child: const Center(
                child: CircularProgressIndicator(),
              ));
        } else {
          return Container(
              margin: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width * 0.9,
              child: const Center(
                child: CircularProgressIndicator(),
              ));
        }
      },
    );
  }
}

class UpComingrCard extends StatelessWidget {
  const UpComingrCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieupcomingBloc, MovieupcomingState>(
      bloc: context.read<MovieupcomingBloc>()
        ..add(const MovieUpComingEvent(page: "1")),
      builder: (context, state) {
        if (state is MovieUpComingStateLoaded) {
          return Container(
            margin: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width * 0.9,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailScreenPage(
                                  id: state.moviedata.results![index + 4].id)));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Stack(children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 2.1,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.4),
                                  BlendMode.srcOver),
                              image: NetworkImage(
                                  "${ConstantHelper.baseBackdropUrl}${state.moviedata.results![index + 4].backdropPath!}"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.only(
                                left: 12, right: 12, bottom: 20),
                            height: 100,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: ColorConstant.kWhiteColor.withOpacity(0.3),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    state.moviedata.results![index + 4]
                                        .originalTitle!,
                                    style: TextStyleCustom.buttonInter.copyWith(
                                        color: ColorConstant.kWhiteColor,
                                        fontWeight: bold)),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    state.moviedata.results![index + 4]
                                        .overview!,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyleCustom.smallInter.copyWith(
                                        color: ColorConstant.kWhiteColor
                                            .withOpacity(0.8))),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 16, right: 16, top: 20, bottom: 20),
                            height: 30,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: ColorConstant.kWhiteColor.withOpacity(0.3),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  "assets/icons/Play.png",
                                  width: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Popularity",
                                        style: TextStyleCustom.extraSmallInter
                                            .copyWith(
                                                color: ColorConstant.kWhiteColor
                                                    .withOpacity(0.8)),
                                      ),
                                      Text(
                                          state.moviedata.results![index + 4]
                                              .popularity!
                                              .toString(),
                                          style: TextStyleCustom.extraSmallInter
                                              .copyWith(
                                                  color: ColorConstant
                                                      .kWhiteColor
                                                      .withOpacity(0.8))),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ),
                  );
                }),
          );
        }
        if (state is MovieUpComingStateLoading) {
          return Container(
              margin: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width * 0.9,
              child: const Center(
                child: CircularProgressIndicator(),
              ));
        } else {
          return Container(
              margin: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width * 0.9,
              child: const Center(
                child: CircularProgressIndicator(),
              ));
        }
      },
    );
  }
}

class TvshowWidget extends StatelessWidget {
  const TvshowWidget({
    Key? key,
    required PageController pageController,
  })  : _pageController = pageController,
        super(key: key);

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            TitleHeadTv(
              title: "Popular Tv",
              onTap: () {
                print("hello");
              },
            ),
            BlocBuilder<TvpopulerBloc, TvpopulerState>(
              bloc: context.read<TvpopulerBloc>()
                ..add(const TvPopulerEvent(page: 1)),
              builder: (context, state) {
                if (state is TvpopulerLoadedState) {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 10),
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             DetailScreenPage(
                                  //                 id: state
                                  //                     .tvdata
                                  //                     .results![index + 8]
                                  //                     .id)));
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: Stack(children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2.1,
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(
                                          colorFilter: ColorFilter.mode(
                                              Colors.black.withOpacity(0.4),
                                              BlendMode.srcOver),
                                          image: NetworkImage(
                                              "${ConstantHelper.baseBackdropUrl}${state.tvdata.results![index + 8].backdropPath!}"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        margin: const EdgeInsets.only(
                                            left: 12, right: 12, bottom: 20),
                                        height: 100,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: ColorConstant.kWhiteColor
                                              .withOpacity(0.3),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                state.tvdata.results![index + 8]
                                                    .name!,
                                                style:
                                                    TextStyleCustom.buttonInter
                                                        .copyWith(
                                                            color: ColorConstant
                                                                .kWhiteColor,
                                                            fontWeight: bold)),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                                state.tvdata.results![index + 8]
                                                    .overview!,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyleCustom
                                                    .smallInter
                                                    .copyWith(
                                                        color: ColorConstant
                                                            .kWhiteColor
                                                            .withOpacity(0.8))),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 16,
                                            right: 16,
                                            top: 20,
                                            bottom: 20),
                                        height: 30,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: ColorConstant.kWhiteColor
                                              .withOpacity(0.3),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Image.asset(
                                              "assets/icons/Play.png",
                                              width: 20,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Column(
                                                // mainAxisAlignment: MainAxisAlignment.center,
                                                // crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Popularity",
                                                    style: TextStyleCustom
                                                        .extraSmallInter
                                                        .copyWith(
                                                            color: ColorConstant
                                                                .kWhiteColor
                                                                .withOpacity(
                                                                    0.8)),
                                                  ),
                                                  Text(
                                                      state
                                                          .tvdata
                                                          .results![index + 8]
                                                          .popularity!
                                                          .toString(),
                                                      style: TextStyleCustom
                                                          .extraSmallInter
                                                          .copyWith(
                                                              color: ColorConstant
                                                                  .kWhiteColor
                                                                  .withOpacity(
                                                                      0.8))),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              );
                            }),
                      ),
                      TitleHeadTv(
                        title: "Top rated Tv",
                        onTap: () {},
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 10),
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             DetailScreenPage(
                                  //                 id: state
                                  //                     .tvdatatop
                                  //                     .results![index + 8]
                                  //                     .id)));
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: Stack(children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2.1,
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(
                                          colorFilter: ColorFilter.mode(
                                              Colors.black.withOpacity(0.4),
                                              BlendMode.srcOver),
                                          image: NetworkImage(
                                              "${ConstantHelper.baseBackdropUrl}${state.tvdatatop.results![index + 8].backdropPath!}"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        padding: const EdgeInsets.all(12),
                                        margin: const EdgeInsets.only(
                                            left: 12, right: 12, bottom: 20),
                                        height: 100,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: ColorConstant.kWhiteColor
                                              .withOpacity(0.3),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                state.tvdatatop
                                                    .results![index + 8].name!,
                                                style: TextStyleCustom
                                                    .buttonInter
                                                    .copyWith(
                                                        color: ColorConstant
                                                            .kWhiteColor,
                                                        fontWeight: bold)),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                                state
                                                    .tvdatatop
                                                    .results![index + 8]
                                                    .overview!,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyleCustom
                                                    .smallInter
                                                    .copyWith(
                                                        color: ColorConstant
                                                            .kWhiteColor
                                                            .withOpacity(0.8))),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 16,
                                            right: 16,
                                            top: 20,
                                            bottom: 20),
                                        height: 30,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: ColorConstant.kWhiteColor
                                              .withOpacity(0.3),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Image.asset(
                                              "assets/icons/Play.png",
                                              width: 20,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(2.0),
                                              child: Column(
                                                // mainAxisAlignment: MainAxisAlignment.center,
                                                // crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Popularity",
                                                    style: TextStyleCustom
                                                        .extraSmallInter
                                                        .copyWith(
                                                            color: ColorConstant
                                                                .kWhiteColor
                                                                .withOpacity(
                                                                    0.8)),
                                                  ),
                                                  Text(
                                                      state
                                                          .tvdatatop
                                                          .results![index + 8]
                                                          .popularity!
                                                          .toString(),
                                                      style: TextStyleCustom
                                                          .extraSmallInter
                                                          .copyWith(
                                                              color: ColorConstant
                                                                  .kWhiteColor
                                                                  .withOpacity(
                                                                      0.8))),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              );
                            }),
                      ),
                    ],
                  );
                } else {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    ));
  }
}

class TabbarWidget extends StatelessWidget {
  const TabbarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: ColorConstant.kOrangeColor,
      labelStyle: TextStyleCustom.regularInter,
      // ignore: prefer_const_literals_to_create_immutables
      tabs: [
        const Tab(
          text: "Movie",
        ),
        const Tab(text: "Tv Show"),
      ],
    );
  }
}

// ignore: must_be_immutable
class TitleHead extends StatefulWidget {
  String? title;
  VoidCallback onTap;
  TitleHead({Key? key, this.title, required this.onTap}) : super(key: key);

  @override
  State<TitleHead> createState() => _TitleHeadState();
}

class _TitleHeadState extends State<TitleHead> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title!,
              style: TextStyleCustom.smallInter.copyWith(
                  color: ColorConstant.kWhiteColor, fontWeight: bold)),
          InkWell(
            onTap: widget.onTap,
            child: Text("Show All",
                style: TextStyleCustom.smallInter.copyWith(
                    color: ColorConstant.kOrangeColor, fontWeight: regular)),
          ),
        ],
      ),
    );
  }
}

class TitleHeadTv extends StatefulWidget {
  String? title;
  VoidCallback onTap;
  TitleHeadTv({Key? key, this.title, required this.onTap}) : super(key: key);

  @override
  State<TitleHeadTv> createState() => _TitleHeadTvState();
}

class _TitleHeadTvState extends State<TitleHeadTv> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 10),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title!,
              style: TextStyleCustom.smallInter.copyWith(
                  color: ColorConstant.kWhiteColor, fontWeight: bold)),
        ],
      ),
    );
  }
}
