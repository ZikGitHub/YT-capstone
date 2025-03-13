FROM python:3.10-slim

WORKDIR /app

COPY flask_app/ /app/
COPY models/vectorizer.pkl /app/models/vectorizer.pkl

RUN apt-get update && apt-get install -y --no-install-recommends gettext-base
RUN pip install -r requirements.txt
RUN python -m nltk.downloader stopwords wordnet

EXPOSE 5000

#local
CMD ["python", "app.py"]  

# #Prod
# CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--timeout", "120", "app:app"]