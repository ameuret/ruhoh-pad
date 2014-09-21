# -*- coding: utf-8 -*-
module ActimeRuhohPlugins
  
  def pass(block)
    "{{=<% %>=}}#{block}<%={{ }}=%>"
  end
  
  def initPageJS
    src = <<-ENDOFSRC
      <script src="/js/{{page.pageId}}.js"></script>
      <script type="text/javascript">
        YUI().use('model-list','model','model-sync-rest','node-event-delegate', 'event-key', 'json-parse', 'io', 'event', 'event-custom','console','imageloader', 'io-form', 'handlebars', 'autocomplete', 'autocomplete-filters', 'autocomplete-highlighters', initPage);
      </script>
    ENDOFSRC
  end
end
  
Ruhoh::Views::MasterView.__send__(:include, ActimeRuhohPlugins)
  
Date.send(:remove_const, :MONTHNAMES)
Date.const_set(:MONTHNAMES,[nil,"janvier","février","mars","avril","mai","juin","juillet","août","septembre","octobre","novembre","décembre"])

