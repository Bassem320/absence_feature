import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DropdownElement<T> extends StatelessWidget {
  const DropdownElement({
    super.key,
    this.value,
    required this.name,
    required this.items,
    required this.onChanged,
    this.validator,
    this.hint,
  });

  final T? value;
  final String name;
  final String? hint;
  final List<T> items;
  final void Function(T) onChanged;
  final String? Function(T?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: FormBuilderDropdown <T>(
        name: name,
        dropdownColor: Theme.of(context).colorScheme.onPrimary,
        validator: validator,
        decoration: InputDecoration(
          // hintText: hint,
          labelText: hint,
          hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.shadow,
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.onPrimary.withAlpha(30),
        ),
        initialValue: value,
        items: [
          for (final data in items)
            DropdownMenuItem<T>(
              value: data,
              child: Text(
                data.toString(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
        ],
        onChanged: (value) {
          if (value != null) {
            onChanged(value);
          }
        },
        style: Theme.of(context).textTheme.bodySmall?.apply(
              color: Theme.of(context).colorScheme.surfaceContainer,
            ),
      ),
    );
  }
}
