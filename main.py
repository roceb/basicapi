import logging

from fastapi import FastAPI, Request

app = FastAPI()
logging.basicConfig(
    level=logging.INFO,
    filemode="a",
    format="%(asctime)s:%(msecs)d %(levelname)s %(message)s",
    datefmt="%H:%M:%S",
)
logger = logging.getLogger(__name__)


@app.get("/")
def healthcheck(request: Request):
    logger.info(f"client: {request.client.host}")
    return {"status": 200}
