#!/bin/env bash

git config --global --add safe.directory "$(git rev-parse --show-toplevel)"
git config --local --get include.path | grep -e ../.gitconfig || git config --local --add include.path ../.gitconfig