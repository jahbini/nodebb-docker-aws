# The base image is the latest 4.x node (LTS) on jessie (debian)
# -onbuild will install the node dependencies found in the project package.json
# and copy its content in /usr/src/app, its WORKDIR
FROM node:6

WORKDIR /nodebb-forum
RUN pwd
#
# as of 7/20/2016 git clone rejected the 'git protocol' clone; https worked so here it is:
RUN git clone https://github.com/NodeBB/NodeBB.git /nodebb-forum
RUN npm install

# add the database an hostname url here
COPY ./config.json .
# put admin information in the setup environment variable
ENV setup='{"admin:username":"Bamboo Jim","admin:email":"jim@bamboocando.com","admin:password":"pass-W0rd","admin:password:confirm":"pass-W0rd"}'

ENV NODE_ENV=production \
    daemon=false \
    silent=false

# the first 'node app' will process the setup from config.json and setup env variable
# UNSETTING setup allows the next invocation to automatically go full production
CMD node app && unset setup && echo "npm start" && npm start

# the default port for NodeBB is exposed outside the container
EXPOSE 4567
