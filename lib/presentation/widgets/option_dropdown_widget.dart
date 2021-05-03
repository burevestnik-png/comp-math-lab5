import 'package:comp_math_lab5/presentation/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionDropdown<T> extends StatefulWidget {
  final List<T> items;
  final Rx<T> obs;
  final void Function(T) onChange;
  late final String? text;
  late final String Function(T) toStr;

  static String _defaultToString<T>(T t) => t.toString();

  OptionDropdown({
    required this.items,
    required this.obs,
    required this.onChange,
    String Function(T)? toStr,
    String? text,
  }) {
    this.toStr = toStr ?? _defaultToString;
    this.text = text ?? null;
  }

  @override
  _OptionDropdownState<T> createState() =>
      _OptionDropdownState<T>(items, obs, onChange, toStr);
}

class _OptionDropdownState<T> extends State<OptionDropdown> {
  final List<T> _items;
  final Rx<T> _obs;
  final void Function(T) _onChange;
  final String Function(T) toStr;

  late var _crutchedDropdownValue;

  _OptionDropdownState(this._items, this._obs, this._onChange, this.toStr);

  @override
  void initState() {
    super.initState();
    _crutchedDropdownValue = _obs.value;
  }

  List<DropdownMenuItem<T>> buildDropDownMenuItems(List<T> items) {
    return items.map<DropdownMenuItem<T>>((T t) {
      return DropdownMenuItem(
        child: Text(toStr(t)),
        value: t,
      );
    }).toList();
  }

  _buildDropdownButton() {
    return DropdownButton<T>(
      value: _crutchedDropdownValue,
      items: buildDropDownMenuItems(_items),
      isExpanded: true,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      underline: Container(
        height: 2,
        color: Colors.blue,
      ),
      onChanged: (T? newValue) {
        _onChange(newValue!);
        setState(() {
          _crutchedDropdownValue = newValue;
        });
      },
    );
  }

  _buildFlexibleDropdownButton() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: _buildDropdownButton(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.text == null) {
      return _buildDropdownButton();
    } else {
      return Row(
        children: [
          SizedBox(
            width: 100,
            child: fieldText(
              widget.text!,
              size: TextSize.SMALL,
              isItalics: true,
            ),
          ),
          _buildFlexibleDropdownButton(),
        ],
      );
    }
  }
}
