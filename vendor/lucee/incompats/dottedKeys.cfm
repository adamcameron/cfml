<cfscript>
struct = {
	one = {
		two = {
			three = {
				four = "six"
			}
		}
	}
};
writeDump(struct);

path = "one.two.three.four";

"struct.#path#" = "five";
writeDump(variables);

</cfscript>