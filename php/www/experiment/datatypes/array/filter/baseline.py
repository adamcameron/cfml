rainbow = ["whero","karaka","kowhai","kakariki","kikorangi","poropango","papura"]
green = list(filter(lambda colour: colour == "kakariki", rainbow))

import json
print(json.dumps(green))