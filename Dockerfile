# Використовуємо офіційний образ Python 3.11
FROM python:3.11-slim

# Встановлюємо робочу директорію всередині контейнера
WORKDIR /app

# Копіюємо файл залежностей до контейнера
COPY requirements.txt .

# Встановлюємо залежності
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо всі файли проєкту до контейнера
COPY . .

# Відкриваємо порт 8000 (Django за замовчуванням)
EXPOSE 8000

# Команда запуску Django-сервера (можеш змінити на gunicorn у продакшн)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
