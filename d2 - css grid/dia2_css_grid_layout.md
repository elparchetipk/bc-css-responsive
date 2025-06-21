# Día 2: CSS Grid y Fundamentos de Layout
## "Construyendo Bases Sólidas de Layout"

---

## 🎯 Objetivos del Día
- Dominar CSS Grid para control total de layouts
- Comprender la relación contenedor/contenido
- Implementar sistemas de grid responsive básicos
- Crear layouts complejos con facilidad y flexibilidad

---

## 📅 Cronograma de 8 Horas

### Hora 1: Teoría CSS Grid y Sintaxis Fundamental
### Horas 2-3: Práctica Guiada - Propiedades de Contenedor y Elementos
### Horas 4-5: Proyecto Práctico - Layout Grid para Portfolio
### Horas 6-7: Patrones Avanzados CSS Grid
### Hora 8: Revisión de Código y Refuerzo

---

## 🚀 HORA 1: Fundamentos de CSS Grid

### ¿Qué es CSS Grid y Por Qué es Revolucionario?

CSS Grid Layout es el sistema de layout bidimensional más poderoso en CSS. A diferencia de Flexbox (que es unidimensional), Grid nos permite controlar tanto filas como columnas simultáneamente, creando layouts complejos de manera intuitiva.

#### Comparación: Grid vs Flexbox vs Float

```css
/* ❌ Método Antiguo con Float - Complejo y limitado */
.old-layout {
    float: left;
    width: 33.33%;
    margin-right: 2%;
    /* Problemas: clearing, cálculos complejos, sin control vertical */
}

/* ✅ Flexbox - Excelente para componentes 1D */
.flex-container {
    display: flex;
    gap: 20px;
    /* Perfecto para: navegación, cards en fila, centrado */
}

/* 🔥 CSS Grid - El rey de layouts 2D */
.grid-container {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
    /* Perfecto para: layouts página completa, dashboards, galerías */
}
```

### Conceptos Fundamentales

#### 1. Contenedor Grid vs Elementos Grid

```css
/* CONTENEDOR GRID - El padre que define la estructura */
.grid-container {
    display: grid; /* Activa el contexto de grid */
    
    /* Definimos la estructura de columnas y filas */
    grid-template-columns: 200px 1fr 100px;
    grid-template-rows: auto 1fr auto;
    
    /* Espaciado entre elementos */
    gap: 20px; /* Equivale a: row-gap: 20px; column-gap: 20px; */
}

/* ELEMENTOS GRID - Los hijos que se posicionan */
.grid-item {
    /* Por defecto, cada elemento ocupa 1 celda */
    /* Pero podemos controlar su posición y tamaño */
    grid-column: 1 / 3; /* Ocupa de la columna 1 a la 3 */
    grid-row: 2 / 4;    /* Ocupa de la fila 2 a la 4 */
}
```

#### 2. Líneas de Grid vs Áreas de Grid

Imagina el grid como una tabla invisible:

```css
/* Las líneas de grid son las "líneas" que separan las celdas */
.grid-container {
    display: grid;
    grid-template-columns: 100px 200px 100px;
    /*                     |1   |2   |3   |4  <- Líneas de columna */
    grid-template-rows: 80px 200px 80px;
    /*                  1─────────────────
                        |     |     |     |
                        2─────────────────  <- Líneas de fila
                        |     |     |     |
                        3─────────────────
                        |     |     |     |
                        4─────────────────  */
}
```

### Repaso Rápido - Conceptos del Día 1

Antes de continuar, recordemos los principios responsive que aplicaremos:

```css
/* Mobile First - Empezamos por el diseño móvil */
.responsive-grid {
    display: grid;
    grid-template-columns: 1fr; /* Una columna en móvil */
    gap: 15px;
}

/* Tablet */
@media (min-width: 768px) {
    .responsive-grid {
        grid-template-columns: repeat(2, 1fr); /* Dos columnas */
        gap: 20px;
    }
}

/* Desktop */
@media (min-width: 1024px) {
    .responsive-grid {
        grid-template-columns: repeat(3, 1fr); /* Tres columnas */
        gap: 30px;
    }
}
```

---

