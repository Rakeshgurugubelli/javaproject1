# Use the latest Ubuntu image
FROM ubuntu:latest

# Set the working directory
WORKDIR /root

# Update and install required packages including Java
RUN apt-get update && \
    apt-get install -y \
        wget \
        vim \
        gzip \
        tar \
        fontconfig \
        openjdk-17-jdk && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Download and extract Tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-11/v11.0.0/bin/apache-tomcat-11.0.0.tar.gz && \
    tar -zxvf apache-tomcat-11.0.0.tar.gz && \
    mv apache-tomcat-11.0.0 tomcat && \
    rm apache-tomcat-11.0.0.tar.gz  # Clean up the tar file

# Copy configuration files
COPY tomcat-users.xml /root/tomcat/conf/
COPY context.xml /root/tomcat/webapps/manager/META-INF/

# Expose the port Tomcat listens on
EXPOSE 8080

# Set the command to start Tomcat
CMD ["/root/tomcat/bin/catalina.sh", "run"]
