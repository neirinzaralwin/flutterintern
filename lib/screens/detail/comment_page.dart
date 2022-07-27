import 'package:flutter/material.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Q: အနီရောင်လေးရနိုင်မလား',
                  style: TextStyle(color: Colors.blue),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.add))
              ],
            ),
            const Text(
              'လကုန်ရင် ရောက်ပါမယ် ဖုန်းပေးခဲ့ပါ။',
              style: TextStyle(color: Colors.black54),
            )
          ],
        ),
      ],
    );
  }
}