## 🛠️ HORAS 2-3: Práctica Guiada - Propiedades Esenciales

### Propiedades del Contenedor Grid

#### 1. grid-template-columns y grid-template-rows

```css
/* Diferentes formas de definir columnas */
.grid-examples {
    display: grid;
    
    /* Unidades fijas */
    grid-template-columns: 200px 300px 100px;
    
    /* Unidades fraccionarias (fr) - ¡La clave del responsive! */
    grid-template-columns: 1fr 2fr 1fr; /* 25% 50% 25% del espacio disponible */
    
    /* Función repeat() - Para patrones repetitivos */
    grid-template-columns: repeat(4, 1fr); /* 4 columnas iguales */
    grid-template-columns: repeat(3, 200px); /* 3 columnas de 200px */
    
    /* Combinaciones híbridas */
    grid-template-columns: 200px repeat(2, 1fr) 100px; /* Fijo, flexible, flexible, fijo */
    
    /* Auto-sizing */
    grid-template-columns: auto 1fr auto; /* Contenido, flexible, contenido */
}
```

#### 2. Funciones Avanzadas: minmax() y fit-content()

```css
/* minmax() - Define un rango mínimo y máximo */
.responsive-columns {
    display: grid;
    
    /* Columnas que nunca sean menores a 200px ni mayores a 1fr */
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    
    /* Combinando diferentes estrategias */
    grid-template-columns: 
        minmax(200px, 300px)  /* Sidebar responsive */
        1fr                   /* Contenido principal */
        minmax(150px, 200px); /* Sidebar secundario */
}

/* fit-content() - Se ajusta al contenido con un máximo */
.content-sized {
    grid-template-columns: fit-content(300px) 1fr fit-content(200px);
}
```

#### 3. Grid Areas - Layout Semántico

```css
/* Definimos las áreas con nombres descriptivos */
.layout-grid {
    display: grid;
    grid-template-areas: 
        "header  header  header"
        "sidebar content ads"
        "footer  footer  footer";
    
    grid-template-columns: 200px 1fr 150px;
    grid-template-rows: auto 1fr auto;
    gap: 20px;
}

/* Asignamos elementos a las áreas */
.header { grid-area: header; }
.sidebar { grid-area: sidebar; }
.content { grid-area: content; }
.ads { grid-area: ads; }
.footer { grid-area: footer; }

/* Responsive: Cambiamos la estructura completa */
@media (max-width: 768px) {
    .layout-grid {
        grid-template-areas: 
            "header"
            "content"
            "sidebar"
            "footer";
        grid-template-columns: 1fr;
    }
}
```

### Propiedades de los Elementos Grid

#### 1. Posicionamiento con Líneas

```css
/* Método 1: Con números de línea */
.featured-item {
    grid-column: 1 / 4; /* De la línea 1 a la 4 (ocupa 3 columnas) */
    grid-row: 2 / 3;    /* Solo la fila 2 */
}

/* Método 2: Con span (más intuitivo) */
.wide-item {
    grid-column: span 2; /* Ocupa 2 columnas */
    grid-row: span 3;    /* Ocupa 3 filas */
}

/* Método 3: Shorthand */
.positioned-item {
    grid-area: 2 / 1 / 4 / 3; /* row-start / col-start / row-end / col-end */
}
```

#### 2. Alineación dentro de las Celdas

```css
.aligned-items {
    /* Alineación del elemento dentro de su celda */
    justify-self: center; /* horizontal: start | center | end | stretch */
    align-self: center;   /* vertical: start | center | end | stretch */
    
    /* Shorthand */
    place-self: center center; /* align-self justify-self */
}

/* Alineación del contenido del contenedor completo */
.grid-container {
    justify-content: center; /* Todo el grid horizontalmente */
    align-content: center;   /* Todo el grid verticalmente */
    
    /* Shorthand */
    place-content: center center;
}
```

### Ejercicio Práctico 1: Card Layout Básico

Vamos a crear un layout de cards responsive:

```html
<!-- HTML Structure -->
<div class="cards-grid">
    <div class="card card--featured">Card Destacada</div>
    <div class="card">Card Normal</div>
    <div class="card">Card Normal</div>
    <div class="card">Card Normal</div>
    <div class="card">Card Normal</div>
    <div class="card">Card Normal</div>
</div>
```

