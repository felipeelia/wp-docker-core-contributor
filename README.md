# WordPress Docker For Core Contributors

Welcome!

If you want to contribute to WP core, first give a look at the [handbooks](https://make.wordpress.org/core/handbook/contribute/).

With this you'll have:

1. **apache**, **svn** and **wp-cli** available at **c_wpsvn** container
1. **nodejs** and **grunt** (with `watch` running) in **c\_wpsvn\_nodejs** container

This is a work in progress, but it's pretty much usable.

## Initial Requirements

* Install [Docker](https://docs.docker.com/engine/installation/)

* Install [Docker-compose](https://docs.docker.com/compose/install/)

## Starting

1. Fork this repository, clone it or just download a zip.
1. Go to directory
1. Start docker-compose with `docker-compose up` or with `docker-compose up -d` for detached mode. At the first time it can take a while, because docker will build two images, checkout svn repo and set everything up. Be patient and enjoy the log craziness.
1. After building process you'll have a subdirectory called `wordpress-svn` with WP code. DB credentials are automatically inserted in `src/wp-config.php`, so you don't need to worry about it.
1. Access `http://localhost/src`
1. To shut it down you can press `Ctrl+C` (if you've started it with `docker-compose up`) and/or run `docker-compose down`

## Using it

General steps for contributing to core are:

1. Pick a ticket at [WordPress Trac](https://core.trac.wordpress.org/)
1. Make a patch that solves the problem
1. Upload it at ticket's attachments section

### Updating code, i.e., getting updates from svn server

**Always** run this before start working:
`docker exec c_wpsvn svn up`

wpsvn image will run this update everytime a container is created, but you can end up with an older version of WP files if
you keep things running for some time without a refresh.

### Getting and applying patches from a ticket

Run `docker exec -it c_wpsvn_nodejs grunt patch:TICKET_NUMBER`

### Using wp-cli

Run `docker exec c_wpsvn wp --version`

### Generating a patch

Run `docker exec c_wpsvn svn diff > TICKET_NUMBER.diff`

## Troubleshooting

If you get stuck with a `ERROR: for c_wpsvn_db  Cannot create container for service db: Conflict. The container name "/c_wpsvn_db" is already in use by container` try running `docker rm -f $(docker ps -a -q)`

## Feedbacks

Any feedback is welcome! Feel free to open an issue, send a PR or contact me at wp community slack.
