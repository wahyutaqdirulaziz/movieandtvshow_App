part of "screen.dart";

class DetailScreenPage extends StatefulWidget {
  int? id;
  DetailScreenPage({super.key, required this.id});

  @override
  State<DetailScreenPage> createState() => _DetailScreenPageState();
}

class _DetailScreenPageState extends State<DetailScreenPage> {
  Movie? movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.kPrimaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ColorConstant.kPrimaryColor,
        centerTitle: true,
        title: Container(
            padding: const EdgeInsets.all(5),
            child: Image.asset(
              "assets/images/logo.png",
              width: 100,
            )),
        elevation: 0,
      ),
      body: SafeArea(
        child: BlocConsumer<DetailBloc, DetailState>(
          bloc: context.read<DetailBloc>()
            ..add(MovieDetailEvent(id: widget.id)),
          listener: (context, state) {
            // TODO: implement listener

            if (state is MovieDetailStateLoaded) {
              movie = Movie(
                  poster_path: state.data.posterPath,
                  id_movie: state.data.id.toString());
            }
          },
          builder: (context, state) {
            if (state is MovieDetailStateLoaded) {
              return ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.all(12),
                    height: MediaQuery.of(context).size.height / 1.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.srcOver),
                        image: NetworkImage(
                            "${ConstantHelper.basePosterUrl}${state.data.posterPath!}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(12),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${state.data.originalTitle!} ${state.data.releaseDate!.toString().substring(0, 4)}",
                              style: TextStyleCustom.regularInter.copyWith(
                                  color: ColorConstant.kWhiteColor,
                                  fontWeight: bold)),
                          Text(state.data.tagline!,
                              style: TextStyleCustom.smallInter.copyWith(
                                  color: ColorConstant.kWhiteColor
                                      .withOpacity(0.8))),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: state.data.genres!
                                .map((e) => Container(
                                      height: 20,
                                      width: 60,
                                      margin: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color: ColorConstant.kYellowColor,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text("${e.name!}",
                                            style: TextStyleCustom
                                                .extraSmallInter
                                                .copyWith(
                                                    color: ColorConstant
                                                        .kWhiteColor)),
                                      ),
                                    ))
                                .toList(),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(state.data.overview!,
                              style: TextStyleCustom.smallInter.copyWith(
                                  color: ColorConstant.kWhiteColor
                                      .withOpacity(0.8))),
                          const SizedBox(
                            height: 5,
                          ),
                          Text("languages",
                              style: TextStyleCustom.extraSmallInter.copyWith(
                                  color: ColorConstant.kWhiteColor,
                                  fontWeight: bold)),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: state.data.spokenLanguages!
                                .map((e) => Container(
                                      height: 20,
                                      width: 60,
                                      margin: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color: ColorConstant.kYellowColor,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text("${e.name!}",
                                            style: TextStyleCustom
                                                .extraSmallInter
                                                .copyWith(
                                                    color: ColorConstant
                                                        .kWhiteColor)),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ]),
                  ),
                  BlocConsumer<MoviewwatchlistBloc, MoviewwatchlistState>(
                    listener: (context, state) {
                      if (state is MoviewwatchlistLoaded) {
                        if (state.data == 0) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Movie is exist at WatchList !!'),
                          ));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Success Add To WatchList !!'),
                          ));
                        }
                      }
                    },
                    builder: (context, state) {
                      return Container(
                        margin: const EdgeInsets.only(right: 16, left: 16),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  ColorConstant.kYellowColor),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side: const BorderSide(
                                          color: ColorConstant
                                              .kYellowColor))) // foreground
                              ),
                          onPressed: () {
                            context
                                .read<MoviewwatchlistBloc>()
                                .add(MovieInsertEvent(movie: movie));
                          },
                          child: Text(
                            'Watchlist',
                            style: TextStyleCustom.smallInter,
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(right: 16, left: 16, bottom: 10),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              ColorConstant.kWhiteColor),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              ColorConstant.kYellowColor),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          )) // foreground
                          ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Back',
                        style: TextStyleCustom.smallInter,
                      ),
                    ),
                  )
                ],
              );
            } else {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
