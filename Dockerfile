# Stage 1: build the site with Node
FROM node:22-alpine AS builder

# Set the working folder inside the container
WORKDIR /app

# Copy package files first so the install step is cached
COPY package*.json ./

# Install exact dependencies from package-lock.json
RUN npm ci

# Copy the website source and styles
COPY src/ ./src/
COPY styles/ ./styles/

# Build all pages into /app/dist
RUN npm run build

# Stage 2: serve the built files with Nginx
FROM nginx:1.27-alpine

# Describe the image
LABEL description="Readers' Haven static website served by Nginx"

# Copy only the built site from stage 1
COPY --from=builder /app/dist /usr/share/nginx/html

# Nginx listens on port 80
EXPOSE 80

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]