#!/bin/bash


pgadmin_bin=/home/zetdg/miniconda3/envs/pgadmin4/bin
pgadmin_lib=/home/zetdg/miniconda3/envs/pgadmin4/lib/python2.7/site-packages/pgadmin4

source $pgadmin_bin/activate pgadmin4
$pgadmin_bin/python $pgadmin_lib/pgAdmin4.py
