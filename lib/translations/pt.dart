const Map<String, dynamic> ptTranslations = {
  // Nav
  'nav_home': 'Início',
  'nav_about': 'Sobre',
  'nav_skills': 'Skills',
  'nav_projects': 'Projetos',
  'nav_contact': 'Contato',

  // Hero
  'hero_badge': 'Full-Stack Developer · Em órbita desde 2022',
  'hero_name': 'Lucca Gabriel',
  'hero_title': 'Engenheiro de Computação',
  'hero_role': 'Desenvolvedor Full-Stack',
  'hero_subtitle': 'Construindo do front-end ao back-end — e tudo que há entre eles.',
  'hero_cta': 'Iniciar Missão',

  // About
  'about_title': 'Sobre Mim',
  'about_bio':
      'Engenheiro de Computação formado pela UTFPR – Universidade Tecnológica Federal do Paraná, atuando como Desenvolvedor Full-Stack. Experiente na construção de aplicações web com ReactJS e sistemas back-end com Node.js, além de desenvolver e publicar aplicativos mobile com Flutter na Google Play e na Apple App Store. Também possuo forte domínio em Python e experiência com tecnologias complementares para entregar soluções completas de software.',
  'about_experience': 'Experiência',
  'about_education': 'Educação',
  'experience': [
    {
      'title': 'Desenvolvedor Full-Stack',
      'company': 'Wikidados – Soluções e Desenvolvimento',
      'period': 'Nov 2022 – Presente',
      'duration': '3+ anos',
      'location': 'Cascavel, Paraná, Brasil · Presencial',
      'description':
          'Desenvolvimento exclusivo com Flutter para iOS e Android (App Store + Play Store), back-end Node.js com APIs de GPS/externas, interfaces administrativas com Vue.js.',
    },
    {
      'title': 'Estagiário de TI',
      'company': 'Universidade Estadual do Oeste do Paraná (UNIOESTE)',
      'period': 'Mar 2020 – Fev 2022',
      'duration': '2 anos',
      'location': 'Cascavel, Paraná, Brasil',
      'description':
          'Configuração de sistemas Windows/Linux, instalação de softwares, suporte a usuários e administração de sistemas.',
    },
  ],
  'education': [
    {
      'title': 'Bacharelado em Engenharia de Computação',
      'company': 'UTFPR – Universidade Tecnológica Federal do Paraná',
      'period': '2018 – 2023',
      'location': 'Cascavel, Paraná, Brasil',
    },
  ],

  // Skills
  'skills_title': 'Habilidades',
  'skills_frontend_name': 'Frontend',
  'skills_frontend_desc': 'Interfaces e experiências web',
  'skills_backend_name': 'Backend',
  'skills_backend_desc': 'Lógica server-side e APIs',
  'skills_mobile_name': 'Mobile',
  'skills_mobile_desc': 'Apps mobile multiplataforma',
  'skills_tools_name': 'Ferramentas & Banco',
  'skills_tools_desc': 'Ferramentas de dev e armazenamento',

  // Projects
  'projects_title': 'Projetos',
  'projects_link_frontend': 'Front-end',
  'projects_link_backend': 'Back-end',
  'projects_link_dashboard': 'Dashboard',
  'projects_link_live': 'Ver Site',
  'projects': [
    {
      'number': '01',
      'name': 'Pedro Luis Imóveis',
      'type': 'Marketplace Imobiliário',
      'description':
          'Marketplace imobiliário para compra e venda de imóveis em Cascavel e região. Solução full-stack com listagens de imóveis, filtros de busca avançados, integração com Google Maps e painel administrativo completo.',
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
      'type': 'Plataforma de Telemetria',
      'description':
          'Plataforma empresarial de telemetria de frotas desenvolvida na Wikidados. Rastreamento de veículos em tempo real, análise de comportamento de motoristas, relatórios de consumo de combustível, registro de eventos e painel administrativo responsivo.',
      'tech': ['Node.js', 'Express', 'RabbitMQ', 'TCP', 'Socket.IO', 'MongoDB', 'Vue.js', 'Quasar', 'Google Maps'],
      'links': {'live': 'https://wikidados.com.br'},
      'accentHex': '#10B981',
    },
    {
      'number': '03',
      'name': 'Chess',
      'type': 'Jogo de Xadrez Interativo',
      'description':
          'Jogo de xadrez interativo para jogar contra amigos online ou contra um bot de IA. Motor completo de regras de xadrez com validação de movimentos, promoção de peças, en passant, roque e estado persistente de partidas.',
      'tech': ['React', 'Next.js', 'Tailwind CSS'],
      'links': {'frontend': 'https://github.com/WorstOne0/Chess_Next'},
      'accentHex': '#94A3B8',
    },
  ],

  // Contact
  'contact_title': 'Contato',
  'contact_subtitle': 'Vamos nos conectar e construir algo incrível juntos.',
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
