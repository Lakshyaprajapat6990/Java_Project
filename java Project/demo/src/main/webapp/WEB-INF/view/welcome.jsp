<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Registration Form</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: #f0f4f8;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .form-container {
      background: white;
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      width: 100%;
      max-width: 400px;
    }

    .form-container h2 {
      text-align: center;
      margin-bottom: 20px;
    }

    label {
      display: block;
      margin-bottom: 8px;
      font-weight: bold;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: 1px solid #ccc;
      border-radius: 8px;
    }

    .error {
      color: red;
      font-size: 0.9em;
      margin-bottom: 10px;
      display: none;
    }

    button {
      width: 100%;
      background-color: #4CAF50;
      color: white;
      padding: 12px;
      border: none;
      border-radius: 8px;
      font-size: 16px;
      cursor: pointer;
    }

    button:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>
  <div class="form-container">
    <h2>Register</h2>
    <form id="registerForm">
      <label for="firstName">First Name</label>
      <input type="text" id="firstName" name="firstName" required>

      <label for="lastName">Last Name</label>
      <input type="text" id="lastName" name="lastName" required>

      <label for="email">Email</label>
      <input type="email" id="email" name="email" required>

      <label for="password">Password</label>
      <input type="password" id="password" name="password" required>
      <div class="error" id="passwordError">Password must be at least 8 characters long, contain one special character and one number.</div>

      <button type="submit">Submit</button>
    </form>
  </div>

  <script>
    const form = document.getElementById('registerForm');
    const passwordInput = document.getElementById('password');
    const passwordError = document.getElementById('passwordError');

    form.addEventListener('submit', function(event) {
      const password = passwordInput.value;
      const pattern = /^(?=.*[0-9])(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;

      if (!pattern.test(password)) {
        event.preventDefault();
        passwordError.style.display = 'block';
      } else {
        passwordError.style.display = 'none';
      }
    });
  </script>
</body>
</html>
