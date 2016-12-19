#!/bin/bash

elm package install -y && \
  npm install && \
  bower install && \
  npm run start
