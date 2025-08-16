#!/bin/bash
# Yoxlayırıq ki, domen argument olaraq verilib
if [ -z "$1" ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

# dig ilə yalnız cavabları göstəririk
dig +nocmd "$1" any +noall +answer
