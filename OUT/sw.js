const CACHE_NAME = 'engelmobile-radio-v17'; // Incrementado para v15 para invalidar caches anteriores
const urlsToCache = [
  './',
  './index.html',
  './icone.png',
  './globo.png',
  './fita.jpg',
  './rolo.png'
];

// Instalação - Salva no cache os arquivos iniciais
self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => {
        return cache.addAll(urlsToCache);
      })
  );
});

// Ativação - Limpa caches antigos
self.addEventListener('activate', event => {
  event.waitUntil(
    caches.keys().then(cacheNames => {
      return Promise.all(
        cacheNames.map(cache => {
          if (cache !== CACHE_NAME) {
            console.log('SW: Removendo cache antigo:', cache);
            return caches.delete(cache);
          }
        })
      );
    }).then(() => self.clients.claim())
  );
});

// Escuta mensagens para ativar o Service Worker quando solicitado pelo usuário (Update Flow)
self.addEventListener('message', event => {
  if (event.data && event.data.action === 'skipWaiting') {
    self.skipWaiting();
  }
});

// Busca (Fetch) - Estratégia Network-First
self.addEventListener('fetch', event => {
  if (event.request.url.startsWith('http') && !event.request.url.includes(self.location.hostname)) {
    return;
  }

  event.respondWith(
    fetch(event.request)
      .then(response => {
        if (response && response.status === 200 && response.type === 'basic') {
          const responseToCache = response.clone();
          caches.open(CACHE_NAME).then(cache => {
            cache.put(event.request, responseToCache);
          });
        }
        return response;
      })
      .catch(() => {
        return caches.match(event.request);
      })
  );
});
