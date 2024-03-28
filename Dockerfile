FROM dunglas/frankenphp

RUN install-php-extensions \
    pcntl
    # Add other PHP extensions here...

# Install Git
RUN apt-get update && apt-get install -y git
# Install wrk
RUN apt-get install -y wrk

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENTRYPOINT ["php", "artisan", "octane:frankenphp"]