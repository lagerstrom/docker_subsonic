#
# Subsonic Dockerfile
#
# http://www.subsonic.org/
#

# Pull base image.
FROM ubuntu:14.04

# Add utf-8 locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Specifies where to download subsonic from
ENV SUB_URL http://subsonic.org/download/subsonic-6.0.deb

# Install java7 and wget
RUN apt-get update && apt-get install -y\
    openjdk-7-jre\
    wget

# Remove apt cache
RUN rm -rf /var/lib/apt/lists/*

# Install subsonic
RUN \
  cd /tmp &&\
  wget $SUB_URL &&\
  dpkg -i subsonic-*deb &&\
  rm -f subsonic-*.deb

# Define mountable directories.
VOLUME ["/subsonic"]
VOLUME ["/music"]

# Copy subsonic config
ADD config/subsonic.conf /etc/default/subsonic

# Copy the startup script
ADD scripts/startup.sh /root/startup.sh

# Make the startup script executable
RUN chmod +x /root/startup.sh

# Create the user subsonic
RUN useradd subsonic

# Expose port
#   - 8080: HTTP (subsonic)
EXPOSE 8080

# Start subsonic
ENTRYPOINT ["/root/startup.sh"]
