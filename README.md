# AdonisJs Docker image

This is a docker image for AdonisJs

## How to use

pull the docker image 

    docker pull stephenafamo/adonisjs:1.0.0

Run the docker image and create your container

    docker run --name adonisjs adonisjs


### Volumes and working directory

The working directory inside the container is `/var/www` so to keep your application data, you can mount a directory onto that volume

    docker run --name adonisjs -v /path/to/app:/var/www stephenafamo/adonisjs:1.0.0

You can change the working directory by passing the `-w` flag, if you do, please make sure to update the mounted volume to preserve data. For example

    docker run --name adonisjs -w /usr/app -v /path/to/app:/usr/app stephenafamo/adonisjs:1.0.0

### Custom application type

If the working directory is empty, the image will create a new adonis application in that directory.
To modify the type of application add flags to the `adonisFlags` environmental variable.

    docker run --name adonisjs -v /path/to/app:/var/www -e "adonisFlags=--slim --yarn" stephenafamo/adonisjs:1.0.0

To see possible options, visit the [documentation](http://dev.adonisjs.com/docs/4.0/installation#_customizing_new_command)

### Server type

By default the server started is the development server, which will watch for changes to files. However, if the `NODE_ENV` in the `.env` file is set to `production` it will start the production server. **This does not watch for changes to files.**

## Viewing your application in your browser

This image will start the adonis server using the `HOST` and `PORT` specified in your `.env` file.

#### HOST
Because of the way docker works. If you already have an Adonis application and you want to run it in a docker container, **you'll have to chage the `HOST` in your `.env` file to `0.0.0.0`**.

If you used this image to create the application, it will do this for you.

#### PORT
The default port of adonis applications is `3333`.
If the application was created by this imaged, it is changed to `80`

To be able to visit your application, map a port on your host machine to the application port defined in the `.env` file.

    docker run --name adonisjs -v /path/to/app:/var/www -p 1234:80 stephenafamo/adonisjs:1.0.0

Then you can visit the application on `http://0.0.0.0:1234`

## Self-Promotion

If you like this project, please star the repository on [GitHub](https://github.com/stephenafamo/adonisjs-docker) You might also consider visiting my [blog](https://stephenafamo.com/blog) and following me on [Twitter](https://twitter.com/stephenafamo) and [Github](https://github.com/stephenafamo).