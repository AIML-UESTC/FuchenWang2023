FROM python:3.8

COPY . /app

WORKDIR /app

#Install necessary packages from requirements1.txt with no cache dir allowing for installation on machine with very little memory on board
RUN pip install --upgrade pip
RUN pip --no-cache-dir install -r requirements.txt

#Exposing the default streamlit port
EXPOSE 8505

#Running the streamlit app
HEALTHCHECK CMD curl --fail http://localhost:8505/_stcore/health 
ENTRYPOINT ["streamlit", "run", "src/Project_Eagle_Vision.py", "--server.port=8505", "--server.address=0.0.0.0"] 
