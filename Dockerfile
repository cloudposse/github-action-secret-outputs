FROM public.ecr.aws/docker/library/alpine:3.20.3

RUN apk add --no-cache gnupg bash

ENTRYPOINT ["/bin/bash"]

COPY entrypoint.sh /usr/local/bin/entrypoint

CMD [ "-c", "entrypoint" ]
