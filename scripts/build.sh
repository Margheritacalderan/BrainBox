#!/bin/bash

# Exit script if you try to use an uninitialized variable.
#set -o nounset

# Exit script if a statement returns a non-true return value.
#set -o errexit

# Use the error status of the first failure, rather than that of the last item in a pipeline.
#set -o pipefail

cd scripts || return

# if [ "$1" ]; then
#     MINIFY=true
#     echo "Minifying"
# else
#     MINIFY=''
#     echo "Not minifying"
# fi
# 
# if [ $MINIFY ]; then
#     min=".min"
# else
#     min=""
# fi
# 
# # Build atlasMaker.min.js
# #------------------------
# echo "Building atlasMaker"
# 
# # get dependencies
# echo "Downloading dependencies"
# if [ ! -f "pako.min.js" ]; then
# curl -O "https://cdnjs.cloudflare.com/ajax/libs/pako/1.0.6/pako.min.js"
# fi
# if [ ! -f "purify.min.js" ]; then
# curl -O "https://cdnjs.cloudflare.com/ajax/libs/dompurify/1.0.2/purify.min.js"
# fi
# if [ ! -f "struct.js" ]; then
# curl -O "https://cdn.rawgit.com/r03ert0/structjs/v0.0.1/struct.js"
# fi

# pack resources (html, css, svg)
node alltogethernow.js "../view/atlasMaker/" "AtlasMakerResources.js"
mv "AtlasMakerResources.js" "atlasMaker-resources.js"
# 
# tomin=('struct.js' '../view/atlasMaker/atlasMaker-draw.js' '../view/atlasMaker/atlasMaker-interaction.js' '../view/atlasMaker/atlasMaker-io.js' '../view/atlasMaker/atlasMaker-paint.js' '../view/atlasMaker/atlasMaker-ui.js' '../view/atlasMaker/atlasMaker-ws.js' 'atlasMaker-resources.js' '../view/atlasMaker/atlasMaker.js')
# tocon=('jquery-3.2.1' 'jquery-ui' 'pako' 'fast-json-patch' 'struct' 'purify' 'atlasMaker-draw' 'atlasMaker-interaction' 'atlasMaker-io' 'atlasMaker-paint' 'atlasMaker-ui' 'atlasMaker-ws' 'atlasMaker-resources' 'atlasMaker')
# 
# # minify
# echo "Minifying"
# for s in "${tomin[@]}"; do
#     tmp=$(basename "$s")
#     if [ $MINIFY ]; then
#         uglifyjs "$s" -m -o "${tmp%.js}.min.js"
#     else
#         cp "$s" "$tmp"
#     fi
# done
# 
# # concatenate
# echo "Concatenating"
# dest="../view/dist/atlasMaker${min}.js"
# if [ -f "$dest" ]; then
#     rm "$dest"
# fi
# for s in "${tocon[@]}"; do
#     if [ ! $MINIFY ] && [ -f "${s}.js" ]; then
#         cat "${s}.js" >> "$dest"
#     else
#         cat "${s}.min.js" >> "$dest"
#     fi
#     echo >> "$dest"
# done
# echo "Done"
# 
# # cleanup
# echo "Clean up"
# for s in "${tocon[@]}"; do
#     tmp=$(ls "$s".*)
#     rm "$tmp"
# done


# Build brainbox.min.js
#----------------------
# echo "Building brainbox"
# 
# # get dependencies
# if [ $MINIFY ]; then
#     cp ../view/dist/atlasMaker.min.js .
# else
#     cp ../view/dist/atlasMaker.js .
# fi
# 
# tomin=('../view/brainbox/twoWayBinding.js' '../view/brainbox/brainbox.js')
# tocon=('atlasMaker' 'twoWayBinding' 'brainbox')
# 
# # minify
# echo "Minifying"
# for s in "${tomin[@]}"; do
#     tmp=$(basename "$s")
#     if [ $MINIFY ]; then
#         uglifyjs "$s" -m -o "${tmp%.js}.min.js"
#     else
#         cp "$s" "$tmp"
#     fi
# done
# 
# # concatenate
# echo "Concatenating"
# dest=../view/dist/brainbox${min}.js
# if [ -f $dest ]; then
#     rm $dest
# fi
# for s in "${tocon[@]}"; do
#     if [ ! $MINIFY ] && [ -f "${s}.js" ]; then
#         cat "${s}.js" >> "$dest"
#     else
#         cat "${s}.min.js" >> $dest
#     fi
#     echo >> "$dest"
# done
# echo "Done"
# 
# # cleanup
# echo "Clean up"
# for s in "${tocon[@]}"; do
#     tmp=$(ls "$s".*)
#     rm "$tmp"
# done
# 
# 
# # Copy brainbox.min.js to /public/lib
# #------------------------------------
# cp "../view/dist/brainbox${min}.js" ../public/lib/

cd ..
