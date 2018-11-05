data {
  int<lower=1> visitors_A;
  int<lower=0> conversions_A;
  int<lower=1> visitors_B;
  int<lower=0> conversions_B;
  real<lower=0> pi_A_alpha;
  real<lower=0> pi_A_beta;
  real<lower=0> pi_B_alpha;
  real<lower=0> pi_B_beta;
}
parameters {
  real<lower=0., upper=1.> pi_A;
  real<lower=0., upper=1.> pi_B;
}
model {
  pi_A ~ beta(pi_A_alpha, pi_A_beta);
  pi_B ~ beta(pi_B_alpha, pi_B_beta);
  conversions_A ~ binomial(visitors_A, pi_A);
  conversions_B ~ binomial(visitors_B, pi_B);
}
generated quantities {
  real<lower=-1., upper=1.> pi_diff;
  real eta_diff;
  real lift;

  pi_A = inv_logit(eta_A);
  pi_B = inv_logit(eta_B);
  pi_diff = pi_B - pi_A;
  lift = (pi_B - pi_A) / pi_B;
}
