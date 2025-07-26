
# Terraform-модуль RDS/Aurora

Цей модуль створює або звичайну RDS-базу (PostgreSQL/MySQL), або Aurora-кластер залежно від прапора `use_aurora`.  
Модуль орієнтований на продакшн-середовище, з мінімальною кількістю змінних для повторного використання.

---
## Можливості
- `use_aurora = true` → створюється **Aurora Cluster** з writer-інстансом.
- `use_aurora = false` → створюється **звичайна RDS instance**.
- Автоматично створюються:
  - **DB Subnet Group**;
  - **Security Group**;
  - **Parameter Group** із базовими параметрами (`max_connections`, `log_statement`, `work_mem`).

---
## Приклад використання
```hcl
module "rds" {
  source          = "./modules/rds"
  use_aurora      = true
  db_name         = "mydb"
  username        = "admin"
  password        = "securepassword123"
  instance_class  = "db.t3.medium"
  engine          = "aurora-postgresql"
  engine_version  = "13.6"
  multi_az        = true
  vpc_id          = "vpc-1234567890"
  subnets         = ["subnet-aaa111", "subnet-bbb222"]
}
```

---
## Змінні модуля

| Змінна            | Тип       | Опис                                      | За замовчуванням |
|-------------------|----------|-------------------------------------------|------------------|
| `use_aurora`      | bool     | Використовувати Aurora (true/false)       | false            |
| `db_name`         | string   | Назва бази даних                          | ""               |
| `username`        | string   | Ім'я користувача                          | ""               |
| `password`        | string   | Пароль користувача                        | ""               |
| `instance_class`  | string   | Клас інстансу                             | "db.t3.micro"    |
| `engine`          | string   | Тип СУБД (postgres, mysql, aurora-*)      | "postgres"       |
| `engine_version`  | string   | Версія СУБД                               | ""               |
| `multi_az`        | bool     | Використання Multi-AZ                     | false            |
| `vpc_id`          | string   | ID VPC                                    | ""               |
| `subnets`         | list     | Список підмереж для бази                  | []               |

---
## Outputs
- `rds_endpoint` — кінцева точка доступу до бази;
- `rds_arn` — ARN ресурсу;
- `security_group_id` — ID security group.

---
## Як змінити тип БД
- **Тип БД**: змінюється параметром `engine` (`postgres`, `mysql`, `aurora-postgresql`, `aurora-mysql`).
- **Версія БД**: змінюється параметром `engine_version`.
- **Клас інстансу**: змінюється параметром `instance_class`.
- **Multi-AZ**: встановити `multi_az = true`.

---
