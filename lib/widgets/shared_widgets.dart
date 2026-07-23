import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/events_screen.dart';

class SharedHeader extends StatelessWidget implements PreferredSizeWidget {
  final String activeTab;

  const SharedHeader({super.key, required this.activeTab});

  @override
  Size get preferredSize => const Size(double.infinity, 80);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 80),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            color: const Color(0xFF0A0A0A).withOpacity(0.7),
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (activeTab != 'Discover') {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    }
                  },
                  child: Text('Viora', style: GoogleFonts.playfairDisplay(color: Theme.of(context).colorScheme.primary, fontSize: 32, fontWeight: FontWeight.bold, letterSpacing: -1)),
                ),
                // Navigation Links (Hidden on small screens)
                if (MediaQuery.of(context).size.width > 800)
                  Row(
                    children: [
                      _buildNavLink(context, 'Discover', activeTab == 'Discover'),
                      const SizedBox(width: 32),
                      _buildNavLink(context, 'Events', activeTab == 'Events'),
                    ],
                  ),
                Row(
                  children: [
                    IconButton(icon: const Icon(Icons.person_outline, color: Color(0xFFD0C5AF)), onPressed: () {}),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavLink(BuildContext context, String text, bool isActive) {
    return GestureDetector(
      onTap: () {
        if (!isActive) {
          if (text == 'Events') {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const EventsScreen()));
          } else if (text == 'Discover') {
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          decoration: isActive ? const BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xFFD4AF37), width: 2))
          ) : null,
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            text,
            style: GoogleFonts.inter(
              color: isActive ? const Color(0xFFD4AF37) : const Color(0xFFD0C5AF),
              fontWeight: FontWeight.w600,
              fontSize: 14,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    const goldColor = Color(0xFFD4AF37);
    const mutedColor = Color(0xFFA3A3A3);

    return Container(
      color: Colors.black,
      child: Column(
        children: [
          // Main Footer Container
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1280),
              child: Column(
                children: [
                  Wrap(
                    spacing: 40,
                    runSpacing: 64,
                    alignment: WrapAlignment.spaceBetween,
                    children: [
                      // Brand
                      SizedBox(
                        width: 250,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: goldColor.withOpacity(0.2)),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(Icons.movie, color: Colors.white),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('VIORA', style: GoogleFonts.playfairDisplay(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 4)),
                                    Text('MEDIA', style: GoogleFonts.inter(color: goldColor, fontSize: 8, fontWeight: FontWeight.w600, letterSpacing: 4)),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text('WHERE EVERY STORY FINDS ITS STAGE.', style: GoogleFonts.playfairDisplay(color: goldColor, fontSize: 10, fontWeight: FontWeight.w600, letterSpacing: 2)),
                          ],
                        ),
                      ),
                      
                      // Company
                      SizedBox(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildFooterHeading('Company'),
                            _buildFooterLink('About Us'),
                            _buildFooterLink('Press'),
                            _buildFooterLink('Careers'),
                            _buildFooterLink('Partner with Us'),
                            _buildFooterLink('Become an Organizer'),
                          ],
                        ),
                      ),
                      
                      // Support
                      SizedBox(
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildFooterHeading('Support'),
                            _buildFooterLink('Contact Support'),
                            _buildFooterLink('Privacy Policy'),
                            _buildFooterLink('Terms of Service'),
                            _buildFooterLink('FAQs'),
                          ],
                        ),
                      ),
                      
                    ],
                  ),
                  
                  const SizedBox(height: 64),
                  
                  // Bottom Bar
                  Container(
                    padding: const EdgeInsets.only(top: 32),
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.white.withOpacity(0.05))),
                    ),
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runSpacing: 16,
                      spacing: 16,
                      children: [
                        Text('© ${DateTime.now().year} Viora. All rights reserved.', style: GoogleFonts.inter(color: mutedColor.withOpacity(0.5), fontSize: 10, letterSpacing: 1.5, fontWeight: FontWeight.w600)),
                        Wrap(
                          spacing: 24,
                          runSpacing: 8,
                          children: [
                            Text('PRIVACY POLICY', style: GoogleFonts.inter(color: mutedColor, fontSize: 10, letterSpacing: 1.5, fontWeight: FontWeight.w600)),
                            Text('TERMS & CONDITIONS', style: GoogleFonts.inter(color: mutedColor, fontSize: 10, letterSpacing: 1.5, fontWeight: FontWeight.w600)),
                            Text('COOKIE POLICY', style: GoogleFonts.inter(color: mutedColor, fontSize: 10, letterSpacing: 1.5, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ],
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

  Widget _buildFooterHeading(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        padding: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: const Color(0xFFD4AF37).withOpacity(0.2)))),
        child: Text(
          title.toUpperCase(),
          style: GoogleFonts.playfairDisplay(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 2),
        ),
      ),
    );
  }

  Widget _buildFooterLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(text, style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300)),
    );
  }

  Widget _buildFooterLinkWithBadge(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text, style: GoogleFonts.inter(color: const Color(0xFFA3A3A3).withOpacity(0.5), fontSize: 12, fontWeight: FontWeight.w300)),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              border: Border.all(color: const Color(0xFFD4AF37).withOpacity(0.2)),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Text('SOON', style: GoogleFonts.inter(color: const Color(0xFFD4AF37), fontSize: 8, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFFD4AF37), size: 14),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: GoogleFonts.inter(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w300))),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Icon(icon, color: Colors.white, size: 16);
  }
}
