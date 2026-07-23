import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/shared_widgets.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const SharedHeader(activeTab: 'Events'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeroSection(context),
            const SizedBox(height: 64),
            _buildFeaturedEvent(),
            const SizedBox(height: 64),
            _buildTrendingCarousel(),
            const SizedBox(height: 64),
            _buildCategoriesGrid(),
            const SizedBox(height: 64),
            _buildUpcomingEventsGrid(),
            const SizedBox(height: 64),
            _buildWeekendPicks(),
            const SizedBox(height: 64),
            _buildFreeEvents(),
            const SizedBox(height: 64),
            _buildVioraOriginals(),
            const SizedBox(height: 64),
            _buildEventsNearYou(),
            const SizedBox(height: 64),
            _buildPopularVenues(),
            const SizedBox(height: 64),
            _buildPopularOrganizers(),
            const SizedBox(height: 64),
            _buildBecomeOrganizerCTA(),
            const SizedBox(height: 64),
            _buildNewsletterSection(),
            const FooterSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heroHeight = size.height < 800 ? 800.0 : size.height;

    return SizedBox(
      height: heroHeight,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.network(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuC6vbRz36I9ycoxmY-7jUY43sWt1SW2I0Wa3QCF7Wbk-Drd4Rr1aAJKilwPonir1NmmYfcr6zaZ3mynzUaJ7DbHB_6YK75YBc7_wKvFHsk8D5TuzZmqOrH8wMkXIb7P8GHd_ViwHnIQdoXPL3ZcqErB8iGHSfgMFeKF9XpmsQOxbusVErj4JQG0iXC82M_-KhtkzRnnleEqiPN2OcuOR2r_YrhjmE5uNeU-1SAvz-6tA_Odi482mZI3oA',
            fit: BoxFit.cover,
          ),
          // Cinematic Overlay
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF16130B).withOpacity(0.2),
                  const Color(0xFF16130B).withOpacity(0.9),
                  const Color(0xFF16130B),
                ],
                stops: const [0.0, 0.8, 1.0],
              ),
            ),
          ),
          // Content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1280),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: GoogleFonts.playfairDisplay(color: const Color(0xFFEAE1D4), fontSize: size.width > 800 ? 64 : (size.width > 500 ? 48 : 36), fontWeight: FontWeight.bold),
                        children: [
                          const TextSpan(text: 'Discover '),
                          TextSpan(text: 'Extraordinary', style: GoogleFonts.playfairDisplay(color: const Color(0xFFD4AF37), fontStyle: FontStyle.italic)),
                          const TextSpan(text: ' Events'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 672), // max-w-2xl
                      child: Text(
                        'Find concerts, film festivals, workshops, comedy shows, conferences, and unforgettable experiences happening around you.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(color: const Color(0xFFD0C5AF).withOpacity(0.8), fontSize: size.width > 500 ? 18 : 14),
                      ),
                    ),
                    const SizedBox(height: 48),
                    // Search & Filters Cluster
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 896), // max-w-4xl
                      child: Column(
                        children: [
                          // Search Bar
                          Container(
                            height: 64,
                            decoration: BoxDecoration(
                              color: const Color(0xFF231F17).withOpacity(0.6),
                              borderRadius: BorderRadius.circular(32),
                              border: Border.all(color: Colors.white.withOpacity(0.1)),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              children: [
                                const Icon(Icons.search, color: Color(0xFFD4AF37)),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: TextField(
                                    style: GoogleFonts.inter(color: const Color(0xFFEAE1D4)),
                                    decoration: InputDecoration(
                                      hintText: 'Search events, artists, venues...',
                                      hintStyle: GoogleFonts.inter(color: const Color(0xFF99907C)),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          // Filters
                          Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            alignment: WrapAlignment.center,
                            children: [
                              _buildFilterDropdown('Select City', Icons.location_on),
                              _buildFilterDropdown('Date', Icons.calendar_today),
                              _buildFilterDropdown('Category', Icons.category),
                              _buildFilterDropdown('Price', Icons.payments),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterDropdown(String hint, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1F1B13).withOpacity(0.5),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xFFD4AF37), size: 20),
          const SizedBox(width: 8),
          Text(hint, style: GoogleFonts.inter(color: const Color(0xFFEAE1D4), fontWeight: FontWeight.w600)),
          const SizedBox(width: 8),
          const Icon(Icons.expand_more, color: Color(0xFF99907C)),
        ],
      ),
    );
  }

  Widget _buildFeaturedEvent() {
    return _buildSectionContainer(
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1514525253161-7a46d19cd819?q=80&w=2000&auto=format&fit=crop'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.8), Colors.transparent],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          padding: const EdgeInsets.all(40),
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFD4AF37),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text('FEATURED', style: GoogleFonts.inter(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12, letterSpacing: 1.5)),
              ),
              const SizedBox(height: 16),
              Text('Tomorrowland 2024', style: GoogleFonts.playfairDisplay(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.calendar_today, color: Color(0xFFD4AF37), size: 16),
                  const SizedBox(width: 8),
                  Text('Jul 19 - Jul 28, 2024', style: GoogleFonts.inter(color: const Color(0xFFD0C5AF))),
                  const SizedBox(width: 24),
                  const Icon(Icons.location_on, color: Color(0xFFD4AF37), size: 16),
                  const SizedBox(width: 8),
                  Text('Boom, Belgium', style: GoogleFonts.inter(color: const Color(0xFFD0C5AF))),
                ],
              ),
              const SizedBox(height: 16),
              Text('Experience the magic of the world\'s largest dance music festival.', style: GoogleFonts.inter(color: Colors.white, fontSize: 16)),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text('From \$350', style: GoogleFonts.inter(color: const Color(0xFFD4AF37), fontSize: 20, fontWeight: FontWeight.w600)),
                  const SizedBox(width: 32),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD4AF37),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                    child: Text('Book Tickets', style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoriesGrid() {
    final categories = [
      {'icon': Icons.movie_creation_outlined, 'label': 'FILM'},
      {'icon': Icons.music_note, 'label': 'MUSIC'},
      {'icon': Icons.masks_outlined, 'label': 'COMEDY'},
      {'icon': Icons.theater_comedy_outlined, 'label': 'THEATRE'},
      {'icon': Icons.business_center_outlined, 'label': 'BUSINESS'},
      {'icon': Icons.brush_outlined, 'label': 'WORKSHOPS'},
      {'icon': Icons.restaurant_outlined, 'label': 'FOOD'},
      {'icon': Icons.sports_tennis_outlined, 'label': 'SPORTS'},
      {'icon': Icons.palette_outlined, 'label': 'ART'},
      {'icon': Icons.festival_outlined, 'label': 'FESTIVALS'},
    ];

    return _buildSectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'EXPLORE',
                    style: GoogleFonts.inter(
                      color: const Color(0xFFD4AF37),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Browse Categories',
                    style: GoogleFonts.playfairDisplay(
                      color: const Color(0xFFEAE1D4),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Text(
                      'See All',
                      style: GoogleFonts.inter(
                        color: const Color(0xFFEAE1D4),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.arrow_forward,
                      color: Color(0xFFEAE1D4),
                      size: 16,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              int columns = constraints.maxWidth > 800 ? 5 : constraints.maxWidth > 500 ? 3 : 2;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.3,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final cat = categories[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1814),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(cat['icon'] as IconData, color: const Color(0xFFD4AF37), size: 36),
                        const SizedBox(height: 16),
                        Text(
                          cat['label'] as String,
                          style: GoogleFonts.inter(
                            color: const Color(0xFFEAE1D4),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingEventsGrid() {
    return _buildSectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Upcoming Events'),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              int columns = constraints.maxWidth > 1000 ? 4 : constraints.maxWidth > 600 ? 2 : 1;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 40,
                  childAspectRatio: 0.65, 
                ),
                itemCount: 8,
                itemBuilder: (context, index) => const EventCard(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildEventCarousel(String title, {String? badge, bool isVioraOriginal = false}) {
    return _buildSectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(title),
          const SizedBox(height: 24),
          SizedBox(
            height: 420,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              separatorBuilder: (context, index) => const SizedBox(width: 24),
              itemBuilder: (context, index) => SizedBox(
                width: 280,
                child: EventCard(badge: badge, isVioraOriginal: isVioraOriginal),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrendingCarousel() => _buildEventCarousel('Trending Now', badge: '🔥 Trending');
  Widget _buildWeekendPicks() => _buildEventCarousel('Weekend Picks');
  Widget _buildFreeEvents() => _buildEventCarousel('Free Events', badge: 'Free');
  Widget _buildVioraOriginals() => _buildEventCarousel('VIORA Originals', isVioraOriginal: true);
  Widget _buildEventsNearYou() => _buildEventCarousel('Events near Chennai');

  Widget _buildPopularVenues() {
    return _buildSectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Popular Venues'),
          const SizedBox(height: 24),
          SizedBox(
            height: 250,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              separatorBuilder: (context, index) => const SizedBox(width: 24),
              itemBuilder: (context, index) {
                return Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: NetworkImage('https://images.unsplash.com/photo-1501281668745-f7f57925c3b4?auto=format&fit=crop&q=80&w=2000'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(0.9), Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Royal Opera Hall', style: GoogleFonts.playfairDisplay(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Chennai', style: GoogleFonts.inter(color: const Color(0xFFD0C5AF), fontSize: 14)),
                            Text('12 Events', style: GoogleFonts.inter(color: const Color(0xFFD4AF37), fontSize: 12, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularOrganizers() {
    return _buildSectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader('Popular Organizers'),
          const SizedBox(height: 24),
          SizedBox(
            height: 240,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              separatorBuilder: (context, index) => const SizedBox(width: 24),
              itemBuilder: (context, index) {
                return Container(
                  width: 250,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                  ),
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xFFD4AF37),
                        child: Icon(Icons.business, color: Colors.black, size: 30),
                      ),
                      const SizedBox(height: 16),
                      Text('Live Nation India', style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('45 Events', style: GoogleFonts.inter(color: const Color(0xFFD0C5AF), fontSize: 12)),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xFFD4AF37)),
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                            ),
                            child: Text('Follow', style: GoogleFonts.inter(color: const Color(0xFFD4AF37), fontSize: 12)),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBecomeOrganizerCTA() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      decoration: BoxDecoration(
        color: const Color(0xFF1A150A),
        border: Border.symmetric(horizontal: BorderSide(color: const Color(0xFFD4AF37).withOpacity(0.2))),
      ),
      child: Center(
        child: Column(
          children: [
            Text('Ready to host your own event?', style: GoogleFonts.playfairDisplay(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            const SizedBox(height: 16),
            Text('Sell tickets, manage attendees, and grow your audience with Viora.', style: GoogleFonts.inter(color: const Color(0xFFD0C5AF), fontSize: 18), textAlign: TextAlign.center),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFD4AF37),
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              ),
              child: Text('Become an Organizer', style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsletterSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              Text('Never miss an event.', style: GoogleFonts.playfairDisplay(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        border: Border.all(color: Colors.white.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        style: GoogleFonts.inter(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Enter your email address',
                          hintStyle: GoogleFonts.inter(color: Colors.white.withOpacity(0.3)),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                    ),
                    child: Text('Subscribe', style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionContainer({required Widget child}) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1280),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: child,
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Builder(
      builder: (context) {
        final isMobile = MediaQuery.of(context).size.width < 500;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(title, style: GoogleFonts.playfairDisplay(color: Colors.white, fontSize: isMobile ? 22 : 28, fontWeight: FontWeight.bold))),
            TextButton(
              onPressed: () {},
              child: Text('See All', style: GoogleFonts.inter(color: const Color(0xFFD4AF37), fontWeight: FontWeight.bold, fontSize: isMobile ? 12 : 14)),
            ),
          ],
        );
      }
    );
  }
}

class EventCard extends StatefulWidget {
  final String? badge;
  final bool isVioraOriginal;

  const EventCard({super.key, this.badge, this.isVioraOriginal = false});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: widget.isVioraOriginal ? const Color(0xFF1A150A) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: widget.isVioraOriginal ? Border.all(color: const Color(0xFFD4AF37).withOpacity(0.3)) : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poster
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: widget.isVioraOriginal 
                  ? const BorderRadius.vertical(top: Radius.circular(12)) 
                  : BorderRadius.circular(12),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    AnimatedScale(
                      scale: _isHovered ? 1.05 : 1.0,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeOutCubic,
                      child: Image.network(
                        'https://images.unsplash.com/photo-1514525253161-7a46d19cd819?auto=format&fit=crop&q=80&w=2000',
                        fit: BoxFit.cover,
                      ),
                    ),
                    if (widget.badge != null)
                      Positioned(
                        top: 12,
                        left: 12,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD4AF37),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(widget.badge!, style: GoogleFonts.inter(color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                        ),
                      ),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.favorite_border, color: Colors.white, size: 20),
                      ),
                    ),
                    AnimatedOpacity(
                      opacity: _isHovered ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 200),
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFD4AF37),
                              foregroundColor: Colors.black,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                            ),
                            child: Text('Book Tickets', style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Details
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.isVioraOriginal ? 16 : 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Chennai', style: GoogleFonts.inter(color: const Color(0xFFD4AF37), fontSize: 12, fontWeight: FontWeight.w600)),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Color(0xFFD4AF37), size: 12),
                            const SizedBox(width: 4),
                            Text('4.8', style: GoogleFonts.inter(color: Colors.white, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text('Jazz Under the Stars', style: GoogleFonts.playfairDisplay(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 4),
                    Text('Viora Media', style: GoogleFonts.inter(color: const Color(0xFFA3A3A3), fontSize: 12)),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, color: Color(0xFFA3A3A3), size: 14),
                        const SizedBox(width: 8),
                        Text('28 Aug • 7:00 PM', style: GoogleFonts.inter(color: const Color(0xFFA3A3A3), fontSize: 12)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text('Starts from ₹499', style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
