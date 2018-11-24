#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Nov 24 16:46:38 2018

This program sets up an empty CSV file for holding speed test results.
CAUTION - this will overwrite any existing results, without a warning.
This is only intended to be used once.

@author: Peter Ellis
"""
import csv

f = open('test-results.csv', 'w')
with f:
    writer = csv.writer(f)
    writer.writerow(["ping", "download", "upload", "timestamp"])