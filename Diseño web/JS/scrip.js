function handleLogin(event) {
    event.preventDefault();
  
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
  
    // Verificar si las credenciales son incorrectas (simulación)
    if (username === 'admin' && password === '1234') {
      // Login exitoso
      document.getElementById('loginForm').style.display = 'none';
      document.getElementById('mainContent').style.display = 'block';
    } else {
      // Mostrar error 404
      showError('404');
    }
  }

  document.getElementById('registerButton').addEventListener('click', handleRegister);

function handleRegister() {
  // Simulación de un error del servidor
  const success = Math.random() > 0.5; // Simula éxito o error (50% probabilidad)

  if (success) {
    alert('Usuario registrado con éxito.');
    clearFormFields();
  } else {
    // Mostrar error 500
    showError('500');
  }
}

  function showError(type) {
    // Ocultar otras secciones
    document.getElementById('loginForm').style.display = 'none';
    document.getElementById('mainContent').style.display = 'none';
    document.getElementById('error404').style.display = type === '404' ? 'block' : 'none';
    document.getElementById('error500').style.display = type === '500' ? 'block' : 'none';
  
    // Mostrar la sección de error correspondiente
    if (type === '404') {
      document.getElementById('error404').style.display = 'block';
    } else if (type === '500') {
      document.getElementById('error500').style.display = 'block';
    }
  }
  
  function goBack() {
    // Ocultar errores y volver al login
    document.getElementById('error404').style.display = 'none';
    document.getElementById('error500').style.display = 'none';
    document.getElementById('loginForm').style.display = 'block';
  }
  
  function retry() {
    // Simula un reintento (puedes personalizarlo según tus necesidades)
    alert('Reintentando...');
    location.reload();
  }
  
  function logout() {
    // Muestra el formulario de login y oculta el contenido principal
    document.getElementById('mainContent').style.display = 'none';
    document.getElementById('loginForm').style.display = 'block';
}
 