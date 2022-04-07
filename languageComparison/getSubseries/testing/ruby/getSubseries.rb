# getSubseries.rb

def getSubseries(series, threshold)
	working = []
	series.inject [] do |reduction, current|
		working.push current
		working.shift while working.inject(0, &:+) > threshold

		workingIsBetterForLength	= working.length > reduction.length
		workingIsBetterForTotal		= working.length == reduction.length && working.inject(0, &:+) > reduction.inject(0, &:+)
		
		workingIsBetterForLength || workingIsBetterForTotal ? working.clone : reduction
	end
end