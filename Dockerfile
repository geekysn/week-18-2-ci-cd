FROM node:20.12.0-alpine3.19

COPY package.json package-lock.json turbo.json tsconfig.json ./
COPY apps ./apps
COPY packages ./packages

#Install Dependecies
RUN npm install
# Can you add a script to global package.json that does this?
RUN npm run db:generate

RUN npm run build

CMD ["npm", "run", "start-user-app"]