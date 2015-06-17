// outputStringContainingChr0.groovy
s = Character.toString((char) 0) + "foo${Character.toString((char) 0)}"
println "${s}:${s.length()}:${(int)s.getAt(4)}"