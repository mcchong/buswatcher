# fetches the NJT arrival predictions for all stops on a given source, route and dumps it to sqlite database
# usage python stopwatcher.py -s nj -r 87


import lib.BusAPI as BusAPI
import lib.StopsDB as StopsDB

import argparse, datetime


def fetch_arrivals(source, route):

    (conn, db) = db_setup(route)

    routedata = BusAPI.parse_xml_getRoutePoints(BusAPI.get_xml_data(source, 'routes', route=route))
    stoplist = []

    for rt in routedata:
        for path in rt.paths:
            for p in path.points:
                if p.__class__.__name__ == 'Stop':
                    stoplist.append(p.identity)

    for s in stoplist:
        arrivals = BusAPI.parse_xml_getStopPredictions(
            BusAPI.get_xml_data('nj', 'stop_predictions', stop=s, route=route))
        now = datetime.datetime.now()
        db.insert_positions(arrivals, now)

    return

def db_setup(route):

    db = StopsDB.MySQL('buses', 'buswatcher', 'njtransit','127.0.0.1', route)
    conn = db.conn
    return conn, db

def main():

    parser = argparse.ArgumentParser()
    parser.add_argument('-s', '--source', dest='source', required=True, default='nj', help='source name')
    parser.add_argument('-r', '--route', dest='route', required=True, help='route # ')
    args = parser.parse_args()

    fetch_arrivals(args.source, args.route)


if __name__ == "__main__":
    main()
