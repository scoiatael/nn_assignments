#!/bin/bash
PORT=31338
USERNAME='i247926'
SSH_FLAGS="-A -t -L $PORT:localhost:$PORT"

HOPS=(
"$USERNAME@tryglaw.ii.uni.wroc.pl"
"szewc@evolution.ii.uni.wroc.pl"
"-p 2222 $USERNAME@localhost"
"$USERNAME@lab110-02"
)

CMD=""

# get length of an array
tLen=${#HOPS[@]}

# use for loop read all hops
for (( i=0; i<${tLen}; i++ ));
do
  CMD="$CMD ssh $SSH_FLAGS ${HOPS[$i]}"
done

CMD="$CMD $@"
echo $CMD
exec $CMD
