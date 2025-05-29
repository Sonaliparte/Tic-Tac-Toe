# Use Node.js base image
FROM node:18

# Set working directory inside container
WORKDIR /app

# Copy backend code into container
COPY backend/ ./backend/
COPY package*.json ./

# Install dependencies
RUN npm install

# Expose port if needed (adjust if different)
EXPOSE 3000

# Start your app (adjust based on how you start it)
CMD ["node", "backend/server.js"]
