#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Nov 24 16:46:38 2018

@author: peter
"""
import csv

f = open('test-results.csv', 'w')
with f:
    writer = csv.writer(f)
    writer.writerow(["ping", "download", "upload", "timestamp"])