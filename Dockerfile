# Stage 1: Build the app
FROM node:12 as builder

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# Stage 2: Run the app in development
FROM node:12 as dev

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/build .

RUN npm install --only=development

EXPOSE 8080
CMD [ "npm", "run", "dev" ]

# Stage 3: Run the app in production
FROM node:12 as prod

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/build .

RUN npm install --only=production

EXPOSE 8080
CMD [ "npm", "start" ]
