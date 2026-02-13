import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moksha_path/core/helper/global_chip.dart';
import 'package:moksha_path/core/helper/global_textfield.dart';
import 'package:moksha_path/features/register/presentation/bloc/register_bloc.dart';
import 'package:moksha_ui_kit/moksha_ui_kit.dart';

class UsernameSection extends StatelessWidget {
  final TextEditingController controller;
  final bool usernameChecked;
  final bool usernameAvailable;
  final bool showSuggestions;
  final List<String> suggestions;
  final VoidCallback onCheckUsername;
  final ValueChanged<String> onSuggestionSelected;

  const UsernameSection({
    super.key,
    required this.controller,
    required this.usernameChecked,
    required this.usernameAvailable,
    required this.showSuggestions,
    required this.suggestions,
    required this.onCheckUsername,
    required this.onSuggestionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabeledTextField(
          label: 'Username',
          hintText: 'Select or type username',
          controller: controller,
          showDropdown: true,
        ),

        // Availability indicator
        if (usernameChecked)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Row(
              children: [
                Icon(
                  usernameAvailable ? Icons.check_circle : Icons.cancel,
                  color: usernameAvailable ? Colors.green : Colors.red,
                  size: 18,
                ),
                const SizedBox(width: 6),
                Text(
                  usernameAvailable
                      ? 'Username is available'
                      : 'Username is not available',
                  style: TextStyle(
                    color: usernameAvailable ? Colors.green : Colors.red,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

        // Suggestions dropdown
        if (showSuggestions)
          Container(
            margin: const EdgeInsets.only(top: 4),
            constraints: const BoxConstraints(maxHeight: 180),
            decoration: BoxDecoration(
              color: AppTheme.of(context).background,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: suggestions.length,
              itemBuilder: (ctx, i) {
                return ListTile(
                  dense: true,
                  title: Text(suggestions[i]),
                  onTap: () => onSuggestionSelected(suggestions[i]),
                );
              },
            ),
          ),

        const SizedBox(height: 8),

        // Check Username button
        Align(
          alignment: Alignment.centerRight,
          child: BlocBuilder<RegisterBloc, RegisterState>(
            buildWhen: (prev, curr) =>
                curr is UsernameCheckLoadInProgress ||
                curr is UsernameCheckLoadSuccess ||
                curr is UsernameCheckLoadFailure,
            builder: (context, state) {
              if (state is UsernameCheckLoadInProgress) {
                return const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                );
              }
              return GlobalChip(
                text: 'Check Username',
                isActive: true,
                onTap: onCheckUsername,
              );
            },
          ),
        ),
      ],
    );
  }
}
