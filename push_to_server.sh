#!/bin/bash
echo -e '
          Pushing Files to Server'
scp index.html norad:/home/apache/mv/stable
scp assets/css/style.min.css norad:/home/apache/mv/stable/assets/css
scp assets/js/all.min.js norad:/home/apache/mv/stable/assets/js/
scp -r assets/font/ assets/ico/ assets/img/ assets/resume/ norad:/home/apache/mv/stable/assets/
