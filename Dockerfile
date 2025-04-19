FROM        python:3.6
RUN         mkdir /app
WORKDIR     /app
COPY        payment.ini payment.py rabbitmq.py requirements.txt /app/
RUN         pip3.6 install -r requirements.txt
ENV         CART_HOST="cart"
ENV         CART_PORT="80"
ENV         USER_HOST="user"
ENV         USER_PORT="80"
ENV         AMQP_HOST="rabbitmq-prod.rsdevops.in"
ENV         AMQP_USER="roboshop"
ENV         AMQP_PASS="roboshop123"
CMD         [ "bash", "uwsgi --ini /app/payment.ini" ]