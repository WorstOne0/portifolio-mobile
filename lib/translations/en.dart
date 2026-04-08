const Map<String, dynamic> enTranslations = {
  // Nav
  'nav_home': 'Home',
  'nav_about': 'About',
  'nav_skills': 'Skills',
  'nav_projects': 'Projects',
  'nav_contact': 'Contact',

  // Hero
  'hero_badge': 'Full-Stack Developer · In orbit since 2022',
  'hero_name': 'Lucca Gabriel',
  'hero_title': 'Computer Engineer',
  'hero_role': 'Full-Stack Developer',
  'hero_subtitle': 'Building from front-end to back-end — and everything in between.',
  'hero_cta': 'Launch Mission',

  // About
  'about_title': 'About Me',
  'about_bio':
      'Computer Engineer graduated from UTFPR – Federal University of Technology of Paraná, working as a Full-Stack Developer. Experienced in building web applications with ReactJS and back-end systems with Node.js, as well as developing and publishing mobile apps with Flutter on both Google Play and the Apple App Store. I also have strong Python skills and experience with complementary technologies for delivering complete software solutions.',
  'about_experience': 'Experience',
  'about_education': 'Education',
  'experience': [
    {
      'title': 'Full-Stack Developer',
      'company': 'Wikidados – Solutions & Development',
      'period': 'Nov 2022 – Present',
      'duration': '3+ years',
      'location': 'Cascavel, Paraná, Brazil · On-site',
      'description':
          'Flutter exclusive development for iOS/Android (App Store + Play Store), Node.js back-end with GPS/external APIs, Vue.js admin interfaces.',
    },
    {
      'title': 'IT Systems Intern',
      'company': 'State University of Western Paraná (UNIOESTE)',
      'period': 'Mar 2020 – Feb 2022',
      'duration': '2 years',
      'location': 'Cascavel, Paraná, Brazil',
      'description': 'Windows/Linux setup, software installation, user support, and system administration.',
    },
  ],
  'education': [
    {
      'title': 'B.Eng. in Computer Engineering',
      'company': 'UTFPR – Federal University of Technology of Paraná',
      'period': '2018 – 2023',
      'location': 'Cascavel, Paraná, Brazil',
    },
  ],

  // Skills
  'skills_title': 'Skills',
  'skills_frontend_name': 'Frontend',
  'skills_frontend_desc': 'Web interfaces & user experiences',
  'skills_backend_name': 'Backend',
  'skills_backend_desc': 'Server-side logic and APIs',
  'skills_mobile_name': 'Mobile',
  'skills_mobile_desc': 'Cross-platform mobile apps',
  'skills_tools_name': 'Tools & Database',
  'skills_tools_desc': 'Dev tools and data storage',

  // Projects
  'projects_title': 'Projects',
  'projects_link_frontend': 'Front-end',
  'projects_link_backend': 'Back-end',
  'projects_link_dashboard': 'Dashboard',
  'projects_link_live': 'Live Site',
  'projects': [
    {
      'number': '01',
      'name': 'Pedro Luis Imóveis',
      'type': 'Real Estate Marketplace',
      'description':
          'Real estate marketplace for buying and selling properties in Cascavel and the surrounding region. Full-stack solution featuring property listings with advanced search filters, Google Maps integration for location browsing, and a complete admin dashboard.',
      'tech': ['Node.js', 'Express', 'MongoDB', 'React', 'Next.js', 'Google Maps', 'Tailwind', 'ShadCN'],
      'links': {
        'frontend': 'https://github.com/WorstOne0/Pedro_Luis_Imoveis_Next',
        'dashboard': 'https://github.com/WorstOne0/Pedro_Luis_Imoveis_Dashboard',
        'backend': 'https://github.com/WorstOne0/Pedro_Luis_Imoveis_Backend',
      },
      'accentHex': '#3B82F6',
    },
    {
      'number': '02',
      'name': 'Wikidados',
      'type': 'Fleet Telemetry Platform',
      'description':
          'Enterprise vehicle telemetry platform developed at Wikidados, specializing in fleet monitoring. Real-time vehicle tracking, driver behavior analysis, fuel consumption reports, event logging, and a fully responsive admin dashboard.',
      'tech': ['Node.js', 'Express', 'RabbitMQ', 'TCP', 'Socket.IO', 'MongoDB', 'Vue.js', 'Quasar', 'Google Maps'],
      'links': {'live': 'https://wikidados.com.br'},
      'accentHex': '#10B981',
    },
    {
      'number': '03',
      'name': 'Chess',
      'type': 'Interactive Chess Game',
      'description':
          'Interactive chess game for playing against friends online or against an AI bot. Complete chess rules engine with full move validation, piece promotion, en passant, castling, and persistent match state.',
      'tech': ['React', 'Next.js', 'Tailwind CSS'],
      'links': {'frontend': 'https://github.com/WorstOne0/Chess_Next'},
      'accentHex': '#94A3B8',
    },
  ],

  // Contact
  'contact_title': 'Contact',
  'contact_subtitle': "Let's connect and build something amazing together.",
  'contact_links': [
    {
      'label': 'Email',
      'value': 'luccagabriel12@hotmail.com',
      'url': 'mailto:luccagabriel12@hotmail.com',
      'colorHex': '#3B82F6',
    },
    {
      'label': 'GitHub',
      'value': 'github.com/WorstOne0',
      'url': 'https://github.com/WorstOne0',
      'colorHex': '#A78BFA',
    },
    {
      'label': 'LinkedIn',
      'value': 'lucca-gabriel',
      'url': 'https://linkedin.com/in/lucca-gabriel-410040154',
      'colorHex': '#0EA5E9',
    },
  ],
};
