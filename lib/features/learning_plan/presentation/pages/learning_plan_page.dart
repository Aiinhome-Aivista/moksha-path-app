import 'package:flutter/material.dart';
import 'package:moksha_path/features/widgets/appbar/appbar.dart';
import 'package:moksha_path/features/widgets/bottom_navigation/bottom_navigation.dart';
import 'package:moksha_path/features/widgets/floating_action_button/floating_action_button.dart';
import 'package:moksha_path/features/widgets/sidebar/side_bar.dart';

// class LearningPlanPage extends StatelessWidget {
//   const LearningPlanPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MokshaPath Learning Planner',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         fontFamily: 'Roboto',
//         colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFFCC00)),
//         useMaterial3: true,
//       ),
//       home: const LearningPlannerScreen(),
//     );
//   }
// }

// ── Data Models ────────────────────────────────────────────────────────────────

enum Priority { high, medium, low }

class Chapter {
  final int sl;
  final String name;
  final List<String> coreTopics;
  final Priority priority;
  final String dateRange;
  final int progress; // 0–100
  final int testCount;
  final int reviseCount;

  const Chapter({
    required this.sl,
    required this.name,
    required this.coreTopics,
    required this.priority,
    required this.dateRange,
    required this.progress,
    this.testCount = 0,
    this.reviseCount = 0,
  });
}

final List<Chapter> physicsChapters = [
  Chapter(
    sl: 1,
    name: 'Matter',
    coreTopics: ['States', 'Inter-conversion', 'Physical Changes'],
    priority: Priority.high,
    dateRange: '10–15 Jan\'26',
    progress: 100,
    testCount: 1,
    reviseCount: 2,
  ),
  Chapter(
    sl: 2,
    name: 'Physical Quantities and Measurement',
    coreTopics: ['States', 'Inter-conversion', 'Physical Changes'],
    priority: Priority.high,
    dateRange: '18–25 Jan\'26',
    progress: 90,
    testCount: 1,
    reviseCount: 1,
  ),
  Chapter(
    sl: 3,
    name: 'Force & Pressure',
    coreTopics: ['SI Units', 'Least Count', 'Errors'],
    priority: Priority.medium,
    dateRange: '28–05 Feb\'26',
    progress: 85,
    testCount: 1,
    reviseCount: 1,
  ),
  Chapter(
    sl: 4,
    name: 'Energy',
    coreTopics: [],
    priority: Priority.low,
    dateRange: '08–18 Feb\'26',
    progress: 45,
    testCount: 1,
    reviseCount: 1,
  ),
  Chapter(
    sl: 5,
    name: 'Light Energy',
    coreTopics: [],
    priority: Priority.high,
    dateRange: '08–18 Feb\'26',
    progress: 0,
    testCount: 1,
    reviseCount: 1,
  ),
  Chapter(
    sl: 6,
    name: 'Heat Transfer',
    coreTopics: [],
    priority: Priority.high,
    dateRange: '08–18 Feb\'26',
    progress: 40,
    testCount: 1,
    reviseCount: 1,
  ),
  Chapter(
    sl: 7,
    name: 'Sound',
    coreTopics: [],
    priority: Priority.low,
    dateRange: '08–18 Feb\'26',
    progress: 0,
    testCount: 1,
    reviseCount: 1,
  ),
  Chapter(
    sl: 8,
    name: 'Electricity (Basic)',
    coreTopics: [],
    priority: Priority.medium,
    dateRange: '08–18 Feb\'26',
    progress: 0,
    testCount: 1,
    reviseCount: 1,
  ),
];

// ── Colours ────────────────────────────────────────────────────────────────────

const Color kYellow = Color(0xFFFFCC00);
const Color kDarkYellow = Color(0xFFE6B800);
const Color kRed = Color(0xFFE53935);
const Color kGreen = Color(0xFF43A047);
const Color kOrange = Color(0xFFFF6F00);
const Color kBlue = Color(0xFF1976D2);
const Color kBgGrey = Color(0xFFF5F5F5);
const Color kCardWhite = Colors.white;
const Color kTextDark = Color(0xFF1A1A2E);
const Color kTextGrey = Color(0xFF757575);

// ── Main Screen ───────────────────────────────────────────────────────────────

class LearningPlannerScreen extends StatefulWidget {
  const LearningPlannerScreen({super.key});

  @override
  State<LearningPlannerScreen> createState() => _LearningPlannerScreenState();
}

class _LearningPlannerScreenState extends State<LearningPlannerScreen> {
  int _selectedSubject = 0;
  final List<String> _subjects = [
    'Physics',
    'Chemistry',
    'Biology',
    'Mathematics',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgGrey,
      appBar: MokshaAppBar(),
      drawer: SideNavBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProfileCard(),
                    const SizedBox(height: 16),
                    _buildSubjectTabs(),
                    const SizedBox(height: 16),
                    _buildChapterList(),
                    const SizedBox(height: 16),
                    _buildLegendCard(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // optional
      // floatingActionButton: MokshaFloatingActionButton(),
      bottomNavigationBar: MokshaBottomNavigation(),
    );
  }

