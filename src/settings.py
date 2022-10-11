import os

from pydantic import BaseSettings


class Settings(BaseSettings):
    PROJECT_NAME: str

    class Config:
        env_file = os.path.join(os.path.dirname(__file__), ".env")
        env_file_encoding = "utf-8"
