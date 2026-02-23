import 'package:flutter/material.dart';
import 'package:moksha_path/features/widgets/appbar/appbar.dart';
import 'package:moksha_path/features/widgets/sidebar/side_bar.dart';

class StudyMaterialsPage extends StatefulWidget {
  const StudyMaterialsPage({super.key});

  @override
  State<StudyMaterialsPage> createState() => _StudyMaterialsPageState();
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

class _StudyMaterialsPageState extends State<StudyMaterialsPage> {
  String selectedBoard = 'ICSE';
  String selectedClass = 'Class 7';
  String selectedDifficulty = 'Difficult';
  String selectedTab = 'Videos';
  String selectedSubject = 'Science';

  final List<String> subjects = [
    'Math',
    'Science',
    'History',
    'Civics',
    'Geography',
    'English Literature',
    'English Grammar',
    'Hindi Sah',
  ];

  final List<String> tabs = ['Videos', 'Practice', 'Tests', 'Notes'];

  final List<String> chapters = [
    'Matter',
    'Physical Quantities & Measurement',
    'Physical Changes',
    'Least Count',
    'Errors',
  ];

  final List<String> coreTopics = [
    'States',
    'Interconversion',
    'Physical Changes',
    'Least Count',
    'Errors',
  ];

  final List<String> boards = ['ICSE', 'CBSE', 'State'];
  final List<String> classes = [
    'Class 6',
    'Class 7',
    'Class 8',
    'Class 9',
    'Class 10',
  ];
  final List<String> difficulties = ['Easy', 'Medium', 'Difficult'];

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
          child: Column(
            children: [
              _buildHeroBanner(),
              _buildSubjectTabs(),
              _buildContentTabs(),
              _buildMainContent(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      drawer: SideNavBar(),
    );
  }

  Widget _buildHeroBanner() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kDark,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          // Vidya Kosh header row
          Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
            child: Row(
              children: [
                // Avatar circle
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kOrange,
                    border: Border.all(color: kYellow, width: 3),
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 42,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Vidya ',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: 'Kosh',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: kYellow,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        'Knowledge Hub',
                        style: TextStyle(fontSize: 11, color: Colors.white54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Learn through ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'Videos',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: kYellow,
                        ),
                      ),
                      TextSpan(
                        text: ', ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'Notes',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: kOrange,
                        ),
                      ),
                      TextSpan(
                        text: ', and ',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'Structured Resources',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: kYellow,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Access high-quality video lessons, learning materials, and notes — organised by subject, chapter, and difficulty level.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white60,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),

          // Filters
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.07),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Choose your filters',
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _buildDropdown(
                        'Board',
                        selectedBoard,
                        boards,
                        (v) => setState(() => selectedBoard = v!),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildDropdown(
                        'Class',
                        selectedClass,
                        classes,
                        (v) => setState(() => selectedClass = v!),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildDropdown(
                        'Level',
                        selectedDifficulty,
                        difficulties,
                        (v) => setState(() => selectedDifficulty = v!),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    String value,
    List<String> items,
    ValueChanged<String?> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: Colors.white54),
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            underline: const SizedBox(),
            style: const TextStyle(fontSize: 11, color: kDarkMid),
            dropdownColor: Colors.white,
            items: items
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: const TextStyle(fontSize: 11, color: kDarkMid),
                    ),
                  ),
                )
                .toList(),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _buildSubjectTabs() {
    return Container(
      height: 44,
      margin: const EdgeInsets.only(bottom: 2),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: subjects.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final isSelected = subjects[i] == selectedSubject;
          return GestureDetector(
            onTap: () => setState(() => selectedSubject = subjects[i]),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? kYellow : Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: isSelected ? kYellow : kBorder),
              ),
              child: Text(
                subjects[i],
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? kDark : kGrey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showTestPopup() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(16),
          child: SingleChildScrollView(child: _buildTestCard(context)),
        );
      },
    );
  }

  Widget _buildContentTabs() {
    return Container(
      height: 48,
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: tabs.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, i) {
          final isSelected = tabs[i] == selectedTab;
          return GestureDetector(
            onTap: () {
              if (tabs[i] == 'Tests') {
                _showTestPopup();
              } else {
                setState(() => selectedTab = tabs[i]);
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: isSelected ? kOrange : Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: isSelected ? kOrange : const Color(0xFFCBD5E0),
                ),
              ),
              child: Text(
                tabs[i],
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: isSelected ? Colors.white : kGrey,
                ),
              ),
            ),
          );
        },
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

  Widget _buildMainContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sidebar
          SizedBox(
            width: 130,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSidebarSection('Chapters', chapters, kOrange),
                const SizedBox(height: 16),
                _buildSidebarSection('Core Topics', coreTopics, kYellow),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Main area
          Expanded(
            child: selectedTab == 'Tests'
                ? _buildTestCard(context)
                : _buildVideosEmptyState(),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebarSection(
    String title,
    List<String> items,
    Color activeColor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
                color: kDarkMid,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const Text(
                'Show All',
                style: TextStyle(fontSize: 9, color: kGrey),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...items.asMap().entries.map((entry) {
          final isActive = entry.key == 1;
          final activeBg = activeColor == kYellow ? kYellow : kOrange;
          final activeTextColor = activeColor == kYellow ? kDark : Colors.white;
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 6),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
            decoration: BoxDecoration(
              color: isActive ? activeBg : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: isActive ? activeBg : kBorder),
            ),
            child: Text(
              entry.value,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: isActive ? activeTextColor : const Color(0xFF4A5568),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildVideosEmptyState() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: kBorder),
      ),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: const BoxDecoration(
              color: kYellow,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.play_circle_outlined,
              color: kDark,
              size: 36,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Select a Chapter',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: kDark,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Choose a chapter from the sidebar to browse available videos for that topic.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11, color: kGrey, height: 1.5),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: kDark,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Browse All',
              style: TextStyle(
                color: kYellow,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
