import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/custom_appbar/app_bar.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> with WidgetsBindingObserver {
  final TextEditingController _textFieldController = TextEditingController();
Country? selectedCountry;
  ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _scrollController.addListener(_onScroll);

   
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    setState(() {
      _isScrolled = _scrollController.hasClients &&
          _scrollController.offset > (120.0); // Adjust this value as needed
    });
  }

  double calculateExpandedHeight(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    print("this i s screeen h $screenHeight");
    if (Platform.isIOS) {
      if (screenHeight < 690) {
        return 200.0;
      } else if (screenHeight < 850) {
        return 170.0;
      } else {
        return 165.0;
      }
    } else if (Platform.isAndroid) {
      return 190.0;
    } else {
      return 165.0; // Default value for other platforms
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final divider = Divider(color: theme.colorScheme.outlineVariant);

    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      //  body: NestedScrollView(
      // headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
      //   return <Widget>[
      //     CustomAppBar(
      //       dataText: 'Flutter',
      //       userName: 'Qasim Ali',
      //       userImageUrl: 'https://example.com/user.jpg',
      //       onProfileTap: () {
      //         // Handle profile tap
      //       },
      //     ),
      //   ];
      // },
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                pinned: true,
                expandedHeight: calculateExpandedHeight(context),
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.fromLTRB(15, 10, 15, 14),
                  title: _isScrolled
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Respnsive appbar",
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: SizedBox(
                                width: 35,
                                height: 35,
                                child: ClipOval(
                                  child: Image.network(
                                    "",
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Center(
                                        child: Icon(
                                          Icons.image,
                                          color: Colors.black,
                                          size: 30,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : null,
                  background: Stack(
                    children: [
                      SizedBox(
                        height: 220,
                        child: Stack(
                          children: [
                            SizedBox(
                              height: 180,
                              child: Image.asset(
                                color: Colors.blueAccent,
                                "assets/images/topbar2.png",
                                fit: BoxFit.fitWidth,
                                width: double.infinity,
                              ),
                            ),
                            Positioned(
                              left: 10,
                              top: 60,
                              right: 10,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Hello,",
                                          style: theme.textTheme.bodyLarge
                                              ?.copyWith(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Flutter",
                                          style: theme.textTheme.titleLarge
                                              ?.copyWith(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: SizedBox(
                                        width: 35,
                                        height: 35,
                                        child: ClipOval(
                                          child: Image.network(
                                            "",
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return const Center(
                                                child: Icon(
                                                  Icons.image,
                                                  color: Colors.white,
                                                  size: 30,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 20,
                        bottom: 10,
                        right: 20,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              height: 64,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 232, 229, 229)),
                                borderRadius: BorderRadius.circular(16),
                                color: isDark ? Colors.grey[50] : Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(
                                        3, 63, 228, 0.8), // Darker shadow color
                                    spreadRadius: -10,
                                    // blurRadius: 5,
                                    offset: Offset(
                                        0, -25), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text("Welcome Screen",
                                        style: theme.textTheme.titleLarge
                                            ?.copyWith(
                                                color: Colors.black,
                                                fontSize: 14)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ];
        },
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10,20,10,10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 10,
                ),
               
             
                const SizedBox(height: 40),
                const Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Please make a selection",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          openUrl("https://youtu.be/wz7OW6luQhY.");
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/home/youtube.png",
                                height: 30,
                                width: 50,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "How to use",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 25),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      showPhoneCode: false,
                      onSelect: (Country country) {
                        setState(() {
                          selectedCountry = country;
                          _saveSelectedCountry(country);
                        });
                      },
                    );
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (selectedCountry != null)
                          Text(
                            selectedCountry!.flagEmoji,
                            style: const TextStyle(fontSize: 32,),
                          ),
                        const SizedBox(width: 8),
                        Text(
                          selectedCountry?.name ?? 'Select a Country',
                          style: const TextStyle(
                              fontSize: 26, color: Colors.black,fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                        
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Center(
                            child: Text(
                              "Live Server",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: const Center(
                            child: Text(
                              "Subscribe",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 26),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
   
          ],
        ),
      ),
    );
  }
}
