import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls + Tiles'),
      ),
      body: const _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportations { car, bike, boat, bus }

class _UiControlsViewState extends State<_UiControlsView> {
  bool switchValue = false;
  Transportations _transportation = Transportations.car;

  bool _wantsBreakFast = false;
  bool _wantsBreakLunch = false;
  bool _wantsBreakDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SwitchListTile(
            value: switchValue,
            onChanged: (value) {
              setState(() {
                switchValue = value;
              });
            },
            title: const Text('Controles adicionales')),
        ExpansionTile(
          title: const Text('Vehiculo de transporte'),
          subtitle: Text("$_transportation"),
          children: [
            RadioListTile(
              value: Transportations.car,
              groupValue: _transportation,
              onChanged: (value) {
                setState(() {
                  _transportation = Transportations.car;
                });
              },
              title: const Text('Carro'),
              subtitle: const Text("Viajar por Carro"),
            ),
            RadioListTile(
              value: Transportations.bike,
              groupValue: _transportation,
              onChanged: (value) {
                setState(() {
                  _transportation = Transportations.bike;
                });
              },
              title: const Text('bicicleta'),
              subtitle: const Text("Viajar por Bicicleta"),
            ),
            RadioListTile(
              value: Transportations.boat,
              groupValue: _transportation,
              onChanged: (value) {
                setState(() {
                  _transportation = Transportations.boat;
                });
              },
              title: const Text('Barco'),
              subtitle: const Text("Viajar por Barco"),
            ),
            RadioListTile(
              value: Transportations.bus,
              groupValue: _transportation,
              onChanged: (value) {
                setState(() {
                  _transportation = Transportations.bus;
                });
              },
              title: const Text('Bus'),
              subtitle: const Text("Viajar por Bus"),
            ),
          ],
        ),

        //TODO: Add more controls here

        CheckboxListTile(
            value: _wantsBreakFast,
            onChanged: (value) {
              setState(() {
                _wantsBreakFast = value ?? false;
              });
            },
            title: const Text('Desayuno?')),
        CheckboxListTile(
            value: _wantsBreakLunch,
            onChanged: (value) {
              setState(() {
                _wantsBreakLunch = value ?? false;
              });
            },
            title: const Text('Almuerzo?')),
        CheckboxListTile(
            value: _wantsBreakDinner,
            onChanged: (value) {
              setState(() {
                _wantsBreakDinner = value ?? false;
              });
            },
            title: const Text('Cena?')),
      ],
    );
  }
}
