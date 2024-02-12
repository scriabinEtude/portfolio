'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"main.dart.js": "55dfd06e3834e4e52f20b37d2d036804",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"index.html": "c3881959bb8e954a0b4119e2a4e0d758",
"/": "c3881959bb8e954a0b4119e2a4e0d758",
"version.json": "0325640b78b9f97959290dc5ebb8b3ed",
"assets/AssetManifest.bin.json": "4ed17ae28756db34106e6c6b74f21e8d",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/fonts/MaterialIcons-Regular.otf": "32fce58e2acb9c420eab0fe7b828b761",
"assets/AssetManifest.bin": "8481c1ae78b5e5795caec79a11cb1ff4",
"assets/AssetManifest.json": "78a05d0e4d9e7c671e0891ba8c27a2c7",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/NOTICES": "8825794ec2c7cb0901780fe4561f4b9b",
"assets/assets/images/icon_flutter.png": "4262c71228b7aa391e995fe5f1d57795",
"assets/assets/images/grat_membership.webp": "d8b66989385b4f002509c5537fc090e2",
"assets/assets/images/gratvet_main.png": "a35ee787ddf25cbc780d06669775fdd2",
"assets/assets/images/gratvet_schedule.png": "71a3b97372da41a0ca16fb25f1fb173c",
"assets/assets/images/gratdriver_shifty.webp": "c6b4c62762087ef18d9276d5d229f622",
"assets/assets/images/grat_location.webp": "e20a4773bf924d1da81aa4ca5745f967",
"assets/assets/images/logo_github_white.png": "1dee40f2668d5c719eafa2c89296f5e7",
"assets/assets/images/gratdriver_list.webp": "bad5bb5324e53433683841e5aa8e292b",
"assets/assets/images/logo_elonsoft.png": "53f26fb0b744db95fbcf082261b420e0",
"assets/assets/images/me.png": "0a1d83a019c6faee628d43f70f47837d",
"assets/assets/images/logo_github.png": "43ce87609eb221d09d4832a9c0e709d0",
"assets/assets/images/logo_gmail_320.png": "ee735bc2e795aaf12759e4ae6f87e966",
"assets/assets/images/logo_java.png": "6dfab33fba677f71c0c0e0f3891f246e",
"assets/assets/images/gratdriver_login.webp": "cd22ea3730479ae39ff0bb0690e0ae0e",
"assets/assets/images/gratvet_reserve.png": "de118817753327d24804e01d2513ae56",
"assets/assets/images/gratdriver_detail.webp": "3a66118112b6ecb1d6bcc7ee67eb7f3c",
"assets/assets/images/logo_grat.png": "3a6af73c96e8aa464ae9faa0167cd869",
"assets/assets/images/grat_summary.webp": "ffff8a82ae55ec6bb0822eefd5107358",
"assets/assets/images/grat_home.png": "9708b973ab157131a148769f63e39d26",
"assets/assets/images/logo_pubdev.png": "4bbc5e0659252aa4c55af84d7b79639b",
"assets/assets/images/grat_gallery.webp": "091dff256c3676b0870ef4f7a8b64562",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"manifest.json": "d40c47d1c161f94dbcb13094d37f1f55"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
