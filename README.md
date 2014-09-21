_(Only intended for our internal use but if it can help anyone I leave it public.)_

A site scaffold for french [Ruhoh](http://ruhoh.com)-generated sites.

## Added conveniences

(compared to upstream)

 - Localized months names (through [this patch](https://github.com/ameuret/ruhoh.rb/commit/afeb989abb8287c475b203dca2e231589d086d78))
 - Localized static strings
 - Localized date format
 - Guard watches for seamless integration into a running webapp (on dev machines).
    - Site is recompiled and copied over to public dir.
    - HAML templates
    - SASS files
    - No need for Sprockets
 - initPageJS Ruhoh partial

### Using the initPageJS partial

Dynamic pages have several pieces that bring them to life:

 - They have a pageId declaration in the page metadata:
 
```
    pageId: 'pub-gallery'
```

 (This must be added to each page)

 - They use the `dyn` sub-layout which (through the initJS partial):
   - loads the YUI code from `http://yui.yahooapis.com`
   - loads the global application code from `app.js`
   - loads the page-specific code from _pageId_.js
   - bootstraps the YUI instance the app-wide code and the page code:
 
```
    <script type="text/javascript">
      function initPageEnv(Y) {
        CLO.Y=Y;
        initPage(Y);
      };
      YUI().use('model-list','model','model-sync-rest','node-event-delegate', 'event-key', 'json-parse', 'io', 'event', 'event-custom','console', 'handlebars', 'panel', 'querystring-parse', 'transition', 'dom-style', initPageEnv);
    </script>
```

The application top-level namespace (here `CLO`) must have been declared in `app.js`

The `initPage()` function is defined in _pageId_.js
