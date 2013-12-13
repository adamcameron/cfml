integerVariable	= 123
stringVariable	= "123"

hash = {
	:integerVariable	=> integerVariable,
	:stringVariable		=> stringVariable,
	:hardCodedString	=> "123",
	:hardCodedInteger	=> 123,
	:to_s				=> integerVariable.to_s
}
require 'json'
puts JSON.generate(hash)puts