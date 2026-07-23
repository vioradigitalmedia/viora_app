import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/shared_widgets.dart';

void main() {
  runApp(const VioraApp());
}

class VioraApp extends StatelessWidget {
  const VioraApp({super.key});

  @override
  Widget build(BuildContext context) {
    const bgColor = Color(0xFF0A0A0A);
    const primaryColor = Color(0xFFD4AF37); 
    const onSurface = Color(0xFFEAE1D4);
    const onSurfaceVariant = Color(0xFFD0C5AF);

    return MaterialApp(
      title: 'Viora',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: bgColor,
        colorScheme: const ColorScheme.dark(
          primary: primaryColor,
          surface: bgColor,
          onSurface: onSurface,
        ),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme).copyWith(
          displayLarge: GoogleFonts.playfairDisplay(color: onSurface, fontWeight: FontWeight.bold),
          headlineLarge: GoogleFonts.playfairDisplay(color: onSurface, fontWeight: FontWeight.w600),
          headlineMedium: GoogleFonts.playfairDisplay(color: onSurface, fontWeight: FontWeight.w500),
          bodyLarge: GoogleFonts.inter(color: onSurfaceVariant, fontSize: 18),
          bodyMedium: GoogleFonts.inter(color: onSurfaceVariant, fontSize: 16),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const SharedHeader(activeTab: 'Discover'),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HeroSection(),
            CategoriesSection(),
            FeaturedExperiencesSection(),
            CTASection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width < 600 ? 380.0 : size.height * 0.85,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.network(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuB-tGGDy8wjDAQYxUBe1-YPXjkyvbMUd1G6rQRJDnkGgHnwQhgEa_Wu8FA6jwDxYK1AM6cuiykY9nLjbb1tdnwKlWARFboEGg-1TJ85esBxUIrae6tB2O2GfSNu5j0f72z08ZbMdJ74h5PbQiqkPp2uDq-_rGMSXVZx4qTDFOwqpbftoYoiX_McnvriPQV4lw6b2POdp2TO3CxV9b2YlpY3xeZHENOFlpt0xcAg896IzUAK8yfzgbVc1g',
            fit: BoxFit.cover,
          ),
          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  const Color(0xFF0A0A0A),
                  const Color(0xFF0A0A0A).withOpacity(0.4),
                  const Color(0xFF0A0A0A).withOpacity(0.6),
                ],
                stops: const [0.0, 0.5, 1.0],
              ),
            ),
          ),
          // Content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: size.width < 600 ? 64 : 60),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: GoogleFonts.playfairDisplay(
                        fontSize: size.width > 800 ? 64 : (size.width > 500 ? 48 : 36),
                        color: const Color(0xFFEAE1D4),
                        fontWeight: FontWeight.bold,
                        shadows: [Shadow(color: Colors.black.withOpacity(0.5), blurRadius: 10)],
                      ),
                      children: const [
                        TextSpan(text: 'Discover Amazing '),
                        TextSpan(text: 'Experiences', style: TextStyle(color: Color(0xFFD4AF37), fontStyle: FontStyle.italic)),
                      ],
                    ),
                  ),
                  SizedBox(height: size.width < 600 ? 12 : 24),
                  Text(
                    'Curated premium experiences from the world\'s most exclusive venues. Find your next unforgettable moment.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: size.width > 500 ? 18 : 14,
                      color: const Color(0xFFD0C5AF).withOpacity(0.9),
                    ),
                  ),
                  SizedBox(height: size.width < 600 ? 24 : 48),
                  // Glass Search Bar
                  Container(
                    constraints: const BoxConstraints(maxWidth: 800),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.white.withOpacity(0.1)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                        child: Row(
                          children: [
                            const SizedBox(width: 16),
                            const Icon(Icons.search, color: Color(0xFFD4AF37)),
                            const SizedBox(width: 16),
                            Expanded(
                              child: TextField(
                                style: const TextStyle(color: Color(0xFFEAE1D4)),
                                decoration: InputDecoration(
                                  hintText: 'Search for events, venues, or categories...',
                                  hintStyle: TextStyle(color: const Color(0xFFD0C5AF).withOpacity(0.6)),
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFD4AF37),
                                foregroundColor: const Color(0xFF241A00),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                padding: EdgeInsets.symmetric(horizontal: size.width > 500 ? 32 : 16, vertical: 20),
                                elevation: 0,
                              ),
                              child: Text('Search', style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: size.width > 500 ? 14 : 12)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'icon': Icons.music_note, 'label': 'Music'},
      {'icon': Icons.sports_basketball, 'label': 'Sports'},
      {'icon': Icons.movie, 'label': 'Movies'},
      {'icon': Icons.theater_comedy, 'label': 'Theater'},
      {'icon': Icons.palette, 'label': 'Arts'},
      {'icon': Icons.festival, 'label': 'Festivals'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.end,
                runSpacing: 16,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Categories', style: GoogleFonts.playfairDisplay(fontSize: 32, fontWeight: FontWeight.w600, color: const Color(0xFFEAE1D4))),
                      const SizedBox(height: 8),
                      Container(width: 48, height: 4, color: const Color(0xFFD4AF37)),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('See All', style: GoogleFonts.inter(color: const Color(0xFFD4AF37), fontWeight: FontWeight.w600)),
                      const SizedBox(width: 4),
                      const Icon(Icons.arrow_forward, color: Color(0xFFD4AF37), size: 18),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: categories.map((cat) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 32.0),
                      child: Column(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFF2D2A21),
                              border: Border.all(color: Colors.white.withOpacity(0.05)),
                            ),
                            child: Icon(cat['icon'] as IconData, color: const Color(0xFFD4AF37), size: 32),
                          ),
                          const SizedBox(height: 16),
                          Text(cat['label'] as String, style: GoogleFonts.inter(color: const Color(0xFFEAE1D4), fontWeight: FontWeight.w600)),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeaturedExperiencesSection extends StatelessWidget {
  const FeaturedExperiencesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Container(
      color: const Color(0xFF110E07).withOpacity(0.3),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80.0),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.end,
                runSpacing: 16,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Featured Experiences', style: GoogleFonts.playfairDisplay(fontSize: MediaQuery.of(context).size.width < 600 ? 28 : 32, fontWeight: FontWeight.w600, color: const Color(0xFFEAE1D4))),
                      const SizedBox(height: 8),
                      Text('Hand-picked events for discerning tastes.', style: GoogleFonts.inter(color: const Color(0xFFD0C5AF), fontSize: 16)),
                    ],
                  ),
                  if (isDesktop)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Browse All Events', style: GoogleFonts.inter(color: const Color(0xFFD4AF37), fontWeight: FontWeight.w600)),
                        const SizedBox(width: 4),
                        const Icon(Icons.arrow_forward, color: Color(0xFFD4AF37), size: 18),
                      ],
                    ),
                ],
              ),
              const SizedBox(height: 40),
              if (isDesktop)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 8,
                      child: _buildMainFeaturedCard(),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          _buildSideCard(
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuBVlZ676lLsraBKkYjMXpktfl0i987EUEQS72ET3bN_CW8nq1gZQFayOasXbbFA7LSVp3XkaCivXXmBVhgZg7D4Lh1NJulp8_Vunhe34fW2N9PvcDCa3skFEpEM-D34IMA9m_55aoH5i_50n3tGa5aNJS5iYYmn68gsv5omyBszHolCh4PPvG0AvLNiBj-qL6datn6kBVlnlvhIjKIPbHLfzDRiztL-JIHJTmANalb37Wx3ofBCzR60yQ',
                            'Music',
                            'Midnight Jazz Series',
                            '\$45'
                          ),
                          const SizedBox(height: 32),
                          _buildSideCard(
                            'https://lh3.googleusercontent.com/aida-public/AB6AXuBVCjncO8MXnOCsaplHWsx-toypBC6c0qC8srjMeWzn9FXWol9bQfLjQ96IyKEeiYL5QDuIgLMc7T13B1XMWzEyBD7ISizo3TnL2Ohn857J6AhyE_GLBcTzlDt1Od6SpsPlRVU0ipfcr69JlLxVMVpl0zeVX3Ganrl9mcD82ghi84z9yX87xPMEEyyDssYPmyC0sYEzEQpQmTEYfFnH76w0rz04MsStOrxkhH5i99F0Amx5OvBV2swb7g',
                            'Arts',
                            'Vogue: Avant-Garde Night',
                            '\$85'
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    _buildMainFeaturedCard(),
                    const SizedBox(height: 32),
                    _buildSideCard(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuBVlZ676lLsraBKkYjMXpktfl0i987EUEQS72ET3bN_CW8nq1gZQFayOasXbbFA7LSVp3XkaCivXXmBVhgZg7D4Lh1NJulp8_Vunhe34fW2N9PvcDCa3skFEpEM-D34IMA9m_55aoH5i_50n3tGa5aNJS5iYYmn68gsv5omyBszHolCh4PPvG0AvLNiBj-qL6datn6kBVlnlvhIjKIPbHLfzDRiztL-JIHJTmANalb37Wx3ofBCzR60yQ',
                      'Music',
                      'Midnight Jazz Series',
                      '\$45'
                    ),
                    const SizedBox(height: 32),
                    _buildSideCard(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuBVCjncO8MXnOCsaplHWsx-toypBC6c0qC8srjMeWzn9FXWol9bQfLjQ96IyKEeiYL5QDuIgLMc7T13B1XMWzEyBD7ISizo3TnL2Ohn857J6AhyE_GLBcTzlDt1Od6SpsPlRVU0ipfcr69JlLxVMVpl0zeVX3Ganrl9mcD82ghi84z9yX87xPMEEyyDssYPmyC0sYEzEQpQmTEYfFnH76w0rz04MsStOrxkhH5i99F0Amx5OvBV2swb7g',
                      'Arts',
                      'Vogue: Avant-Garde Night',
                      '\$85'
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMainFeaturedCard() {
    return Builder(
      builder: (context) {
        return Container(
          constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.width > 800 ? 600 : 400),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
        image: const DecorationImage(
          image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDOB2lrChkZaqUwAXLf6c_m4TcdYxzl7gIuWi9MH3FCvWLhcdTsAPET_E268mCyFq0lliyeU-iQAJzBiTDlddnttcvFJlx8cclm-iZjAzU_wxrK06N_LQB1krpxpdYl37Cqda8rsB8guFnQ-t9bDCo7xkqtyTWjdZrjoPVjYWAozYxH0G2CIzVYEcZdyc51XPn7GbmQBpj8aQmjAr7Rnnr7PhHVREMmD2im2djiUIZUhefjRruTH5vlvg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.95),
              Colors.black.withOpacity(0.4),
              Colors.transparent,
            ],
          ),
        ),
        padding: EdgeInsets.all(MediaQuery.of(context).size.width < 600 ? 24 : 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD4AF37),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text('FEATURED', style: GoogleFonts.inter(color: const Color(0xFF241A00), fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Text('Selling Fast', style: GoogleFonts.inter(color: Colors.white, fontSize: 12)),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('The Grand Philharmonic:\nMoonlight Symphony', style: GoogleFonts.playfairDisplay(color: Colors.white, fontSize: MediaQuery.of(context).size.width < 600 ? 28 : 40, fontWeight: FontWeight.bold, height: 1.1)),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 24,
                  runSpacing: 16,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.calendar_today, color: Color(0xFFD4AF37), size: 20),
                        const SizedBox(width: 8),
                        Text('Oct 24, 2024 • 8:00 PM', style: GoogleFonts.inter(color: const Color(0xFFD0C5AF), fontWeight: FontWeight.w600)),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.location_on, color: Color(0xFFD4AF37), size: 20),
                        const SizedBox(width: 8),
                        Text('Royal Opera Hall', style: GoogleFonts.inter(color: const Color(0xFFD0C5AF), fontWeight: FontWeight.w600)),
                      ],
                    ),
                    const SizedBox(width: 24),
                    Text('From \$120', style: GoogleFonts.playfairDisplay(color: const Color(0xFFD4AF37), fontSize: 24, fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
      }
    );
  }

  Widget _buildSideCard(String imageUrl, String tag, String title, String price) {
    return Container(
      height: 284,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.95),
              Colors.black.withOpacity(0.4),
              Colors.transparent,
            ],
          ),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Text(tag.toUpperCase(), style: GoogleFonts.inter(color: Colors.white, fontSize: 12, letterSpacing: 1.5)),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.playfairDisplay(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                Text('From $price', style: GoogleFonts.inter(color: const Color(0xFFD4AF37), fontWeight: FontWeight.w600)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CTASection extends StatelessWidget {
  const CTASection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 80.0),
      child: Center(
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 896),
          padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
          decoration: BoxDecoration(
            color: const Color(0xFF231F17).withOpacity(0.6),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Column(
                children: [
                  Text('Experience More.', style: GoogleFonts.playfairDisplay(color: const Color(0xFFD4AF37), fontSize: MediaQuery.of(context).size.width > 500 ? 48 : 32, fontWeight: FontWeight.bold, letterSpacing: -1)),
                  const SizedBox(height: 24),
                  Text(
                    'Join Viora Black for exclusive early access, concierge booking services, and complimentary lounge entry to the world\'s finest venues.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(color: const Color(0xFFD0C5AF), fontSize: MediaQuery.of(context).size.width > 500 ? 18 : 14),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD4AF37),
                      foregroundColor: const Color(0xFF241A00),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                      elevation: 0,
                    ),
                    child: Text('Join the Circle', style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 16)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

