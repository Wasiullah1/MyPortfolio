import 'package:flutter/material.dart';
import 'package:flutter_profile/components/animated_counter.dart';
import 'package:flutter_profile/responsive.dart';
import 'package:flutter_profile/utils/function.dart';

import '../../../constants.dart';
import 'heigh_light.dart';

class GithubStats extends StatelessWidget {
  const GithubStats({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FutureBuilder(
          future: getGithubStats(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData)
              return Center(
                  child: CircularProgressIndicator(
                color: primaryColor,
              ));
            return (MediaQuery.of(context).size.width > 500)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      StatsText(
                          number: snapshot.data['followers'] - 1,
                          text: 'Followers'),
                      Spacer(),
                      StatsText(
                          number: snapshot.data['public_repos'] - 1,
                          text: 'Repos'),
                      Spacer(),
                      StatsText(
                          number: snapshot.data['public_gists'], text: 'Gists'),
                      Spacer(),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StatsText(
                          number: snapshot.data['followers'] - 1,
                          text: 'Followers'),
                      SizedBox(
                        height: 10,
                      ),
                      StatsText(
                          number: snapshot.data['public_repos'] - 1,
                          text: 'Repos'),
                      SizedBox(
                        height: 10,
                      ),
                      StatsText(
                          number: snapshot.data['public_gists'], text: 'Gists'),
                    ],
                  );
          }),
    );
  }
} 
class StatsText extends StatelessWidget {
  const StatsText({
    Key? key,
    required this.number,
    required this.text,
  }) : super(key: key);

  final int number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedCounter(
          value: number,
          text: '+',
        ),
        SizedBox(
          width: defaultPadding / 2,
        ),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: Colors.white),
        ),
      ],
    );
  }
}

