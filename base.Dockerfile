FROM jekyll/jekyll:latest

COPY minimal-mistakes /srv/jekyll

RUN cd /srv/jekyll \
    && bundle install
