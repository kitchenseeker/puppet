#!/bin/bash
cat <<EOF > /var/www/stats.html
<h1><font color="blue">Node Stats.html</font></h2>
<h2>Realtime Statistics for node: <font color="red"> $(hostname -f):80 </font></h2>
<h3>connected database</h3> <font color="red">$(ping -c1 mysql.kitchenseeker.com | grep -m1 kitchenseeker | awk '{p
rint $2 " " $3}')</font>
<ul>
        <li><b>System Date:</b> $(date) </li>
        <li><b>Uname:</b> $(uname -a) </li>
        <li><b>CPU:</b>  $(grep 'cpu ' /proc/stat| awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}') </li
>
        <li><b>Memory(MB):</b>  $(free -m | awk 'NR==3 {print "used:"$3" free:"$4}') </li>
        <li><b>Uptime:</b>  $(uptime) </li>
</ul>
<h3> List of live connections </h3>
<code><pre>
$(netstat -an | grep :80)
</pre></code>
<h3> Traffic Statistics </h3>
<pre>
$(netstat -s)
</pre>
EOF
