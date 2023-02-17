data { 
  int<lower=0> N; 
  int<lower=0, upper=1> y[N]; 
} 
parameters { 
  real<lower=0, upper=1> theta;
}
transformed parameters {
  real eta = logit(theta);
}
model { 
  y ~ bernoulli(theta);  
  theta ~ beta(1e-4, 1e-4); 
}
