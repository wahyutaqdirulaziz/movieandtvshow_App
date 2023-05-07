part of "./screen.dart";

class WatchlistScreenPage extends StatefulWidget {
  const WatchlistScreenPage({super.key});

  @override
  State<WatchlistScreenPage> createState() => _WatchlistScreenPageState();
}

class _WatchlistScreenPageState extends State<WatchlistScreenPage> {
  @override
  Widget build(BuildContext context) {
    context.read<MoviewwatchlistBloc>().add(MovieWatchEvent(isDeleted: false));
    return Scaffold(
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
      ),
      body: BlocConsumer<MoviewwatchlistBloc, MoviewwatchlistState>(
        listener: (context, state) {
          if (state is MoviewwatchLoaded) {
            print(state.moviedata[0].poster_path);
          }
        },
        builder: (context, state) {
        

          if (state is MoviewwatchlistError) {
            return SafeArea(
                child: Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Center(
                  child: Text(
                "Belum Ada Data",
                style: TextStyleCustom.regularInter.copyWith(
                  color: ColorConstant.kWhiteColor.withOpacity(0.3),
                ),
              )),
            ));
          }
          if (state is MoviewwatchLoaded) {
            if (state.moviedata.isEmpty) {
              return SafeArea(
                  child: Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: Center(
                    child: Text(
                  "Belum Ada Data",
                  style: TextStyleCustom.regularInter.copyWith(
                    color: ColorConstant.kWhiteColor.withOpacity(0.3),
                  ),
                )),
              ));
            } else {
              return SafeArea(
                  child: Container(
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 6,
                  itemCount: state.moviedata.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreenWatchingPage(
                                    id: int.parse(
                                        state.moviedata[index].id_movie!))));
                      },
                      child: MasonryGridTile(
                        image:
                            "${ConstantHelper.basePosterUrl}${state.moviedata[index].poster_path}",
                      ),
                    );
                  },
                ),
              ));
            }
          } else {
            return SafeArea(
                child: Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Center(
                  child: Text(
                "Belum Ada Data",
                style: TextStyleCustom.regularInter.copyWith(
                  color: ColorConstant.kWhiteColor.withOpacity(0.3),
                ),
              )),
            ));
          }
        },
      ),
    );
  }
}

class MasonryGridTile extends StatelessWidget {
  final String image;
  const MasonryGridTile({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Colors.white),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image(
              image: NetworkImage(image),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text("Name", style: TextStyleCustom.regularInter),
          //           IconButton(
          //               onPressed: () {},
          //               icon: const Icon(
          //                 Icons.download,
          //                 color: Colors.teal,
          //               ))
          //         ],
          //       ),
          //       Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit",
          //           style: TextStyleCustom.smallInter)
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
