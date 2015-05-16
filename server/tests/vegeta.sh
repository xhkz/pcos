#!/bin/sh

vegeta report -inputs=results.bin -reporter=plot > plot.html

#uwsgi:
echo "GET http://127.0.0.1:5000/info" | vegeta attack -duration=60s | tee results.bin | vegeta report
#Requests	[total, rate]			3000, 50.02
#Duration	[total, attack, wait]		59.98510646s, 59.979999914s, 5.106546ms
#Latencies	[mean, 50, 95, 99, max]		3.783242ms, 3.561043ms, 6.48925ms, 10.129618ms, 10.129618ms
#Bytes In	[total, mean]			12000, 4.00
#Bytes Out	[total, mean]			0, 0.00
#Success		[ratio]				100.00%
#Status Codes	[code:count]			200:3000
#Error Set:

#python:
echo "GET http://127.0.0.1:5000/info" | vegeta attack -duration=60s | tee results.bin | vegeta report
#Requests	[total, rate]			3000, 50.02
#Duration	[total, attack, wait]		59.984787124s, 59.979999966s, 4.787158ms
#Latencies	[mean, 50, 95, 99, max]		4.943311ms, 4.964345ms, 7.014592ms, 23.759744ms, 23.759744ms
#Bytes In	[total, mean]			12000, 4.00
#Bytes Out	[total, mean]			0, 0.00
#Success		[ratio]				100.00%
#Status Codes	[code:count]			200:3000
#Error Set:

#nginx:
echo "GET http://127.0.0.1:5500/info" | vegeta attack -duration=60s | tee results.bin | vegeta report
#Requests	[total, rate]			3000, 50.02
#Duration	[total, attack, wait]		59.98531843s, 59.979999921s, 5.318509ms
#Latencies	[mean, 50, 95, 99, max]		3.945947ms, 4.248038ms, 6.390436ms, 10.923277ms, 10.923277ms
#Bytes In	[total, mean]			12000, 4.00
#Bytes Out	[total, mean]			0, 0.00
#Success		[ratio]				100.00%
#Status Codes	[code:count]			200:3000
#Error Set: