import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pspdfkit_flutter/pspdfkit.dart';
import 'package:pspdfkit_flutter/widgets/pspdfkit_widget.dart';
import 'package:pspdfkit_flutter/widgets/pspdfkit_widget_controller.dart';

import 'show_pdf.dart';

const String DOCUMENT_PATH = 'PDFs/Document.pdf';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late PspdfkitWidgetController view;

  // Create an Instant JSON payload.
  final annotationsJson = '''
  {
    "annotations": [{
      "bbox": [18.4609375, 582.3333740234375, 431.6640625, 426.00003051757812],
      "blendMode": "normal",
      "createdAt": "2019-11-15T15:36:25Z",
      "creatorName": "PSPDFKit",
      "isDrawnNaturally": false,
      "lineWidth": 10,
      "lines": {
        "intensities": [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]],
        "points": [[[271.6171875, 598], [266.93331909179688, 595.16668701171875], [259.71206665039062, 591.5833740234375], [255.27398681640625, 590.16668701171875], [248.65992736816406, 588.75], [244.59376525878906, 588.0030517578125], [239.75138854980469, 587.3333740234375], [234.60507202148438, 587.3333740234375], [229.98934936523438, 587.3333740234375], [225.3984375, 588.5908203125], [218.64601135253906, 588.75], [212.66595458984375, 588.75], [206.78047180175781, 590.16668701171875], [190.50941467285156, 591.5833740234375], [179.1796875, 593.75], [167.80718994140625, 595.16668701171875], [158.66848754882812, 596.5833740234375], [150.61857604980469, 598], [144.00840759277344, 600.125], [139.43266296386719, 600.125], [135.82032775878906, 601.54168701171875], [130.93865966796875, 604.41668701171875], [125.97789764404297, 607.9583740234375], [120.16405487060547, 609.6793212890625], [114.53083038330078, 612.2083740234375], [109.08804321289062, 614.375], [104.01295471191406, 616.29022216796875], [98.109375, 619.43707275390625], [92.337196350097656, 622.16668701171875], [87.625740051269531, 625.04168701171875], [82.543983459472656, 628.5833740234375], [77.507820129394531, 631.41668701171875], [71.68023681640625, 636.41668701171875], [68.25, 641.36651611328125], [63.281246185302734, 644.66424560546875], [58.289066314697266, 650.6976318359375], [54.0234375, 658.99774169921875], [49.0546875, 669.7379150390625], [42.656242370605469, 681.2083740234375], [37.6875, 694.83612060546875], [32.695316314697266, 707.46807861328125], [29.859375, 717.4583740234375], [28.429689407348633, 730.241943359375], [24.867185592651367, 742.06866455078125], [24.867185592651367, 753.7083740234375], [23.4609375, 768.94134521484375], [23.4609375, 782.875], [23.4609375, 799.98004150390625], [23.4609375, 814.16668701171875], [24.867185592651367, 828.375], [27, 841.2083740234375], [29.859375, 854], [32.695316314697266, 867.92138671875], [36.257816314697266, 880.78863525390625], [41.226566314697266, 893.8333740234375], [42.656242370605469, 904.97161865234375], [44.085941314697266, 913.21966552734375], [45.185382843017578, 919.41668701171875], [48.017143249511719, 928.0272216796875], [51.890621185302734, 937.18316650390625], [56.882816314697266, 946.41668701171875], [61.938720703125, 952.8333740234375], [64.687507629394531, 957.05609130859375], [70.581169128417969, 962.0833740234375], [78.143966674804688, 968.4583740234375], [86.742179870605469, 973.4583740234375], [96.703125, 979.875], [109.5, 984.125], [124.87102508544922, 989.0833740234375], [137.95753479003906, 992.66668701171875], [149.32032775878906, 995.5], [163.54685974121094, 999.04168701171875], [184.17189025878906, 1000.4583740234375], [209.76560974121094, 1001.9166870117188], [231.79685974121094, 1003.3333740234375], [250.99217224121094, 1003.3333740234375], [265.053955078125, 1003.3333740234375], [276.60940551757812, 1003.3333740234375], [287.2734375, 1001.9166870117188], [301.83041381835938, 1000.2388916015625], [317.83590698242188, 995.5], [333.4921875, 992.66668701171875], [345.98687744140625, 984.57415771484375], [355.52838134765625, 976.28839111328125], [366.91409301757812, 965.625], [384.67971801757812, 952.8333740234375], [401.74224853515625, 941.4583740234375], [414.5625, 932.2083740234375], [425.454345703125, 924.84600830078125], [432.32809448242188, 915.875], [436.59375, 901.6387939453125], [441.58590698242188, 881], [442.99221801757812, 854], [445.125, 830.54168701171875], [445.125, 807.79168701171875], [442.99221801757812, 788.7923583984375], [440.15625, 771.5], [435.16409301757812, 752.2916259765625], [430.19534301757812, 736.66668701171875], [427.35934448242188, 724.387451171875], [424.5, 715.0751953125], [420.96090698242188, 708.2083740234375], [415.96810913085938, 698.25], [410.59469604492188, 690.4583740234375], [406.734375, 682.9306640625], [403.17190551757812, 677.268798828125], [400.33590698242188, 671.87744140625], [395.66424560546875, 668.41668701171875], [389.95599365234375, 662.67138671875], [381.23092651367188, 657], [373.3125, 650.625], [366.91409301757812, 645.625], [360.19537353515625, 641.375], [354.17913818359375, 637.8333740234375], [349.00265502929688, 634.9583740234375], [345.44509887695312, 631.41668701171875], [339.6290283203125, 628.5833740234375], [334.68048095703125, 625.04168701171875], [330.84097290039062, 623.5833740234375], [325.87319946289062, 622.16668701171875], [319.62060546875, 620.75], [315.2069091796875, 618.625], [309.99786376953125, 618.6029052734375], [304.51095581054688, 617.2083740234375], [300.08163452148438, 617.2083740234375], [297.23440551757812, 616.544189453125], [292.9212646484375, 615.7916259765625], [287.88607788085938, 615.7916259765625], [283.19888305664062, 615.7916259765625], [277.85714721679688, 615.7916259765625], [273.72171020507812, 615.043701171875], [268.078125, 614.58349609375], [264.75930786132812, 615.7916259765625], [260.88003540039062, 615.7916259765625], [256.7109375, 615.7916259765625], [252.39967346191406, 617.2083740234375], [247.453125, 622.875], [243.87890625, 623.5833740234375], [239.98826599121094, 625.04168701171875]]]
      },
      "name": "ed9b4f2f-8178-4b69-9c50-bb59f820e10e",
      "opacity": 1,
      "pageIndex": 0,
      "strokeColor": "#2196F3",
      "type": "pspdfkit/ink",
      "updatedAt": "2019-11-15T15:36:25Z",
      "v": 1
    }],
    "format": "https://pspdfkit.com/instant-json/v1",
    "pdfId": {
      "changing": "3llO8Q1c9h7lim6xrsd3BQ==",
      "permanent": "2ShIBg/xQBK0uIs748b8Ng=="
    }
  }
''';
  void showDocument(BuildContext context) async {
    final bytes = await DefaultAssetBundle.of(context).load(DOCUMENT_PATH);
    final list = bytes.buffer.asUint8List();

    final tempDir = await Pspdfkit.getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}/$DOCUMENT_PATH';

    final file = await File(tempDocumentPath).create(recursive: true);
    file.writeAsBytesSync(list);

    await Pspdfkit.present(tempDocumentPath);
    //save annotations
    // await Pspdfkit.applyInstantJson(annotationsJson);
    //export 5 detik sekali
    Future.delayed(Duration(seconds: 10), () async {
      await Pspdfkit.save();

      final annotationsJSON = await Pspdfkit.exportInstantJson();
      debugPrint("Json : $annotationsJSON");
    });

