FROM node:18

# Set working directory
WORKDIR /app

# Install required system dependencies (fixed)
RUN apt-get update && \
    apt-get install -y python3 make g++ && \
    rm -rf /var/lib/apt/lists/*

# Copy only package files first (better caching)
COPY package*.json ./

# Install dependencies
RUN npm install --legacy-peer-deps

# Copy rest of the app
COPY . .

# Expose app port
EXPOSE 8080

# Start the app
CMD ["npm", "start"]
