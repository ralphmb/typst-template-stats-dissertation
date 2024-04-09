== Tables and Plots

Here's a table with some R output, made using `tablemaker.py`.
#table(
  columns:4, 
[Variable],           [Estimate], [Std. Error], [p],
[(Intercept)],             [-1.527], [0.698], [0.029],
[Variable 1],     [-0.014], [0.008], [0.081],
[Variable 2],               [0.033], [0.008], [0.000],
[Variable 3],      [-0.087], [0.429], [0.840],
)

And here's a plot I used in my thesis.

#figure(
  image("../assets/contourplot_logistic.png"),
  caption: [Caption goes here]
) <contourplot>
Here's a snippet of R code

```R
x <- seq(0,1,0.01)
y <- 2*sin()
```

You can reference figures like @contourplot. Bibliography entries can have short citations @premierleague, or long ones (#cite(<premierleague>, form:"prose"))\
You can have inline equations like $sum_(i in NN) 2^(-i) = 1$, or block equations like follows:
$ n! approx sqrt(2 pi n) ((n)/(e))^(n) $

== Next Section


#lorem(400)