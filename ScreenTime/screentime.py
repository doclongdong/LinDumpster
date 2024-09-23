
from datetime import datetime
import pytz
import subprocess
import time
import os

la = pytz.timezone("America/Los_Angeles")
now = datetime.now(la)


start_time = 18
end_time = 23

dyr = os.path.dirname(os.path.abspath(__file__))
nsa = os.path.join(dyr, "notify-send-all.sh")

h = now.hour
if not (start_time <= h <= end_time):
    subprocess.run(["bash", f"{nsa}", '"Outside allowed hours"', '"Locking screen in 10 seconds"'])
    time.sleep(10)
    subprocess.run(["loginctl", "lock-sessions"])


