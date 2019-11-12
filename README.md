Step 1:
Clone the repository:
git clone https://github.com/overallcoma/Hak5-C2.git

Step 2:
Build the Container:
cd Hak5-C2
docker build -t hak5c2 .

Step 3:
docker run -d \
--name Hak5-C2 \
-p 2022:2022 \

(extended version I am using with nginx proxy and LetsEncrypt Companion)

docker run -d \
--name Hak5-C2 \
-p 2022:2022 \
-e VIRTUAL_HOST=my.dns.name \
-e LETSENCRYPT_HOST=my.dns.name \
-e LETSENCRYPT_EMAIL=myemail@address.com \
-e VIRTUAL_PORT=8080 \
hak5c2

Step 4:
Get the logs to collect the setup token:
docker logs Hak5-C2

Step 5:
Go to URL you designated in step 3.
Enter your setup token
Enter your license key
Create username and password (and password verification)