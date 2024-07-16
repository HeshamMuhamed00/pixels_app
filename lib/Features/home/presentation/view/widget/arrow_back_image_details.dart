import 'package:flutter/material.dart';
import 'package:pixels_app/core/utils/constants.dart';

class ArrowBackAndDownloadIcon extends StatelessWidget {
  const ArrowBackAndDownloadIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            CircleAvatar(
              backgroundColor: downloadBackground.withOpacity(0.8),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.download,
                    color: Colors.white,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
