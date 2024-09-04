FROM dunglas/frankenphp

# Install necessary PHP extensions and other tools
RUN install-php-extensions \
    pcntl \
    pdo_mysql \
    zip \
 && apt-get update \
 && apt-get install -y git wrk unzip \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Command to start your application
ENTRYPOINT ["php", "artisan", "octane:frankenphp"]
