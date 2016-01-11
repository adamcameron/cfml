(def numbers ["tahi", "rua", "toru", "wha", "rima", "ono", "whitu", "waru", "iwa", "tekau"])
(def indexedNumbers (map (fn [v,i] (vector i v)) numbers (range)))

(def oddIndexedNumber (
	filter (
		fn [indexedNumber] (= (rem (get indexedNumber 0) 2) 0))
		indexedNumbers
	)
)
(def oddNumbers (
	map (
		fn [indexedNumber] (get indexedNumber 1))
		oddIndexedNumber
	)
)

(println "via doseq")
(doseq [number oddNumbers] (println number))
(println "=======================")

(println "via reduce")
(def oddNumbersAsString (
	reduce (
		fn [combined oddNumber] (str combined oddNumber "\n"))
		""
		oddNumbers
	)
)
(print oddNumbersAsString)
(println "=======================")
