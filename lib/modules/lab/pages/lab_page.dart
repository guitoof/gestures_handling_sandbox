import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hand_signature/signature.dart';

class LabPage extends StatelessWidget {
  const LabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: TabBarView(
        children: [
          Container(height: 200, color: Colors.pink),
          ListView(
            children: [
              Column(
                children: [
                  Row(
                    children: const [
                      Flexible(
                        child: Text(
                            'The grey section is the signature pad which should absorb all gestures, on mobile this will look a bit funky at the moment'),
                      ),
                    ],
                  ),
                  const SignatureSection(),
                  ...List.generate(
                    20,
                    (index) {
                      return Container(height: 300, width: 300, color: index.isEven ? Colors.red : Colors.blue);
                    },
                  ),
                ],
              ),
            ],
          ),
          Container(height: 200, color: Colors.green),
        ],
      ),
    );
  }
}

class SignatureSection extends StatefulWidget {
  const SignatureSection({
    Key? key,
  }) : super(key: key);

  @override
  State<SignatureSection> createState() => _SignatureSectionState();
}

class _SignatureSectionState extends State<SignatureSection> {
  final control = HandSignatureControl();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      height: 300,
      width: 300,
      child: RawGestureDetector(
        gestures: {
          EagerGestureRecognizer:
              GestureRecognizerFactoryWithHandlers<EagerGestureRecognizer>(
                  () => EagerGestureRecognizer(),
                  (EagerGestureRecognizer instance) {})
        },
        child: HandSignature(
          control: control,
          type: SignatureDrawType.shape,
        ),
      ),
    );
  }
}
