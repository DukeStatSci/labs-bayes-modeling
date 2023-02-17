data { 
  int<lower=0> n;           // items 
  int<lower=0> N[n];        // initial trials 
  int<lower=0> y[n];        // initial successes 
  real<lower = 0> a;        // beta param1
  real<lower = 0> b;        // beta param2
} 
parameters { 
  vector<lower=0, upper=1>[n] theta;  // chance of success (unpooled) 
} 
model { 
  y ~ binomial(N, theta);  // likelihood 
  theta ~ beta(a,b);
}


