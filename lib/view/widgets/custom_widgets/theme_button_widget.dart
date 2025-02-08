
import 'package:flutter/material.dart';
import 'package:untitled/utils/theme/app_colors/all_colors_export.dart';

class SwitchAdaptiveWidget extends StatelessWidget {
  final bool value;
  final Function? onChange;

  const SwitchAdaptiveWidget({
    this.value = true,
    this.onChange,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Switch.adaptive(
        value: value,
        onChanged: onChange != null ? (v) => onChange!(v) : null,
        activeColor: Colors.white,
      ),
    );
  }
}
