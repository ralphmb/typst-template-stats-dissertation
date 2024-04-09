#let c = counter("appendix")
#let appendix(it) = block[
  #c.step()
  #heading([Appendix #c.display("1"): #it], numbering: none, outlined:false)
]
// The above function automatically numbers the appendices
// 


#appendix([My Code])
A Python implementation of fizzbuzz. \

#raw(read("../assets/code/fizzbuzz.py"),lang:"Python")

#appendix([Other Stuff])

#lorem(100)