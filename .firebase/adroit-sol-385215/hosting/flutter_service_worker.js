'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/canvaskit.js": "76f7d822f42397160c5dfc69cbc9b2de",
"canvaskit/canvaskit.wasm": "f48eaf57cada79163ec6dec7929486ea",
"canvaskit/chromium/canvaskit.js": "8c8392ce4a4364cbb240aa09b5652e05",
"canvaskit/chromium/canvaskit.wasm": "fc18c3010856029414b70cae1afc5cd9",
"canvaskit/skwasm.js": "1df4d741f441fa1a4d10530ced463ef8",
"canvaskit/skwasm.wasm": "6711032e17bf49924b2b001cef0d3ea3",
"canvaskit/skwasm.worker.js": "19659053a277272607529ef87acf9d8a",
"flutter.js": "6fef97aeca90b426343ba6c5c9dc5d4a",
"main.dart.js": "af7ff49cd2ca29baa731dd97712bd569",
"version.json": "f694906ee02186f6d8ae3e1f9666bae3",
"assets/assets/images/placeholder.png": "b8334a744ca2f9957684452066151f04",
"assets/fonts/AveriaSerifLibre-Bold.ttf": "f66b9c61fb1b62691392fef3d27598ae",
"assets/fonts/AveriaSerifLibre-BoldItalic.ttf": "f20c8065b4528f957a16d01b7e996a3d",
"assets/fonts/AveriaSerifLibre-Light.ttf": "4a35f6227fd8c935b4ecac7b9832d608",
"assets/fonts/AveriaSerifLibre-LightItalic.ttf": "984e7b8e6adea7bc44e108ec3dbe1daa",
"assets/fonts/AveriaSerifLibre-Regular.ttf": "b653aa40dc0ebd0a47ae833b8862586b",
"assets/fonts/AveriaSerifLibre-Italic.ttf": "f00a01fe34ac64293215469581c64b84",
"assets/fonts/MaterialIcons-Regular.otf": "d8d40c33f3757d3d0f9e438c94b1380e",
"assets/static/Geologica-Thin.ttf": "58c6751f6930956e78a8f690e732cc1d",
"assets/static/Geologica-ExtraLight.ttf": "4356a45484abc4dce427a3a568ae5993",
"assets/static/Geologica-Light.ttf": "55fa7187bffa5443a8362b6717c274a2",
"assets/static/Geologica-Regular.ttf": "a1be126282b0cbf8fe369f4a46ccc9a4",
"assets/static/Geologica-Bold.ttf": "f9f15d25259d1b91905ebfddb8840df5",
"assets/static/Geologica-SemiBold.ttf": "9e1dd44aa6ff39331764c487ea638e41",
"assets/static/Geologica-ExtraBold.ttf": "21e047985f59b55cf706d82ff0d5c8f2",
"assets/static/Geologica-Black.ttf": "95ddc548bd7caeeed90a2ed8d8ddd746",
"assets/static/Geologica-Medium.ttf": "c7d376a7e3678dbdc32de4abd0cf486e",
"assets/static/Geologica_Auto-Black.ttf": "768d0948ab499da992a0f22bb2646183",
"assets/static/Geologica_Auto-ExtraLight.ttf": "80eecfee1cf400b9567b11c4cd81cd02",
"assets/static/Geologica_Auto-Light.ttf": "f8d08ed0d9e1ed13624a378cc64ca429",
"assets/static/Geologica_Auto-Medium.ttf": "c5a2ca33076b1ebb7df6f0851c0267d2",
"assets/static/Geologica_Auto-Regular.ttf": "191a13e6c9607286769ae4bad9a377bf",
"assets/static/Geologica_Auto-SemiBold.ttf": "f381c1c74f9896c7e6013429e630ae0c",
"assets/static/Geologica_Auto-Thin.ttf": "22679cd48d9d8fab79081571b1f37038",
"assets/static/Geologica_Auto-Bold.ttf": "1f74fb66c41fae1c3fb11c982baf4e53",
"assets/static/Geologica_Auto-ExtraBold.ttf": "fe585f79717b1487ff7c417686ec9659",
"assets/static/Geologica_Cursive-Thin.ttf": "82d964da77f109a0596dc03bc80bf9ec",
"assets/static/Geologica_Cursive-ExtraLight.ttf": "6177ee2842672511fbf0397f6e7d978f",
"assets/static/Geologica_Cursive-Light.ttf": "cba925d4b943427e9b21ac8904a6f38e",
"assets/static/Geologica_Cursive-Medium.ttf": "5c9707e6ebe51605d6fde4f0272b6fea",
"assets/static/Geologica_Cursive-Regular.ttf": "d7004b596ff2fb992e5b960670d3f597",
"assets/static/Geologica_Cursive-SemiBold.ttf": "3478c42044417058c11206a628bf005c",
"assets/static/Geologica_Cursive-Bold.ttf": "2e3589303e895a40198e4903752a4142",
"assets/static/Geologica_Cursive-ExtraBold.ttf": "d0d52bf22ba9bee69ec560bda75ef256",
"assets/static/Geologica_Cursive-Black.ttf": "aac9ac0a39e50c0d792d580cc3ff2e3f",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"assets/AssetManifest.json": "8444c399e5f1c9018cbfde7d3ac394f9",
"assets/AssetManifest.bin": "ee6ca92d6834d3a619f4f23924238692",
"assets/FontManifest.json": "00ae96ce21d844fe0c32df92c4ca1ab8",
"assets/NOTICES": "771b453006eaab401e0a9f4cbb2467d4",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "e3be57a20c9597329304f4d4e0e61a21",
"/": "e3be57a20c9597329304f4d4e0e61a21",
"manifest.json": "dbf57b1d369977cba0d70add924fa8bf"};
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
