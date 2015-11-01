#!/bin/bash
PORT=31338
SSH_FLAGS="-A -t -L $PORT:localhost:$PORT"

HOPS="tryglaw.ii.uni.wroc.pl hera cymes"

CMD=""

for hop in $HOPS; do
  CMD="$CMD ssh $SSH_FLAGS i247926@$hop"
done

CMD="$CMD $@"
echo $CMD
exec $CMD
