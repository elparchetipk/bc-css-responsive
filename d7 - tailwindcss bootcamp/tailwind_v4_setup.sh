# Instalación de TailwindCSS v4.0
# IMPORTANTE: Esta es la configuración para la versión 4.0 (aún en desarrollo)

# Paso 1: Crear proyecto nuevo
mkdir tailwind-v4-project
cd tailwind-v4-project

# Paso 2: Inicializar npm
npm init -y

# Paso 3: Instalar TailwindCSS v4.0 (versión alpha/beta)
npm install @tailwindcss/cli@next @tailwindcss/postcss@next

# Paso 4: Crear estructura de archivos
mkdir src dist
touch src/input.css src/index.html dist/style.css

# Paso 5: Configurar package.json scripts
# Agregar en package.json:
{
  "scripts": {
    "dev": "tailwindcss -i src/input.css -o dist/style.css --watch",
    "build": "tailwindcss -i src/input.css -o dist/style.css --minify"
  }
}

# Alternativa: Usando CDN para pruebas rápidas
# <script src="https://cdn.tailwindcss.com/4.0.0-alpha.1"></script>