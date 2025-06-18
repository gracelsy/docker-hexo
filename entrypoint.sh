#!/bin/sh
if [ -n "$GIT_USER" ]; then
  git config --global user.name "$GIT_USER"
fi
if [ -n "$GIT_EMAIL" ]; then
  git config --global user.email "$GIT_EMAIL"
fi
exec sh
