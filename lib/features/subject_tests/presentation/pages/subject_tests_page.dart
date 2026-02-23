import 'package:flutter/material.dart';
import 'package:moksha_path/features/widgets/appbar/appbar.dart';

class SubjectTestsPage extends StatelessWidget {
  const SubjectTestsPage({super.key});

  // Brand colors
  static const Color kYellow = Color(0xFFFFCC00);
  static const Color kOrange = Color(0xFFFF6B35);
  static const Color kDark = Color(0xFF1A202C);
  static const Color kDarkMid = Color(0xFF2D3748);
  static const Color kGrey = Color(0xFF718096);
  static const Color kBorder = Color(0xFFE2E8F0);
  static const Color kBg = Color(0xFFF7F7F7);
  static const Color kGreen = Color(0xFF6DBF35);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      appBar: MokshaAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(children: [_buildTestCard(context)]),
        ),
      ),
    );
  }

  Widget _buildTestCard(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: kBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card header banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            decoration: const BoxDecoration(
              color: kDark,
              borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: kYellow,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'ICSE  •  Class 8',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: kDark,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Physics – Matter\n(States of Matter)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Chapter: Matter',
                  style: TextStyle(fontSize: 11, color: Colors.white54),
                ),
              ],
            ),
          ),

          // Info section
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section label
                _buildSectionLabel('Test Overview'),
                const SizedBox(height: 12),

                // Info grid
                _buildInfoGrid([
                  _InfoItem(
                    icon: Icons.class_outlined,
                    label: 'Class',
                    value: '8',
                  ),
                  _InfoItem(
                    icon: Icons.school_outlined,
                    label: 'Board',
                    value: 'ICSE',
                  ),
                  _InfoItem(
                    icon: Icons.menu_book_outlined,
                    label: 'Chapter',
                    value: 'Matter',
                  ),
                  _InfoItem(
                    icon: Icons.quiz_outlined,
                    label: 'MCQ',
                    value: '50 Marks',
                  ),
                ]),

                const SizedBox(height: 20),
                const Divider(color: kBorder, thickness: 1),
                const SizedBox(height: 20),

                _buildSectionLabel('Exam Rules'),
                const SizedBox(height: 12),

                _buildInfoGrid([
                  _InfoItem(
                    icon: Icons.timer_outlined,
                    label: 'Duration',
                    value: '30 minutes*',
                  ),
                  _InfoItem(
                    icon: Icons.star_border_rounded,
                    label: 'Max Marks',
                    value: '100',
                  ),
                  _InfoItem(
                    icon: Icons.format_list_bulleted_rounded,
                    label: 'Pattern',
                    value: 'ICSE-aligned',
                  ),
                  _InfoItem(
                    icon: Icons.remove_circle_outline,
                    label: 'Negative Marking',
                    value: 'No',
                  ),
                  _InfoItem(
                    icon: Icons.edit_note_rounded,
                    label: 'Long-Q',
                    value: '50 Marks',
                  ),
                ]),

                const SizedBox(height: 12),

                // Disclaimer
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: kYellow.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kYellow.withOpacity(0.4)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.info_outline_rounded,
                        size: 14,
                        color: kOrange,
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          '* After 30 minutes, the system will freeze your marks to where you are. Keep an eye on the stop watch.',
                          style: TextStyle(
                            fontSize: 10,
                            color: kDarkMid,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                // Start Tests button
                SizedBox(
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        color: kGreen,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Start Tests',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionLabel(String label) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 16,
          decoration: BoxDecoration(
            color: kOrange,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w800,
            color: kDark,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoGrid(List<_InfoItem> items) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: items.map((item) => _buildInfoChip(item)).toList(),
    );
  }

  Widget _buildInfoChip(_InfoItem item) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: kBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(item.icon, size: 14, color: kOrange),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.label,
                style: const TextStyle(
                  fontSize: 9,
                  color: kGrey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                item.value,
                style: const TextStyle(
                  fontSize: 11,
                  color: kDark,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoItem {
  final IconData icon;
  final String label;
  final String value;
  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });
}
