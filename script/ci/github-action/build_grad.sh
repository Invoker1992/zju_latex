#! /bin/bash

this_path="$( cd "$(dirname "$0")" ; pwd -P )"
project_path=$this_path/../../../

source $this_path/build_zjuthesis.sh

echo "CD $project_path"
cd $project_path

mkdir -p dist

degree="graduate"
types=("design" "thesis")

build_zjuthesis $degree "general" "thesis" "final" "true" "doctor" "chinese"

for type in ${types[@]}; do
    build_zjuthesis $degree "general" $type "final" "false" "doctor" "chinese"
done

build_zjuthesis $degree "cs"      "thesis" "final" "false" "master" "chinese"
build_zjuthesis $degree "general" "thesis" "final" "false" "doctor" "english"
