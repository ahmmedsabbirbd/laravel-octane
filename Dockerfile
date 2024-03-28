FROM dunglas/frankenphp
 
RUN install-php-extensions \
    pcntl
    # Add other PHP extensions here...
 
 # Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY . /app 

# Expose ports
EXPOSE 80 443