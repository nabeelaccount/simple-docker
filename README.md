# Simple web application

This is a simple example on dpeloying a web application using docker and nodeJS.

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