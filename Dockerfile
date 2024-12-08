# syntax = docker/dockerfile:1

# Base stage with ruby and runtime deps
ARG RUBY_VERSION=3.1.0
ARG RUBY_VARIANT=slim
FROM dh-mirror.gitverse.ru/ruby:${RUBY_VERSION}-${RUBY_VARIANT} AS ruby
ARG TZ=Europe/Moscow
RUN ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone
RUN apt-get update -qq && \
    apt-get install --autoremove --no-install-recommends -y libjemalloc2 libvips && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Stage with ruby, runtime and build deps
FROM ruby AS ruby-builder
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y gcc make && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives
