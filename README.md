# ANSYS Fluent Docker Build
Attempt at running ANSYS Fluent v195 within a Docker Container with Centos 7.6.

You will need to provide your own install of ANSYS Fluent; I created this by installing only Fluent on a Centos7.6 VM, then copying the ansys_inc folder to the Docker Build folder. During install in the VM you'll need to setup your license server. If your server uses ports other than 1055/2325 you'll need to change the expose line.

So far I've been unable to get the container to recognize the host GPU, so graphics works, it just a little odd, and severly under-performs. I suggest not displaying large meshes.
