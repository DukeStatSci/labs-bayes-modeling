data {
  int<lower=1> N;
  vector[N] x; // Rainfall in cm
  vector[N] y; // Income in k$
  real lb;
  real<lower = lb> ub;
}

parameters {
  real<lower = lb, upper = ub> alpha;          // k$
  real beta;           // k$ / cm
  real<lower=0> sigma; // k$
}

model {
  y ~ normal(beta * x + alpha, sigma);
  alpha ~ uniform(lb, ub);
}

