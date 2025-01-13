#!/bin/bash

Echo “Beginning storage check… “

Exec >> ~/storage_report.txt

Echo “Date: $(date)”
Echo “----------------”

part=/dev/sda1
checkper=$(df -h | grep $part | awk ‘{print $5} | cut -d ‘%’ -f1)

Echo “$part is $checkper% full.”
Echo “storage check complete. Report saved to storage_report.txt.” >&2

