// Implementation.cfc
component implements="Interface" {

	public any function acceptArrayOfSamples(required Sample[] samples){
		return samples;
	}

	public Sample[] function returnArrayOfSamples(required array samples){
		return samples;
	}

}