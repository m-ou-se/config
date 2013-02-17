#/usr/bin/python
import datetime
from subprocess import call

now = datetime.datetime.now();

strikes = 0;
tune = False;


if now.minute == 0:
	tune    = True
	strikes = now.hour % 12
	if strikes == 0: strikes = 12;
elif now.minute == 30:
	strikes = 1;

if tune:
	call(["/usr/bin/paplay", "/usr/local/share/bigben/tune.wav"]);

if strikes > 0:
	for i in range(strikes):
		call(["/usr/bin/paplay", "/usr/local/share/bigben/strike.wav"]);
