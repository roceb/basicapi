# Use a Python image with uv pre-installed
#FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim
FROM ghcr.io/astral-sh/uv:python3.12-alpine

# Install the project into `/app`
WORKDIR /app

# Enable bytecode compilation
ENV UV_COMPILE_BYTECODE=1

# Copy from the cache instead of linking since it's a mounted volume
ENV UV_LINK_MODE=copy

ENV PATH="/app/.venv/bin:$PATH"
# Install the project's dependencies using the lockfile and settings
RUN --mount=type=cache,target=/root/.cache/uv \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync --frozen --no-install-project --no-dev

ADD . /app
# Place executables in the environment at the front of the path

RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --frozen --no-dev
EXPOSE 8000
CMD ["fastapi", "dev", "--host", "0.0.0.0"]