  // ── Profile / Stats Card ─────────────────────────────────────────────────────

  Widget _buildProfileCard() {
    return Container(
      decoration: BoxDecoration(
        color: kCardWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            children: [
              // Avatar
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: kYellow, width: 2.5),
                ),
                child: const CircleAvatar(
                  backgroundColor: Color(0xFFFFE082),
                  child: Icon(Icons.person, size: 32, color: kTextDark),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Learning Planner',
                      style: TextStyle(
                        color: kTextGrey,
                        fontSize: 12,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const Text(
                      'Hi Aarav !',
                      style: TextStyle(
                        color: kTextDark,
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const Text(
                      'St. Thomas School for Boys',
                      style: TextStyle(color: kTextGrey, fontSize: 11),
                    ),
                    const Text(
                      'ICSE | Class 8: Science, Mathematics',
                      style: TextStyle(color: kTextGrey, fontSize: 11),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Stats row
          SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildDaysLeft(),
                const SizedBox(width: 10),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatBadge('28', 'Chapters\nAssigned', kYellow),
                      _buildStatBadge(
                        '65',
                        'Target\nCompletion(days)',
                        kYellow,
                      ),
                      _buildStatBadge('11', 'Completed', kYellow),
                      _buildStatBadge('65', 'Pending', kYellow),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDaysLeft() {
    return Container(
      width: 72,
      height: 72,
      decoration: const BoxDecoration(color: kYellow, shape: BoxShape.circle),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            '78',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w900,
              color: kRed,
              height: 1,
            ),
          ),
          Text(
            'days left',
            style: TextStyle(
              fontSize: 8,
              color: kTextDark,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text('ICSE Annual', style: TextStyle(fontSize: 7, color: kTextDark)),
          Text('Exam', style: TextStyle(fontSize: 7, color: kTextDark)),
        ],
      ),
    );
  }

  Widget _buildStatBadge(String value, String label, Color bg) {
    return Column(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(color: bg, shape: BoxShape.circle),
          alignment: Alignment.center,
          child: Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 16,
              color: kTextDark,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 9, color: kTextGrey, height: 1.2),
        ),
      ],
    );
  }

  // ── Subject Tabs ─────────────────────────────────────────────────────────────

  Widget _buildSubjectTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(_subjects.length, (i) {
          final selected = i == _selectedSubject;
          return GestureDetector(
            onTap: () => setState(() => _selectedSubject = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              decoration: BoxDecoration(
                color: selected ? kYellow : kCardWhite,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: selected ? kYellow : const Color(0xFFDDDDDD),
                ),
                boxShadow: selected
                    ? [
                        BoxShadow(
                          color: kYellow.withOpacity(0.4),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ]
                    : [],
              ),
              child: Text(
                _subjects[i],
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: selected ? kTextDark : kTextGrey,
                  fontSize: 13,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  // ── Chapter List ─────────────────────────────────────────────────────────────

  Widget _buildChapterList() {
    return Column(
      children: physicsChapters
          .map(
            (ch) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _ChapterCard(chapter: ch),
            ),
          )
          .toList(),
    );
  }

  // ── Legend Card ──────────────────────────────────────────────────────────────

  Widget _buildLegendCard() {
    return Container(
      decoration: BoxDecoration(
        color: kCardWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8),
        ],
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildLegendSection('Primary Actions', [
                  ('Study', 'Opens Vidya Kosh (videos + notes)'),
                  ('Materials', 'Browse chapter study materials'),
                  ('Practice', 'Chapter-wise tests & numericals'),
                  ('Test', 'Timed ICSE-style assessment'),
                ]),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildLegendSection('Secondary Actions', [
                  ('Revise', 'Opens Vidya Kosh (videos + notes)'),
                  ('Ask AI', 'Chapter-wise tests & numericals'),
                  ('Plan', 'Timed ICSE-style assessment'),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegendSection(String title, List<(String, String)> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: kTextDark,
          ),
        ),
        const SizedBox(height: 6),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${item.$1} ',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 11,
                      color: kTextDark,
                    ),
                  ),
                  TextSpan(
                    text: '→ ${item.$2}',
                    style: const TextStyle(fontSize: 10, color: kTextGrey),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ── Floating AI Button ───────────────────────────────────────────────────────
  // Just put it int the custom mokshafloatingactionbutton
  // Widget _buildAIFab() {
  //   return Container(
  //     width: 56,
  //     height: 56,
  //     decoration: const BoxDecoration(color: kYellow, shape: BoxShape.circle),
  //     child: const Icon(Icons.smart_toy_rounded, color: kTextDark, size: 28),
  //   );
  // }
}

// ── Chapter Card Widget ───────────────────────────────────────────────────────

class _ChapterCard extends StatefulWidget {
  final Chapter chapter;
  const _ChapterCard({required this.chapter});

  @override
  State<_ChapterCard> createState() => _ChapterCardState();
}

class _ChapterCardState extends State<_ChapterCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final ch = widget.chapter;
    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: Container(
        decoration: BoxDecoration(
          color: kCardWhite,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            // Main row
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  // Sl number
                  SizedBox(
                    width: 24,
                    child: Text(
                      '${ch.sl}.',
                      style: const TextStyle(
                        color: kTextGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // Name & topics
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ch.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            color: kTextDark,
                          ),
                        ),
                        if (ch.coreTopics.isNotEmpty) ...[
                          const SizedBox(height: 3),
                          Wrap(
                            spacing: 4,
                            runSpacing: 2,
                            children: ch.coreTopics
                                .map(
                                  (t) => Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.check_circle,
                                        size: 10,
                                        color: kGreen,
                                      ),
                                      const SizedBox(width: 2),
                                      Text(
                                        t,
                                        style: const TextStyle(
                                          fontSize: 10,
                                          color: kTextGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ],
                    ),
                  ),
                  // Priority badge
                  _PriorityBadge(priority: ch.priority),
                ],
              ),
            ),
            // Progress + dates row
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        size: 11,
                        color: kTextGrey,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        ch.dateRange,
                        style: const TextStyle(fontSize: 11, color: kTextGrey),
                      ),
                      const Spacer(),
                      Text(
                        '${ch.progress}%',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: _progressColor(ch.progress),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: ch.progress / 100,
                      minHeight: 7,
                      backgroundColor: const Color(0xFFEEEEEE),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        _progressColor(ch.progress),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Action buttons
                  Row(
                    children: [
                      _ActionButton(
                        label: 'Test',
                        icon: Icons.assignment_turned_in_outlined,
                        color: kGreen,
                        count: ch.testCount > 0 ? ch.testCount : null,
                      ),
                      const SizedBox(width: 8),
                      _ActionButton(
                        label: 'Revise',
                        icon: Icons.refresh_rounded,
                        color: kRed,
                        count: ch.reviseCount > 0 ? ch.reviseCount : null,
                      ),
                      const Spacer(),
                      // Materials icon
                      _MaterialsButton(),
                      const SizedBox(width: 8),
                      // Study icon
                      _IconAction(icon: Icons.search, color: kBlue),
                      const SizedBox(width: 8),
                      // Ask AI icon
                      _IconAction(
                        icon: Icons.smart_toy_outlined,
                        color: kOrange,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Expanded core topics detail
            if (_expanded && ch.coreTopics.isNotEmpty)
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFFFAFAFA),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(12),
                  ),
                ),
                padding: const EdgeInsets.all(12),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: ch.coreTopics
                      .map(
                        (t) => Chip(
                          label: Text(
                            t,
                            style: const TextStyle(
                              fontSize: 11,
                              color: kTextDark,
                            ),
                          ),
                          backgroundColor: kYellow.withOpacity(0.3),
                          visualDensity: VisualDensity.compact,
                          padding: EdgeInsets.zero,
                        ),
                      )
                      .toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Color _progressColor(int p) {
    if (p >= 80) return kGreen;
    if (p >= 40) return kOrange;
    if (p > 0) return kRed;
    return const Color(0xFFDDDDDD);
  }
}

// ── Small Widgets ─────────────────────────────────────────────────────────────

class _PriorityBadge extends StatelessWidget {
  final Priority priority;
  const _PriorityBadge({required this.priority});

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (priority) {
      Priority.high => ('High', kRed),
      Priority.medium => ('Medium', kOrange),
      Priority.low => ('Low', kGreen),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.4)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final int? count;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.color,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.4)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 13, color: color),
            const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (count != null) ...[
              const SizedBox(width: 4),
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                alignment: Alignment.center,
                child: Text(
                  '$count',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _MaterialsButton extends StatelessWidget {
  const _MaterialsButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Tooltip(
        message: 'View Materials',
        child: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: const Color(0xFF6A1B9A).withOpacity(0.1),
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFF6A1B9A).withOpacity(0.35),
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Icon(
                Icons.menu_book_rounded,
                size: 15,
                color: Color(0xFF6A1B9A),
              ),
              Positioned(
                top: 4,
                right: 4,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: kYellow,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.search, size: 6, color: kTextDark),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IconAction extends StatelessWidget {
  final IconData icon;
  final Color color;
  const _IconAction({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Icon(icon, size: 16, color: color),
    );
  }
}
