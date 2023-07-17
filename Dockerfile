FROM  centos:latest
# Set an alternative mirror for CentOS AppStream
RUN echo "mirrorlist=http://mirrorlist.centos.org/?release=8&arch=x86_64&repo=AppStream&infra=$infra" > /etc/yum.repos.d/CentOS-AppStream.repo

# Update the package manager metadata
RUN yum update -y

# Install required packages
RUN yum install -y httpd unzip

# Clean up the package manager metadata and cache
RUN yum clean all
RUN echo "mirrorlist=http://mirrorlist.centos.org/?release=8&arch=x86_64&repo=AppStream&infra=$infra" > /etc/yum.repos.d/CentOS-AppStream.repo
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80 22
