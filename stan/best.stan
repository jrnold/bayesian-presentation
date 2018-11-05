data {
  // priors
  real mu_loc_A;
  real mu_loc_B;
  real<lower=0.> mu_scale_A;
  real<lower=0.> mu_scale_B;
  real<lower=0.> sigma_scale_A;
  real<lower=0.> sigma_scale_B;
}
parameters {
  real mu_A;
  real mu_B;
  real<lower=0.> sigma_A;
  real<lower=0.> sigma_B;
  real<lower=1.> nu;
}
model {
  sigma_A ~ cauchy(0., sigma_scale_A);
  sigma_B ~ cauchy(0., sigma_scale_B);
  mu_A ~ normal(m_A, s_A);
  mu_B ~ normal(m_B, s_B);
  sigma_A ~ student_t(nu, mu_A, sigma_A);
  sigma_B ~ student_t(nu, mu_A, sigma_B);
  nu ~ gamma(2, 0.1);
}
