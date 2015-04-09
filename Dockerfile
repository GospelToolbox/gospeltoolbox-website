FROM iojs

COPY app.js /site/app.js
COPY config.js /site/config.js

COPY package.json /site/package.json
COPY .bowerrc /site/.bowerrc
COPY bower.json /site/bower.json

COPY public/ /site/public
COPY views/ /site/views

RUN (CD /site && npm install && npm install bower -g && bower install)

WORKDIR /site

EXPOSE 80

CMD ["iojs", "app"]