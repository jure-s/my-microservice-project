FROM python:3.11-slim

# Встановлення системних залежностей
RUN apt-get update && \
    apt-get install -y gcc libpq-dev && \
    pip install --upgrade pip

# Робоча директорія
WORKDIR /app

# Копіюємо requirements.txt та встановлюємо залежності
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо весь проєкт
COPY . .

# Вказуємо команду запуску
CMD ["gunicorn", "myproject.wsgi:application", "--bind", "0.0.0.0:8000"]
