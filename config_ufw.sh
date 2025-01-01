#!/bin/bash

# Actualización e instalación de UFW
sudo apt update
sudo apt install ufw -y

# Reiniciar configuración de UFW
sudo ufw reset

# Configuración de políticas predeterminadas
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Permitir tráfico desde la red interna (ajustar según tu red)
sudo ufw allow from 192.168.1.0/24
sudo ufw allow from 192.168.0.0/24

# Permitir puertos específicos
sudo ufw allow 80/tcp        # HTTP
sudo ufw allow 443/tcp       # HTTPS
sudo ufw allow 3000/tcp      # Aplicaciones específicas
sudo ufw allow 9000/tcp      # Conteiners
sudo ufw allow 8080/tcp      # Otro puerto de aplicación
sudo ufw allow samba         # Samba
sudo ufw allow 5900/tcp      # VNC
sudo ufw allow 3306/tcp      # MySQL
sudo ufw allow 5432/tcp      # PostgreSQL
sudo ufw allow 3389/tcp      # RDP
sudo ufw allow 1433/tcp      # SQL Server
sudo ufw allow 1434/udp      # SQL Server Browser (UDP)
sudo ufw allow ssh           # SSH
sudo ufw limit ssh           # Limitar intentos de conexión SSH

# Proteger ICMP (ping)
sudo ufw deny icmp

# Configuración de logging
sudo ufw logging on
sudo ufw loglevel medium  # Considerar 'medium' para más detalles

# Habilitar el firewall
sudo ufw enable

# Verificar el estado de UFW
sudo ufw status verbose