```css
/* CSS Grid Implementation */
.cards-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 24px;
    padding: 20px;
}

.card {
    background: white;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.2s ease;
}

.card:hover {
    transform: translateY(-4px);
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
}

/* La card destacada ocupa más espacio */
.card--featured {
    grid-column: span 2;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
}

/* Responsive: En móvil, todas las cards ocupan el ancho completo */
@media (max-width: 600px) {
    .card--featured {
        grid-column: span 1;
    }
}
```

---

## 🎨 HORAS 4-5: Proyecto Práctico - Layout Grid para Portfolio

Ahora vamos a construir un layout de portfolio profesional que demuestre el poder de CSS Grid.

### Estructura HTML Semántica

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portfolio Grid Layout</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="portfolio-layout">
        <!-- Header principal -->
        <header class="header">
            <h1>Mi Portfolio</h1>
            <nav class="nav">
                <a href="#about">Sobre Mí</a>
                <a href="#projects">Proyectos</a>
                <a href="#contact">Contacto</a>
            </nav>
        </header>
        
        <!-- Hero section destacada -->
        <section class="hero">
            <h2>Desarrollador Frontend</h2>
            <p>Especializado en CSS Grid y diseño responsive</p>
        </section>
        
        <!-- Sidebar con información personal -->
        <aside class="sidebar">
            <div class="profile-card">
                <img src="avatar.jpg" alt="Mi foto">
                <h3>John Doe</h3>
                <p>Frontend Developer</p>
            </div>
            <div class="skills">
                <h4>Habilidades</h4>
                <ul>
                    <li>CSS Grid & Flexbox</li>
                    <li>JavaScript ES6+</li>
                    <li>React & Vue.js</li>
                </ul>
            </div>
        </aside>
        
        <!-- Galería de proyectos -->
        <main class="projects-grid">
            <article class="project project--large">
                <h3>Proyecto Destacado</h3>
                <p>E-commerce responsive con CSS Grid</p>
            </article>
            <article class="project">
                <h3>App Web</h3>
                <p>Dashboard administrativo</p>
            </article>
            <article class="project">
                <h3>Landing Page</h3>
                <p>Sitio corporativo</p>
            </article>
            <article class="project">
                <h3>Blog Personal</h3>
                <p>CMS personalizado</p>
            </article>
            <article class="project project--wide">
                <h3>Sistema Complejo</h3>
                <p>Aplicación de gestión empresarial</p>
            </article>
        </main>
        
        <!-- Footer -->
        <footer class="footer">
            <p>&copy; 2024 Mi Portfolio. Todos los derechos reservados.</p>
        </footer>
    </div>
</body>
</html>
```

### CSS Grid Implementation Completa

```css
/* Reset y estilos base */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    line-height: 1.6;
    color: #333;
    background-color: #f5f7fa;
}

/* LAYOUT PRINCIPAL CON CSS GRID */
.portfolio-layout {
    display: grid;
    min-height: 100vh;
    
    /* Definimos las áreas del layout */
    grid-template-areas: 
        "header header header"
        "hero hero sidebar"
        "projects projects sidebar"
        "footer footer footer";
    
    /* Columnas: flexible, flexible, fija */
    grid-template-columns: 1fr 1fr 300px;
    
    /* Filas: auto, auto, flexible, auto */
    grid-template-rows: auto auto 1fr auto;
    
    /* Espaciado entre áreas */
    gap: 20px;
    
    /* Padding del contenedor principal */
    padding: 20px;
}

/* HEADER - Navegación principal */
.header {
    grid-area: header;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    padding: 20px 30px;
    border-radius: 12px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 4px 20px rgba(102, 126, 234, 0.3);
}

.header h1 {
    font-size: 1.8rem;
    font-weight: 700;
}

.nav {
    display: flex;
    gap: 30px;
}

.nav a {
    color: white;
    text-decoration: none;
    padding: 8px 16px;
    border-radius: 6px;
    transition: background-color 0.2s ease;
}

.nav a:hover {
    background-color: rgba(255, 255, 255, 0.2);
}

