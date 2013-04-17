{:user {:dependencies [[spyscope "0.1.3"]
                       [redl "0.1.0"]] 
        :injections [(require 'spyscope.core)
                     (require '[redl complete core])]
        :plugins [[clj-stacktrace "0.2.4"]
                  [lein-autotest "1.2.0"]
                  [lein-guzheng "0.4.5"]
                  [jonase/kibit "0.0.3"]
                  ;[lein-checkouts "1.0.0"]
                  ;[lein-difftest "1.3.7"]
                  [lein-swank "1.4.4"]
                  [lein-clojars "0.9.1"]
                  [lein-midje "2.0.4"] 
                  [lein-pprint "1.1.1"]
                  [lein-autoexpect "0.2.2"]
                  [lein-expectations "0.0.7"]
                  ;[lein-catnip "0.4.1"]
                  [lein-tarsier "0.9.4-SNAPSHOT" :exclusions [org.clojure/clojure]]]}
 :pedant {:plugins [[lein-pedantic "0.0.3"]]}
 :offline {:offline? true}}
