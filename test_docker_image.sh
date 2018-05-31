base=`pwd`
base_dockerfile="$base/Dockerfile"
baker="$base/images"

echo $1
date
if [ -d "$baker/$1" ]; then
    echo "Repository $1 already exists, remove it now."
    rm -rf "$baker/$1"
fi

echo "clone $1's repository into $baker/$1"
if git clone "https://github.com/$1/ball_in_box.git" "$baker/$1"; then
    echo "clone good"
else
    echo "clone failed"; exit 1
fi

echo "copy Dockerfile into local directory."
cp "$base_dockerfile" "$baker/$1/"
cp "$base/ball_in_box/area_sum.py" "$baker/$1/ball_in_box/" 

echo "build docker image"
if docker build -t "pipehappy/${1,,}" -f "$base_dockerfile" "$baker/$1" --build-arg ACCOUNT=$1 --quiet; then
    echo "docker build good"
else
    echo "docker build bad"; exit 1
fi

if timeout -k 1 300 docker run "pipehappy/${1,,}"; then
    echo "docker run good"
else
    echo "docker run bad"; exit 1
fi

date
echo "evaluate ends for $1"
