;; (load-file "clojure_version.clj")

(def numbers ["tahi", "rua", "toru", "wha", "rima", "ono", "whitu", "waru", "iwa", "tekau"])
(def indexed-numbers (map (fn [i,v] (vector i v)) (range) numbers))

(def odd-indexed-number (
	filter (
		fn [indexed-number] (= (rem (get indexed-number 0) 2) 0))
		indexed-numbers
	)
)
(def odd-numbers (
	map (
		fn [indexed-number] (get indexed-number 1))
		odd-indexed-number
	)
)

(println "via doseq")
(doseq [number odd-numbers] (println number))
(println "=======================")

(println "via reduce")
(def odd-numbers-as-string (
	reduce (
		fn [combined odd-number] (str combined odd-number "\n"))
		""
		odd-numbers
	)
)
(print odd-numbers-as-string)
(println "=======================")
