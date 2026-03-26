FROM node:18-alpine

WORKDIR /app

# Install build tools (Alpine version)
RUN apk add --no-cache python3 make g++

# Copy dependency files
COPY package*.json ./

# Install dependencies
RUN npm install --legacy-peer-deps

# Copy rest of app
COPY . .

EXPOSE 8080

CMD ["npm", "start"]
