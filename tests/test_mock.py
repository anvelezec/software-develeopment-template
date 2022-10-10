from src.settings import Settings


def test_init():
    assert isinstance(Settings().PROJECT_NAME, str)
