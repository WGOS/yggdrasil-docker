FROM golang:alpine3.19 as build

ARG YGG_VER
WORKDIR /build

RUN apk add --no-cache git
RUN git clone https://github.com/yggdrasil-network/yggdrasil-go . \
    && git checkout tags/v$YGG_VER \
    && ./build

FROM alpine:3.19

ENV PATH="$PATH:/opt/yggdrasil"
WORKDIR /opt/yggdrasil

COPY --chmod=755 --from=build /build/yggdrasil /opt/yggdrasil
COPY --chmod=755 --from=build /build/yggdrasilctl /opt/yggdrasil

CMD [ "yggdrasil", "-useconffile", "/etc/yggdrasil/yggdrasil.conf" ]