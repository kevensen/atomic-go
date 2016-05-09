#!/bin/bash

export GOPATH=~/go

# docker build --build-arg user=$(id -u)  -t atomic-go .

if [ ! -d ~/go ]; then
	mkdir ~/go
fi

sudo chcon -Rt svirt_sandbox_file_t ~/go

if [ ! -d ~/bin ]; then
	mkdir ~/bin
fi

cat << EOF > ~/bin/go
#!/bin/bash
echo "\$@"
docker run --rm -u $(id -u) -v ~/go:/opt/app-root/go atomic-go "\$@"
EOF

chmod u+x ~/bin/go
