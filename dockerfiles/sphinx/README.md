Build image with `docker buildx build --platform linux/amd64 . -t NAME_FOR_IMAGE`.

Run image with ``docker run --platform linux/amd64 --rm -t -i -v `pwd`:/home/sphinx  NAME_FOR_IMAGE``.