// Will print all the unsaved annotations in the document.
  }

  Future<File> extractAsset(BuildContext context, String assetPath, {bool shouldOverwrite = true, String prefix = ''}) async {
    final bytes = await DefaultAssetBundle.of(context).load(assetPath);
    final list = bytes.buffer.asUint8List();

    final tempDir = await Pspdfkit.getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}/$prefix$assetPath';
    final file = File(tempDocumentPath);

    if (shouldOverwrite || !file.existsSync()) {
      await file.create(recursive: true);
      file.writeAsBytesSync(list);
    }
    return file;
  }

  void showDocuments() async {
    final extractedDocument = await extractAsset(context, DOCUMENT_PATH);
    await Navigator.of(context).push<dynamic>(
      MaterialPageRoute<dynamic>(
        builder: (_) => Scaffold(
          // Do not resize the the document view on Android or
          // it won't be rendered correctly when filling forms.
          appBar: AppBar(),
          body: SafeArea(
            top: false,
            bottom: false,
            child: Container(
              child: PspdfkitWidget(
                documentPath: extractedDocument.path,
              ),
            ),
          ),
        ),
      ),
    );
  }

  File? path;

  //get file from function and assign to path
  void getFile() async {
    final file = await extractAsset(context, DOCUMENT_PATH);
    setState(() {
      path = file;
      debugPrint('Path: ${path?.path}');
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return MaterialApp(
      home: Scaffold(body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text('Tap to Open Document', style: themeData.textTheme.headline4?.copyWith(fontSize: 21.0)),
                  onPressed: () => getFile(),
                ),
                ElevatedButton(
                  child: Text('Tap to Open Document', style: themeData.textTheme.headline4?.copyWith(fontSize: 21.0)),
                  onPressed: () async {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => PspdfkitInstantJsonExampleWidget(documentPath: path!.path, instantJsonPath: 'PDFs/Instant.json')));
                  },
                ),
                // Expanded(
                //   child: PspdfkitWidget(
                //     documentPath: path?.path,
                //     onPspdfkitWidgetCreated: (PspdfkitWidgetController controller) {
                //       setState(() {
                //         view = controller;
                //       });
                //     },
                //   ),
                // ),
              ],
            ),
          );
        },
      )),
    );
  }
}
