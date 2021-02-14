#!/usr/bin/env bash
iterator=1;
subpaths=$(git config --file .gitmodules --get-regexp path | awk '{ print $2}');
subrepos=$(git config --file .gitmodules --get-regexp url | awk '{ print $2}');
for path in $subpaths; do
  repo=$(echo "$subrepos"| sed $iterator'q;d');
  #echo $repo $path
  git submodule add $repo $path;
  let iterator++;
done

