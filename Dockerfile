# specify base image
FROM node:14-alpine

# Change working directory 
WORKDIR /usr/app

# Copy package file
COPY ./package.json .

# install dependencies
RUN npm install

# Copy the rest of the package if not available
COPY . .

# defult run command
CMD ["npm", "start"]
