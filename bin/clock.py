#!/usr/bin/python

import datetime
import subprocess
import os

minutes = datetime.datetime.now().minute;
cents = minutes // 9 * 100;

subprocess.call(["play", os.environ["HOME"] + "/.intro/woolooloo.wav", "pitch", str(cents)])

