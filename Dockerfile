FROM oven/bun

WORKDIR /app

COPY package.json .
COPY bun.lockb .

RUN bun install --production

COPY src src
COPY tsconfig.json .
# COPY public public

ARG PORT
ENV PORT=$PORT
ENV NODE_ENV production
CMD ["bun", "src/index.ts"]

EXPOSE $PORT
