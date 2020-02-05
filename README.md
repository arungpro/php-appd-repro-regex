# php-appd-repro-regex
php agent regex repro

From Project path

        docker build -t regex  .
        
        docker run -p 8888:80 regex

## Drive Load by
        curl $(cat urls.txt)
