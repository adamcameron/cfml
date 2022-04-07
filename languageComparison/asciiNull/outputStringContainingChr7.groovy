// outputStringContainingChr0.groovy
s = Character.toString((char) 7) + "foo${Character.toString((char) 7)}"
println "${s}:${s.length()}:${(int)s.getAt(4)}"