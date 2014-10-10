green = ["whero","karaka","kowhai","kakariki","kikorangi","poropango","papura"].select {|colour|
	colour == "kakariki"
}
require "json"
puts green.to_json
