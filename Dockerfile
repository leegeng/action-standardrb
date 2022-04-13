FROM ruby:2.7

ENV REVIEWDOG_VERSION v0.14.0

SHELL ["/bin/bash", "-eo", "pipefail", "-c"]
RUN apt-get update && apt-get install -y --no-install-recommends --no-install-suggests build-essential git
RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ $REVIEWDOG_VERSION

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
