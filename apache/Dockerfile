FROM httpd:2.4

# Add `www-data` to group `appuser`
RUN addgroup --gid 1000 appuser
RUN adduser --uid 1000 --gid 1000 --disabled-password appuser
RUN adduser www-data appuser

EXPOSE 80

CMD ["httpd-foreground"]
