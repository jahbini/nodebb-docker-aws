# nodebb-docker-aws
create NodeBB in dockable form for AWS EC2

execute `docker build -t tt-b/1 .`

This will create image `tt-b1`.

You can spin up the container with a simple:
`docker-compose up`

This has been tested with AWS via Docker Hub - use the compose yml file as Docker Hub's stackfile.

Note that AWS/Docker will not allow you to save an executing stack.  Each plugin that you add should also be included in the
dependencies of the NodeBB image -- you will need to add new image slices before you get to the image that you finally spin up.

Jim-
Not a Newbie-- Worse, and Oldbie


