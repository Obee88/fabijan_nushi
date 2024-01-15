# Use the official Nginx base image
FROM nginx

# Copy your web page files to the container
COPY ./webpage /usr/share/nginx/html

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
