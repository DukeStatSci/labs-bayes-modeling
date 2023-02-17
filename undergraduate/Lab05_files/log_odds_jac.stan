data {
   int<lower=0> N;
   int<lower=0, upper=1> y[N];
}
parameters {
  real eta;
}
transformed parameters {
  real<lower=0, upper=1> theta;
  theta = inv_logit(eta);
}
model {
  theta ~ uniform(0, 1);
  /* Now we need a log absolute Jacobian adjustment. */
  target += eta - 2 * log(1 + exp(eta));
  for(i in 1:N){
    y[i] ~ bernoulli(theta);
  }
  
  /*alternate implementation 1*/ 
  //y ~ bernoulli(theta);
  //theta ~ uniform(0, 1);
  //increment_log_prob(log(theta) + log(1 - theta));
  
  /*alternate implementation 2*/ 
  // target += beta_lpdf(theta | 1,1);
  // target += eta - 2 * log(1 + exp(eta));
  //for(i in 1:N){
  //  target += bernoulli_lpmf(y[i]|theta);
  //}
}

