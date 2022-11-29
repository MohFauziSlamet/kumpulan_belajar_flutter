import 'dart:developer';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const StepperWidgetApp());
}

class StepperWidgetApp extends StatelessWidget {
  const StepperWidgetApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController postCode = TextEditingController();
  List<Step> getSteps() => [
        Step(
          title: const Text('Account'),
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          content: Column(
            children: [
              TextFormField(
                controller: firstName,
                decoration: const InputDecoration(labelText: 'First Name'),
              ),
              TextFormField(
                controller: lastName,
                decoration: const InputDecoration(labelText: 'First Name'),
              ),
            ],
          ),
          isActive: currentStep >= 0,
        ),
        Step(
          title: const Text('Address'),
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          content: Column(
            children: [
              TextFormField(
                controller: address,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
              TextFormField(
                controller: postCode,
                decoration: const InputDecoration(labelText: 'Post Code'),
              ),
            ],
          ),
          isActive: currentStep >= 1,
        ),
        Step(
          title: const Text('Complete'),
          content: Container(),
          isActive: currentStep > 2,
        ),
      ];
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper Widget'),
        centerTitle: true,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Colors.lightBlue)),
        child: Stepper(
          type: StepperType.horizontal,
          steps: getSteps(),
          currentStep: currentStep,
          onStepContinue: () {
            // variabel untuk mengecek , apakah step sudah sampai terakhir
            // index current == panjang getSteps().length - 1
            final isLastStep = currentStep == getSteps().length - 1;

            if (isLastStep) {
              log('Complete');
              // send data to database
            } else {
              setState(
                () {
                  currentStep += 1;
                },
              );
            }
          },
          onStepCancel: () => currentStep == 0
              ? setState(() => log('You are on first step'))
              : setState(
                  () {
                    currentStep -= 1;
                  },
                ),
          onStepTapped: (step) => setState(() {
            currentStep = step;
          }),
          controlsBuilder: (context, details) {
            // variabel untuk mengecek , apakah step sudah sampai terakhir
            // index current == panjang getSteps().length - 1
            final isLastStep = currentStep == getSteps().length - 1;
            return Container(
              margin: const EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: details.onStepContinue,
                      child: Text(isLastStep ? 'Confirm' : 'Next'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: details.onStepCancel,
                      child: const Text('Cancel'),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class SuksesView extends StatefulWidget {
  const SuksesView({Key? key}) : super(key: key);

  @override
  State<SuksesView> createState() => _SuksesViewState();
}

class _SuksesViewState extends State<SuksesView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text(
            'SUKSES',
            style: TextStyle(fontSize: 50),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {});
            },
            child: const Text('Reset'),
          ),
        ],
      ),
    );
  }
}
