# Stage 1: Install production dependencies only
FROM node:20-alpine AS dependencies
WORKDIR /app
COPY src/package.json src/package-lock.json ./
RUN npm ci --omit=dev

# Stage 2: Minimal runtime image
FROM node:20-alpine AS runner
WORKDIR /app

ENV NODE_ENV=production \
    PORT=3000

# Use existing unprivileged user 'node' provided by node alpine image
USER node

# Copy production dependencies and application code with proper ownership
COPY --chown=node:node --from=dependencies /app/node_modules ./node_modules
COPY --chown=node:node src/package.json ./
COPY --chown=node:node src/index.js ./
COPY --chown=node:node src/server ./server
COPY --chown=node:node src/routes ./routes

EXPOSE 3000

CMD ["node", "index.js"]
