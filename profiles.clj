{:user {:dependencies [[spyscope "0.1.3"]
                       [criterium "0.4.1"]
                       [redl "0.1.0"]] 
        :injections [(require 'spyscope.core)
                     (require '[redl complete core])]
        :plugins [[clj-stacktrace "0.2.4"]
                  [lein-autotest "1.2.0"]
                  [lein-guzheng "0.4.5"]
                  [jonase/kibit "0.0.4"]
                  [lein-annotations "0.1.0"]
                  [varspotting "0.0.2"]
                  [lein-vanity "0.1.0"]
                  [lein-midje "2.0.4"]
                  [lein-pprint "1.1.1"]
                  [lein-autoexpect "0.2.2"]
                  [lein-expectations "0.0.7"]]}
 :offline {:offline? true}}
