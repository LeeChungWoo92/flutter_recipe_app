import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/components/big_button.dart';
import 'package:flutter_recipe_app/core/presentation/components/filter_button.dart';
import 'package:flutter_recipe_app/core/presentation/components/input_field.dart';
import 'package:flutter_recipe_app/core/presentation/components/rating_button.dart';
import 'package:flutter_recipe_app/core/presentation/components/two_tab.dart';
import 'package:flutter_recipe_app/core/presentation/dialogs/rating_dialog.dart';
import 'package:flutter_recipe_app/core/routing/router.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

import 'core/presentation/components/medium_button.dart';
import 'core/presentation/components/small_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Component', style: TextStyles.largeTextBold),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  return RatingDialog(
                      title: 'Rate recipe',
                      score: 3,
                      actionName: 'Send',
                      onChange: (sceore) {
                        print(sceore);
                      });
                },
              );
            },
            child: Text('RatingDialog'),
          ),
          TwoTab(
            labels: [
              'label1',
              'label2',
            ],
            selectedIndex: 1,
            onChange: (int index) {
              print('TwoTab: $index');
            },
          ),
          const RatingButton('text'),
          const RatingButton('text', isSelected: true),
          const FilterButton('text'),
          const FilterButton('text', isSelected: true),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BigButton(
              "Big",
              onPressed: () {
                print("Big Button Clicked");
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MediumButton(
              "Medium",
              onPressed: () {
                print("Big Button Clicked");
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SmallButton(
              "Small",
              onPressed: () {
                print("Big Button Clicked");
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: InputField(
              label: 'Label',
              placeHolder: 'placeHolder',
            ),
          )
        ],
      ),
    );
  }
}
