#!/bin/bash
set -xe

mkdir -p ~/.git_template/hooks
cp commit-msg ~/.git_template/hooks
git config --global init.templatedir ~/.git_template