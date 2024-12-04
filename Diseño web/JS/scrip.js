// inicio de sesión
function Login(event) {
    event.preventDefault();

    const username = document.getElementById('Usuario').value.trim();
    const password = document.getElementById('password').value.trim();

    if (username === 'usuario' && password === '4321') {
        navigateToSection('empleados');
    } else if (username === 'admin' && password === '1234') {
        navigateToSection('Administrador');
    } else {
        showError('404');
    }
}

// formulario de empleados
function Register(event) {
    event.preventDefault();
    
    // Comentario: Agregamos validación más estricta para mostrar error 500
    try {
        const nombre = document.getElementById('nombre').value.trim();
        const apellido = document.getElementById('apellido').value.trim();
        const horaIngreso = document.getElementById('hora_ingreso').value;
        const horaSalida = document.getElementById('hora_salida').value;
        const oficina = document.getElementById('oficina_destino').value.trim();
        const tipoDocumento = document.getElementById('tipo_documento').value;
        const numeroDocumento = document.getElementById('numero_documento').value.trim();
        const telefono = document.getElementById('telefono').value.trim();
        const fechaIngreso = document.getElementById('fecha_ingreso').value;
        const rol = document.getElementById('rol').value;
        const comentarios = document.getElementById('comentarios').value.trim();

        // Comentario: Validación con más campos requeridos
        if (!nombre || !apellido || !horaIngreso || !horaSalida || !oficina ||
            !tipoDocumento || !numeroDocumento || !telefono || !fechaIngreso || !rol) {
            throw new Error('Campos incompletos');
        }

        alert('Registro de empleado guardado exitosamente.');
    } catch (error) {
        // Comentario: Mostramos error 500 en caso de error de validación
        showError("500");
    }    
}

// formulario de agregar usuario
function AddUser(event) {
    event.preventDefault();
    const nombre = document.getElementById('nombre_agregar').value.trim();
    const apellido = document.getElementById('apellido_agregar').value.trim();
    const usuario = document.getElementById('usuario_agregar').value.trim();
    const contraseña = document.getElementById('contraseña_agregar').value.trim();
    const cargo = document.getElementById('cargo_agregar').value.trim();

    if (nombre && apellido && usuario && contraseña && cargo) {
        alert('Usuario agregado exitosamente.');
    } else {
        alert('Por favor, complete todos los campos.');
    }
}

// formulario de editar usuario
function EditUser(event) {
    event.preventDefault();
    const tipo = document.getElementById('tipo_usuario_editar').value.trim();
    const nombre = document.getElementById('nombre_editar').value.trim();
    const apellido = document.getElementById('apellido_editar').value.trim();

    if (tipo && nombre && apellido) {
        alert('Usuario editado exitosamente.');
    } else {
        alert('Por favor, complete todos los campos.');
    }
}

// formulario de eliminar usuario
function DeleteUser(event) {
    event.preventDefault();
    const tipo = document.getElementById('tipo_usuario_eliminar').value.trim();
    const nombre = document.getElementById('nombre_eliminar').value.trim();
    const apellido = document.getElementById('apellido_eliminar').value.trim();

    if (tipo && nombre && apellido) {
        alert('Usuario eliminado exitosamente.');
    } else {
        alert('Por favor, complete todos los campos.');
    }
}

// Función navegar
function navigateToSection(sectionId) {
    const sections = document.querySelectorAll('main, #error404, #error500');
    sections.forEach(section => {
        section.style.display = 'none';
    });
    
    const targetSection = document.getElementById(sectionId);
    if (targetSection) {
        targetSection.style.display = 'block';
    }else {
        console.error(`Sección con ID ${sectionId} no encontrada.`);
    }
}

// Mostrar errores
function showError(type) {
    navigateToSection(`error${type}`);
}

// Función cerrar sesión
function cerrarSesion() {
    navigateToSection('inicio_sesion');
}

// Volver inicio error
function goBack() {
    navigateToSection('inicio_sesion');
}

function retry() {
    alert('Reintentando...');
    navigateToSection('inicio_sesion'); // Redirige al inicio de sesión en lugar de recargar
}

document.addEventListener('DOMContentLoaded', () => {
    
    const loginForm = document.querySelector('.formulario_inicio');
    if (loginForm) {
        loginForm.addEventListener('submit', Login);
    }

    const employeeForm = document.querySelector('.formulario_empleados');
    if (employeeForm) {
        employeeForm.addEventListener('submit', Register);
    }

    const addUserForm = document.querySelector('.formulario_admin[onsubmit*="AddUser"]');
    if (addUserForm) {
        addUserForm.addEventListener('submit', AddUser);
    }

    const editUserForm = document.querySelector('.formulario_admin[onsubmit*="EditUser"]');
    if (editUserForm) {
        editUserForm.addEventListener('submit', EditUser);
    }

    const deleteUserForm = document.querySelector('.formulario_admin[onsubmit*="DeleteUser"]');
    if (deleteUserForm) {
        deleteUserForm.addEventListener('submit', DeleteUser);
    }

    // boton guardarCambios
    const guardarCambiosBtn = document.querySelector('.boton_guardar_cambios');
    if (guardarCambiosBtn) {
        guardarCambiosBtn.addEventListener('click', () => {
            alert('Todos los cambios se han guardado.');
        });
    }
});