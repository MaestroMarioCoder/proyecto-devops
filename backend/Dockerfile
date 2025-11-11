# =============================================
# Backend DevOps - Node.js + Express + MySQL
# Imagen base
# =============================================
FROM node:22-alpine

WORKDIR /app

# Copiar package.json antes del código
COPY package*.json ./

# Instalar dependencias
RUN npm install

# Copiar el resto del código
COPY . .

# Exponer el puerto
EXPOSE 4000

# Comando por defecto
CMD ["npm", "start"]
