import 'dart:io';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String dataText;
  final String userName;
  final String userImageUrl;
  final Function() onProfileTap;

  const CustomAppBar({
    Key? key,
    required this.dataText,
    required this.userName,
    required this.userImageUrl,
    required this.onProfileTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return SliverAppBar(
      pinned: true,
      expandedHeight: _calculateExpandedHeight(context),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.fromLTRB(15, 10, 15, 14),
        title: GestureDetector(
          onTap: onProfileTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDataText(theme),
              _buildUserProfileImage(userImageUrl),
            ],
          ),
        ),
        background: _buildFlexibleSpaceBackground(theme, isDark, context),
      ),
    );
  }

  Text _buildDataText(ThemeData theme) {
    return Text(
      dataText,
      style: theme.textTheme.bodyLarge?.copyWith(
        color: Colors.black,
        fontSize: 20,
      ),
    );
  }

  ClipOval _buildUserProfileImage(String userImageUrl) {
    return ClipOval(
      child: Image.network(
        userImageUrl,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Icon(
              Icons.image,
              color: Colors.white,
              size: 30,
            ),
          );
        },
      ),
    );
  }

  Widget _buildFlexibleSpaceBackground(
      ThemeData theme, bool isDark, BuildContext context) {
    return Stack(
      children: [
        _buildTopBarImage(),
        _buildGreetingRow(theme, context),
        _buildWelcomeContainer(theme, isDark, context),
      ],
    );
  }

  SizedBox _buildTopBarImage() {
    return SizedBox(
      height: 220,
      child: SizedBox(
        height: 180,
        child: Image.asset(
          "assets/images/topbar2.png",
          fit: BoxFit.fitWidth,
          width: double.infinity,
          color: Colors.blue,
        ),
      ),
    );
  }

  Positioned _buildGreetingRow(ThemeData theme, BuildContext context) {
    return Positioned(
      left: 10,
      top: 60,
      right: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildGreetingText(theme),
            _buildUserProfileImage(userImageUrl),
          ],
        ),
      ),
    );
  }

  Row _buildGreetingText(ThemeData theme) {
    return Row(
      children: [
        Text(
          "Hello,",
          style: theme.textTheme.bodyLarge?.copyWith(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          userName,
          style: theme.textTheme.titleLarge?.copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Positioned _buildWelcomeContainer(
      ThemeData theme, bool isDark, BuildContext context) {
    return Positioned(
      left: 20,
      bottom: 10,
      right: 20,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: GestureDetector(
          onTap: () {
            // Handle add property action
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 64,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 232, 229, 229),
              ),
              borderRadius: BorderRadius.circular(16),
              color: isDark ? Colors.grey[50] : Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(2, 61, 236, 0.8),
                  spreadRadius: -10,
                  offset: Offset(0, -25),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Welcome",
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _calculateExpandedHeight(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
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
}