/* HERO SECTION - Presentación principal */
.hero {
    grid-area: hero;
    background: white;
    padding: 40px;
    border-radius: 12px;
    box-shadow: 0 2px 16px rgba(0, 0, 0, 0.1);
    display: flex;
    flex-direction: column;
    justify-content: center;
    text-align: center;
}

.hero h2 {
    font-size: 2.5rem;
    margin-bottom: 15px;
    color: #2d3748;
}

.hero p {
    font-size: 1.2rem;
    color: #718096;
}

/* SIDEBAR - Información personal */
.sidebar {
    grid-area: sidebar;
    display: flex;
    flex-direction: column;
    gap: 20px;
}

.profile-card {
    background: white;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 2px 16px rgba(0, 0, 0, 0.1);
    text-align: center;
}

.profile-card img {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    margin-bottom: 15px;
    object-fit: cover;
}

.skills {
    background: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 2px 16px rgba(0, 0, 0, 0.1);
}

.skills h4 {
    margin-bottom: 15px;
    color: #2d3748;
}

.skills ul {
    list-style: none;
}

.skills li {
    padding: 8px 0;
    border-bottom: 1px solid #e2e8f0;
}

.skills li:last-child {
    border-bottom: none;
}

/* PROJECTS GRID - Galería de proyectos */
.projects-grid {
    grid-area: projects;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 20px;
}

.project {
    background: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 2px 16px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease;
    border-left: 4px solid #667eea;
}

.project:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
}

/* Proyecto destacado - Ocupa más espacio */
.project--large {
    grid-column: span 2;
    background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
    color: white;
    border-left: 4px solid #f5576c;
}

/* Proyecto ancho - Solo en desktop */
.project--wide {
    grid-column: span 2;
}

/* FOOTER */
.footer {
    grid-area: footer;
    background: #2d3748;
    color: white;
    padding: 20px;
    border-radius: 12px;
    text-align: center;
}

/* RESPONSIVE DESIGN */

/* Tablet */
@media (max-width: 1024px) {
    .portfolio-layout {
        grid-template-areas: 
            "header header"
            "hero sidebar"
            "projects projects"
            "footer footer";
        
        grid-template-columns: 1fr 280px;
    }
    
    .project--large,
    .project--wide {
        grid-column: span 1;
    }
}

/* Mobile */
@media (max-width: 768px) {
    .portfolio-layout {
        grid-template-areas: 
            "header"
            "hero"
            "sidebar"
            "projects"
            "footer";
        
        grid-template-columns: 1fr;
        padding: 15px;
        gap: 15px;
    }
    
    .header {
        flex-direction: column;
        gap: 15px;
        text-align: center;
    }
    
    .nav {
        flex-wrap: wrap;
        justify-content: center;
    }
    
    .hero h2 {
        font-size: 2rem;
    }
    
    .projects-grid {
        grid-template-columns: 1fr;
    }
    
    .project--large,
    .project--wide {
        grid-column: span 1;
    }
}

/* Mobile pequeño */
@media (max-width: 480px) {
    .portfolio-layout {
        padding: 10px;
        gap: 10px;
    }
    
    .header,
    .hero,
    .profile-card,
    .skills,
    .project,
    .footer {
        padding: 20px;
    }
    
    .hero h2 {
        font-size: 1.8rem;
    }
}
```

### Análisis del Código - Mejores Prácticas Implementadas

#### 1. **Mobile-First Approach**
```css
/* Comenzamos con el diseño base (móvil) */
.portfolio-layout {
    grid-template-columns: 1fr;
}

/* Luego escalamos hacia desktop */
@media (min-width: 768px) {
    .portfolio-layout {
        grid-template-columns: 1fr 280px;
    }
}
```

#### 2. **Grid Areas Semánticas**
Las áreas con nombres descriptivos hacen el código más legible y mantenible:
```css
grid-template-areas: 
    "header header"
    "hero sidebar"
    "projects projects"
    "footer footer";
```

#### 3. **Flexibilidad con Minmax**
```css
grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
```
Esta técnica asegura que las cards nunca sean demasiado pequeñas pero se adapten al espacio disponible.

---

## 🔥 HORAS 6-7: Patrones Avanzados CSS Grid

### Auto-fit vs Auto-fill - La Diferencia Crucial

```css
/* AUTO-FIT: Se ajusta al contenido disponible */
.grid-auto-fit {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 20px;
}
/* Si hay 3 elementos en un contenedor de 1000px:
   Cada elemento ocupará ~306px (espacio distribuido) */

