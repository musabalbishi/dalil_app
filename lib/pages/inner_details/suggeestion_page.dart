import 'package:dalil_app/constant/styles.dart';
import 'package:dalil_app/pages/inner_details/suggestion_form.dart';
import 'package:dalil_app/utilities/back_button.dart';
import 'package:dalil_app/widgets/camera_widget.dart';
import 'package:flutter/material.dart';

class SuggestionPage extends StatelessWidget {
  const SuggestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Styles.red,
          leading: const BackBtn(),
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(' أضف صورة:'),
                CameraWidget(
                  function: () {
                    // function to add a  picture
                  },
                ),
                //
                SuggestionForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
