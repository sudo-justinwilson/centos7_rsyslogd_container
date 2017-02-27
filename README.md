# rsyslog container on Centos7

## To run:
    ```
    docker run -d -p 514:514 -p 514:514/udp -v /var/log/remote/:/var/log/remote:z centos7_rsyslogd_container
    ```

    -   /var/log/remote = directory where the logs will be stored
    -  :z = set SELINUX label
    -   514/udp =   the port that rsyslog will listen on

## rsyslog\_container\_service:
    I have included a systemd-unit file, which can be placed in /etc/systemd/system so that the service will start on boot (if enabled with systemctl enable..), or you can use it as a template.
    This systemd-unit file in particular will always restart the container if it stops.
