data { 
  int<lower=0> N; 
  real<lower = 0> a;
  real<lower = 0> b;
  real y[N]; 
  real mu;
} 
parameters {
  real<lower=0> tau2;
}
transformed parameters {
  real<lower=0> s2;
  s2 = 1 / tau2;  // change variables
}
model {
  /* alternate implementation */
  //s2 ~ inv_gamma(a,b);
  //target +=  -2 * log(tau2);  //  Jacobian adjustment;
  //for(i in 1:N){
  //    y[i]~ normal(mu,sqrt(s2));
  //}
  target += inv_gamma_lpdf(s2|a,b);
  target += -2 * log(tau2);
    for(i in 1:N){
      target+= normal_lpdf(y[i] | mu,sqrt(s2));
  }
}

