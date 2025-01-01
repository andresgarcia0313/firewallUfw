#!/bin/bash

# Reiniciar UFW para empezar con una configuración limpia
sudo ufw reset

# Configurar la política predeterminada: bloquear tráfico entrante y permitir tráfico saliente
sudo ufw default deny incoming
sudo ufw default allow outgoing

# Permitir tráfico SSH para que puedas acceder al servidor remotamente
sudo ufw allow ssh

# Permitir el tráfico en la interfaz de Docker (docker0) para que Docker gestione puertos automáticamente
sudo ufw allow in on docker0
sudo ufw allow out on docker0

# Permitir el tráfico de Docker en puertos remotos (si usas Docker Remote API)
# Nota: Esto solo se debe hacer si necesitas exponer el Docker Remote API (puertos 2375 y 2376)
# sudo ufw allow proto tcp from any to any port 2375
# sudo ufw allow proto tcp from any to any port 2376

# Permitir puertos comunes de contenedores (si ya sabes qué puertos usar)
# Ejemplo: Si tienes un contenedor de Nginx que expone el puerto 80
# sudo ufw allow 80/tcp
# Ejemplo: Si tienes un contenedor de MySQL que expone el puerto 3306
# sudo ufw allow 3306/tcp

# Habilitar el firewall
sudo ufw enable

# Verificar las reglas activas
sudo ufw status verbose
