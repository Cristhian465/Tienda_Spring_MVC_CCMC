<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Inicio | HypeCore</title>
        <style>
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: linear-gradient(135deg, #1f6feb, #9333ea);
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #f8fafc;
                margin: 0;
            }
            .card {
                background: rgba(15, 23, 42, 0.75);
                padding: 2.5rem 3rem;
                border-radius: 20px;
                box-shadow: 0 25px 50px -12px rgba(15, 23, 42, 0.65);
                backdrop-filter: blur(12px);
                text-align: center;
                max-width: 520px;
            }
            h1 {
                margin-bottom: 1rem;
                font-size: 2.2rem;
            }
            p {
                line-height: 1.6;
                margin-bottom: 2rem;
            }
            a {
                display: inline-block;
                padding: 0.85rem 1.5rem;
                background: #facc15;
                color: #0f172a;
                text-decoration: none;
                font-weight: 700;
                border-radius: 12px;
                transition: transform 0.2s ease, box-shadow 0.2s ease;
            }
            a:hover {
                transform: translateY(-2px);
                box-shadow: 0 10px 25px rgba(250, 204, 21, 0.45);
            }
        </style>
    </head>
    <body>
        <div class="card">
            <h1>Bienvenido a HypeCore</h1>
            <p>Utiliza el módulo de cargos para administrar los roles disponibles en la tienda. Desde aquí podrás crear, actualizar y eliminar registros.</p>
            <a href="cargo.htm">Ir al CRUD de cargos</a>
        </div>
    </body>
</html>
