FROM mysql:latest
ENV MYSQL_ROOT_PASSWORD 1234
EXPOSE 3306

// Build the image
// docker build -t mysql-image .

// Run the container
// docker run -d --name mysql-container -p 6603:3306 mysql-image