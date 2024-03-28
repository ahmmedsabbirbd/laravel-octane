FROM dunglas/frankenphp
 
RUN install-php-extensions \
    pcntl
    # Add other PHP extensions here...
 
COPY . /app 

# Expose ports
EXPOSE 80 443