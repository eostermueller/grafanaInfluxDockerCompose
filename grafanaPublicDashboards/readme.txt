Looking for the right folder to place your Grafana "scripted dashboard" javascript files?
This is the folder!

For example, you can launch this scripted dashboard:

    http://localhost:3000/dashboard/script/scripted.js?rows=3&name=myName

which runs the file scripted.js file in this folder.  I validated this by changing this line in scripted.js:

      title: 'Events',

to this:

      title: 'BigEvents',

...and then I verified that the title for the graphs changed from "Events" to "BigEvents".


Learn how to write Grafana Scripted Dashboards:  http://docs.grafana.org/reference/scripting/
Here is the disk location inside the Grafana container:  /usr/share/grafana/public/dashboards

The files in this folder came (unmodified) from the Grafana 4.2.0 installation.  https://grafana.com/grafana/download/4.2.0
I downloaded the MS-Windows .zip distribution and unzipped the files into this folder.
I copied these files into place because I wasn't sure whether the "Union File System" was working.
See [this stackoverflow question][1] for details.

  [1]: https://stackoverflow.com/questions/32775594/why-does-docker-need-a-union-file-system
