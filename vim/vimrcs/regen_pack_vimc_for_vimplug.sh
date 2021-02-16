#1 /usr/bin/env bash
for i in `ls ../plugged/`; do
  mkdir -p $i
  touch $i/.vimrc
done
