import sys
import sqlite3
import contextlib

argvs = sys.argv

with contextlib.closing(
    sqlite3.connect("file:" + argvs[1] + "?mode=ro&nolock=1", uri=True)
) as conn:
    c = conn.cursor()

    for row in c.execute("select url, title from urls order by last_visit_time desc"):
        row = list(row)
        print(row[1] + " [" + row[0] + "]")
