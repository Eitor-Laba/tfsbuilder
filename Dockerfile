FROM ubuntu:focal

ENV TZ=America/Argentina/Buenos_Aires

RUN apt-get update
RUN apt-get install --no-install-recommends -y tzdata
RUN apt-get install --no-install-recommends -y \
  autoconf automake pkg-config build-essential cmake \
  liblua5.1-0-dev libsqlite3-dev libmysqlclient-dev libxml2-dev libgmp3-dev \
  libboost-filesystem-dev libboost-regex-dev libboost-thread-dev

WORKDIR /home/3777-master

COPY . .

# Limpa builds anteriores
RUN rm -rf build

# Gera os arquivos do CMake
RUN cmake -S . -B build

# Compila o projeto
RUN cmake --build build -j$(nproc)
