FROM docker.io/library/node:16-alpine

# build the app
WORKDIR /app
COPY package.json yarn.lock ./
ENV NODE_ENV="production"
RUN yarn
COPY . .

# run as the "node" user
USER 1000

# expose the HTTP service under the unprivileged (>1024) http-alt port
EXPOSE 8080

CMD ["yarn", "run", "start"]