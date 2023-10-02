docker stop $(docker ps-q)

if [$? != 0]
then
	exit 2
fi
docker rm -f $(docker ps -aq)
if [$? != 0]
then
        exit 3
fi

docker image  prune -a -f
if [$? != 0]
then
        exit 4
fi

docker volume prune -f
if [$? != 0]
then
        exit 5
fi

docker network prune -f
if [$? != 0]
then
        exit 6
fi
