## Subsonic Dockerfile ##

Build)

 $ docker build -t subsonic .

Run)

 * Create a mountable data directory for subsonic on the host.

 $ docker run -d -p 8080:8080 -v <music directory>:/music:ro -v <subsonic data directory>:/subsonic subsonic

 E.g

 $ docker run -d -p 8080:8080 -v /persistent_storage/music/:/music:ro -v /persistent_storage/subsonic/:/subsonic subsonic



If you want to use docker compose I have added a example file to show you how that could be done.