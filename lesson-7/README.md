# 🎯 Django on EKS via Helm

Цей проєкт демонструє повне розгортання Django-додатку на Amazon EKS із використанням Helm, ECR, автоскейлінгу (HPA) та LoadBalancer-сервісу.

---

## 📦 Архітектура

- **ECR** – зберігання Docker-образу `django-app-v2`
- **Helm-чарт** – розгортання Deployment, Service, ConfigMap, HPA
- **EKS** – Kubernetes кластер для продакшн-деплою
- **LoadBalancer** – зовнішній доступ через ELB

---

## 🛠️ Основні кроки

### 1. Побудова Docker-образу
```bash
docker build -t django-app-v2:latest .
```

### 2. Публікація до ECR
```bash
docker tag django-app-v2:latest 658428669098.dkr.ecr.us-east-1.amazonaws.com/django-app-v2:latest
docker push 658428669098.dkr.ecr.us-east-1.amazonaws.com/django-app-v2:latest
```

---

### 3. Розгортання Helm-чарту

```bash
helm upgrade django-app lesson-7/charts/django-app --values lesson-7/charts/django-app/values.yaml
kubectl rollout restart deployment django-app-django-app
```

---

## ⚙️ Структура Helm-чарту

Чарт знаходиться у `lesson-7/charts/django-app` і включає:
- `Deployment`
- `Service` типу `LoadBalancer`
- `HorizontalPodAutoscaler` (HPA)
- `ConfigMap` (для збереження команд запуску)

---

## 🌐 Перевірка

```bash
kubectl get pods
kubectl get svc
kubectl logs <pod-name>
```

Перейти за EXTERNAL-IP, щоб перевірити, що додаток працює:  
`✅ Django on Kubernetes is working!`

---

## 💡 Примітки

- Gunicorn запускає Django у контейнері
- Postgres підключено через RDS
- Перемінні оточення передаються через Helm (`values.yaml`)