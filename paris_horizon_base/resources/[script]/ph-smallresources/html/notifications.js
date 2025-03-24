// You can add or remove any notification
// type from here. Make sure you use the
// same name as the one in the brackets

const k5Notifications = {
  ['error']: {
    background: 'rgba(173, 38, 38, 0.9)',
    titleColor: '#FFF',
    messageColor: '#FFF',
    borderRadius: '5px',
    icon: '<i class="fa-solid fa-circle-exclamation"></i>',
  },
  ['success']: {
    background: 'rgba(47, 156, 20, 0.9)',
    titleColor: '#FFF',
    messageColor: '#FFF',
    borderRadius: '5px',
    icon: '<i class="fa-solid fa-circle-check"></i>',
  },
  ['warn']: {
    background: 'rgba(255, 152, 0, 0.9)',
    titleColor: '#FFF',
    messageColor: '#FFF',
    borderRadius: '5px',
    icon: '<i class="fa-solid fa-triangle-exclamation"></i>',
  },
  ['info']: {
    background: 'rgba(20, 100, 219, 0.9)',
    titleColor: '#FFF',
    messageColor: '#FFF',
    borderRadius: '5px',
    icon: '<i class="fa-solid fa-circle-info"></i>',
  },
  ['k5style']: {
    background:
      'linear-gradient(270deg, rgba(200,67,148,1) 0%, rgba(53,115,195,1) 100%)',
    titleColor: '#FFF',
    messageColor: '#FFF',
    boldTitle: true,
    borderRadius: '8px',
    border: '2px solid rgba(65,196,255,1)',
    startImage: 'assets/k5_logo.png',
    icon: '<i class="fa-brands fa-kickstarter"></i>',
    duration: 4000,
    audio: 'assets/k5_notify.ogg',
  },
  ['entreprise_open']: {
    background: 'linear-gradient(270deg, rgba(46,125,50,1) 0%, rgba(76,175,80,1) 100%)',
    titleColor: '#FFF',
    messageColor: '#FFF',
    boldTitle: true,
    borderRadius: '8px',
    border: '2px solid rgba(129,199,132,1)',
    startImage: 'assets/k5_logo.png',
    icon: '<i class="fa-solid fa-door-open"></i>',
    duration: 7000,
    audio: 'assets/notify.ogg',
  },
  ['entreprise_close']: {
    background: 'linear-gradient(270deg, rgba(198,40,40,1) 0%, rgba(244,67,54,1) 100%)',
    titleColor: '#FFF',
    messageColor: '#FFF',
    boldTitle: true,
    borderRadius: '8px',
    border: '2px solid rgba(239,154,154,1)',
    startImage: 'assets/k5_logo.png',
    icon: '<i class="fa-solid fa-door-closed"></i>',
    duration: 7000,
    audio: 'assets/notify.ogg',
  },

  ['entreprise_annonce']: {
    background: 'linear-gradient(270deg, rgba(33,33,33,0.95) 0%, rgba(66,66,66,0.95) 100%)',
    titleColor: '#FFD700',
    messageColor: '#FFF',
    boldTitle: true,
    borderRadius: '8px',
    border: '2px solid rgba(255,215,0,0.6)',
    startImage: 'assets/k5_logo.png',
    icon: '<i class="fa-solid fa-bullhorn"></i>',
    duration: 7000,
    audio: 'assets/notify.ogg',
  },
}
