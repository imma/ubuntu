(ns defn.core)

(require '["express" :as express])
(require '["http" :as http])

(def app (express))

(. app (get "/hello"
  (fn [req res] (. res (send "Hello defn")))))

(defn -main [& args]
  (doto (.createServer http #(app %1 %2))
    (.listen 3000)))