/* AUTO-FILL: Mantiene el tamaño mínimo */
.grid-auto-fill {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    gap: 20px;
}
/* Si hay 3 elementos en un contenedor de 1000px:
   Cada elemento ocupará 200px, dejando espacio vacío */
```

### Subgrid - El Futuro del CSS Grid

Aunque el soporte es limitado, es importante conocer esta característica:

```css
.parent-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
}

.child-grid {
    display: grid;
    grid-template-columns: subgrid; /* Hereda las columnas del padre */
    grid-column: span 3;
}
```

### Patrones de Layout Avanzados

#### 1. Holy Grail Layout Moderno

```css
.holy-grail {
    display: grid;
    min-height: 100vh;
    grid-template-areas: 
        "header header header"
        "sidebar main aside"
        "footer footer footer";
    grid-template-columns: minmax(150px, 200px) 1fr minmax(150px, 200px);
    grid-template-rows: auto 1fr auto;
}

@media (max-width: 768px) {
    .holy-grail {
        grid-template-areas: 
            "header"
            "main"
            "sidebar"
            "aside"
            "footer";
        grid-template-columns: 1fr;
    }
}
```

#### 2. Magazine Layout Complejo

```css
.magazine-layout {
    display: grid;
    grid-template-columns: repeat(6, 1fr);
    grid-auto-rows: 200px;
    gap: 15px;
}

.article-featured {
    grid-column: span 4;
    grid-row: span 2;
}

.article-secondary {
    grid-column: span 2;
    grid-row: span 1;
}

.article-small {
    grid-column: span 1;
    grid-row: span 1;
}

/* Responsive collapse */
@media (max-width: 768px) {
    .magazine-layout {
        grid-template-columns: 1fr;
    }
    
    .article-featured,
    .article-secondary,
    .article-small {
        grid-column: span 1;
        grid-row: span 1;
    }
}
```

#### 3. Dashboard Layout Profesional

```css
.dashboard {
    display: grid;
    min-height: 100vh;
    grid-template-areas: 
        "sidebar header header"
        "sidebar main main"
        "sidebar main main";
    grid-template-columns: 250px 1fr 1fr;
    grid-template-rows: 70px 1fr 1fr;
}

.dashboard-main {
    grid-area: main;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 20px;
    padding: 20px;
}

.widget {
    background: white;
    border-radius: 8px;
    padding: 20px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.widget--large {
    grid-column: span 2;
}

/* Responsive dashboard */
@media (max-width: 1024px) {
    .dashboard {
        grid-template-areas: 
            "header"
            "sidebar"
            "main";
        grid-template-columns: 1fr;
        grid-template-rows: auto auto 1fr;
    }
    
    .widget--large {
        grid-column: span 1;
    }
}
```

### Ejercicio Avanzado: Sistema de Cards Inteligente

```css
/* Sistema que se adapta automáticamente al contenido */
.smart-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(clamp(250px, 30vw, 400px), 1fr));
    gap: clamp(15px, 2vw, 30px);
    padding: clamp(15px, 2vw, 30px);
}

.smart-card {
    background: white;
    border-radius: clamp(8px, 1vw, 12px);
    padding: clamp(15px, 2vw, 25px);
    box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease;
}

/* Cards especiales con comportamiento específico */
.smart-card--hero {
    grid-column: 1 / -1; /* Ocupa todo el ancho */
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    text-align: center;
    padding: clamp(30px, 4vw, 50px);
}

.smart-card--featured {
    grid-column: span 2;
    border-left: 4px solid #667eea;
}

