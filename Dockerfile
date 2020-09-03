FROM jsacrist/jekyll/minimal-mistakes-base:latest

COPY ./system/* /srv/jekyll/

RUN cd /srv/jekyll \
    && bundle install

# Burn-in a default config, if the user decides to have a custom config dir, they can mount over this one
COPY ./config/* /config/
