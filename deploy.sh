#!/usr/bin/env bash

scp -i ~/.ssh/epimorphism.pem html/* ubuntu@52.40.74.208:/home/ubuntu/www/epimorphism
scp -i ~/.ssh/epimorphism.pem -r html/lib* ubuntu@52.40.74.208:/home/ubuntu/www/epimorphism
#scp -i ~/.ssh/epimorphism.pem -r html/images* ubuntu@52.40.74.208:/home/ubuntu/www/epimorphism
#scp -i ~/.ssh/epimorphism.pem -r html/textures* ubuntu@52.40.74.208:/home/ubuntu/www/epimorphism
