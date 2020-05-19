FROM node:12.16.3-alpine as base

LABEL "com.github.actions.name"="Vuepress deploy"
LABEL "com.github.actions.description"="A GitHub Action to build and deploy Vuepress sites to GitHub Pages"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="gray-dark"

LABEL "repository"="https://github.com/jenkey2011/vuepress-deploy"
LABEL "homepage"="https://github.com/jenkey2011/vuepress-deploy"
LABEL "maintainer"="Jenkey2011 <jenkey2011@163.com>"

RUN apk add --no-cache git jq

run apk --no-cache add --virtual native-deps \
  g++ gcc libgcc libstdc++ linux-headers make python && \
  npm install --quiet node-gyp -g &&\
  npm install --quiet && \
  apk del native-deps

RUN npm uninstall -g node-sass && npm install -g node-sass --sass-binary-name=linux-x64-57

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
