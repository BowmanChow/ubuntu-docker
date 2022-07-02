#!/bin/bash

file=/etc/apt/sources.list
version="$1"
address=mirrors.tuna.tsinghua.edu.cn
branches=("" "-updates" "-backports" "-security")
options="main restricted universe multiverse"

echo_source_list() {
    for b in "${branches[@]}"; do
        echo "deb http://${address}/ubuntu/ ${version}$b ${options}" >> ${file}
        echo "# deb-src http://${address}/ubuntu/ ${version}$b ${options}" >> ${file}
    done
}

echo "" > ${file}
echo_source_list