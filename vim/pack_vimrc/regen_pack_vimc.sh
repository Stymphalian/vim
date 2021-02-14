#1 /usr/bin/env bash
for i in `ls ../pack/default/opt`; do
  mkdir -p $i
  touch $i/.vimrc
done
