FROM php:8.2-apache

# changing the default Apache port to 8081
RUN sed -i 's/Listen 80/Listen 8081/' /etc/apache2/ports.conf && \
    sed -i 's/:80/:8081/' /etc/apache2/sites-available/000-default.conf

# Enable required PHP extensions
RUN docker-php-ext-install mysqli

# Set working directory
WORKDIR /var/www/html

# Copy project files
COPY . .

# Expose HTTP port
EXPOSE 8081
