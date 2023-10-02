FROM python:3.9

RUN pip install requests

COPY src/ /var/www/html/

WORKDIR /var/www/html

CMD ["python", "getLocationsData.py"]