/* En tablet, featured cards ocupan solo 1 columna */
@media (max-width: 768px) {
    .smart-card--featured {
        grid-column: span 1;
    }
}
```

---

## 📝 HORA 8: Revisión de Código y Refuerzo de Conocimientos

### Checklist de Mejores Prácticas CSS Grid

#### ✅ Estructura y Semántica
- [ ] Usar `display: grid` solo en contenedores que necesiten layout 2D
- [ ] HTML semántico con elementos apropiados (header, main, aside, footer)
- [ ] Grid areas con nombres descriptivos y consistentes
- [ ] Comentarios en CSS explicando decisiones de layout complejas

#### ✅ Responsive Design
- [ ] Enfoque mobile-first en media queries
- [ ] Uso de `minmax()` para flexibilidad
- [ ] `auto-fit` vs `auto-fill` aplicado correctamente
- [ ] Grid areas que se reorganizan lógicamente en móvil

#### ✅ Performance y Mantenibilidad
- [ ] Evitar grids innecesarios (usar flexbox para layouts 1D)
- [ ] Usar `gap` en lugar de margins para espaciado
- [ ] Unidades relativas (fr, %, vw/vh) para escalabilidad
- [ ] Fallbacks para navegadores antiguos si es necesario

### Debugging Common Grid Issues

#### Problema 1: Grid Items Desbordando el Contenedor
```css
/* ❌ Problemático */
.grid-container {
    grid-template-columns: 300px 300px 300px; /* Fijo, puede desbordar */
}

/* ✅ Solución */
.grid-container {
    grid-template-columns: repeat(3, minmax(0, 1fr)); /* Flexible */
}
```

#### Problema 2: Gaps Inconsistentes
```css
/* ❌ Problemático */
.grid-item {
    margin: 10px; /* Crea espaciado inconsistente */
}

/* ✅ Solución */
.grid-container {
    gap: 20px; /* Espaciado consistente controlado por el contenedor */
}
```

#### Problema 3: Alineación Vertical Problemática
```css
/* ❌ Problemático */
.grid-item {
    height: 200px; /* Altura fija, contenido puede no ajustarse */
    vertical-align: middle; /* No funciona en grid */
}

/* ✅ Solución */
.grid-item {
    display: flex; /* Grid item se convierte en flex container */
    align-items: center; /* Centrado vertical */
    justify-content: center; /* Centrado horizontal */
    min-height: 200px; /* Altura mínima, no fija */
}
```

### Ejercicio de Refuerzo: Quiz Interactivo

**Pregunta 1:** ¿Cuándo usarías `auto-fit` vs `auto-fill`?

**Respuesta:** `auto-fit` cuando quieres que los elementos existentes se expandan para llenar el espacio disponible. `auto-fill` cuando quieres mantener el tamaño mínimo y permitir espacio vacío.

**Pregunta 2:** ¿Cómo harías un elemento que ocupe toda la fila en un grid?

**Respuesta:** `grid-column: 1 / -1;` o `grid-column: span all;` (si está soportado).

### Próximos Pasos - Preparación para el Día 3

Mañana exploraremos Flexbox y aprenderemos:
- Cuándo usar Grid vs Flexbox
- Crear componentes UI reutilizables
- Patrones de navegación avanzados
- Integración Grid + Flexbox

### Recursos para Profundizar

1. **CSS Grid Garden** - Juego interactivo para practicar
2. **Grid by Example** (Rachel Andrew) - Patrones y ejemplos
3. **MDN CSS Grid Layout** - Documentación completa
4. **Can I Use - CSS Grid** - Compatibilidad de navegadores

---

## 🎯 Resumen del Día 2

Hoy hemos construido una base sólida en CSS Grid que nos permitirá crear layouts complejos de manera intuitiva. Los conceptos clave que dominamos:

**Fundamentos:** Grid containers vs grid items, líneas vs áreas, posicionamiento preciso

**Responsive Design:** Mobile-first con grid areas, minmax() para flexibilidad, auto-fit/auto-fill para adaptabilidad

**Patrones Avanzados:** Layouts tipo magazine, dashboards profesionales, sistemas de cards inteligentes

**Mejores Prácticas:** Código semántico, performance optimizada, debugging efectivo

Mañana integraremos estos conocimientos con Flexbox para crear la combinación perfecta de control de layout. ¡Excelente trabajo!

---

*"CSS Grid nos da superpoderes para el layout, pero el verdadero poder está en saber cuándo y cómo usarlo. Mañana añadiremos Flexbox a nuestra caja de herramientas para ser imparables."*