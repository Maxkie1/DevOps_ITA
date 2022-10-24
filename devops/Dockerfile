FROM python:3.8-slim

LABEL maintainer = "Max Kiefer, Gregor Boschmann"

EXPOSE 5000

ENV PYTHONDONTWRITEBYTECODE=1

COPY requirements.txt .

RUN python -m pip install -r requirements.txt

WORKDIR /app
COPY . /app

CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]