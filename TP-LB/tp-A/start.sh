docker build -t im-nginx-lb -f Dockerfile .

mkdir -p shared1
mkdir -p shared2

echo "<h1>Hello 1</h1>" > shared1/index.html
echo "<h1>Hello 2</h1>" > shared2/index.html

docker run --rm -d \
	-p 81:80 \
	--name nginx1 \
	--mount type=bind,source=/home/user/tp-r504/TP-LB/tp-A/shared1,target=/usr/share/nginx/html \
	nginx

docker run --rm -d \
	-p 82:80 \
	--name nginx2 \
	--mount type=bind,source=/home/user/tp-r504/TP-LB/tp-A/shared2,target=/usr/share/nginx/html \
	nginx

docker run --rm -d \
	-p 83:80 \
	--name nginx3 \
	im-nginx-lb