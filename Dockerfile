# this is my base image
FROM alpine:3.5

# Install python and pip
RUN apk add --update py2-pip

# install Python modules needed by the Python app
COPY requirements.txt /usr/local/src/app/
RUN pip install --no-cache-dir -r /usr/local/src/app/requirements.txt

# copy files required for the app to run
COPY app.py /usr/local/src/app/
COPY templates/index.html /usr/local/src/app/templates/

# tell the port number the container should expose
EXPOSE 5000

# run the application
CMD ["python", "/usr/local/src/app/app.py"]
