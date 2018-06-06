# this python app should run cron as a cron job
# grabs the current arrivals for every stop on a source, route

# all it does is talk to the database. never talks to flask

#
# python stopwatcher.py -s nj -r 87
#


import argparse, sys
from lib.reportcard_helpers import *


def main():

    parser = argparse.ArgumentParser()
    parser.add_argument('-s', '--source', dest='source', required=True, default='nj', help='source name')
    parser.add_argument('-r', '--route', dest='route', required=True, help='route # ')
    args = parser.parse_args()

    fetch_arrivals(args.source, args.route)

if __name__ == "__main__":
    main()


# TO DO
# 1 rewrite to use mysql
# 2 deploy to webster.hopto.org