part of './screen.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    SplashCubit screenCubit = context.watch<SplashCubit>();
    screenCubit.onReady(context);
    return BlocConsumer<SplashCubit, SplashState>(
      listener: (context, state) {
      
        if (state is Splashloaded) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteNames.kHomeScreenRoute,
            (page) => false,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorConstant.kPrimaryColor,
          body: SafeArea(
              child: Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 160,
                  ))),
        );
      },
    );
  }
}
