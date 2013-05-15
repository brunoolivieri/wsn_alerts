#! /usr/bin/python
from TOSSIM import *
import sys

t = Tossim([])
r = t.radio()
f = open("topo.txt", "r")

for line in f:
  s = line.split()
  if s:
    print " ", s[0], " ", s[1], " ", s[2];
    r.add(int(s[0]), int(s[1]), float(s[2]))

t.addChannel("alarmGroupAppC", sys.stdout)


noise = open("meyer-heavy-short.txt", "r")
for line in noise:
  str1 = line.strip()
  if str1:
    val = int(str1)
    for i in range(0, 4):
      t.getNode(i).addNoiseTraceReading(val)

for i in range(0, 4):
  print "Creating noise model for ",i;
  t.getNode(i).createNoiseModel()

t.getNode(0).bootAtTime(100000);
t.getNode(1).bootAtTime(100001);
t.getNode(2).bootAtTime(800008);
t.getNode(3).bootAtTime(1800009);

while (t.getNode(0).isOn()):
  t.runNextEvent()

