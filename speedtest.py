#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Nov 24 16:28:34 2018

See https://stackoverflow.com/questions/50999879/pyspeedtest-cannot-find-test-server

@author: peter
"""

import pyspeedtest
import csv
import time
import datetime
import os

os.chdir('/home/peter/Documents/speedtest/')


ts = datetime.datetime.fromtimestamp(time.time()).isoformat()
print("start:", ts)

try:
    st = pyspeedtest.SpeedTest()
    x = st.ping()
    y = st.download()
    z = st.upload()
except:
    x = float('inf')
    y = 0
    z = 0

ts = datetime.datetime.fromtimestamp(time.time()).isoformat()

f = open('test-results.csv', 'a')
with f:
    writer = csv.writer(f)
    writer.writerow([x, y, z, ts])

# Print to the log file
print("finish:", ts)
