#! /usr/bin/env bash

while rabbitmqadmin delete queue name=`rabbitmqadmin list queues | head -4 | tail -1 | awk '{print $4}'`; do
	echo 'deleted';
done

echo 'done';

