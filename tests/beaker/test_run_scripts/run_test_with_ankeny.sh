#!/bin/bash

# Work-around for RE-5005
export SSL_CERT_FILE=/usr/local/etc/openssl/cert.pem

export pe_dist_dir="http://enterprise.delivery.puppetlabs.net/2015.3/ci-ready"

export GEM_SOURCE=http://rubygems.delivery.puppetlabs.net

bundle install --without build development test --path .bundle/gems

bundle exec beaker \
  --preserve-host onfail\
  --host ../config/$1 \
  --debug \
  --pre-suite ../pre-suite \
  --tests ../tests \
  --keyfile ~/.ssh/id_rsa-acceptance \
  --load-path lib
