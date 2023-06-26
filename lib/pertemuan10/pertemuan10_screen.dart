import 'package:flutter/material.dart';
import 'package:flutter_m10/pertemuan10/components/fullscreen_dialog_widget.dart';

class Pertemuan10Screen extends StatefulWidget {
  const Pertemuan10Screen({Key? key}) : super(key: key);

  @override
  State<Pertemuan10Screen> createState() => _Pertemuan10ScreenState();
}

class _Pertemuan10ScreenState extends State<Pertemuan10Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pertemuan 10 - M. Natasya Ramadana'),
      ),
      body: Column(children: [
        const SizedBox(height: 16),
        MaterialBanner(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Banner',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                  'A banner display an important succinct \n message, and provides actions for users to \n address (or dismiss the banner). it requires \n a user antion to be dismiss'),
              SizedBox(
                height: 20,
              ),
            ],
          ),
          actions: [
            TextButton(
                onPressed: () => ScaffoldMessenger.of(context)
                  ..removeCurrentMaterialBanner()
                  ..showMaterialBanner(showBanner(context)),
                child: const Text('Show Banner'))
          ],
        ),
        SizedBox(
          height: 20,
        ),
        MaterialBanner(
          content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Dialog',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                    'Dialog inform users about a task and can contain critical \n information, require decisions, or invoive multiple tasks')
              ]),
          actions: [
            TextButton(
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) => showAlertDialog(context)),
                child: const Text('Alert Dialog')),
            TextButton(
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) => showSimpleDialog(context)),
                child: const Text('Phone Rightone')),
            TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: ((context) => FullScreenDialog()))),
                child: const Text('Full'))
          ],
        ),
        SizedBox(
          height: 20,
        ),
        MaterialBanner(
            content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Snackbar',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                      'Snackbar provide brief messages about \n app processes at the bottom of the screen'),
                  SizedBox(
                    height: 20,
                  ),
                ]),
            actions: [
              TextButton(
                  child: const Text('Snackbar'),
                  onPressed: () => ScaffoldMessenger.of(context)
                      .showSnackBar(showSnackBar(context)))
            ]),
        SizedBox(
          height: 20,
        ),
      ]),
    );
  }

  showBanner(BuildContext context) {
    return MaterialBanner(
        content: const Text('Flutter Tutorial'),
        leading: const Icon(
          Icons.folder,
          color: Colors.orange,
        ),
        actions: [
          TextButton(onPressed: () {}, child: const Text('UPDATE')),
          TextButton(
              onPressed: () =>
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
              child: const Text('DISMISS'))
        ]);
  }

  showAlertDialog(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Reset setting ?',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: const Text(
        'This will reset your device to its default \n factory setting?',
        style: TextStyle(fontSize: 13),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('CANCEL'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('ACCEPT'),
        ),
      ],
    );
  }

  showSimpleDialog(BuildContext context) {
    return SimpleDialog(
      title: const Text('Set backup account'),
      children: List.generate(4, ((index) {
        return SimpleDialogOption(
          onPressed: () => Navigator.pop(context, 'mail$index@mail.com'),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.info, size: 36.0, color: Colors.black),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 16.0),
                child: Text('Uno$index'),
              ),
            ],
          ),
        );
      })),
    );
  }

  showSnackBar(BuildContext context) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 6),
      content: const Text('Hey User \nCustom Snackbar'),
      action: SnackBarAction(
        label: 'ADD',
        textColor: Colors.red,
        onPressed: () => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
      ),
    );
  }
}