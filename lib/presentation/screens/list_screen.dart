part of 'screen.dart';

class ListScreenPage extends StatefulWidget {
  const ListScreenPage({super.key});

  @override
  State<ListScreenPage> createState() => _ListScreenPageState();
}

class _ListScreenPageState extends State<ListScreenPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: ColorConstant.kPrimaryColor,
          appBar: AppBar(
            backgroundColor: ColorConstant.kPrimaryColor,
            centerTitle: true,
            title: Container(
                padding: const EdgeInsets.all(5),
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 100,
                )),
            elevation: 0,
            bottom: TabBar(
              indicatorColor: ColorConstant.kOrangeColor,
              labelStyle: TextStyleCustom.regularInter,
              isScrollable: true,
              tabs: const [
                Tab(
                  text: "Top rated movies",
                ),
                Tab(
                  text: "Upcoming movies",
                ),
                Tab(
                  text: "Now playing movies",
                ),
                Tab(
                  text: "Popular movies",
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              TopRateWidget(),
              MovieupComing(),
              MoviePlayNow(),
              MoviePopuler(),
            ],
          )),
    );
  }
}

class TopRateWidget extends StatelessWidget {
  const TopRateWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocBuilder<MovietoprateBloc, MovietoprateState>(
      bloc: context.read<MovietoprateBloc>()
        ..add(const MovieTopRateEvent(page: 1)),
      builder: (context, state) {
        if (state is MovietoprateInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is MovietoprateLoaded) {
          return Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 15),
            child: MasonryGridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 6,
              itemCount: state.moviedata.results!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreenPage(
                                id: state.moviedata.results![index].id)));
                  },
                  child: MasonryGridTile(
                    image:
                        "${ConstantHelper.basePosterUrl}${state.moviedata.results![index].posterPath!}",
                  ),
                );
              },
            ),
          );
        } else {
          return Center(
              child: Text(
            "Sayang Sekali Sedang Terjadi Masalah Server",
            style: TextStyleCustom.regularInter.copyWith(
              color: ColorConstant.kWhiteColor,
            ),
          ));
        }
      },
    ));
  }
}

class MovieupComing extends StatelessWidget {
  const MovieupComing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<MovieupcomingBloc>().add(const MovieUpComingEvent(page: "1"));
    return SafeArea(child: BlocBuilder<MovieupcomingBloc, MovieupcomingState>(
      builder: (context, state) {
        if (state is MovieUpComingStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is MovieUpComingStateLoaded) {
          return Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 15),
            child: MasonryGridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 6,
              itemCount: state.moviedata.results!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreenPage(
                                id: state.moviedata.results![index].id)));
                  },
                  child: MasonryGridTile(
                    image:
                        "${ConstantHelper.basePosterUrl}${state.moviedata.results![index].posterPath!}",
                  ),
                );
              },
            ),
          );
        } else {
          return Center(
              child: Text(
            "Sayang Sekali Sedang Terjadi Masalah Server",
            style: TextStyleCustom.regularInter.copyWith(
              color: ColorConstant.kWhiteColor,
            ),
          ));
        }
      },
    ));
  }
}

class MoviePopuler extends StatelessWidget {
  const MoviePopuler({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<MovieBloc>().add(const MoviePopulerEvent(page: "1"));
    return SafeArea(child: BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is MovieStateLoaded) {
          return Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 15),
            child: MasonryGridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 6,
              itemCount: state.moviedata.results!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreenPage(
                                id: state.moviedata.results![index].id)));
                  },
                  child: MasonryGridTile(
                    image:
                        "${ConstantHelper.basePosterUrl}${state.moviedata.results![index].posterPath!}",
                  ),
                );
              },
            ),
          );
        } else {
          return Center(
              child: Text(
            "Sayang Sekali Sedang Terjadi Masalah Server",
            style: TextStyleCustom.regularInter.copyWith(
              color: ColorConstant.kWhiteColor,
            ),
          ));
        }
      },
    ));
  }
}

class MoviePlayNow extends StatelessWidget {
  const MoviePlayNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context
        .read<MovieplayingnowBloc>()
        .add(const MoviePlayingnowEvent(page: "1"));
    return SafeArea(
        child: BlocBuilder<MovieplayingnowBloc, MovieplayingnowState>(
      builder: (context, state) {
        if (state is MovieplayingnowInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is MovieplayingnowLoaded) {
          return Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 15),
            child: MasonryGridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 6,
              itemCount: state.moviedata.results!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreenPage(
                                id: state.moviedata.results![index].id)));
                  },
                  child: MasonryGridTile(
                    image:
                        "${ConstantHelper.basePosterUrl}${state.moviedata.results![index].posterPath!}",
                  ),
                );
              },
            ),
          );
        } else {
          return Center(
              child: Text(
            "Sayang Sekali Sedang Terjadi Masalah Server",
            style: TextStyleCustom.regularInter.copyWith(
              color: ColorConstant.kWhiteColor,
            ),
          ));
        }
      },
    ));
  }
}
