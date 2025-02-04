#!/bin/bash
file="${1/data\//\/var\/lib\/mysql\/}"
echo "# Executing: mysqlbinlog --verbose $file"
docker exec -i mbt mysqlbinlog --verbose "$file"
