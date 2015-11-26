#!/bin/bash
PORT=31338
USERNAME='i247926'
SSH_FLAGS="-A -t -L $PORT:localhost:$PORT"

HOPS=""

CMD="ssh $SSH_FLAGS szewc@evolution.ii.uni.wroc.pl ssh $SSH_FLAGS -p 2222 $USERNAME@localhost "

for hop in $HOPS; do
  CMD="$CMD ssh $SSH_FLAGS $USERNAME@$hop"
done

CMD="$CMD $@"
echo $CMD
exec $CMD
