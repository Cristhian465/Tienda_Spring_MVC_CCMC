<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestión de Cargos</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cargo.css">
    </head>
    <body>
        <header class="page-header">
            <h1>Gestión de Cargos</h1>
            <a class="btn btn-primary" href="cargo-crear.htm">Nuevo cargo</a>
        </header>

        <c:if test="${not empty success}">
            <div class="alert alert-success">${success}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-error">${error}</div>
        </c:if>

        <section class="table-wrapper">
            <c:choose>
                <c:when test="${not empty cargos}">
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Estado</th>
                                <th>Creación</th>
                                <th>Actualización</th>
                                <th class="column-actions">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="cargo" items="${cargos}">
                                <tr>
                                    <td>${cargo.idCargo}</td>
                                    <td>${cargo.nombre}</td>
                                    <td>
                                        <span class="badge ${cargo.estado ? 'badge-success' : 'badge-muted'}">
                                            <c:out value="${cargo.estado ? 'Activo' : 'Inactivo'}"/>
                                        </span>
                                    </td>
                                    <td>${cargo.fechaCreacion}</td>
                                    <td>${cargo.fechaActualizacion}</td>
                                    <td class="column-actions">
                                        <a class="btn btn-secondary" href="cargo-editar.htm?id=${cargo.idCargo}">Editar</a>
                                        <a class="btn btn-danger js-delete" href="cargo-eliminar.htm?id=${cargo.idCargo}" data-nombre="${cargo.nombre}">Eliminar</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    <div class="empty-state">
                        <p>Aún no se han registrado cargos.</p>
                        <a class="btn btn-primary" href="cargo-crear.htm">Registrar el primero</a>
                    </div>
                </c:otherwise>
            </c:choose>
        </section>

        <script src="${pageContext.request.contextPath}/resources/js/cargo.js"></script>
    </body>
</html>
