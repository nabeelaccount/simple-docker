# Simple web application

This is a simple example on dpeloying a web application using docker and nodeJS.

## How to run the application locally
prerequist:
 ->  Running docker service

1. Please build the docker image:
- docker-username: Your Docker account username
- application-name: A name you would like to give to the application
`docker build -t <docker-username>/<application-name>`

2. Run the application locally using the following command:
`docker run -p 8080:8080 <docker-username>/<application-name>`

3. Visit localhost:8080 on your web browser. You should see the following message
**You're amazing**
because you are 😃

## Dockerfile
```
# specify base image
FROM node:14-alpine

# Change working directory 
## so you don't conflict with root directory
WORKDIR /usr/app

# Copy constantly changing file for caching
COPY ./package.json .

# install dependencies
RUN npm install

# Copy the rest of the package if not available
COPY . .

# defult run command
CMD ["npm", "start"]
```

- node:14-alpine is set as the base image for the node applcation.
- The working directory, which is where all following processes will be run is set to /usr/app. You may choose any reasonable directory including /app
- The package.json file is copied over and npm install is run on the file to install package dependencies.
- The rest of the node content is copied across before starting npm via the command `npm install`