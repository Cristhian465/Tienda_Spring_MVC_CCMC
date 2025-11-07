(function () {
    const deleteLinks = document.querySelectorAll('.js-delete');
    deleteLinks.forEach(function (link) {
        link.addEventListener('click', function (event) {
            const nombre = link.getAttribute('data-nombre') || 'este registro';
            const confirmado = confirm(`¿Seguro que deseas eliminar ${nombre}? Esta acción no se puede deshacer.`);
            if (!confirmado) {
                event.preventDefault();
            }
        });
    });
})();
