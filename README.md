# docker-mailer
Simple dockerized emailer

eg:

```sh
docker run -e EMAIL='fromme@gmail.com' -e AUTHPASS='fromme_password' -e MESSAGE='test' -e TO='tomail@gmail.com' dockerinpractice/docker-mailer
```

