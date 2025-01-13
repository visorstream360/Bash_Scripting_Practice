#!/bin/bash

Echo “Beginning storage check… “

Exec >> ~/storage_report.txt

Echo “Date: $(date)”
Echo “----------------”

part=/dev/sda1
checkper=$(df -h | grep $part | awk ‘{print $5} | cut -d ‘%’ -f1)

If [ $checkper -ge 50 ] && [ $checker -le 100 ]
Then
	echo “ALERT: $part is $checkper% full! Consider freeing up some space.”

Elif [ $checkper -ge 50 ] && [ $checkper -lt 95 ]
Then 
Echo “Caution: $part is $checker% full! Consider freeing up some space.”

Elif [ $checkper -lt 50 ]
Then
Echo “$part is $checkper% full. No action is needed.”

Else
Echo “encounter an error. Status code: $?” >&2
Exit $?
fi 

Echo “$part is $checkper% full.”
Echo “storage check complete. Report saved to storage_report.txt.” >&2
