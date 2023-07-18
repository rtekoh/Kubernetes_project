FROM  centos:latest
# Set an alternative mirror for CentOS AppStream
RUN echo "mirrorlist=http://vault.centos.org/?release=8&arch=x86_64&repo=AppStream&infra=$infra" > /etc/yum.repos.d/CentOS-AppStream.repo && \
    sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

# Update the package manager metadata
RUN yum -y install httpd && \
    yum install -y unzip && \
    yum clean all


ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
