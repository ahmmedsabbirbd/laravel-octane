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


WORKDIR /app

# Copy Laravel files
COPY artisan ./
COPY composer.json composer.lock ./
COPY .env.example .env
COPY app/ ./app/
COPY bootstrap/ ./bootstrap/
COPY config/ ./config/
COPY database/ ./database/
COPY public/ ./public/
COPY resources/ ./resources/
COPY routes/ ./routes/
COPY storage/ ./storage/
COPY tests/ ./tests/

# Install Composer dependencies
RUN composer install --no-dev

# Copy the rest of the application
COPY . .


ENTRYPOINT ["php", "artisan", "octane:frankenphp"]