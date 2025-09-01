!#/bin/bash
subnet=$1

if [ -z "$subnet" ]; then
    echo "Usage: $0 <subnetwork>"
    exit 1
fi
