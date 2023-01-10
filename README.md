# Multi-stage-Dockerfile
Dockerfile using Multi-Stage build but with developer and production stage

In this Dockerfile, the first stage uses the Node.js 12 base image and installs the app’s dependencies. It then builds the app and copies the build artifacts to the second and third stages.

The second stage uses the Node.js 12 base image and copies the build artifacts from the first stage into the container. It then installs the development dependencies and runs the npm run dev command to start the app in development mode.

The third stage also uses the Node.js 12 base image, and copies the build artifacts from the first stage into the container. It then installs the production dependencies and runs the npm start command to start the app in production mode.
