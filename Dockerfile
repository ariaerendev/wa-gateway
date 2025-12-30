FROM node:20-alpine AS runtime

WORKDIR /app
COPY . /app

RUN ls -la /app
RUN npm install

ENV NODE_ENV=production
EXPOSE 5001

CMD ["npm", "start"]

HEALTHCHECK --interval=10s --timeout=5s --retries=3 \
  CMD wget -qO- http://localhost:3000/sessions || exit 1
