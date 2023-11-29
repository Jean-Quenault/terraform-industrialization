#!/bin/bash
aws ecr get-login-password --region ${region} | docker login --username AWS --password-stdin ${ecr_front_url}
docker run -d -p ${front_port}:80 ${ecr_front_url}/${front_image}:${front_image_tag}
