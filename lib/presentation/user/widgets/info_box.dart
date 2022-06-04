import 'package:flutter/material.dart';
import 'package:mc_challenge/presentation/theme/constants.dart';
import 'package:mc_challenge/presentation/user/widgets/info.dart';

class InfoBox extends StatelessWidget {
  final String title;
  final List<Info> infos;

  const InfoBox({
    Key? key,
    required this.title,
    required this.infos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(blurRadius: 4, color: Colors.black12),
        ],
        color: kWhite,
        border: Border.all(
          color: Colors.black12,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                for (var info in infos) ...[
                  ...[
                    info,
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
