import uvicorn
from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def hello_world():
    return "Hello_world Coldpaper!"


@app.get("/health")
def test2():
    return {"health" : "ok"}


if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=5000)