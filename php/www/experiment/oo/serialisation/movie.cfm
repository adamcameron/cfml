<cfscript>
// movie.cfm

movie = new Movie("Once Were Warriors", 1994, new Person("Lee", "Tamahori"))

serialisedMovie = serialize(movie)

echo("<pre>serialisedMovie</pre><hr>")
echo(serialisedMovie)


deserialisedMovie = evaluate(serialisedMovie)

dump(var=deserialisedMovie.get(), label=getMetadata(deserialisedMovie).fullName)

director = deserialisedMovie.getDirector()
dump(var=director.getFullName(), label=getMetadata(director).fullName)
</cfscript>
