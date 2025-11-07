<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${titulo}</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cargo.css">
    </head>
    <body>
        <section class="form-wrapper">
            <header class="form-header">
                <h1>${titulo}</h1>
                <a class="btn btn-secondary" href="cargo.htm">Volver al listado</a>
            </header>

            <c:if test="${not empty error}">
                <div class="alert alert-error">${error}</div>
            </c:if>

            <form action="${actionUrl}" method="post" class="form-card">
                <c:if test="${cargo.idCargo ne 0}">
                    <input type="hidden" name="idCargo" value="${cargo.idCargo}">
                </c:if>

                <div class="form-field">
                    <label for="nombre">Nombre</label>
                    <input type="text" id="nombre" name="nombre" value="${cargo.nombre}" maxlength="50" required>
                </div>

                <div class="form-field form-field-inline">
                    <label for="estado">Activo</label>
                    <input type="hidden" name="_estado" value="on">
                    <input type="checkbox" id="estado" name="estado" value="true" <c:if test="${cargo.estado}">checked</c:if>>
                </div>

                <div class="form-actions">
                    <button class="btn btn-primary" type="submit">Guardar</button>
                    <a class="btn btn-secondary" href="cargo.htm">Cancelar</a>
                </div>
            </form>
        </section>

        <script>
            document.getElementById('nombre').focus();
        </script>
    </body>
</html>
