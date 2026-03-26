FROM node:18

WORKDIR /app

# Install build tools (important for many npm packages)
RUN apt-get update && apt-get install -y python3 make g++

# Copy dependency files
COPY package*.json ./

# Install dependencies (fixed version)
RUN npm install --legacy-peer-deps

# Copy rest of app
COPY . .

EXPOSE 8080

CMD ["npm", "start"]
